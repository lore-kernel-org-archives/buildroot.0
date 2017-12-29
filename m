From: Mario Lang <mlang@blind.guru>
Date: Fri, 29 Dec 2017 13:52:03 +0100
Subject: [Buildroot] [PATCH 2/2] Explicitly check if ioperm is available
In-Reply-To: <20171229125203.2361-1-mlang@blind.guru>
References: <20171229125203.2361-1-mlang@blind.guru>
Message-ID: <20171229125203.2361-2-mlang@blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ioperm, inb and outb are i386 specific functions usuall
not available on non-PC archs.  Check if ioperm is available before
trying to use it.

Patch cherry-picked from upstream, can be removed when 5.6 is out.

Fixes:
  http://autobuild.buildroot.net/results/f09974f2ba24319e55e578ece34bb2e7e8bb3c43
  http://autobuild.buildroot.net/results/7d502f280c46f0d1e2678140f9117fcc59bc2d7b
Signed-off-by: Mario Lang <mlang@blind.guru>
---
 ...operm-to-make-sure-the-platform-supports-.patch | 31 ++++++++++++++++++++++
 package/brltty/brltty.mk                           |  6 +++++
 2 files changed, 37 insertions(+)
 create mode 100644 package/brltty/5.5/0002-Check-for-ioperm-to-make-sure-the-platform-supports-.patch

diff --git a/package/brltty/5.5/0002-Check-for-ioperm-to-make-sure-the-platform-supports-.patch b/package/brltty/5.5/0002-Check-for-ioperm-to-make-sure-the-platform-supports-.patch
new file mode 100644
index 0000000000..3dbacb3b57
--- /dev/null
+++ b/package/brltty/5.5/0002-Check-for-ioperm-to-make-sure-the-platform-supports-.patch
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
index 9621d4f9c1..00b796d78d 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -24,6 +24,12 @@ BRLTTY_CONF_OPTS = \
 	--without-mikropuhe --without-speechd --without-swift \
 	--without-theta --without-viavoice
 
+define BRLTTY_AUTOCONF
+	cd $(BRLTTY_SRCDIR) && $(AUTOCONF)
+endef
+
+BRLTTY_PRE_CONFIGURE_HOOKS += BRLTTY_AUTOCONF
+
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 BRLTTY_DEPENDENCIES += bluez5_utils
 BRLTTY_CONF_OPTS += --with-bluetooth-package
-- 
2.15.0
