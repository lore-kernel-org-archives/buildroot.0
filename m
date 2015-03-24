From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 24 Mar 2015 20:57:47 +0100
Subject: [Buildroot] [PATCH v3] mc: new package
Message-ID: <1427227067-3514-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Mauro Condarelli <mc5686@mclink.it>

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v3: fix hash location, drop install staging (Bernd Kuhls)
	v2: fix indentation
Changes since original patch from Mauro Condarelli
        - add mc.hash
        - bump to 4.8.14
        - implement comments from Baruch Siach and Thomas Petazzoni

 package/Config.in    |  1 +
 package/mc/Config.in | 19 +++++++++++++++++++
 package/mc/mc.hash   |  2 ++
 package/mc/mc.mk     | 25 +++++++++++++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 package/mc/Config.in
 create mode 100644 package/mc/mc.hash
 create mode 100644 package/mc/mc.mk

diff --git a/package/Config.in b/package/Config.in
index d6a5ad3..566a78a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1364,6 +1364,7 @@ menu "Text editors and viewers"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/less/Config.in"
 endif
+	source "package/mc/Config.in"
 	source "package/nano/Config.in"
 	source "package/uemacs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/mc/Config.in b/package/mc/Config.in
new file mode 100644
index 0000000..7030b5f
--- /dev/null
+++ b/package/mc/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_MC
+	bool "mc"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2, slang
+	select BR2_PACKAGE_LIBGLIB2
+	# mc prefers slang, but can use ncurses too
+	select BR2_PACKAGE_SLANG if !BR2_PACKAGE_NCURSES
+	help
+	  GNU Midnight Commander is a visual file manager, licensed under
+	  GNU General Public License. It can use either SLang (preferred)
+	  or ncurses for screen handling; if neither is enabled SLang
+	  will be automatically chosen.
+
+	  https://www.midnight-commander.org
+
+comment "mc needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
diff --git a/package/mc/mc.hash b/package/mc/mc.hash
new file mode 100644
index 0000000..588bbaa
--- /dev/null
+++ b/package/mc/mc.hash
@@ -0,0 +1,2 @@
+# Hash from http://ftp.midnight-commander.org/mc-4.8.14.sha256:
+sha256  61fd0fd2280c3d09d7e0aec8ab001fc89dad8e4fd9941f386414667b55152ec5  mc-4.8.14.tar.bz2
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
new file mode 100644
index 0000000..fb223ff
--- /dev/null
+++ b/package/mc/mc.mk
@@ -0,0 +1,25 @@
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
