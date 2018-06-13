From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jun 2018 22:53:35 +0200
Subject: [Buildroot] [git commit] mosquitto: bump to version 1.5
Message-ID: <20180613205127.1DA16885A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=375e11a186bd6ac9f934f9bb0b8102cab58efa53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Add patch to fix crash (retrieved from upstream)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mosquitto/0001-Fix-subs-memory-issue.patch | 151 +++++++++++++++++++++
 ...01-websockets.c-unbreak-build-without-TLS.patch |  49 -------
 package/mosquitto/mosquitto.hash                   |   2 +-
 package/mosquitto/mosquitto.mk                     |   2 +-
 4 files changed, 153 insertions(+), 51 deletions(-)

diff --git a/package/mosquitto/0001-Fix-subs-memory-issue.patch b/package/mosquitto/0001-Fix-subs-memory-issue.patch
new file mode 100644
index 0000000000..49ec15630a
--- /dev/null
+++ b/package/mosquitto/0001-Fix-subs-memory-issue.patch
@@ -0,0 +1,151 @@
+From 67fe32672b60afd6cf91f7a3ccc969259dc68a19 Mon Sep 17 00:00:00 2001
+From: Tatsuzo Osawa <tatsuzo.osawa@gmail.com>
+Date: Thu, 24 Aug 2017 12:22:33 +0000
+Subject: [PATCH] Fix subs memory issue.
+
+Patches retrieved from: https://github.com/eclipse/mosquitto/pull/531
+
+Both patches have been merged in a single one as second patch is putting
+back code that is wrongly deleted in first patch.
+First patch needs also an update to apply on version 1.5
+
+Signed-off-by: Tatsuzo Osawa <tatsuzo.osawa@gmail.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/database.c                  | 16 ++++++++++++----
+ src/mosquitto_broker_internal.h |  4 ++--
+ src/subs.c                      | 21 ++++++++++++---------
+ 3 files changed, 26 insertions(+), 15 deletions(-)
+
+diff --git a/src/database.c b/src/database.c
+index 670cf710..9e02de2d 100644
+--- a/src/database.c
++++ b/src/database.c
+@@ -12,6 +12,7 @@ and the Eclipse Distribution License is available at
+  
+ Contributors:
+    Roger Light - initial implementation and documentation.
++   Tatsuzo Osawa - Fix subs memory issue.
+ */
+ 
+ #include <assert.h>
+@@ -121,10 +122,10 @@ int db__open(struct mosquitto__config *config, struct mosquitto_db *db)
+ 
+ 	db->subs = NULL;
+ 
+-	subhier = sub__add_hier_entry(&db->subs, "", strlen(""));
++	subhier = sub__add_hier_entry(NULL, &db->subs, "", strlen(""));
+ 	if(!subhier) return MOSQ_ERR_NOMEM;
+ 
+-	subhier = sub__add_hier_entry(&db->subs, "$SYS", strlen("$SYS"));
++	subhier = sub__add_hier_entry(NULL, &db->subs, "$SYS", strlen("$SYS"));
+ 	if(!subhier) return MOSQ_ERR_NOMEM;
+ 
+ 	db->unpwd = NULL;
+diff --git a/src/mosquitto_broker_internal.h b/src/mosquitto_broker_internal.h
+index 3508c555..808b4f2b 100644
+--- a/src/mosquitto_broker_internal.h
++++ b/src/mosquitto_broker_internal.h
+@@ -12,7 +12,7 @@ and the Eclipse Distribution License is available at
+  
+ Contributors:
+    Roger Light - initial implementation and documentation.
+-   Tatsuzo Osawa - Add epoll.
++   Tatsuzo Osawa - Add epoll. Fix subs memory issue.
+ */
+ 
+ #ifndef MOSQUITTO_BROKER_INTERNAL_H
+@@ -547,7 +547,7 @@ void sys_tree__update(struct mosquitto_db *db, int interval, time_t start_time);
+  * Subscription functions
+  * ============================================================ */
+ int sub__add(struct mosquitto_db *db, struct mosquitto *context, const char *sub, int qos, struct mosquitto__subhier **root);
+-struct mosquitto__subhier *sub__add_hier_entry(struct mosquitto__subhier **parent, const char *topic, size_t len);
++struct mosquitto__subhier *sub__add_hier_entry(struct mosquitto__subhier *parent, struct mosquitto__subhier **head, const char *topic, size_t len);
+ int sub__remove(struct mosquitto_db *db, struct mosquitto *context, const char *sub, struct mosquitto__subhier *root);
+ void sub__tree_print(struct mosquitto__subhier *root, int level);
+ int sub__clean_session(struct mosquitto_db *db, struct mosquitto *context);
+diff --git a/src/subs.c b/src/subs.c
+index 7b9b457c..b1c0fc78 100644
+--- a/src/subs.c
++++ b/src/subs.c
+@@ -12,6 +12,7 @@ and the Eclipse Distribution License is available at
+  
+ Contributors:
+    Roger Light - initial implementation and documentation.
++   Tatsuzo Osawa - Fix subs memory issue.
+ */
+ 
+ /* A note on matching topic subscriptions.
+@@ -314,7 +315,7 @@ static int sub__add_recurse(struct mosquitto_db *db, struct mosquitto *context,
+ 		return sub__add_recurse(db, context, qos, branch, tokens->next);
+ 	}else{
+ 		/* Not found */
+-		branch = sub__add_hier_entry(&subhier->children, UHPA_ACCESS_TOPIC(tokens), tokens->topic_len+1);
++		branch = sub__add_hier_entry(subhier, &subhier->children, UHPA_ACCESS_TOPIC(tokens), tokens->topic_len+1);
+ 		if(!branch) return MOSQ_ERR_NOMEM;
+ 
+ 		return sub__add_recurse(db, context, qos, branch, tokens->next);
+@@ -406,18 +407,18 @@ static void sub__search(struct mosquitto_db *db, struct mosquitto__subhier *subh
+ }
+ 
+ 
+-struct mosquitto__subhier *sub__add_hier_entry(struct mosquitto__subhier **parent, const char *topic, size_t len)
++struct mosquitto__subhier *sub__add_hier_entry(struct mosquitto__subhier *parent, struct mosquitto__subhier **head, const char *topic, size_t len)
+ {
+ 	struct mosquitto__subhier *child;
+ 
+-	assert(parent);
++	assert(head);
+ 
+ 	child = mosquitto__malloc(sizeof(struct mosquitto__subhier));
+ 	if(!child){
+ 		log__printf(NULL, MOSQ_LOG_ERR, "Error: Out of memory.");
+ 		return NULL;
+ 	}
+-	child->parent = *parent;
++	child->parent = parent;
+ 	child->topic_len = strlen(topic);
+ 	if(UHPA_ALLOC_TOPIC(child) == 0){
+ 		child->topic_len = 0;
+@@ -433,13 +434,13 @@ struct mosquitto__subhier *sub__add_hier_entry(struct mosquitto__subhier **paren
+ 
+ 	if(child->topic_len+1 > sizeof(child->topic.array)){
+ 		if(child->topic.ptr){
+-			HASH_ADD_KEYPTR(hh, *parent, child->topic.ptr, child->topic_len, child);
++			HASH_ADD_KEYPTR(hh, *head, child->topic.ptr, child->topic_len, child);
+ 		}else{
+ 			mosquitto__free(child);
+ 			return NULL;
+ 		}
+ 	}else{
+-		HASH_ADD(hh, *parent, topic.array, child->topic_len, child);
++		HASH_ADD(hh, *head, topic.array, child->topic_len, child);
+ 	}
+ 
+ 	return child;
+@@ -460,7 +461,7 @@ int sub__add(struct mosquitto_db *db, struct mosquitto *context, const char *sub
+ 
+ 	HASH_FIND(hh, *root, UHPA_ACCESS_TOPIC(tokens), tokens->topic_len, subhier);
+ 	if(!subhier){
+-		subhier = sub__add_hier_entry(root, UHPA_ACCESS_TOPIC(tokens), tokens->topic_len+1);
++		subhier = sub__add_hier_entry(NULL, root, UHPA_ACCESS_TOPIC(tokens), tokens->topic_len+1);
+ 		if(!subhier){
+ 			sub__topic_tokens_free(tokens);
+ 			log__printf(NULL, MOSQ_LOG_ERR, "Error: Out of memory.");
+@@ -545,12 +546,14 @@ static struct mosquitto__subhier *tmp_remove_subs(struct mosquitto__subhier *sub
+ 		return NULL;
+ 	}
+ 
+-	if(sub->children || sub->subs){
++	if(sub->children || sub->subs || sub->retained){
+ 		return NULL;
+ 	}
+ 
+ 	parent = sub->parent;
+-	HASH_DELETE(hh, parent, sub);
++	HASH_DELETE(hh, parent->children, sub);
++	UHPA_FREE_TOPIC(sub);
++	mosquitto__free(sub);
+ 
+ 	if(parent->subs == NULL
+ 			&& parent->children == NULL
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
