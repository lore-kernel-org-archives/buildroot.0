From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 00:04:23 +0100
Subject: [Buildroot] [git commit] package/expedite: bump to efl-1.15 branch
Message-ID: <20151217230816.75FF7803E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40e6f4ee0754878c337d39800281e25b89e34b66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since expedite hasn't been released since 1.7.10 release,
use efl-1.15 branch in the git tree.

Use the newly added libefl package wich provide a new version
of efl libraries.

Autoreconf the package since there is no configure script
in the git tree.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/expedite/Config.in     |  8 ++------
 package/expedite/expedite.hash |  2 --
 package/expedite/expedite.mk   | 14 +++++++++-----
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/package/expedite/Config.in b/package/expedite/Config.in
index e60510b..0bcf343 100644
--- a/package/expedite/Config.in
+++ b/package/expedite/Config.in
@@ -2,15 +2,11 @@ config BR2_PACKAGE_EXPEDITE
 	bool "expedite"
 	depends on BR2_PACKAGE_EFL
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
-	select BR2_PACKAGE_LIBEET
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEVAS
 	help
 	  Expedite is the official Evas benchmark tool. It can test different
 	  engines, such as X11, XRender, OpenGL (also ES variant), SDL,
 	  DirectFB and so on. Its tests are quite extensive, trying to
 	  reproduce real world usage cases.
 
-comment "expedite needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "expedite needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/expedite/expedite.hash b/package/expedite/expedite.hash
deleted file mode 100644
index cde3689..0000000
--- a/package/expedite/expedite.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256 91d0290ba3635a4440c389647643beaa8e39def2789d685d54a58a723398cc10  expedite-1.7.10.tar.bz2
diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
index 27b4c44..4a4e2ee 100644
--- a/package/expedite/expedite.mk
+++ b/package/expedite/expedite.mk
@@ -4,15 +4,19 @@
 #
 ################################################################################
 
-EXPEDITE_VERSION = 1.7.10
-EXPEDITE_SOURCE = expedite-$(EXPEDITE_VERSION).tar.bz2
-EXPEDITE_SITE = http://download.enlightenment.org/releases
+# efl-1.15 branch
+EXPEDITE_VERSION = 3ce8b3f1451700f9a2da60c2e717c644220e2449
+EXPEDITE_SITE = http://git.enlightenment.org/tools/expedite.git
+EXPEDITE_SITE_METHOD = git
 EXPEDITE_LICENSE = BSD-2c
 EXPEDITE_LICENSE_FILES = COPYING
 
-EXPEDITE_DEPENDENCIES = libevas libeina libeet
+EXPEDITE_DEPENDENCIES = host-libefl host-pkgconf libefl
 
-ifeq ($(BR2_PACKAGE_LIBEVAS_X11),y)
+# There is no configure script in the git tree.
+EXPEDITE_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB),y)
 EXPEDITE_CONF_OPTS += --with-x=$(STAGING_DIR) \
 	--x-includes=$(STAGING_DIR)/usr/include \
 	--x-libraries=$(STAGING_DIR)/usr/lib
