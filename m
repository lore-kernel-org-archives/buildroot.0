From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 21:38:15 +0200
Subject: [Buildroot] [git commit] package/quota: fix build on m68k
Message-ID: <20190403193440.C2C1C8D385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=feef4b733c4e5a6ee89d1554d29786304be7a720
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PIE breaks the build on m68k, so add an upstream patch to disable PIE.
Obviously, when we start seriously testing the BR2_RELRO_FULL option, we
will realize that it is broken on some architectures, and will probably
disable it on m68k.

Fixes:
 - http://autobuild.buildroot.org/results/25985bbc160e3d62b23c4c613b2a81f3711621e3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure.ac-add-disable-pie-option.patch | 55 ++++++++++++++++++++++
 package/quota/quota.mk                             |  1 +
 2 files changed, 56 insertions(+)

diff --git a/package/quota/0001-configure.ac-add-disable-pie-option.patch b/package/quota/0001-configure.ac-add-disable-pie-option.patch
new file mode 100644
index 0000000000..c3b57fea66
--- /dev/null
+++ b/package/quota/0001-configure.ac-add-disable-pie-option.patch
@@ -0,0 +1,55 @@
+From cb20e19028a8996de9305502ba5e5da3bd1181bf Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 2 Apr 2019 09:19:36 +0200
+Subject: [PATCH] configure.ac: add --disable-pie option
+
+PIE is not necessarily supported on all architectures, so add an option
+to allow the user to disable the PIE.
+
+This fixes the build on the m68k architecture:
+ - http://autobuild.buildroot.org/results/25985bbc160e3d62b23c4c613b2a81f3711621e3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: merged]
+---
+ Makefile.am  |  2 +-
+ configure.ac | 12 ++++++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 638198d..332bd67 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,5 +1,5 @@
+ ACLOCAL_AMFLAGS = -I m4
+-AM_LDFLAGS = -pie
++AM_LDFLAGS = @PIE_LDFLAGS@
+ 
+ doc_DATA = \
+        README.mailserver \
+diff --git a/configure.ac b/configure.ac
+index 095ff86..5af4235 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,6 +55,18 @@ AS_IF([test "x${prefix}" = "xNONE"], [
+   AC_DEFINE_UNQUOTED(PACKAGE_LOCALE_DIR, "${prefix}/share/locale", [Locale-specific data directory])
+ ])
+ 
++# ================
++# Check for ldflags
++# ================
++AC_ARG_ENABLE([pie],
++   [AS_HELP_STRING([--disable-pie], [Disable Position Independent Executable])],
++   [enable_pie="$enableval"],
++   [enable_pie=yes]
++)
++AS_IF([test x"$enable_pie" != "xno"], [
++    PIE_LDFLAGS="-pie"
++])
++AC_SUBST([PIE_LDFLAGS])
+ 
+ # ================
+ # Check for cflags
+-- 
+2.14.1
+
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 5f1e427d0b..8c7563d289 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -10,6 +10,7 @@ QUOTA_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-nfs-utils
 QUOTA_LICENSE = GPL-2.0+
 QUOTA_LICENSE_FILES = COPYING
 QUOTA_LIBS = $(TARGET_NLS_LIBS)
+QUOTA_CONF_OPTS = --disable-pie
 
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBNL),yy)
 QUOTA_DEPENDENCIES += host-pkgconf dbus libnl
