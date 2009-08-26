From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 26 Aug 2009 17:50:55 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <87fxbemhjh.fsf@macbook.be.48ers.dk>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA738@mi8nycmail19.Mi8.com><20090822011906.2dd045fc@surf><BD79186B4FD85F4B8E60E381CAEE19091E7909@mi8nycmail19.Mi8.com><20090822105505.27ace9b6@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA86D@mi8nycmail19.Mi8.com><20090823081702.445b1b5a@surf><BD79186B4FD85F4B8E60E381CAEE190901C550E7@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901C55101@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901C551E6@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901C552DE@mi8nycmail19.Mi8.com><20090825190153.GA29206@mx.loc><BD79186B4FD85F4B8E60E381CAEE190901C55435@mi8nycmail19.Mi8.com>
	<87fxbemhjh.fsf@macbook.be.48ers.dk>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901C554E3@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, August 26, 2009 1:45 PM, Peter Korsgaard wrote:
>> What I don't understand is why they need to be copied to $(STAGING_DIR)
>> and then needing to re-direct the --sysroot to them.  The only comment
>> about this in ext-tool.mk says:
>
> I didn't write the external toolchain support, but I guess it's
> because the individual packages wants to install their libraries /
> headers, and it's a lot simpler (E.G. similar to the internal
> toolchain) if everything is together in a single directory tree
> instead of 2 trees.

Thanks for the information.

I've "almost" got the external toolchain stuff working with the
multilib CodeSourcery toolchain.

I started with the two commits Thomas Petrazzoni made:

> Same place as the other fixes, in my multilib-toolchain-fix branch, at
> http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=multilib-toolchain-fix
> 
> The two commits are :
>  http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=multilib-toolchain-fix&id=65ee9b3945a665f1279fa940b30818f4924acd31
>  http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=multilib-toolchain-fix&id=2907415d82b7d306ca3f1f1ead0bbb0c7f1505c3

There are still a couple of issues with the external multilib toolchain
support.

1) The commit to improve SYSROOT_DIR detection was not passing the -march=???
option when trying the -print-sysroot option.  This results in the "default"
sysroot directory getting returned which is effectivly the same as the one
found by --with-sysroot.

This was easily fixed by adding the following before the SYSROOT_DIR= stuff:

# We need to pass the -march= option in order to get the correct
# multilib sysroot with CROSS-gcc -print-sysroot.
ifneq ($(CC_TARGET_ARCH_),)
SYSROOT_CFLAGS=-march=$(CC_TARGET_ARCH_)
endif

Then changing the first SYSROOT_DIR= to:

SYSROOT_DIR=$(shell $(TARGET_CC) -print-sysroot $(SYSROOT_CFLAGS) 2>&1)

Now SYSROOT_DIR is the location of the correct files that need to be
copied to the target.

2) Not all the necessary sysroot files are getting copied to the target.

copy_toolchain_lib_root only copys the lib files.  According to the
CodeSourcery documentation the lib, usr/bin, and sbin files all need to
be copied to the target.  I couldn't figure out a clean way to do this
so I just hacked in the mkdir and cp commands and commented out the
for/call/done loop in ext-tool.mk.

3) The wrong files are getting copied to the staging directory.

The call to copy_toolchain_sysroot is passing SYSROOT_DIR that was
previously found above.  In the multilib toolchain case this will be
something like (in my case):

/home/bigguiness/CodeSourcery/Sourcery_G++_Lite/bin/../arm-none-linux-gnueabi/libc/armv4t

In that directory are etc, lib, sbin, and usr.  The copy_toolchain_sysroot
call copies all of these to $(STAGING_DIR).

But when the compiler is called with -march=armv4t --sysroot $(STAGING_DIR)
it trys to find the library files in $(STAGING_DIR)/armv4t/lib and
$(STAGING_DIR)/armv4t/usr/lib.

The correct directory that should have been copied to $(STAGING_DIR) is the
one that is found by the CROSS-gcc -v ... --with-sysroot value, which in my
case is:

/opt/codesourcery/arm-none-linux-gnueabi/libc

Which is a symlink to:

/home/bigguiness/CodeSourcery/Sourcery_G++_Lite/bin/../arm-none-linux-gnueabi/libc

This directory has armv4t, etc, lib, sbin, thumb2, and usr subdirectories in it.

To handle this I changed the second test to find the sysroot to WITH_SYSROOT_DIR.
If the test to find SYSROOT_DIR failed I set that equal to WITH_SYSROOT_DIR.

Now SYSROOT_DIR points to the necessary files for the target and
WITH_SYSROOT_DIR points to the files for STAGING_DIR.

Following is the modified patch:

---

diff a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -205,12 +205,26 @@
 EXTERNAL_LIBS+=libstdc++.so
 endif
 
-SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=)
+# We need to pass the -march= option in order to get the correct
+# multilib sysroot with CROSS-gcc -print-sysroot.
+ifneq ($(CC_TARGET_ARCH_),)
+SYSROOT_CFLAGS=-march=$(CC_TARGET_ARCH_)
+endif
+
+# SYSROOT_DIR selection. We first try the -print-sysroot option,
+# available in gcc 4.4.x and in some CodeSourcery toolchains. If this
+# option is not available, we fallback to the value of --with-sysroot
+# as visible in CROSS-gcc -v.
+SYSROOT_DIR=$(shell $(TARGET_CC) -print-sysroot $(SYSROOT_CFLAGS) 2>&1)
+WITH_SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=)
+ifeq ($(SYSROOT_DIR),)
+SYSROOT_DIR=$(WITH_SYSROOT_DIR)
+endif
 
 $(STAMP_DIR)/ext-toolchain-installed:
 	@echo "Checking external toolchain settings"
 	$(Q)$(call check_cross_compiler_exists)
-ifeq ($(strip $(SYSROOT_DIR)),)
+ifeq ($(strip $(WITH_SYSROOT_DIR)),)
 	@echo "External toolchain doesn't support --sysroot. Cannot use."
 	exit 1
 endif
@@ -224,9 +238,19 @@
 endif
 	mkdir -p $(TARGET_DIR)/lib
 	@echo "Copy external toolchain libraries to target..."
-	$(Q)for libs in $(EXTERNAL_LIBS); do \
-		$(call copy_toolchain_lib_root,$(SYSROOT_DIR),$$libs,/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
-	done
+#	$(Q)for libs in $(EXTERNAL_LIBS); do \
+#		$(call copy_toolchain_lib_root,$(SYSROOT_DIR),$$libs,/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
+#	done
+	# HACK
+	# Copy all the lib, usr/bin, and /sbin files from the sysroot
+	# to the target.
+	cp -d $(SYSROOT_DIR)/lib/* $(TARGET_DIR)/lib
+	mkdir -p $(TARGET_DIR)/usr
+	mkdir -p $(TARGET_DIR)/usr/bin
+	cp -d $(SYSROOT_DIR)/usr/bin/* $(TARGET_DIR)/usr/bin
+	mkdir -p $(TARGET_DIR)/sbin
+	cp -d $(SYSROOT_DIR)/sbin/* $(TARGET_DIR)/sbin
+	# END HACK
 	@echo "Copy external toolchain sysroot to staging..."
-	$(Q)$(call copy_toolchain_sysroot,$(SYSROOT_DIR))
+	$(Q)$(call copy_toolchain_sysroot,$(WITH_SYSROOT_DIR))
 	@touch $@

---

I also have Thomas' second patch applied that takes into account the
architecture variant (-mtune=, -march=, -mabi=, etc.).  With that patch and
the modified patch above I can now build my rootfs and it "almost" works.

My kernel (2.6.30.5) starts up fine then trys to run /sbin/init.  It now
doesn't do a kernel panic but I get the following:

rtc-isl1208 0-006f: setting system clock to 2009-08-26 13:41:04 UTC (1251294064)
RAMDISK: gzip image found at block 0
VFS: Mounted root (ext2 filesystem) on device 1:0.
Freeing init memory: 120K
run_init_process: /sbin/init
usb 1-1: configuration #1 chosen from 1 choice
input: HID 04d9:1203 as /devices/platform/ep93xx-ohci/usb1/1-1/1-1:1.0/input/input2
generic-usb 0003:04D9:1203.0001: input: USB HID v1.11 Keyboard [HID 04d9:1203] on usb-ep93xx-1/input0
input: HID 04d9:1203 as /devices/platform/ep93xx-ohci/usb1/1-1/1-1:1.1/input/input3
generic-usb 0003:04D9:1203.0002: input: USB HID v1.11 Device [HID 04d9:1203] on usb-ep93xx-1/input1
rcS (430): undefined instruction: pc=0007514c
Code: e1530001 9a00006f e1110002 0a000071 (e16f2f13)

Please press Enter to activate this console.

Every time I press Enter after that I get:

sh (441): undefined instruction: pc=0007514c
Code: e1530001 9a00006f e1110002 0a000071 (e16f2f13)

Please press Enter to activate this console.

I'm not sure how to figure out what the undefined instruction was but my
guess is it's an ARMv5T instruction.  It seems like something in the busybox
build did not honor the TARGET_CFLAGS that were setup for my build.

TARGET_CFLAGS= -Os -mtune=arm920t -march=armv4t -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 --sysroot /home/bigguiness/buildroot/build_arm/staging_dir/

Does anyone have any ideas on this?

Regards,
Hartley
