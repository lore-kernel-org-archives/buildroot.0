From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Apr 2014 21:58:03 +0200
Subject: [Buildroot] [PATCH 1/6] system: make the zoneinfo list a system
	option
In-Reply-To: <cover.1396900553.git.yann.morin.1998@free.fr>
References: <cover.1396900553.git.yann.morin.1998@free.fr>
Message-ID: <3b823a60209ab14af1ad45420c9b3bd4014f3311.1396900553.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>

---
Note: because the tzdata package loses its prompt, it defaults
to 'n'. This means a user will loose his timezone settings,
unless he selects to install timezone info in the system
configuration menu.

We can not add a legacy option for that, or we'd get a circular
dependency. The only way we'd be fool-proof would be by renaming
the package altogether, and adding a legacy option for the old
name.
---
 Config.in.legacy         | 15 +++++++++++++++
 package/tzdata/Config.in | 23 +++--------------------
 package/tzdata/tzdata.mk |  4 ++--
 system/Config.in         | 23 +++++++++++++++++++++++
 4 files changed, 43 insertions(+), 22 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ce44d0f..393cc1f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -215,6 +215,21 @@ config BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
+config BR2_TARGET_TZ_ZONELIST
+	default BR2_PACKAGE_TZDATA_ZONELIST if BR2_PACKAGE_TZDATA_ZONELIST != ""
+
+config BR2_PACKAGE_TZDATA_ZONELIST
+	string "tzdata: the timezone list option has been renamed"
+	help
+	  The option BR2_PACKAGE_TZDATA_ZONELIST has been renamed to
+	  BR2_TARGET_TZ_ZONELIST, and moved to the "System configuration"
+	  menu. You'll need to select BR2_TARGET_TZ_INFO.
+
+config BR2_PACKAGE_TZDATA_ZONELIST_WRAP
+	bool
+	default y if BR2_PACKAGE_TZDATA_ZONELIST != ""
+	select BR2_LEGACY
+
 config BR2_sh2
 	bool "sh2 support removed"
 	help
diff --git a/package/tzdata/Config.in b/package/tzdata/Config.in
index 1be6814..1e6cc0f 100644
--- a/package/tzdata/Config.in
+++ b/package/tzdata/Config.in
@@ -1,26 +1,9 @@
-comment "tzdata needs an (e)glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+# This package is not meant to be user-visible.
+# It gets selected by BR2_TARGET_TZ in system/Config.in
 
 config BR2_PACKAGE_TZDATA
-	bool "tzdata"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	bool
 	help
 	  Time zone database
 
 	  http://www.iana.org/time-zones/repository/tz-link.html
-
-if BR2_PACKAGE_TZDATA
-
-config BR2_PACKAGE_TZDATA_ZONELIST
-	string "Time zone list"
-	default "default"
-	help
-	  Space-separated list of time zones to compile.
-
-	  The value "default" includes all commonly used time zones. Note
-	  that this set consumes around 5.5M.
-
-	  The full list is the list of files in the time zone database source,
-	  not including the build and .tab files.
-
-endif
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index d5c9f66..5900473 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -13,10 +13,10 @@ TZDATA_LICENSE = Public domain
 TZDATA_DEFAULT_ZONELIST = africa antarctica asia australasia backward etcetera \
 			europe factory northamerica pacificnew southamerica
 
-ifeq ($(call qstrip,$(BR2_PACKAGE_TZDATA_ZONELIST)),default)
+ifeq ($(call qstrip,$(BR2_TARGET_TZ_ZONELIST)),default)
 TZDATA_ZONELIST = $(TZDATA_DEFAULT_ZONELIST)
 else
-TZDATA_ZONELIST = $(call qstrip,$(BR2_PACKAGE_TZDATA_ZONELIST))
+TZDATA_ZONELIST = $(call qstrip,$(BR2_TARGET_TZ_ZONELIST))
 endif
 
 # Don't strip any path components during extraction.
diff --git a/system/Config.in b/system/Config.in
index ba225ce..d69e880 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -267,6 +267,29 @@ config BR2_TARGET_GENERIC_GETTY_OPTIONS
 endmenu
 endif
 
+config BR2_TARGET_TZ_INFO
+	bool "Install timezone info"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_TZDATA
+	help
+	  Say 'y' here to install timezone info.
+
+if BR2_TARGET_TZ_INFO
+
+config BR2_TARGET_TZ_ZONELIST
+	string "timezone list"
+	default "default"
+	help
+	  Space-separated list of time zones to compile.
+
+	  The value "default" includes all commonly used time zones. Note
+	  that this set consumes around 5.5M.
+
+	  The full list is the list of files in the time zone database source,
+	  not including the build and .tab files.
+
+endif # BR2_TARGET_TZ_INFO
+
 config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 	bool "remount root filesystem read-write during boot"
 	default y
-- 
1.8.3.2
