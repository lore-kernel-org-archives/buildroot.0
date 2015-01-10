From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Jan 2015 16:51:52 +0100
Subject: [Buildroot] [PATCH v2] package/sane-backends: remove unsafe headers
	path
Message-ID: <1420905112-31654-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/deb/deb3d45416633b9217d3cc09664273687c809464/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: remove entirely "INCLUDES=" line (Thomas Petazzoni)
---
 .../0003-remove-unsafe-headers-path.patch          | 28 ++++++++++++++++++++++
 package/sane-backends/sane-backends.mk             |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 package/sane-backends/0003-remove-unsafe-headers-path.patch

diff --git a/package/sane-backends/0003-remove-unsafe-headers-path.patch b/package/sane-backends/0003-remove-unsafe-headers-path.patch
new file mode 100644
index 0000000..29b8d04
--- /dev/null
+++ b/package/sane-backends/0003-remove-unsafe-headers-path.patch
@@ -0,0 +1,28 @@
+From 3c03e4b81c9de73e57a56029f7f8cda8bec24e91 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 10 Jan 2015 15:48:21 +0100
+Subject: [PATCH] configure.in: remove unsafe headers path
+
+Forcing /usr/local/include headers path in CFLAGS is unsafe for
+cross-compilation.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index a8fc950..93a4b77 100644
+--- a/configure.in
++++ b/configure.in
+@@ -82,7 +82,6 @@ AM_CONDITIONAL(CROSS_COMPILING, test x$cross_compiling = xyes)
+ dnl ***********************************************************************
+ dnl set compiler/linker flags
+ dnl ***********************************************************************
+-INCLUDES="${INCLUDES} -I/usr/local/include"
+ AC_SUBST(INCLUDES)
+ SANE_SET_CFLAGS([$is_release])
+ SANE_SET_LDFLAGS
+-- 
+1.9.3
+
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index f8c59e8..bde8e6a 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -10,6 +10,8 @@ SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPLv2+
 SANE_BACKENDS_LICENSE_FILES = COPYING
 SANE_BACKENDS_INSTALL_STAGING = YES
+# 0003-remove-unsafe-headers-path.patch patch configure.in
+SANE_BACKENDS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 SANE_BACKENDS_DEPENDENCIES += libusb
-- 
1.9.3
