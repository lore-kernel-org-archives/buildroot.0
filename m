From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:23:50 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/mosquitto:
 security bump to version 1.5.6
Message-ID: <20190221102225.6FEDF8196D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91eec0ab241eaf345216c69873577550b3bda9c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes the following security issues:

CVE-2018-12551: If Mosquitto is configured to use a password file for
authentication, any malformed data in the password file will be treated as
valid. This typically means that the malformed data becomes a username and
no password.  If this occurs, clients can circumvent authentication and get
access to the broker by using the malformed username.  In particular, a
blank line will be treated as a valid empty username.  Other security
measures are unaffected.  Users who have only used the mosquitto_passwd
utility to create and modify their password files are unaffected by this
vulnerability.  Affects version 1.0 to 1.5.5 inclusive.

CVE-2018-12550: If an ACL file is empty, or has only blank lines or
comments, then mosquitto treats the ACL file as not being defined, which
means that no topic access is denied.  Although denying access to all topics
is not a useful configuration, this behaviour is unexpected and could lead
to access being incorrectly granted in some circumstances.  Affects versions
1.0 to 1.5.5 inclusive.

CVE-2018-12546: If a client publishes a retained message to a topic that
they have access to, and then their access to that topic is revoked, the
retained message will still be delivered to future subscribers.  This
behaviour may be undesirable in some applications, so a configuration option
check_retain_source has been introduced to enforce checking of the retained
message source on publish.

Add two upstream post-1.5.6 patches to fix a build error in the bridge code
when ADNS is enabled and when building with older toolchains not defaulting
to C99 mode.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e4789770712ff88cf36ae6b97741d9a006e47d3c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ix-build-failure-when-using-WITH_ADNS-yes.patch | 27 +++++++++++++++++
 .../0002-Don-t-require-C99-compiler.patch          | 35 ++++++++++++++++++++++
 package/mosquitto/mosquitto.hash                   |  2 +-
 package/mosquitto/mosquitto.mk                     |  2 +-
 4 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/0001-Fix-build-failure-when-using-WITH_ADNS-yes.patch b/package/mosquitto/0001-Fix-build-failure-when-using-WITH_ADNS-yes.patch
new file mode 100644
index 0000000000..3e79a1750a
--- /dev/null
+++ b/package/mosquitto/0001-Fix-build-failure-when-using-WITH_ADNS-yes.patch
@@ -0,0 +1,27 @@
+From 9378016b19521aa6c281f475267c5cb67ea967d1 Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Fri, 8 Feb 2019 21:34:08 +0000
+Subject: [PATCH] Fix build failure when using WITH_ADNS=yes
+
+[Peter: drop ChangeLog.txt modification]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/bridge.c  | 2 +-
+ 1 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/bridge.c b/src/bridge.c
+index 6e4b94f..d9611f0 100644
+--- a/src/bridge.c
++++ b/src/bridge.c
+@@ -228,7 +228,7 @@ int bridge__connect_step3(struct mosquitto_db *db, struct mosquitto *context)
+ {
+ 	int rc;
+ 
+-	rc = net__socket_connect_step3(context, context->bridge->addresses[context->bridge->cur_address].address, context->bridge->addresses[context->bridge->cur_address].port, NULL, false);
++	rc = net__socket_connect_step3(context, context->bridge->addresses[context->bridge->cur_address].address);
+ 	if(rc > 0){
+ 		if(rc == MOSQ_ERR_TLS){
+ 			net__socket_close(db, context);
+-- 
+2.11.0
+
diff --git a/package/mosquitto/0002-Don-t-require-C99-compiler.patch b/package/mosquitto/0002-Don-t-require-C99-compiler.patch
new file mode 100644
index 0000000000..7ca40903eb
--- /dev/null
+++ b/package/mosquitto/0002-Don-t-require-C99-compiler.patch
@@ -0,0 +1,35 @@
+From 04e89450c0aeb0e6fdff58aca3cffce10b29fb98 Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Sat, 9 Feb 2019 13:52:09 +0000
+Subject: [PATCH] Don't require C99 compiler.
+
+[Peter: drop ChangeLog.txt modification]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/persist.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/persist.c b/src/persist.c
+index 2f40086..13b34d2 100644
+--- a/src/persist.c
++++ b/src/persist.c
+@@ -720,6 +720,7 @@ static int persist__msg_store_chunk_restore(struct mosquitto_db *db, FILE *db_fp
+ 	struct mosquitto_msg_store *stored = NULL;
+ 	struct mosquitto_msg_store_load *load;
+ 	char *err;
++	int i;
+ 
+ 	payload.ptr = NULL;
+ 
+@@ -749,7 +750,7 @@ static int persist__msg_store_chunk_restore(struct mosquitto_db *db, FILE *db_fp
+ 		read_e(db_fptr, &i16temp, sizeof(uint16_t));
+ 		source_port = ntohs(i16temp);
+ 		if(source_port){
+-			for(int i=0; i<db->config->listener_count; i++){
++			for(i=0; i<db->config->listener_count; i++){
+ 				if(db->config->listeners[i].port == source_port){
+ 					source.listener = &db->config->listeners[i];
+ 					break;
+-- 
+2.11.0
+
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 831171c082..da28c4f67f 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking gpg signature
-sha256 fcdb47e340864c545146681af7253399cc292e41775afd76400fda5b0d23d668  mosquitto-1.5.5.tar.gz
+sha256 d5bdc13cc668350026376d57fc14de10aaee029f6840707677637d15e0751a40  mosquitto-1.5.6.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 8d3e250819..cdb75e4264 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.5.5
+MOSQUITTO_VERSION = 1.5.6
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
