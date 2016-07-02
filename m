From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:45:34 +0200
Subject: [Buildroot] [git commit] package/systemd: Remove SYSTEMD_COMPAT
	option
Message-ID: <20160702144559.F1E56818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=638cfb5e0e4f93c7d3ccddf17dd95d719943c5fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since v230 of systemd, the compat libraries have been fully removed.
https://github.com/systemd/systemd/commit/4de282cf9324ab13d17ac334244d0d7cae2df37d

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[Thomas: rewrap Config.in help text in Config.in.legacy and put the
option at the right place.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy             |  8 ++++++++
 package/dbus/Config.in       |  1 -
 package/liblogging/Config.in |  1 -
 package/systemd/Config.in    | 13 -------------
 package/systemd/systemd.mk   |  6 ------
 5 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 34bdaf0..a135d3d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.08"
 
+config BR2_PACKAGE_SYSTEMD_COMPAT
+	bool "systemd compatibility libraries have been removed"
+	help
+	  The systemd option te enable the compatibility libraries has
+	  been removed. Theses libraries have been useless since a few
+	  version, and have been fully dropped from the source since
+	  v230.
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIVEADDER
 	bool "gst1-plugins-bad liveadder plugin removed"
 	select BR2_LEGACY
diff --git a/package/dbus/Config.in b/package/dbus/Config.in
index 7d49ce5..653f748 100644
--- a/package/dbus/Config.in
+++ b/package/dbus/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_DBUS
 	# uses fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_SYSTEMD_COMPAT if BR2_INIT_SYSTEMD
 	help
 	  The D-Bus message bus system.
 
diff --git a/package/liblogging/Config.in b/package/liblogging/Config.in
index 12ee950..23c3c1a 100644
--- a/package/liblogging/Config.in
+++ b/package/liblogging/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBLOGGING
 	bool "liblogging"
-	select BR2_PACKAGE_SYSTEMD_COMPAT if BR2_INIT_SYSTEMD
 	help
 	  Liblogging is an easy to use library for
 	  logging. It offers an enhanced replacement
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 34c00ad..f064c12 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -311,19 +311,6 @@ config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-timesyncd.html
 
-config BR2_PACKAGE_SYSTEMD_COMPAT
-	bool "enable compatibility libraries"
-	help
-	  Since systemd 209, the following libraries have been merged into
-	  libsystemd.so:
-
-	  - libsystemd-daemon
-	  - libsystemd-id128
-	  - libsystemd-journal
-	  - libsystemd-login
-
-	  This option enables the installation of compatibility *.pc files.
-
 config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	bool "enable SMACK support"
 	select BR2_PACKAGE_ATTR
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 2f5019c..835fc26 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -54,12 +54,6 @@ define SYSTEMD_RUN_INTLTOOLIZE
 endef
 SYSTEMD_PRE_CONFIGURE_HOOKS += SYSTEMD_RUN_INTLTOOLIZE
 
-ifeq ($(BR2_PACKAGE_SYSTEMD_COMPAT),y)
-SYSTEMD_CONF_OPTS += --enable-compat-libs
-else
-SYSTEMD_CONF_OPTS += --disable-compat-libs
-endif
-
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_CONF_OPTS += --enable-acl
 SYSTEMD_DEPENDENCIES += acl
