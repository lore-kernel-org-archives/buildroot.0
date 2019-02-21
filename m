From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:23:36 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/mosquitto: bump
 to version 1.5.7
Message-ID: <20190221102229.F26F98196D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19d5c1da458af4c48a2d6f2539fccb9b308b866e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Bugfix release, fixing a number of issues discovered post-1.5.6.

Drop patches as they are now included upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 640153775bafb4873940b96a5ef5a8fc1895a72e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ix-build-failure-when-using-WITH_ADNS-yes.patch | 27 -----------------
 .../0002-Don-t-require-C99-compiler.patch          | 35 ----------------------
 package/mosquitto/mosquitto.hash                   |  2 +-
 package/mosquitto/mosquitto.mk                     |  2 +-
 4 files changed, 2 insertions(+), 64 deletions(-)

diff --git a/package/mosquitto/0001-Fix-build-failure-when-using-WITH_ADNS-yes.patch b/package/mosquitto/0001-Fix-build-failure-when-using-WITH_ADNS-yes.patch
deleted file mode 100644
index 3e79a1750a..0000000000
--- a/package/mosquitto/0001-Fix-build-failure-when-using-WITH_ADNS-yes.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 9378016b19521aa6c281f475267c5cb67ea967d1 Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Fri, 8 Feb 2019 21:34:08 +0000
-Subject: [PATCH] Fix build failure when using WITH_ADNS=yes
-
-[Peter: drop ChangeLog.txt modification]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/bridge.c  | 2 +-
- 1 files changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/bridge.c b/src/bridge.c
-index 6e4b94f..d9611f0 100644
---- a/src/bridge.c
-+++ b/src/bridge.c
-@@ -228,7 +228,7 @@ int bridge__connect_step3(struct mosquitto_db *db, struct mosquitto *context)
- {
- 	int rc;
- 
--	rc = net__socket_connect_step3(context, context->bridge->addresses[context->bridge->cur_address].address, context->bridge->addresses[context->bridge->cur_address].port, NULL, false);
-+	rc = net__socket_connect_step3(context, context->bridge->addresses[context->bridge->cur_address].address);
- 	if(rc > 0){
- 		if(rc == MOSQ_ERR_TLS){
- 			net__socket_close(db, context);
--- 
-2.11.0
-
diff --git a/package/mosquitto/0002-Don-t-require-C99-compiler.patch b/package/mosquitto/0002-Don-t-require-C99-compiler.patch
deleted file mode 100644
index 7ca40903eb..0000000000
--- a/package/mosquitto/0002-Don-t-require-C99-compiler.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 04e89450c0aeb0e6fdff58aca3cffce10b29fb98 Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Sat, 9 Feb 2019 13:52:09 +0000
-Subject: [PATCH] Don't require C99 compiler.
-
-[Peter: drop ChangeLog.txt modification]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/persist.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/persist.c b/src/persist.c
-index 2f40086..13b34d2 100644
---- a/src/persist.c
-+++ b/src/persist.c
-@@ -720,6 +720,7 @@ static int persist__msg_store_chunk_restore(struct mosquitto_db *db, FILE *db_fp
- 	struct mosquitto_msg_store *stored = NULL;
- 	struct mosquitto_msg_store_load *load;
- 	char *err;
-+	int i;
- 
- 	payload.ptr = NULL;
- 
-@@ -749,7 +750,7 @@ static int persist__msg_store_chunk_restore(struct mosquitto_db *db, FILE *db_fp
- 		read_e(db_fptr, &i16temp, sizeof(uint16_t));
- 		source_port = ntohs(i16temp);
- 		if(source_port){
--			for(int i=0; i<db->config->listener_count; i++){
-+			for(i=0; i<db->config->listener_count; i++){
- 				if(db->config->listeners[i].port == source_port){
- 					source.listener = &db->config->listeners[i];
- 					break;
--- 
-2.11.0
-
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index da28c4f67f..17a467a721 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking gpg signature
-sha256 d5bdc13cc668350026376d57fc14de10aaee029f6840707677637d15e0751a40  mosquitto-1.5.6.tar.gz
+sha256 d4024c3388502d50be4192991e90d66dfb344376104df3f63846c9f201779955  mosquitto-1.5.7.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 31b929401c..ae23c54016 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.5.6
+MOSQUITTO_VERSION = 1.5.7
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
