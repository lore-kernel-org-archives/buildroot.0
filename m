From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:40 +0200
Subject: [Buildroot] [PATCH 060/100] newt: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-61-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/newt/Config.in | 1 -
 package/newt/newt.mk   | 6 ++++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/newt/Config.in b/package/newt/Config.in
index a221615..c59af1c 100644
--- a/package/newt/Config.in
+++ b/package/newt/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_NEWT
 	depends on !BR2_STATIC_LIBS # unconditionally creates .so
 	select BR2_PACKAGE_SLANG
 	select BR2_PACKAGE_POPT
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Programming library for color text mode, widget based user interfaces.
 
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 1764bbc..456dd69 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -7,8 +7,10 @@
 NEWT_VERSION = 0.52.19
 NEWT_SITE = https://pagure.io/releases/newt
 NEWT_INSTALL_STAGING = YES
-NEWT_DEPENDENCIES = popt slang \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+NEWT_DEPENDENCIES = popt slang $(TARGET_NLS_DEPENDENCIES)
+# Force to use libintl, otherwise it finds gettext functions in the C
+# library, and does not link against libintl.
+NEWT_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 NEWT_CONF_OPTS = --without-python --without-tcl
 NEWT_MAKE = $(MAKE1)
 NEWT_LICENSE = GPL-2.0
-- 
2.9.4
