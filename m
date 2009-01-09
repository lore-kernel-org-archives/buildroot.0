From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Fri, 9 Jan 2009 17:07:29 +0100
Subject: [Buildroot] [PATCH] u-boot: add config option to disable
	general patches
In-Reply-To: <87hc48o6hp.fsf@macbook.be.48ers.dk>
References: <200811140854.58814.markus.heidelberg@web.de>
	<200901091608.17923.markus.heidelberg@web.de>
	<87hc48o6hp.fsf@macbook.be.48ers.dk>
Message-ID: <200901091707.29369.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard, 09.01.2009:
> >>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:
> 
>  >> (E.G. Linux/U-Boot). Building upstream versions of those rarely make
>  >> sense for custom boards, so having the option to apply custom patches
> 
>  Markus> Which is available, but only in addition to the general patches lying
>  Markus> around.
> 
> Exactly, it should ofcourse be INSTEAD.

Which was the reason for the config option in my patch.

Or do you think of the following, without an additional option? Maybe
this would make sense!?

--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -85,13 +85,14 @@ $(U_BOOT_DIR)/.unpacked: $(DL_DIR)/$(U_BOOT_SOURCE)
        touch $@

 $(U_BOOT_DIR)/.patched: $(U_BOOT_DIR)/.unpacked
-       toolchain/patch-kernel.sh $(U_BOOT_DIR) target/u-boot/$(U_BOOT_VERSION) \
-               u-boot-$(U_BOOT_VERSION)-\*.patch \
-               u-boot-$(U_BOOT_VERSION)-\*.patch.$(ARCH)
 ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH)),"")
        @mkdir -p $(U_BOOT_PATCH_DIR)
        cp -dpr $(BR2_TARGET_UBOOT_CUSTOM_PATCH) $(U_BOOT_PATCH_DIR)
        toolchain/patch-kernel.sh $(U_BOOT_DIR) $(U_BOOT_PATCH_DIR) \*.patch
+else
+       toolchain/patch-kernel.sh $(U_BOOT_DIR) target/u-boot/$(U_BOOT_VERSION) \
+               u-boot-$(U_BOOT_VERSION)-\*.patch \
+               u-boot-$(U_BOOT_VERSION)-\*.patch.$(ARCH)
 endif
        touch $@
