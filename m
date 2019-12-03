From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  3 Dec 2019 11:53:40 +0100
Subject: [Buildroot] [PATCH 4/5] package/shairport-sync: add dbus option
In-Reply-To: <20191203105341.1232360-1-joerg.krause@embedded.rocks>
References: <20191203105341.1232360-1-joerg.krause@embedded.rocks>
Message-ID: <20191203105341.1232360-4-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Shairport Sync added DBus support in version 3.2.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/shairport-sync/Config.in         | 11 +++++++++++
 package/shairport-sync/shairport-sync.mk |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index 87f38a940d..6325e9d30d 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -26,6 +26,17 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION
 	help
 	  Enable audio DSP convolution support.
 
+config BR2_PACKAGE_SHAIRPORT_SYNC_DBUS
+	bool "dbus support"
+	depends on BR2_USE_WCHAR # libglib2 -> gettext
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Enable support for support for the MPRIS and native
+	  Shairport Sync D-Bus interface.
+
+comment "shairport-sync dbus support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
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
-- 
2.24.0
