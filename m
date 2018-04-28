From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 22:05:52 +0200
Subject: [Buildroot] [git commit] libconfig: bump to version 1.7.2
Message-ID: <20180428200717.42D5689091@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a30d794f9b68794992998b4b7ff967f198dd9520
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site to github
 - Add hash for license file
 - Add patch to disable documentation (sent upstream:
https://github.com/hyperrealm/libconfig/pull/116)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libconfig/0001-Add-disable-doc-option.patch    | 54 ++++++++++++++++++++++
 package/libconfig/Config.in                        |  2 +-
 package/libconfig/libconfig.hash                   |  3 +-
 package/libconfig/libconfig.mk                     |  6 ++-
 4 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/package/libconfig/0001-Add-disable-doc-option.patch b/package/libconfig/0001-Add-disable-doc-option.patch
new file mode 100644
index 0000000000..ac323eba24
--- /dev/null
+++ b/package/libconfig/0001-Add-disable-doc-option.patch
@@ -0,0 +1,54 @@
+From a0301bde126c2b08b50e789fd025a8c513c914c3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 28 Apr 2018 19:15:22 +0200
+Subject: [PATCH] Add --disable-doc option
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am  |  6 +++++-
+ configure.ac | 12 ++++++++++++
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 50ef4fa..e94d3ec 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,7 +1,11 @@
+ 
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-SUBDIRS = lib doc tinytest tests
++SUBDIRS = lib tinytest tests
++
++if BUILDDOC
++SUBDIRS += doc
++endif
+ 
+ if BUILDEXAMPLES
+ SUBDIRS += examples
+diff --git a/configure.ac b/configure.ac
+index 62c5c56..8a14855 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -99,6 +99,18 @@ docxx=yes
+ 
+ AM_CONDITIONAL(BUILDCXX, test x$docxx = xyes)
+ 
++dodoc=yes
++
++AC_ARG_ENABLE(doc,
++AS_HELP_STRING([--disable-doc], [Disable building of the documentation]),
++[if test "$enableval" = "no"; then dodoc="no"; fi],
++[
++dodoc=yes
++]
++)
++
++AM_CONDITIONAL(BUILDDOC, test x$dodoc = xyes)
++
+ doexamples=yes
+ 
+ AC_ARG_ENABLE(examples,
+-- 
+2.14.1
+
diff --git a/package/libconfig/Config.in b/package/libconfig/Config.in
index 75dacab36d..9541b30bfc 100644
--- a/package/libconfig/Config.in
+++ b/package/libconfig/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LIBCONFIG
 	  readable than XML. And unlike XML, it is type-aware, so it is
 	  not necessary to do string parsing in application code.
 
-	  http://www.hyperrealm.com/libconfig/
+	  https://hyperrealm.github.io/libconfig/
diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
index 30110cbbd0..7a77034e68 100644
--- a/package/libconfig/libconfig.hash
+++ b/package/libconfig/libconfig.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6  libconfig-1.5.tar.gz
+sha256  f67ac44099916ae260a6c9e290a90809e7d782d96cdd462cac656ebc5b685726  libconfig-v1.7.2.tar.gz
+sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING.LIB
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index ed7e40f162..699f593385 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-LIBCONFIG_VERSION = 1.5
-LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig
+LIBCONFIG_VERSION = v1.7.2
+LIBCONFIG_SITE = $(call github,hyperrealm,libconfig,$(LIBCONFIG_VERSION))
 LIBCONFIG_LICENSE = LGPL-2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
 LIBCONFIG_INSTALL_STAGING = YES
+# From git
+LIBCONFIG_AUTORECONF = YES
 LIBCONFIG_CONF_OPTS = --disable-examples
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
