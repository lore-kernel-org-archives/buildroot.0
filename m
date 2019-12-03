From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  3 Dec 2019 11:53:39 +0100
Subject: [Buildroot] [PATCH 3/5] package/shairport-sync: add audio DSP
 convolution option
In-Reply-To: <20191203105341.1232360-1-joerg.krause@embedded.rocks>
References: <20191203105341.1232360-1-joerg.krause@embedded.rocks>
Message-ID: <20191203105341.1232360-3-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Already in version 3.1, shairport-sync added audio DSP convolution support. This
optional feature requires the sndfile library.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/shairport-sync/Config.in         | 6 ++++++
 package/shairport-sync/shairport-sync.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index 085a9ec77d..87f38a940d 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -20,6 +20,12 @@ config BR2_PACKAGE_SHAIRPORT_SYNC
 
 if BR2_PACKAGE_SHAIRPORT_SYNC
 
+config BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION
+	bool "convolution support"
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  Enable audio DSP convolution support.
+
 config BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR
 	bool "libsoxr support"
 	select BR2_PACKAGE_LIBSOXR
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 3d9e909879..1ca56e9f0a 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -51,6 +51,11 @@ SHAIRPORT_SYNC_CONF_LIBS += -lz
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION),y)
+SHAIRPORT_SYNC_DEPENDENCIES += libsndfile
+SHAIRPORT_SYNC_CONF_OPTS += --with-convolution
+endif
+
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libsoxr
 SHAIRPORT_SYNC_CONF_OPTS += --with-soxr
-- 
2.24.0
