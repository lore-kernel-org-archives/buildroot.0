From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 21:48:24 +0100
Subject: [Buildroot] [git commit] package/brltty: explicitly check if ioperm
 is available
Message-ID: <20171229205518.9AF0A80DB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee8309e2874063603e9f330aa529fa2f027681a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ioperm, inb and outb are i386 specific functions usually
not available on non-PC archs.  Check if ioperm is available before
trying to use it.

Patch cherry-picked from upstream, can be removed when 5.6 is out.

Fixes:
  http://autobuild.buildroot.net/results/f09974f2ba24319e55e578ece34bb2e7e8bb3c43
  http://autobuild.buildroot.net/results/7d502f280c46f0d1e2678140f9117fcc59bc2d7b

Signed-off-by: Mario Lang <mlang@blind.guru>
[Thomas: move patch out of per-version directory, add comment
explaining why we need to autoreconf, and why we can't use
<pkg>_AUTORECONF.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...operm-to-make-sure-the-platform-supports-.patch | 31 ++++++++++++++++++++++
 package/brltty/brltty.mk                           | 12 ++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/package/brltty/0002-Check-for-ioperm-to-make-sure-the-platform-supports-.patch b/package/brltty/0002-Check-for-ioperm-to-make-sure-the-platform-supports-.patch
new file mode 100644
index 0000000..3dbacb3
--- /dev/null
+++ b/package/brltty/0002-Check-for-ioperm-to-make-sure-the-platform-supports-.patch
@@ -0,0 +1,31 @@
+From 28dde6749327fd15a1b8b7bcf5cc74a95598582a Mon Sep 17 00:00:00 2001
+From: Mario Lang <mlang@delysid.org>
+Date: Fri, 29 Dec 2017 10:35:05 +0100
+Subject: [PATCH] Check for ioperm to make sure the platform supports ports
+ I/O. (ml)
+
+Signed-off-by: Mario Lang <mlang@blind.guru>
+---
+This patch was taken from upstream, and can be removed when 5.6 is out.
+
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5e94d33bd..07119dd9f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1446,7 +1446,9 @@ BRLTTY_ARG_PACKAGE([ports], [I/O ports], [], [dnl
+       ports_package="kfreebsd"
+       ;;
+    linux*)
+-      ports_package="glibc"
++      AC_CHECK_FUNC([ioperm], [
++         ports_package="glibc"
++      ])
+       ;;
+    mingw*)
+       ports_package="windows"
+-- 
+2.15.0
+
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 9621d4f..632aa68 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -11,7 +11,7 @@ BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
 BRLTTY_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
 BRLTTY_LICENSE_FILES = LICENSE-GPL LICENSE-LGPL
 
-BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf
 
 BRLTTY_CONF_OPTS = \
 	--disable-java-bindings \
@@ -24,6 +24,16 @@ BRLTTY_CONF_OPTS = \
 	--without-mikropuhe --without-speechd --without-swift \
 	--without-theta --without-viavoice
 
+# Autoreconf is needed because we're patching configure.ac in
+# 0002-Check-for-ioperm-to-make-sure-the-platform-supports-.patch. However,
+# a plain autoreconf doesn't work, because this package is only
+# autoconf-based.
+define BRLTTY_AUTOCONF
+	cd $(BRLTTY_SRCDIR) && $(AUTOCONF)
+endef
+
+BRLTTY_PRE_CONFIGURE_HOOKS += BRLTTY_AUTOCONF
+
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 BRLTTY_DEPENDENCIES += bluez5_utils
 BRLTTY_CONF_OPTS += --with-bluetooth-package
