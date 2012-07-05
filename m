From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Thu,  5 Jul 2012 22:01:31 +0200
Subject: [Buildroot] [PATCH v2] syslinux: bump to 4.05
In-Reply-To: <4FF5F191.4050404@mind.be>
References: <CAJkQPOm7x8898X-bjDhN+LRN_EY8wR46WWj7hZmFOD0Q8YiASA@mail.gmail.com>
 <4FF5F191.4050404@mind.be>
Message-ID: <1341518491-14146-1-git-send-email-aras.vaichas@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* bump syslinux from 4.04 to 4.05
* add patch to fix build problem with 4.05, see
http://old.nabble.com/syslinux-fails-to-build-td34112447.html
* add util-linux dependency and make sure the build finds it

Signed-off-by: Aras Vaichas <aras.vaichas@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2 [Arnout]:
- Fix whitespace problems
- util-linux dependency for libuuid

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
-- 
tg: (8f6fc94..) t/syslinux-4.05 (depends on: master)
