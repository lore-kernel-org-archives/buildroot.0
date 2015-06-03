From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:29 +0200
Subject: [Buildroot] [PATCH 12/32 v2] package/matchbox: get rid of
	intermediate non-package matchbox
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <d7b1f4cbe279dd83cff17a1dac1a66a0dba73157.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the matchbox entry in the menu is a non-package entry, that
forcibly selects the matchbox-wm package, which is the real matchbox WM.

So, get rid of the current matchbox option, rename the existing
matchbox-wm to simply matchbox, so we have a real package from the
onset.

Since we're re-using the previous option for the WM package, there is no
need for an entry in the legacy menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../{matchbox-wm => }/0001-defaulttheme.patch      |  0
 package/matchbox/Config.in                         |  2 --
 package/matchbox/matchbox-wm/Config.in             |  3 --
 package/matchbox/matchbox-wm/matchbox-wm.mk        | 38 --------------------
 .../matchbox-wm.hash => matchbox.hash}             |  0
 package/matchbox/matchbox.mk                       | 40 ++++++++++++++++++++++
 6 files changed, 40 insertions(+), 43 deletions(-)
 rename package/matchbox/{matchbox-wm => }/0001-defaulttheme.patch (100%)
 delete mode 100644 package/matchbox/matchbox-wm/Config.in
 delete mode 100644 package/matchbox/matchbox-wm/matchbox-wm.mk
 rename package/matchbox/{matchbox-wm/matchbox-wm.hash => matchbox.hash} (100%)

diff --git a/package/matchbox/matchbox-wm/0001-defaulttheme.patch b/package/matchbox/0001-defaulttheme.patch
similarity index 100%
rename from package/matchbox/matchbox-wm/0001-defaulttheme.patch
rename to package/matchbox/0001-defaulttheme.patch
diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 891ac95..7d06bb2 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_MATCHBOX
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_MATCHBOX_LIB
-	select BR2_PACKAGE_MATCHBOX_WM
 	help
 	  Matchbox is an Open Source base environment for the X Window
 	  System running on non-desktop embedded platforms such as
@@ -20,7 +19,6 @@ config BR2_PACKAGE_MATCHBOX
 if BR2_PACKAGE_MATCHBOX
 
 source "package/matchbox/matchbox-lib/Config.in"
-source "package/matchbox/matchbox-wm/Config.in"
 source "package/matchbox/matchbox-panel/Config.in"
 source "package/matchbox/matchbox-desktop/Config.in"
 source "package/matchbox/matchbox-common/Config.in"
diff --git a/package/matchbox/matchbox-wm/Config.in b/package/matchbox/matchbox-wm/Config.in
deleted file mode 100644
index 6ad5dfc..0000000
--- a/package/matchbox/matchbox-wm/Config.in
+++ /dev/null
@@ -1,3 +0,0 @@
-config BR2_PACKAGE_MATCHBOX_WM
-	bool
-	select BR2_PACKAGE_MATCHBOX_LIB
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
deleted file mode 100644
index da9efd7..0000000
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ /dev/null
@@ -1,38 +0,0 @@
-################################################################################
-#
-# matchbox-wm
-#
-################################################################################
-
-MATCHBOX_WM_VERSION = 1.2
-MATCHBOX_WM_SOURCE = matchbox-window-manager-$(MATCHBOX_WM_VERSION).tar.bz2
-MATCHBOX_WM_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-window-manager/$(MATCHBOX_WM_VERSION)
-MATCHBOX_WM_LICENSE = GPLv2+
-MATCHBOX_WM_LICENSE_FILES = COPYING
-
-MATCHBOX_WM_DEPENDENCIES = matchbox-lib
-MATCHBOX_WM_CONF_OPTS = --enable-expat
-
-# Workaround bug in configure script
-MATCHBOX_WM_CONF_ENV = expat=yes
-
-ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
-ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
-MATCHBOX_WM_CONF_OPTS += --enable-composite
-MATCHBOX_WM_DEPENDENCIES += xlib_libXcomposite
-MATCHBOX_WM_DEPENDENCIES += xlib_libXpm
-endif
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
-MATCHBOX_WM_DEPENDENCIES += xlib_libXft
-endif
-
-ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
-MATCHBOX_WM_CONF_OPTS += --enable-startup-notification
-MATCHBOX_WM_DEPENDENCIES += startup-notification
-else
-MATCHBOX_WM_CONF_OPTS += --disable-startup-notification
-endif
-
-$(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.hash b/package/matchbox/matchbox.hash
similarity index 100%
rename from package/matchbox/matchbox-wm/matchbox-wm.hash
rename to package/matchbox/matchbox.hash
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index ae989b3..100a633 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -1 +1,41 @@
+################################################################################
+#
+# matchbox
+#
+################################################################################
+
+MATCHBOX_VERSION = 1.2
+MATCHBOX_SOURCE = matchbox-window-manager-$(MATCHBOX_VERSION).tar.bz2
+MATCHBOX_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-window-manager/$(MATCHBOX_VERSION)
+MATCHBOX_LICENSE = GPLv2+
+MATCHBOX_LICENSE_FILES = COPYING
+
+MATCHBOX_DEPENDENCIES = matchbox-lib
+MATCHBOX_CONF_OPTS = --enable-expat
+
+# Workaround bug in configure script
+MATCHBOX_CONF_ENV = expat=yes
+
+ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
+ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
+MATCHBOX_CONF_OPTS += --enable-composite
+MATCHBOX_DEPENDENCIES += xlib_libXcomposite
+MATCHBOX_DEPENDENCIES += xlib_libXpm
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
+MATCHBOX_DEPENDENCIES += xlib_libXft
+endif
+
+ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
+MATCHBOX_CONF_OPTS += --enable-startup-notification
+MATCHBOX_DEPENDENCIES += startup-notification
+else
+MATCHBOX_CONF_OPTS += --disable-startup-notification
+endif
+
+$(eval $(autotools-package))
+
+# After we called a package infra, we can include more files
 include $(sort $(wildcard package/matchbox/*/*.mk))
-- 
1.9.1
