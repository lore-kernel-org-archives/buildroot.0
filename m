From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Jun 2018 15:42:44 +0200
Subject: [Buildroot] [PATCH 1/1] mosquitto: bump to version 1.5
Message-ID: <20180610134244.5369-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-websockets.c-unbreak-build-without-TLS.patch | 49 ----------------------
 package/mosquitto/mosquitto.hash                   |  2 +-
 package/mosquitto/mosquitto.mk                     |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/mosquitto/0001-websockets.c-unbreak-build-without-TLS.patch

diff --git a/package/mosquitto/0001-websockets.c-unbreak-build-without-TLS.patch b/package/mosquitto/0001-websockets.c-unbreak-build-without-TLS.patch
deleted file mode 100644
index e977fae56c..0000000000
--- a/package/mosquitto/0001-websockets.c-unbreak-build-without-TLS.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 4822aa97da80a86033ec6e4a8b2f4ad0911235cf Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Sat, 3 Mar 2018 11:04:47 +0100
-Subject: [PATCH] websockets.c: unbreak build without TLS
-
-Commit 7943072b1f3b (Fix use_identity_as_username not working on websockets
-clients) added code which unconditionally accesses mosq-ssl, breaking the
-build when TLS support is disabled.
-
-Fix it by guarding this logic inside #ifdef WITH_TLS.
-
-[Upstream: https://dev.eclipse.org/mhonarc/lists/mosquitto-dev/msg01813.html]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/websockets.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/websockets.c b/src/websockets.c
-index d4d7961..a796f0a 100644
---- a/src/websockets.c
-+++ b/src/websockets.c
-@@ -201,12 +201,14 @@ static int callback_mqtt(struct libwebsocket_context *context,
- 				mosq->ws_context = context;
- #endif
- 				mosq->wsi = wsi;
-+#ifdef WITH_TLS
- 				if(in){
- 					mosq->ssl = (SSL *)in;
- 					if(!mosq->listener->ssl_ctx){
- 						mosq->listener->ssl_ctx = SSL_get_SSL_CTX(mosq->ssl);
- 					}
- 				}
-+#endif
- 				u->mosq = mosq;
- 			}else{
- 				return -1;
-@@ -240,7 +242,9 @@ static int callback_mqtt(struct libwebsocket_context *context,
- 					mosq->pollfd_index = -1;
- 				}
- 				mosq->wsi = NULL;
-+#ifdef WITH_TLS
- 				mosq->ssl = NULL;
-+#endif
- 				do_disconnect(db, mosq);
- 			}
- 			break;
--- 
-2.11.0
-
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 91c855cb4e..87ddad9578 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking gpg signature
-sha256 7d3b3e245a3b4ec94b05678c8199c806359737949f4cfe0bf936184f6ca89a83  mosquitto-1.4.15.tar.gz
+sha256 80c9606a906c736fe582b67bdfb650ee45239fea058fe34927f81277d3486e21  mosquitto-1.5.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index ec5fc02f9f..993da2f925 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.4.15
+MOSQUITTO_VERSION = 1.5
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
-- 
2.14.1
