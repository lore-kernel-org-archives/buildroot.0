From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 23:11:54 +0100
Subject: [Buildroot] [git commit] package/rpm: don't use sub-options for
	bzip2 and xz features
Message-ID: <20150201221238.16B848046F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c476540d17aaa629aa67bc754f1f67233d20aed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow enabling features depends on the relying packages.

Add the old sub-options to Config.in.legacy.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy      |   16 ++++++++++++++++
 package/rpm/Config.in |   19 -------------------
 package/rpm/rpm.mk    |    5 +++--
 3 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a8c5dab..0f1b202 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -102,6 +102,22 @@ endif
 
 comment "Legacy options removed in 2015.02"
 
+config BR2_PACKAGE_RPM_BZIP2_PAYLOADS
+	bool "rpm's bzip2 payloads option has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BZIP2
+	help
+	  The bzip2 payloads option rely entirely on the dependant package bzip2.
+	  So, you need to select it to enable this feature.
+
+config BR2_PACKAGE_RPM_XZ_PAYLOADS
+	bool "rpm's xz payloads option has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XZ
+	help
+	  The xz payloads option rely entirely on the dependant package xz.
+	  So, you need to select it to enable this feature.
+
 config BR2_PACKAGE_M4
 	bool "m4 target package removed"
 	select BR2_LEGACY
diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 5ec4167..c6fc3b7 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -19,22 +19,3 @@ config BR2_PACKAGE_RPM
 	  The RPM package management system.
 
 	  http://rpm5.org
-
-if BR2_PACKAGE_RPM
-
-config BR2_PACKAGE_RPM_BZIP2_PAYLOADS
-	bool "support for bzip2 payloads"
-	select BR2_PACKAGE_BZIP2
-	help
-	  Support for bzip2 payloads in RPM.
-
-config BR2_PACKAGE_RPM_XZ_PAYLOADS
-	bool "support for xz payloads"
-	depends on BR2_INSTALL_LIBSTDCPP
-	help
-	  Support for xz payloads in RPM.
-
-comment "xz payload support needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
-endif
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 74f5b88..68d964a 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -44,11 +44,12 @@ else
 RPM_CONF_OPTS += --with-file=no
 endif
 
-ifeq ($(BR2_PACKAGE_RPM_XZ_PAYLOADS),y)
+# xz payload support needs a toolchain w/ C++
+ifeq ($(BR2_PACKAGE_XZ)$(BR2_INSTALL_LIBSTDCPP),yy)
 RPM_CONF_OPTS += --with-xz
 endif
 
-ifeq ($(BR2_PACKAGE_RPM_BZIP2_PAYLOADS),y)
+ifeq ($(BR2_PACKAGE_BZIP2),y)
 RPM_CONF_OPTS += --with-bzip2
 RPM_DEPENDENCIES += bzip2
 endif
