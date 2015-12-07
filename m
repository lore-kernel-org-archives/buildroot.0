From: Romain Naour <romain.naour@openwide.fr>
Date: Mon,  7 Dec 2015 22:29:23 +0100
Subject: [Buildroot] [PATCH v7 21/33] package/expedite: bump to efl-1.15
	branch
In-Reply-To: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1449523775-6582-22-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since expedite hasn't been released since 1.7.10 release,
use efl-1.15 branch in the git tree.

Use the newly added libefl package wich provide a new version
of efl libraries.

Autoreconf the package since there is no configure script
in the git tree.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v6: Add host-pkgconfig dependency (Yann E.Morin)
v5: Use depends on BR2_PACKAGE_EFL instead of select (ThomasP)
    remove comments on dependencies
v4: update Config.in to use libefl
    improve commit log
    keep the dependency on threads
    Replace the old BR2_PACKAGE_LIBEVAS_X11 by BR2_PACKAGE_LIBEFL_X
v2: bump to 1.15 branch
---
 package/expedite/Config.in   |  8 ++------
 package/expedite/expedite.mk | 13 +++++++++----
 2 files changed, 11 insertions(+), 10 deletions(-)

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
diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
index 9b232f8..6b3bbfe 100644
--- a/package/expedite/expedite.mk
+++ b/package/expedite/expedite.mk
@@ -4,14 +4,19 @@
 #
 ################################################################################
 
-EXPEDITE_VERSION = 1.7.10
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
+ifeq ($(BR2_PACKAGE_LIBEFL_X),y)
 EXPEDITE_CONF_OPTS += --with-x=$(STAGING_DIR) \
 	--x-includes=$(STAGING_DIR)/usr/include \
 	--x-libraries=$(STAGING_DIR)/usr/lib
-- 
2.4.3
