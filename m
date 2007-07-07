From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 7 Jul 2007 12:06:09 +0200
Subject: [Buildroot] $(TARGET_CONFIGURE_OPTS) $(MAKE) vs $(MAKE)
	$(TARGET_CONFIGURE_OPTS)
References: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
	<20070706155558.GA18954@real.realitydiluted.com>
Message-ID: <000201c7c087$9e70d0a0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> * Update mtdutils (which is really old)
>>
> Please do not check in changes to this until running the patch by
> me. This package is critical for a lot of embedded systems and has
> been working well up to this point and there are no bugs in the
> bug tracker.
> 

Before looking at introducing my new version (as an option)
I tried rebuilding the current svn and ran into a problem with mtd.

When building for arm, the target mtdutils are built using the *host* compiler 
and stored in $(TARGET_DIR)/usr/sbin.

When the arm-linux-uclibc-strip is invoked on 
"$(TARGET_DIR)/usr/sbin/flash_erase" 
compiled by gcc (not arm-linux-uclibc-gcc), the make fails.

I think someone got it wrong in the "package/mtd/mtd.mk" which says

    $(TARGET_CONFIGURE_OPTS) $(MAKE) ...    - build using gcc
    
which should be:

     $(MAKE) $(TARGET_CONFIGURE_OPTS) ...    - build using arm-linux-uclibc-gcc

I am using Gnu Make 3.81 on OpenSuSE 10.2

Looks to be a number of the packages that suffer from this problem.
* argus
* distcc
* flex
* kexec
* l2tp
* libevent
* libusb
* microcom
* nano
* netcat
* procps
* qte
* qtopia4
* quagga
* rsync
* samba
* thttpd
* tinyx
* usbutils
* wget

Anyone only using the x86 architecture, maybe would not see this problem.
Anyone using something else will suffer.

Suggest we apply the patch below to the packages above.

Index: package/mtd/mtd.mk
===================================================================
--- package/mtd/mtd.mk (revision 19014)
+++ package/mtd/mtd.mk (arbetskopia)
@@ -115,7 +115,7 @@
 MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/util/, $(MTD_TARGETS_y))
 
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
- $(TARGET_CONFIGURE_OPTS) $(MAKE) CFLAGS="-I$(MTD_DIR)/include -I$(LINUX_HEADERS_DIR)/include" LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
+ $(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I$(MTD_DIR)/include -I$(LINUX_HEADERS_DIR)/include" LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
 
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
 


Best Regards
Ulf Samuelsson
