From: Steve Kenton <skenton@ou.edu>
Date: Sat, 31 Jan 2015 18:00:01 -0600
Subject: [Buildroot] [PATCH V3] memtest86+: new package
Message-ID: <54CD6C81.1040808@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Memtest86+ is a bootable standalone memory test program.

Please note that this is the forked memtest86+ program and not
the original memtest86 which has different licensing. Buildroot
does not support packages with a '+' sign in their name.

Memtest86+ is a utility designed to test whether your memory
is in working order. It repeatedly writes an enormous amount
of different patterns to all memory locations and reads them
back again and verifies whether the result of the read is the
same as what was written to memory.

Memtest86+ will only work on 32-bit or 64-bit x86 targets.
It boots as an i486 program and autodetects hardware.

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
I promise I'll try to have future patches use git, I just
wanted to clear out the stuff I had laying around before
possibly disappearing down a rabbit hole for a long time.

I'm using V4.20 which ships with Ubuntu 14.04 and has
never give me trouble instead of V5.01 which hung twice
during my testing - probably due to the new multi-core support

V3 changed hash to sha256sum and cleaned up text a bit
V2 added hash file

diff -pruN buildroot.ori/package/Config.in buildroot/package/Config.in
--- buildroot.ori/package/Config.in	2015-01-27 16:58:14.000000000 -0600
+++ buildroot/package/Config.in	2015-01-31 17:49:44.362634907 -0600
@@ -341,6 +341,7 @@ endif
 	source "package/lvm2/Config.in"
 	source "package/mdadm/Config.in"
 	source "package/media-ctl/Config.in"
+	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
 	source "package/minicom/Config.in"
 	source "package/nanocom/Config.in"
diff -pruN buildroot.ori/package/memtest86/Config.in buildroot/package/memtest86/Config.in
--- buildroot.ori/package/memtest86/Config.in	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/memtest86/Config.in	2015-01-31 17:30:57.870613298 -0600
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_MEMTEST86
+	bool "memtest86"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  Memtest86+ is a bootable standalone memory test program.
+
+	  Please note that this is the forked memtest86+ program and not
+	  the original memtest86 which has different licensing. Buildroot
+	  does not support packages with a '+' sign in their name.
+
+	  Memtest86+ is a utility designed to test whether your memory
+	  is in working order. It repeatedly writes an enormous amount
+	  of different patterns to all memory locations and reads them
+	  back again and verifies whether the result of the read is the
+	  same as what was written to memory.
+
+	  Memtest86+ will only work on 32-bit or 64-bit x86 targets.
+	  It boots as an i486 program and autodetects hardware. It can
+	  be added to the grub2 boot menu by adding the following lines
+	  to the bottom of /boot/grub/grub.cfg - note the use of linux16.
+
+	  menuentry "Memtest86+" {
+		 linux16 /boot/memtest86+.bin
+	  }
+
+	  Other boot loaders will have similar requirements.
+
+	  http://www.memtest.org
diff -pruN buildroot.ori/package/memtest86/memtest86.hash buildroot/package/memtest86/memtest86.hash
--- buildroot.ori/package/memtest86/memtest86.hash	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/memtest86/memtest86.hash	2015-01-31 17:45:11.522629673 -0600
@@ -0,0 +1,2 @@
+# locally computed using sha256sum
+sha256	5630ce978d0e6b671891df4253fc5c54659764d0cdfc7515ac0df3d8dd9e8737  memtest86+-4.20.tar.gz
diff -pruN buildroot.ori/package/memtest86/memtest86.mk buildroot/package/memtest86/memtest86.mk
--- buildroot.ori/package/memtest86/memtest86.mk	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/memtest86/memtest86.mk	2015-01-31 17:32:12.982614739 -0600
@@ -0,0 +1,19 @@
+###############################################################################
+#
+# memtest86
+#
+###############################################################################
+
+MEMTEST86_VERSION = 4.20
+MEMTEST86_SOURCE = memtest86+-$(MEMTEST86_VERSION).tar.gz
+MEMTEST86_SITE = http://www.memtest.org/download/$(MEMTEST86_VERSION)
+MEMTEST86_LICENSE = GPLv2
+MEMTEST86_LICENSE_FILES = README
+
+# memtest86+ is sensitive to toolchain changes, use the shipped binary version
+define MEMTEST86_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/precomp.bin $(TARGET_DIR)/boot/memtest86+.bin
+endef
+
+$(eval $(generic-package))
+
