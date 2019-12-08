From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 23:17:23 +0100
Subject: [Buildroot] [git commit] package/shairport-sync: add dbus option
Message-ID: <20191208221346.722FF88D2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21a893130451706518627189185b21759971a59c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Shairport Sync added DBus support in version 3.2.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shairport-sync/Config.in         | 14 ++++++++++++++
 package/shairport-sync/shairport-sync.mk |  5 +++++
 2 files changed, 19 insertions(+)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index 87f38a940d..750767e567 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -26,6 +26,20 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION
 	help
 	  Enable audio DSP convolution support.
 
+config BR2_PACKAGE_SHAIRPORT_SYNC_DBUS
+	bool "dbus support"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Enable support for support for the MPRIS and native
+	  Shairport Sync D-Bus interface.
+
+comment "shairport-sync dbus support needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR
 	bool "libsoxr support"
 	select BR2_PACKAGE_LIBSOXR
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 1ca56e9f0a..a20570f915 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -56,6 +56,11 @@ SHAIRPORT_SYNC_DEPENDENCIES += libsndfile
 SHAIRPORT_SYNC_CONF_OPTS += --with-convolution
 endif
 
+ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_DBUS),y)
+SHAIRPORT_SYNC_DEPENDENCIES += libglib2
+SHAIRPORT_SYNC_CONF_OPTS += --with-dbus-interface --with-mpris-interface
+endif
+
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libsoxr
 SHAIRPORT_SYNC_CONF_OPTS += --with-soxr
