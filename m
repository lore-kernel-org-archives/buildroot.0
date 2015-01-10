From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Jan 2015 16:11:01 +0100
Subject: [Buildroot] [PATCH 2/2] package/sane-backends: remove unsafe
	headers path
In-Reply-To: <1420902661-20721-1-git-send-email-romain.naour@openwide.fr>
References: <1420902661-20721-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1420902661-20721-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/deb/deb3d45416633b9217d3cc09664273687c809464/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../0003-remove-unsafe-headers-path.patch          | 29 ++++++++++++++++++++++
 package/sane-backends/sane-backends.mk             |  2 ++
 2 files changed, 31 insertions(+)
 create mode 100644 package/sane-backends/0003-remove-unsafe-headers-path.patch

diff --git a/package/sane-backends/0003-remove-unsafe-headers-path.patch b/package/sane-backends/0003-remove-unsafe-headers-path.patch
new file mode 100644
index 0000000..54b1835
--- /dev/null
+++ b/package/sane-backends/0003-remove-unsafe-headers-path.patch
@@ -0,0 +1,29 @@
+From a79d700923134678c38cedd96fa00b058f70d597 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 10 Jan 2015 15:48:21 +0100
+Subject: [PATCH] configure.in: remove unsafe headers path
+
+Forcing /usr/local/include headers path in CFLAGS is unsafe for
+cross-compilation.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index a8fc950..0b0bcd1 100644
+--- a/configure.in
++++ b/configure.in
+@@ -82,7 +82,7 @@ AM_CONDITIONAL(CROSS_COMPILING, test x$cross_compiling = xyes)
+ dnl ***********************************************************************
+ dnl set compiler/linker flags
+ dnl ***********************************************************************
+-INCLUDES="${INCLUDES} -I/usr/local/include"
++INCLUDES="${INCLUDES}"
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
