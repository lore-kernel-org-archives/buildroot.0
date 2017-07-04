From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:58 +0200
Subject: [Buildroot] [PATCH 078/100] ushare: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-79-thomas.petazzoni@free-electrons.com>
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

 - using BR2_SYSTEM_ENABLE_NLS instead of BR2_ENABLE_LOCALE to decide
   if NLS support should be enabled or not

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ushare/Config.in |  1 -
 package/ushare/ushare.mk | 10 +++-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/ushare/Config.in b/package/ushare/Config.in
index 70bf24a..c3475b8 100644
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_USHARE
 	# linking.
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBUPNP
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  uShare is a UPnP (TM) A/V & DLNA Media Server.
 	  It implements the server component that provides UPnP media devices
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index 32aa445..bb194f6 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -7,9 +7,10 @@
 USHARE_VERSION = 1.1a
 USHARE_SOURCE = ushare-$(USHARE_VERSION).tar.bz2
 USHARE_SITE = http://ushare.geexbox.org/releases
-USHARE_DEPENDENCIES = host-pkgconf libupnp
+USHARE_DEPENDENCIES = host-pkgconf libupnp $(TARGET_NLS_DEPENDENCIES)
 USHARE_LICENSE = GPL-2.0+
 USHARE_LICENSE_FILES = COPYING
+USHARE_LDFLAGS = $(TARGET_NLS_LIBS)
 
 USHARE_CONF_OPTS = \
 	--prefix=/usr \
@@ -18,12 +19,7 @@ USHARE_CONF_OPTS = \
 	--sysconfdir=/etc \
 	--disable-strip
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-USHARE_DEPENDENCIES += gettext
-USHARE_LDFLAGS += -lintl
-endif
-
-ifeq ($(BR2_ENABLE_LOCALE),)
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
 USHARE_CONF_OPTS += --disable-nls
 endif
 
-- 
2.9.4
