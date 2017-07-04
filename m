From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:18 +0200
Subject: [Buildroot] [PATCH 038/100] kbd: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-39-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kbd/Config.in | 1 -
 package/kbd/kbd.mk    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/kbd/Config.in b/package/kbd/Config.in
index ab1f1b3..6cf2fc0 100644
--- a/package/kbd/Config.in
+++ b/package/kbd/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_KBD
 	bool "kbd"
 	# Uses fork()
 	depends on BR2_USE_MMU
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Keytable files and keyboard utilities.
 
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 175a237..a4873f3 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -11,7 +11,7 @@ KBD_CONF_OPTS = \
 	--disable-vlock \
 	--disable-tests
 KBD_DEPENDENCIES = \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf
 KBD_LICENSE = GPL-2.0+
 KBD_LICENSE_FILES = COPYING
-- 
2.9.4
