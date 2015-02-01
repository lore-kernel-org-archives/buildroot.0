From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Feb 2015 14:54:07 +0100
Subject: [Buildroot] [git commit] memtest86+: new package
Message-ID: <20150201135502.1445580722@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5007d478ed1284cd4006e13bf08400dda5857992
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: tweak help text as suggested by Thomas]
Signed-off-by Stephen M. Kenton <skenton@ou.edu>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                |    1 +
 package/memtest86/Config.in      |   28 ++++++++++++++++++++++++++++
 package/memtest86/memtest86.hash |    2 ++
 package/memtest86/memtest86.mk   |   19 +++++++++++++++++++
 4 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d3e5ac8..1f37c7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -341,6 +341,7 @@ endif
 	source "package/lvm2/Config.in"
 	source "package/mdadm/Config.in"
 	source "package/media-ctl/Config.in"
+	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
 	source "package/minicom/Config.in"
 	source "package/nanocom/Config.in"
diff --git a/package/memtest86/Config.in b/package/memtest86/Config.in
new file mode 100644
index 0000000..3a684b6
--- /dev/null
+++ b/package/memtest86/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_MEMTEST86
+	bool "memtest86"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  Memtest86+ is a bootable standalone memory test program.
+
+	  Buildroot does not support packages with a '+' sign in their
+	  name, which explains why it is named memtest86 and not
+	  memtest86+.
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
diff --git a/package/memtest86/memtest86.hash b/package/memtest86/memtest86.hash
new file mode 100644
index 0000000..cac0be7
--- /dev/null
+++ b/package/memtest86/memtest86.hash
@@ -0,0 +1,2 @@
+# locally computed using sha256sum
+sha256	5630ce978d0e6b671891df4253fc5c54659764d0cdfc7515ac0df3d8dd9e8737  memtest86+-4.20.tar.gz
diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
new file mode 100644
index 0000000..eb01d96
--- /dev/null
+++ b/package/memtest86/memtest86.mk
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
