From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 23 Mar 2015 21:36:23 +0100
Subject: [Buildroot] [PATCH] mc: new package
Message-ID: <1427142983-26051-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Mauro Condarelli <mc5686@mclink.it>

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
Changes since original patch from Mauro Condarelli
	- add mc.hash
	- bump to 4.8.14
	- implement comments from Baruch Siach and Thomas Petazzoni

 package/Config.in    |  1 +
 package/mc/Config.in | 15 +++++++++++++++
 package/mc/mc.hash   |  2 ++
 package/mc/mc.mk     | 26 ++++++++++++++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 package/mc/Config.in
 create mode 100644 package/mc/mc.hash
 create mode 100644 package/mc/mc.mk

diff --git a/package/Config.in b/package/Config.in
index 93fde92..a013db6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1363,6 +1363,7 @@ menu "Text editors and viewers"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/less/Config.in"
 endif
+	source "package/mc/Config.in"
 	source "package/nano/Config.in"
 	source "package/uemacs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/mc/Config.in b/package/mc/Config.in
new file mode 100644
index 0000000..b2bb8ea
--- /dev/null
+++ b/package/mc/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_MC
+	bool "mc"
+	depends on BR2_USE_WCHAR # libglib2
+        depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+        depends on BR2_USE_MMU # libglib2, slang
+	select BR2_PACKAGE_LIBGLIB2
+	# mc prefers slang, but can use ncurses too
+	select BR2_PACKAGE_SLANG if !BR2_PACKAGE_NCURSES
+	help
+	  GNU Midnight Commander is a visual file manager, licensed under
+	  GNU General Public License. It can use either SLang(preferred)
+	  or ncurses for screen handling; if neither is enabled SLang
+	  will be automatically chosen.
+	  
+	  https://www.midnight-commander.org/
diff --git a/package/mc/mc.hash b/package/mc/mc.hash
new file mode 100644
index 0000000..5d14f5a
--- /dev/null
+++ b/package/mc/mc.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  61fd0fd2280c3d09d7e0aec8ab001fc89dad8e4fd9941f386414667b55152ec5  mc-4.8.14.tar.bz2
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
new file mode 100644
index 0000000..dd74d0c
--- /dev/null
+++ b/package/mc/mc.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# mc
+#
+################################################################################
+
+MC_VERSION = 4.8.14
+MC_SOURCE = mc-$(MC_VERSION).tar.bz2
+MC_SITE = http://ftp.midnight-commander.org
+MC_LICENSE =  GPLv3
+MC_LICENSE_FILES = COPYING
+MC_INSTALL_STAGING = YES
+MC_DEPENDENCIES = libglib2 host-pkgconf
+
+# mc prefers slang, so use that if enabled, otherwise
+# fallback to using ncurses.
+# Either or both will be enabled, but we prefer slang.
+ifeq ($(BR2_PACKAGE_SLANG),y)
+MC_DEPENDENCIES += slang
+MC_CONF_OPTS += --with-screen=slang
+else
+MC_DEPENDENCIES += ncurses
+MC_CONF_OPTS += --with-screen=ncurses
+endif
+
+$(eval $(autotools-package))
-- 
2.1.0
