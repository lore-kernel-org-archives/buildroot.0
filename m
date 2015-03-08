From: Mauro Condarelli <mc5686@mclink.it>
Date: Sun,  8 Mar 2015 22:37:07 +0100
Subject: [Buildroot] [PATCH 1/3] Added new package 'mc' (Midnight Commander).
Message-ID: <1425850629-14725-1-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in    |    1 +
 package/mc/Config.in |   10 ++++++++++
 package/mc/mc.mk     |   27 +++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 package/mc/Config.in
 create mode 100644 package/mc/mc.mk

diff --git a/package/Config.in b/package/Config.in
index cab9382..745426e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1351,6 +1351,7 @@ menu "Text editors and viewers"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/less/Config.in"
 endif
+	source "package/mc/Config.in"
 	source "package/nano/Config.in"
 	source "package/uemacs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/mc/Config.in b/package/mc/Config.in
new file mode 100644
index 0000000..735523f
--- /dev/null
+++ b/package/mc/Config.in
@@ -0,0 +1,10 @@
+# mc prefers slang, but can use ncurses too
+config BR2_PACKAGE_MC
+	bool "mc"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_SLANG if !BR2_PACKAGE_NCURSES
+	help
+	  GNU Midnight Commander is a visual file manager, licensed under GNU General Public License.
+	  It can use either SLang(preferred) or ncurses for screen handling; if neither is enabled SLang will be automatically chosen.
+	  
+	  https://www.midnight-commander.org/
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
new file mode 100644
index 0000000..678e1f7
--- /dev/null
+++ b/package/mc/mc.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# mc
+#
+################################################################################
+
+MC_VERSION_MAJOR = 4.8
+MC_VERSION = $(MC_VERSION_MAJOR).13
+MC_SOURCE = mc-$(MC_VERSION).tar.bz2
+MC_SITE = http://ftp.midnight-commander.org
+MC_INSTALL_STAGING = YES
+MC_INSTALL_TARGET = YES
+MC_CONF_OPTS = --disable-shared
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
1.7.10.4
