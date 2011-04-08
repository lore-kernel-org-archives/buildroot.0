From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  8 Apr 2011 15:22:35 +0000 (UTC)
Subject: [Buildroot] [Bug 3571] New: u-boot: fw_printenv does not build
Message-ID: <bug-3571-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3571

           Summary: u-boot: fw_printenv does not build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: luca.ceresoli at tiscali.it
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3181
  --> https://bugs.busybox.net/attachment.cgi?id=3181
Buildroot configuration to reproduce the problem

fw_printenv does not build in current versions of buildroot.

The problem is well known ussue in upstream U-Boot.
The good news is that there is a workaround.
The bad news is that the issue is known by the U-Boot developers
since last october, but there does not seem to be activity to
really fix it.

For the long story see the links in
http://lists.denx.de/pipermail/u-boot/2011-April/089987.html .

Reproduced with current buildroot (2011.02-116-g64b351f) and the
attached (minimized) config.

The result is:

  CONF  config/config.in
  CONF  config/config.in
mkdir -p /home/murray/temp/buildroot-clean/output/target/usr/sbin
/home/murray/temp/buildroot-clean/output/host/usr/bin/arm-unknown-linux-gnueabi-gcc
--sysroot=/home/murray/temp/buildroot-clean/output/host/usr/arm-unknown-linux-gnueabi/sysroot
-I/home/murray/temp/buildroot-clean/output/build/u-boot-2010.12/include
-I/include \
        -DUSE_HOSTCC -o
/home/murray/temp/buildroot-clean/output/target/usr/sbin/fw_printenv \
       
/home/murray/temp/buildroot-clean/output/build/u-boot-2010.12/tools/env/*.c
/home/murray/temp/buildroot-clean/output/build/u-boot-2010.12/lib*/crc32.c
/home/murray/temp/buildroot-clean/output/host/usr/lib/gcc/arm-unknown-linux-gnueabi/4.4.3/../../../../arm-unknown-linux-gnueabi/bin/ld:
errno: TLS definition in
/home/murray/temp/buildroot-clean/output/host/usr/arm-unknown-linux-gnueabi/sysroot/lib/libc.so.6
section .tbss mismatches non-TLS reference in /tmp/cccHIRXB.o
/home/murray/temp/buildroot-clean/output/host/usr/arm-unknown-linux-gnueabi/sysroot/lib/libc.so.6:
could not read symbols: Bad value
collect2: ld returned 1 exit status
make: ***
[/home/murray/temp/buildroot-clean/output/target/usr/sbin/fw_printenv] Error 1

I solved this problem applying the known workaround this way:

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index d859cf5..4de4d1f 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -166,9 +166,8 @@ $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/.configured
 # Build manually fw_printenv for the target
 $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/.configured
     mkdir -p $(@D)
-    $(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
-        -DUSE_HOSTCC -o $@ \
-        $(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/lib*/crc32.c
+    $(MAKE) HOSTCC="$(TARGET_CC)" -C $(U_BOOT_DIR) env
+    cp $(U_BOOT_DIR)/tools/env/fw_printenv $@
     $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
     ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv

This works for me, but I don't know if will for other people, nor
if it is general enough to be proposed for mainline buildroot inclusion.

Any observations?

Luca

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
