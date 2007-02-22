From: Bobby Ramsook <bobby.83x2@gmail.com>
Date: Thu, 22 Feb 2007 05:14:54 -0500
Subject: [Buildroot] Problem building build root in a squashhfs image
In-Reply-To: <20070215140111.GB18188@aon.at>
References: <12d878080702111341q1b2b9468w53aff97f6c6ccb0c@mail.gmail.com>
	<20070212090729.58cf28f0.philippe.ney@pardes.ws>
	<12d878080702142303k63ed50a7jb99f7b5d3bf21617@mail.gmail.com>
	<12d878080702142341q47408d7fib76e4954763a3677@mail.gmail.com>
	<12d878080702142356o85daefetee5e8eb2cfbc90c1@mail.gmail.com>
	<20070215140111.GB18188@aon.at>
Message-ID: <12d878080702220214j38b78b84i1477aac4b81d63a1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A patch if the kernel will not build properly:



Index: target/linux26.mk
===================================================================
--- target/linux26.mk   (revision 17949)
+++ target/linux26.mk   (working copy)
@@ -32,7 +32,7 @@

 # Linux kernel configuration file
 # Has to be set by the target/device
-# LINUX26_KCONFIG=$(BR2_BOARD_PATH)/linux26.config
+# LINUX26_KCONFIG=$(BR2_BOARD_PATH)/linux26-$(LINUX26_VERSION).config

 # File name for the Linux kernel binary
 LINUX26_KERNEL=linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
@@ -61,7 +61,7 @@
                sleep 5; \
        fi;

-ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
+#ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
 $(DL_DIR)/$(LINUX26_SOURCE):
         $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)

@@ -74,10 +74,12 @@
 endif
        touch $@

+linux-patched: $(LINUX26_DIR)/.patched
+
 $(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
        toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
        touch $@
-endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
+# endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))

 $(LINUX26_DIR)/.configured:  $(LINUX26_DIR)/.patched  $(LINUX26_KCONFIG)
        cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config

_________________________________________________________________________________
On 2/15/07, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
>
> On Thu, Feb 15, 2007 at 02:56:27AM -0500, Bobby Ramsook wrote:
> >If any one else is having problems, may be it might be related to the
> >following lines:
>
> I cannot really see what you did below, so please do a "svn diff" and
> send that instead
>
> thanks,
>



-- 
Bobby Ramsook
CCNY Computer Tech
Grad Date (EXP):  07'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070222/cd936786/attachment.htm 
