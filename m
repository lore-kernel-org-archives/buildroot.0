From: Eric Malkowski <eric@bvwireless.net>
Date: Tue, 5 Dec 2006 22:51:53 -0500 (EST)
Subject: [Buildroot] Building 2.6.19 with Soekris 4801 target
In-Reply-To: <20061205082246.GA31644@aon.at>
References: <33915.10.1.2.50.1165286261.squirrel@bvwireless.net>
	<20061205075036.GB31372@aon.at> <20061205082246.GA31644@aon.at>
Message-ID: <54505.10.1.2.50.1165377113.squirrel@bvwireless.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is what I came up with.  The check for uclibc version 0.9.28 AND
kernel >= 2.6.18 I came up with is pretty ugly.  I'm also not certain it
would work right for kernels w/ 4 version numbers like 2.6.15.3 and such.

[malk at testbed buildroot]$ svn diff toolchain/uClibc/uclibc.mk
toolchain/kernel-headers/kernel-headers.mk
Index: toolchain/uClibc/uclibc.mk
===================================================================
--- toolchain/uClibc/uclibc.mk  (revision 16786)
+++ toolchain/uClibc/uclibc.mk  (working copy)
@@ -53,6 +53,8 @@
 UCLIBC_NOT_TARGET_ENDIAN:=LITTLE
 endif

+UCLIBC_KERNEL_HEADERS_VERSION:=$(strip $(subst ",,
$(BR2_DEFAULT_KERNEL_HEADERS)))
+
 $(DL_DIR)/$(UCLIBC_SOURCE):
        mkdir -p $(DL_DIR)
        $(WGET) -P $(DL_DIR) $(UCLIBC_SITE)/$(UCLIBC_SOURCE)
@@ -133,6 +135,13 @@
                HOSTCC="$(HOSTCC)" \
                pregen install_dev && \
        touch $(UCLIBC_DIR)/.configured
+ifeq ("$(strip $(UCLIBC_VER))","0.9.28")
+ifeq ("$(findstring 2.6.,$(UCLIBC_KERNEL_HEADERS_VERSION))","2.6.")
+ifneq ("$(strip $(filter-out 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
17,$(subst 2.6.,,$(UCLIBC_KERNEL_HEADERS_VERSION))))","")
+       rm -f $(LINUX_HEADERS_DIR)/Makefile
+endif
+endif
+endif

 $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(LIBFLOAT_TARGET)
        $(MAKE1) -C $(UCLIBC_DIR) \
Index: toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- toolchain/kernel-headers/kernel-headers.mk  (revision 16786)
+++ toolchain/kernel-headers/kernel-headers.mk  (working copy)
@@ -150,6 +150,7 @@
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
        (cd $(LINUX_HEADERS_UNPACK_DIR) ; \
         $(MAKE) ARCH=$(KERNEL_ARCH) INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR)
headers_install)
+       cp $(LINUX_HEADERS_UNPACK_DIR)/Makefile $(LINUX_HEADERS_DIR)
        touch $(LINUX_HEADERS_DIR)/.configured
 else
 # the sanitized kernel-headers


> On Tue, Dec 05, 2006 at 08:50:36AM +0100, Bernhard Fischer wrote:
>>On Mon, Dec 04, 2006 at 09:37:41PM -0500, Eric Malkowski wrote:
>>
>>>So I made the following mod to
>>> toolchain/kernel-headers/kernel-headers.mk
>>>to copy over the 2.6.19 top level Makefile to the linux headers dir and
>>>voila:
>>>
>>>[malk at testbed buildroot]$ svn diff
>>> toolchain/kernel-headers/kernel-headers.mk
>>>Index: toolchain/kernel-headers/kernel-headers.mk
>>>===================================================================
>>>--- toolchain/kernel-headers/kernel-headers.mk  (revision 16776)
>>>+++ toolchain/kernel-headers/kernel-headers.mk  (working copy)
>>>@@ -150,6 +150,7 @@
>>> $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
>>>        (cd $(LINUX_HEADERS_UNPACK_DIR) ; \
>>>         $(MAKE) ARCH=$(KERNEL_ARCH)
>>> INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR)
>>>headers_install)
>>>+       cp $(LINUX_HEADERS_UNPACK_DIR)/Makefile $(LINUX_HEADERS_DIR)
>>>        touch $(LINUX_HEADERS_DIR)/.configured
>>> else
>>> # the sanitized kernel-headers
>>>
>>
>>Could you look if calling make prepare (or something like make
>
> Ah, no. The old uClibc release had version checks that are removed for
> good from uClibc trunk.
>
> To please uClibc-0.9.28, we can copy the Makefile, but i ask you to
> update the patch to delete that Makefile if the kernel version is >=
> 2.6.18 and uClibc-0.9.28 is used, right after the configure-step from
> uClibc.
>
> thanks,
>
