From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:52:30 +0200
Subject: [Buildroot] [PATCH 3/3] package/systemd: Remove SYSTEMD_COMPAT
	option
In-Reply-To: <1467409950-9628-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409950-9628-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409950-9628-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since v230 of systemd, the compat libraries have been fully removed.
https://github.com/systemd/systemd/commit/4de282cf9324ab13d17ac334244d0d7cae2df37d

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 Config.in.legacy             |  7 +++++++
 package/dbus/Config.in       |  1 -
 package/liblogging/Config.in |  1 -
 package/systemd/Config.in    | 13 -------------
 package/systemd/systemd.mk   |  6 ------
 5 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 34bdaf0..ff4deb2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -369,6 +369,13 @@ config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
 	  removed. To get the same features, the libgcrypt and xz
 	  package should now be enabled.
 
+config BR2_PACKAGE_SYSTEMD_COMPAT
+	bool "systemd compatibility libraries has been removed"
+	help
+		The systemd option te enable the compatibility libraries has been
+		removed. Theses libraries have been useless since a few version, and
+		have been fully dropped from the source since v230.
+
 config BR2_GCC_VERSION_4_5_X
 	bool "gcc 4.5.x has been removed"
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
index 6ac0c9a..430fc45 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -144,19 +144,6 @@ config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 
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
index fb306ee..d55d264 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -51,12 +51,6 @@ define SYSTEMD_RUN_INTLTOOLIZE
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
-- 
2.8.1
