From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 6 Jun 2014 14:44:29 +0100
Subject: [Buildroot] [PATCH 5/5] pinentry: new package
In-Reply-To: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1402062269-57018-6-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
Reviewed-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in            |    1 +
 package/pinentry/Config.in   |   53 ++++++++++++++++++++++++++++++++++++++++++
 package/pinentry/pinentry.mk |   47 +++++++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+), 0 deletions(-)
 create mode 100644 package/pinentry/Config.in
 create mode 100644 package/pinentry/pinentry.mk

diff --git a/package/Config.in b/package/Config.in
index 03d6670..325a0b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1078,6 +1078,7 @@ source "package/inotify-tools/Config.in"
 source "package/lockfile-progs/Config.in"
 source "package/logrotate/Config.in"
 source "package/logsurfer/Config.in"
+source "package/pinentry/Config.in"
 source "package/screen/Config.in"
 source "package/sudo/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
new file mode 100644
index 0000000..392133f
--- /dev/null
+++ b/package/pinentry/Config.in
@@ -0,0 +1,53 @@
+menuconfig BR2_PACKAGE_PINENTRY
+	bool "pinentry"
+	help
+	  A collection of simple PIN or pass-phrase entry dialogs
+
+	  https://www.gnupg.org/related_software/pinentry/
+
+if BR2_PACKAGE_PINENTRY
+
+config BR2_PACKAGE_PINENTRY_NCURSES
+	bool "pinentry-ncurses"
+	# At least one backend is needed to avoid build breakage
+	default y if !BR2_PACKAGE_PINENTRY_GTK2 && !BR2_PACKAGE_PINENTRY_QT4
+	select BR2_PACKAGE_NCURSES
+	help
+	  The pinentry-ncurses tool
+
+config BR2_PACKAGE_PINENTRY_GTK2
+	bool "pinentry-gtk2"
+	# propagate libgtk2's dependencies
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on BR2_INSTALL_LIBSTDCPP
+	# select libgtk2
+	select BR2_PACKAGE_LIBGTK2
+	help
+	  The pinentry-gtk2 tool
+
+comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_XORG7 || !BR2_USE_WCHAR || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_PINENTRY_QT4
+	bool "pinentry-qt4"
+	# propagate qt's dependencies
+	depends on !BR2_avr32 # lacks TLS
+	depends on BR2_USE_MMU # fork
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# select qt
+	select BR2_PACKAGE_QT
+	help
+	  The pinentry-qt4 tool
+
+comment "pinentry-qt4 needs a toolchain w/ C++, threads"
+	depends on !BR2_avr32
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+endif
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
new file mode 100644
index 0000000..11046e6
--- /dev/null
+++ b/package/pinentry/pinentry.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# pinentry
+#
+################################################################################
+
+PINENTRY_VERSION = 0.8.3
+PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
+PINENTRY_SITE = ftp://ftp.gnupg.org/gcrypt/pinentry
+PINENTRY_LICENSE = GPLv2
+PINENTRY_LICENSE_FILES = COPYING
+PINENTRY_CONF_OPT =  --disable-pinentry-gtk # gtk1
+PINENTRY_CONF_OPT += --disable-pinentry-qt  # qt3
+PINENTRY_CONF_OPT += --without-libcap       # requires PAM
+
+# build with X if available
+ifeq ($(BR2_PACKAGE_XORG7),y)
+PINENTRY_CONF_OPT += --with-x
+else
+PINENTRY_CONF_OPT += --without-x
+endif
+
+# pinentry-ncurses backend
+ifeq ($(BR2_PACKAGE_PINENTRY_NCURSES),y)
+PINENTRY_CONF_OPT += --enable-ncurses
+PINENTRY_DEPENDENCIES += ncurses
+else
+PINENTRY_CONF_OPT += --disable-ncurses
+endif
+
+# pinentry-gtk2 backend
+ifeq ($(BR2_PACKAGE_PINENTRY_GTK2),y)
+PINENTRY_CONF_OPT += --enable-pinentry-gtk2
+PINENTRY_DEPENDENCIES += libgtk2
+else
+PINENTRY_CONF_OPT += --disable-pinentry-gtk2
+endif
+
+# pinentry-qt4 backend
+ifeq ($(BR2_PACKAGE_PINENTRY_QT4),y)
+PINENTRY_CONF_OPT += --enable-pinentry-qt4
+PINENTRY_DEPENDENCIES += qt
+else
+PINENTRY_CONF_OPT += --disable-pinentry-qt4
+endif
+
+$(eval $(autotools-package))
-- 
1.7.1
