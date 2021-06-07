From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:45 -0000
Subject: [Buildroot] [git commit] package/seatd: new package
Message-ID: <20210607144654.246148B398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=daae31149017cbf8b03634cfc56da132f7e1ad83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce a seatd package, which can be used by wlroots 0.12.0 and
newer. The package includes both a library (always built) and an
optional seat management daemon.

The library can use systemd-logind, the seatd daemon, or a simple
builtin in-process mode. Build options are introduced for the daemon
and the built-in mode, as to allow selecting the built-in mode as
default when both the daemon and systemd-logind are not being built.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                  |  1 +
 ...on-Support-building-builtin-without-seatd.patch | 37 ++++++++++++++++++++++
 package/seatd/Config.in                            | 22 +++++++++++++
 package/seatd/seatd.hash                           |  5 +++
 package/seatd/seatd.mk                             | 37 ++++++++++++++++++++++
 5 files changed, 102 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e4a6dc292d..6e10988e51 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2491,6 +2491,7 @@ menu "System tools"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/sdbusplus/Config.in"
+	source "package/seatd/Config.in"
 	source "package/smack/Config.in"
 	source "package/start-stop-daemon/Config.in"
 	source "package/supervisor/Config.in"
diff --git a/package/seatd/0001-meson-Support-building-builtin-without-seatd.patch b/package/seatd/0001-meson-Support-building-builtin-without-seatd.patch
new file mode 100644
index 0000000000..fcaa355dc4
--- /dev/null
+++ b/package/seatd/0001-meson-Support-building-builtin-without-seatd.patch
@@ -0,0 +1,37 @@
+From 11bf7d5d11424749d549239540e5db06b8754bb5 Mon Sep 17 00:00:00 2001
+From: Kenny Levinsen <kl@kl.wtf>
+Date: Sun, 25 Apr 2021 20:16:19 +0200
+Subject: [PATCH] meson: Support building builtin without seatd
+
+The builtin backend relies on the seatd backend implementation. When
+builtin was enabled without seatd, compilation would fail due to the
+implementation not being included.
+
+Include the implementation if either seatd or builtin is enabled.
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream-Status: backport [with adaptations]
+---
+ meson.build | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index ff56845..8cb4fc6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -105,8 +105,11 @@ server_files = [
+ 	'seatd/server.c',
+ ]
+ 
+-if get_option('seatd').enabled()
++if get_option('seatd').enabled() or get_option('builtin').enabled()
+ 	private_files += 'libseat/backend/seatd.c'
++endif
++
++if get_option('seatd').enabled()
+ 	add_project_arguments('-DSEATD_ENABLED=1', language: 'c')
+ endif
+ 
+-- 
+2.31.1
+
diff --git a/package/seatd/Config.in b/package/seatd/Config.in
new file mode 100644
index 0000000000..2c2efcb04e
--- /dev/null
+++ b/package/seatd/Config.in
@@ -0,0 +1,22 @@
+menuconfig BR2_PACKAGE_SEATD
+	bool "seatd"
+	select BR2_PACKAGE_SEATD_BUILTIN \
+		if !BR2_PACKAGE_SYSTEMD_LOGIND && !BR2_PACKAGE_SEATD_DAEMON
+	help
+	  Seat management daemon and support library.
+
+	  https://git.sr.ht/~kennylevinsen/seatd
+
+if BR2_PACKAGE_SEATD
+
+config BR2_PACKAGE_SEATD_BUILTIN
+	bool "builtin backend"
+	help
+	  Builtin in-process seatd implementation inside libseat.
+
+config BR2_PACKAGE_SEATD_DAEMON
+	bool "seatd daemon"
+	help
+	  Build the seatd daemon and support for it inside libseat.
+
+endif
diff --git a/package/seatd/seatd.hash b/package/seatd/seatd.hash
new file mode 100644
index 0000000000..342079e958
--- /dev/null
+++ b/package/seatd/seatd.hash
@@ -0,0 +1,5 @@
+# Calculated locally
+sha256  274b56324fc81ca6002bc1cdd387668dee34a6e1063e5f3896805c3770948988  0.5.0.tar.gz
+
+# License files
+sha256  282a494803d666616bd726e0279636b5f6a31387ae19a707459074050f2600d3  LICENSE
diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
new file mode 100644
index 0000000000..2e90270555
--- /dev/null
+++ b/package/seatd/seatd.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# seatd
+#
+################################################################################
+
+SEATD_VERSION = 0.5.0
+SEATD_SOURCE = $(SEATD_VERSION).tar.gz
+SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
+SEATD_LICENSE = MIT
+SEATD_LICENSE_FILES = LICENSE
+SEATD_INSTALL_STAGING = YES
+
+SEATD_CONF_OPTS += \
+	-Dman-pages=disabled \
+	-Dexamples=disabled
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
+SEATD_CONF_OPTS += -Dlogind=enabled
+SEATD_DEPENDENCIES += systemd
+else
+SEATD_CONF_OPTS += -Dlogind=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_SEATD_BUILTIN),y)
+SEATD_CONF_OPTS += -Dbuiltin=enabled
+else
+SEATD_CONF_OPTS += -Dbuiltin=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_SEATD_DAEMON),y)
+SEATD_CONF_OPTS += -Dseatd=enabled -Dserver=enabled
+else
+SEATD_CONF_OPTS += -Dseatd=disabled -Dserver=disabled
+endif
+
+$(eval $(meson-package))
