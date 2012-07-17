From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 19:45:06 +0200
Subject: [Buildroot] [git commit] syslinux: bump to 4.05
Message-ID: <20120717181425.E886C8F8BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2ff1ac2b34ed23273e1284255ba5970f47126d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* bump syslinux from 4.04 to 4.05
* add patch to fix build problem with 4.05, see
http://old.nabble.com/syslinux-fails-to-build-td34112447.html
* add util-linux dependency and make sure the build finds it

Signed-off-by: Aras Vaichas <aras.vaichas@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/syslinux/syslinux-build-fix-for-uuid.patch |   15 +++++++++++++++
 boot/syslinux/syslinux.mk                       |    9 ++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/boot/syslinux/syslinux-build-fix-for-uuid.patch b/boot/syslinux/syslinux-build-fix-for-uuid.patch
new file mode 100644
index 0000000..04ff562
--- /dev/null
+++ b/boot/syslinux/syslinux-build-fix-for-uuid.patch
@@ -0,0 +1,15 @@
+Author: Micah Gersten <micahg@ubuntu.com>
+Description: Fix build failure with --as-needed (Closes: #654838).
+
+diff -Naurp syslinux.orig/utils/Makefile syslinux/utils/Makefile
+--- syslinux.orig/utils/Makefile       2011-12-23 14:53:26.653571511 +0100
++++ syslinux/utils/Makefile    2012-01-22 18:55:03.849466924 +0100
+@@ -51,7 +51,7 @@ isohdpfx.c: $(ISOHDPFX) isohdpfxarray.pl
+ 	$(PERL) isohdpfxarray.pl $(ISOHDPFX) > $@
+
+ isohybrid: isohybrid.o isohdpfx.o
+-	$(CC) $(LDFLAGS) -luuid -o $@ $^
++	$(CC) $(LDFLAGS) -o $@ $^ -luuid
+
+ gethostip: gethostip.o
+ 	$(CC) $(LDFLAGS) -o $@ $^
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 3e89bdf..185baab 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -4,17 +4,20 @@
 #
 #############################################################
 
-SYSLINUX_VERSION = 4.04
+SYSLINUX_VERSION = 4.05
 SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.bz2
 SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/4.xx/
 
 SYSLINUX_INSTALL_TARGET = NO
 SYSLINUX_INSTALL_IMAGES = YES
 
-SYSLINUX_DEPENDENCIES = host-nasm
+SYSLINUX_DEPENDENCIES = host-nasm host-util-linux
 
+# syslinux build system has no convenient way to pass CFLAGS,
+# and the internal zlib should take precedence so -I shouldn't
+# be used.
 define SYSLINUX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(HOSTCC)" AR="$(HOSTAR)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" AR="$(HOSTAR)" -C $(@D)
 endef
 
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += isolinux.bin
