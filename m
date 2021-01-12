From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 12 Jan 2021 23:28:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez-alsa: bump to version 3.0.0
Message-ID: <20210112222807.1649810-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch which is included in the new version.

Add additional config option `--enable-a2dpconf` to build small (13 kB)
utility `a2dpconf` which does not depend on any external dependencies.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../0001-fix-build-issue-with-gcc-10.patch    | 140 ------------------
 package/bluez-alsa/bluez-alsa.hash            |   2 +-
 package/bluez-alsa/bluez-alsa.mk              |   3 +-
 3 files changed, 3 insertions(+), 142 deletions(-)
 delete mode 100644 package/bluez-alsa/0001-fix-build-issue-with-gcc-10.patch

diff --git a/package/bluez-alsa/0001-fix-build-issue-with-gcc-10.patch b/package/bluez-alsa/0001-fix-build-issue-with-gcc-10.patch
deleted file mode 100644
index b0b1f72721..0000000000
--- a/package/bluez-alsa/0001-fix-build-issue-with-gcc-10.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From 72324e9415d2757a5f0f028865f841de70e1d0c4 Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Sun, 12 Jul 2020 14:18:09 +0200
-Subject: [PATCH] fix build issue with gcc 10
-
-This patch is created on top of tagged version v2.1.0.
-An upstream fix commit [1] for this issue is already in upstream master but
-does not apply on current used version in buildroot.
-
-[1] https://github.com/Arkq/bluez-alsa/commit/30a23dd7ce9b00c702fa48545f6b03038f9e17c6
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
-[Fabrice: also update src/ofono-iface.h]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/bluealsa-dbus.c  | 4 ++++
- src/bluealsa-iface.c | 2 ++
- src/bluealsa-iface.h | 4 ----
- src/bluealsa.c       | 3 +++
- src/bluez-a2dp.h     | 3 ---
- src/bluez-iface.h    | 3 ---
- src/bluez.c          | 3 +++
- 7 files changed, 12 insertions(+), 10 deletions(-)
-
-diff --git a/src/bluealsa-dbus.c b/src/bluealsa-dbus.c
-index 5e748e3..4c9cd3d 100644
---- a/src/bluealsa-dbus.c
-+++ b/src/bluealsa-dbus.c
-@@ -33,6 +33,10 @@
- #include "shared/defs.h"
- #include "shared/log.h"
- 
-+extern const GDBusInterfaceInfo bluealsa_iface_manager;
-+extern const GDBusInterfaceInfo bluealsa_iface_pcm;
-+extern const GDBusInterfaceInfo bluealsa_iface_rfcomm;
-+
- static GVariant *ba_variant_new_device_path(const struct ba_device *d) {
- 	return g_variant_new_object_path(d->bluez_dbus_path);
- }
-diff --git a/src/bluealsa-iface.c b/src/bluealsa-iface.c
-index 71810c7..55b79c9 100644
---- a/src/bluealsa-iface.c
-+++ b/src/bluealsa-iface.c
-@@ -10,6 +10,8 @@
- 
- #include "bluealsa-iface.h"
- 
-+#define BLUEALAS_IFACE_C
-+
- static const GDBusArgInfo arg_codec = {
- 	-1, "codec", "q", NULL
- };
-diff --git a/src/bluealsa-iface.h b/src/bluealsa-iface.h
-index 262fb76..4f3e85b 100644
---- a/src/bluealsa-iface.h
-+++ b/src/bluealsa-iface.h
-@@ -32,8 +32,4 @@
- #define BLUEALSA_RFCOMM_MODE_HSP_AG "HSP-AG"
- #define BLUEALSA_RFCOMM_MODE_HSP_HS "HSP-HS"
- 
--const GDBusInterfaceInfo bluealsa_iface_manager;
--const GDBusInterfaceInfo bluealsa_iface_pcm;
--const GDBusInterfaceInfo bluealsa_iface_rfcomm;
--
- #endif
-diff --git a/src/bluealsa.c b/src/bluealsa.c
-index 929f9ed..690c407 100644
---- a/src/bluealsa.c
-+++ b/src/bluealsa.c
-@@ -20,6 +20,9 @@
- #include "bluez-a2dp.h"
- #include "hfp.h"
- 
-+/* NULL-terminated list of available A2DP codecs */
-+extern const struct bluez_a2dp_codec **bluez_a2dp_codecs;
-+
- /* Initialize global configuration variable. */
- struct ba_config config = {
- 
-diff --git a/src/bluez-a2dp.h b/src/bluez-a2dp.h
-index 7c0e33b..127dbd9 100644
---- a/src/bluez-a2dp.h
-+++ b/src/bluez-a2dp.h
-@@ -57,7 +57,4 @@ struct bluez_a2dp_codec {
- 	size_t samplings_size;
- };
- 
--/* NULL-terminated list of available A2DP codecs */
--const struct bluez_a2dp_codec **bluez_a2dp_codecs;
--
- #endif
-diff --git a/src/bluez-iface.h b/src/bluez-iface.h
-index 34269c5..250267e 100644
---- a/src/bluez-iface.h
-+++ b/src/bluez-iface.h
-@@ -27,7 +27,4 @@
- #define BLUEZ_TRANSPORT_STATE_PENDING "pending"
- #define BLUEZ_TRANSPORT_STATE_ACTIVE  "active"
- 
--const GDBusInterfaceInfo bluez_iface_endpoint;
--const GDBusInterfaceInfo bluez_iface_profile;
--
- #endif
-diff --git a/src/bluez.c b/src/bluez.c
-index cfdbff8..190101e 100644
---- a/src/bluez.c
-+++ b/src/bluez.c
-@@ -45,6 +45,9 @@
- # define G_DBUS_ERROR_UNKNOWN_OBJECT G_DBUS_ERROR_FAILED
- #endif
- 
-+extern const GDBusInterfaceInfo bluez_iface_endpoint;
-+extern const GDBusInterfaceInfo bluez_iface_profile;
-+
- /**
-  * Structure describing registered D-Bus object. */
- struct dbus_object_data {
- diff --git a/src/ofono-iface.h b/src/ofono-iface.h
-index d5a6715..d5b9065 100644
---- a/src/ofono-iface.h
-+++ b/src/ofono-iface.h
-@@ -1,6 +1,6 @@
- /*
-  * BlueALSA - ofono-iface.h
-- * Copyright (c) 2016-2019 Arkadiusz Bokowy
-+ * Copyright (c) 2016-2020 Arkadiusz Bokowy
-  *               2018 Thierry Bultel
-  *
-  * This file is a part of bluez-alsa.
-@@ -27,6 +27,6 @@
- #define OFONO_AUDIO_CODEC_CVSD 0x01
- #define OFONO_AUDIO_CODEC_MSBC 0x02
- 
--const GDBusInterfaceInfo ofono_iface_hf_audio_agent;
-+extern const GDBusInterfaceInfo ofono_iface_hf_audio_agent;
- 
- #endif
--- 
-2.20.1
-
diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
index 603a501d4f..6be93bc045 100644
--- a/package/bluez-alsa/bluez-alsa.hash
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  6459f70e47e70b4c04a85acf148381e6c8a2e86bd638aff21870afc6c14b85b0  bluez-alsa-2.1.0.tar.gz
+sha256  8b9bc36be922c10c6628ddf84b13dfadfeb3ab0bcf72bad842c66f3120abc6b2  bluez-alsa-3.0.0.tar.gz
 sha256  60253922a459245128c34eb379cbda7c76936636d4c10edc576663a0f560dd4d  LICENSE
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index d5cb3ed67b..9262a7f66b 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ_ALSA_VERSION = 2.1.0
+BLUEZ_ALSA_VERSION = 3.0.0
 BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,v$(BLUEZ_ALSA_VERSION))
 BLUEZ_ALSA_LICENSE = MIT
 BLUEZ_ALSA_LICENSE_FILES = LICENSE
@@ -14,6 +14,7 @@ BLUEZ_ALSA_DEPENDENCIES = alsa-lib bluez5_utils libglib2 sbc host-pkgconf
 BLUEZ_ALSA_AUTORECONF = YES
 
 BLUEZ_ALSA_CONF_OPTS = \
+	--enable-a2dpconf \
 	--enable-aplay \
 	--disable-debug-time \
 	--with-alsaplugindir=/usr/lib/alsa-lib \
-- 
2.30.0
