From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 13 May 2021 19:33:22 +0300
Subject: [Buildroot] [PATCH 3/6] package/seatd: new package
In-Reply-To: <20210513163325.1775639-1-aperez@igalia.com>
References: <20210513163325.1775639-1-aperez@igalia.com>
Message-ID: <20210513163325.1775639-4-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce a seatd package, which can be used by wlroots 0.12.0 and
newer. The package includes both a library (always built) and an
optional seat management daemon.

The library can use systemd-logind, the seatd daemon, or a simple
builtin in-process mode. Build options are introduced for each of them.
At least one backend needs to be built; if both logind and seatd are
disabled the builtin backend will be enabled unconditionally.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/Config.in                             |  1 +
 ...pport-building-builtin-without-seatd.patch | 37 ++++++++++++++
 package/seatd/Config.in                       | 48 +++++++++++++++++++
 package/seatd/seatd.hash                      |  5 ++
 package/seatd/seatd.mk                        | 42 ++++++++++++++++
 5 files changed, 133 insertions(+)
 create mode 100644 package/seatd/0001-meson-Support-building-builtin-without-seatd.patch
 create mode 100644 package/seatd/Config.in
 create mode 100644 package/seatd/seatd.hash
 create mode 100644 package/seatd/seatd.mk

diff --git a/package/Config.in b/package/Config.in
index 82b28d2835..d572d441f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2489,6 +2489,7 @@ menu "System tools"
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
index 0000000000..a921e0e01c
--- /dev/null
+++ b/package/seatd/Config.in
@@ -0,0 +1,48 @@
+menuconfig BR2_PACKAGE_SEATD
+	bool "seatd"
+	select BR2_PACKAGE_SEATD_LIBSEAT
+	help
+	  Seat management daemon and support library.
+
+	  https://git.sr.ht/~kennylevinsen/seatd
+
+if BR2_PACKAGE_SEATD
+
+config BR2_PACKAGE_SEATD_LIBSEAT
+	bool "libseat"
+	select BR2_PACKAGE_SEATD_LIBSEAT_BUILTIN \
+		if !BR2_PACKAGE_SEATD_LIBSEAT_LOGIND && !BR2_PACKAGE_SEATD_LIBSEAT_SEATD
+
+if BR2_PACKAGE_SEATD_LIBSEAT
+
+config BR2_PACKAGE_SEATD_LIBSEAT_LOGIND
+	bool "logind backend"
+	default y
+	depends on BR2_PACKAGE_SYSTEMD_LOGIND
+	help
+	  Support using logind for seat management.
+
+comment "logind backend needs systemd-logind"
+	depends on !BR2_PACKAGE_SYSTEMD_LOGIND
+
+config BR2_PACKAGE_SEATD_LIBSEAT_SEATD
+	bool "seatd backend"
+	default y
+	depends on BR2_PACKAGE_SEATD_SEATD
+	help
+	  Support using seatd for seat management.
+
+comment "seatd backend needs seatd daemon"
+	depends on !BR2_PACKAGE_SEATD_SEATD
+
+config BR2_PACKAGE_SEATD_LIBSEAT_BUILTIN
+	bool "builtin backend"
+	help
+	  Builtin in-process seatd implementation.
+
+endif
+
+config BR2_PACKAGE_SEATD_SEATD
+	bool "seatd daemon"
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
index 0000000000..45da53904f
--- /dev/null
+++ b/package/seatd/seatd.mk
@@ -0,0 +1,42 @@
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
+ifeq ($(BR2_PACKAGE_SEATD_LIBSEAT_LOGIND),y)
+SEATD_CONF_OPTS += -Dlogind=enabled
+else
+SEATD_CONF_OPTS += -Dlogind=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_SEATD_LIBSEAT_SEATD),y)
+SEATD_CONF_OPTS += -Dseatd=enabled
+else
+SEATD_CONF_OPTS += -Dseatd=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_SEATD_LIBSEAT_BUILTIN),y)
+SEATD_CONF_OPTS += -Dbuiltin=enabled
+else
+SEATD_CONF_OPTS += -Dbuiltin=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_SEATD_SEATD),y)
+SEATD_CONF_OPTS += -Dserver=enabled
+else
+SEATD_CONF_OPTS += -Dserver=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.31.1
