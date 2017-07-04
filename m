From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:28:44 +0200
Subject: [Buildroot] [git commit] libv4l: use the new gettext logic
Message-ID: <20170704233516.741C080330@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34c5bd726643a2063c2567ef49f58ab1419c016f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libv4l/Config.in | 1 -
 package/libv4l/libv4l.mk | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 638aeff..e7f78dc 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -19,7 +19,6 @@ comment "libv4l JPEG support not enabled"
 
 config BR2_PACKAGE_LIBV4L_UTILS
 	bool "v4l-utils tools"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  v4l-utils is a collection of various video4linux and DVB utilities.
 	  Enable this if you want to build the following tools:
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index b742717..5950c5a 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -61,9 +61,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
 LIBV4L_CONF_OPTS += --enable-v4l-utils
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-LIBV4L_DEPENDENCIES += gettext
-endif
+LIBV4L_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
 ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
 LIBV4L_CONF_OPTS += --enable-qv4l2
 LIBV4L_DEPENDENCIES += qt5base
