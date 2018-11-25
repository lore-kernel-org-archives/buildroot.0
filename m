From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 22:15:15 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/mosquitto: bump
 version to 1.5.1
Message-ID: <20181125211913.4100488374@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ebb40cfa5e88b1de4d3718dc4418468b67062d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Removed patch 0001, applied upstream.
Replaced patch 0002 with a more generic solution as patch 0001.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f5336412d54397f35daa09c4f9eab952afadd3fe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/0001-Fix-subs-memory-issue.patch | 151 ---------------------
 ...001-_GNU_SOURCE-needed-for-EAI_INPROGRESS.patch |  46 +++++++
 ...ckets-_GNU_SOURCE-needed-for-S_IF-DIR-REG.patch |  34 -----
 package/mosquitto/mosquitto.hash                   |   2 +-
 package/mosquitto/mosquitto.mk                     |   2 +-
 5 files changed, 48 insertions(+), 187 deletions(-)

diff --git a/package/mosquitto/0001-Fix-subs-memory-issue.patch b/package/mosquitto/0001-Fix-subs-memory-issue.patch
deleted file mode 100644
index 49ec15630a..0000000000
--- a/package/mosquitto/0001-Fix-subs-memory-issue.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 67fe32672b60afd6cf91f7a3ccc969259dc68a19 Mon Sep 17 00:00:00 2001
-From: Tatsuzo Osawa <tatsuzo.osawa@gmail.com>
-Date: Thu, 24 Aug 2017 12:22:33 +0000
-Subject: [PATCH] Fix subs memory issue.
-
-Patches retrieved from: https://github.com/eclipse/mosquitto/pull/531
-
-Both patches have been merged in a single one as second patch is putting
-back code that is wrongly deleted in first patch.
-First patch needs also an update to apply on version 1.5
-
-Signed-off-by: Tatsuzo Osawa <tatsuzo.osawa@gmail.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/database.c                  | 16 ++++++++++++----
- src/mosquitto_broker_internal.h |  4 ++--
- src/subs.c                      | 21 ++++++++++++---------
- 3 files changed, 26 insertions(+), 15 deletions(-)
-
-diff --git a/src/database.c b/src/database.c
-index 670cf710..9e02de2d 100644
---- a/src/database.c
-+++ b/src/database.c
-@@ -12,6 +12,7 @@ and the Eclipse Distribution License is available at
-  
- Contributors:
-    Roger Light - initial implementation and documentation.
-+   Tatsuzo Osawa - Fix subs memory issue.
- */
- 
- #include <assert.h>
-@@ -121,10 +122,10 @@ int db__open(struct mosquitto__config *config, struct mosquitto_db *db)
- 
- 	db->subs = NULL;
- 
--	subhier = sub__add_hier_entry(&db->subs, "", strlen(""));
-+	subhier = sub__add_hier_entry(NULL, &db->subs, "", strlen(""));
- 	if(!subhier) return MOSQ_ERR_NOMEM;
- 
--	subhier = sub__add_hier_entry(&db->subs, "$SYS", strlen("$SYS"));
-+	subhier = sub__add_hier_entry(NULL, &db->subs, "$SYS", strlen("$SYS"));
- 	if(!subhier) return MOSQ_ERR_NOMEM;
- 
- 	db->unpwd = NULL;
-diff --git a/src/mosquitto_broker_internal.h b/src/mosquitto_broker_internal.h
-index 3508c555..808b4f2b 100644
---- a/src/mosquitto_broker_internal.h
-+++ b/src/mosquitto_broker_internal.h
-@@ -12,7 +12,7 @@ and the Eclipse Distribution License is available at
-  
- Contributors:
-    Roger Light - initial implementation and documentation.
--   Tatsuzo Osawa - Add epoll.
-+   Tatsuzo Osawa - Add epoll. Fix subs memory issue.
- */
- 
- #ifndef MOSQUITTO_BROKER_INTERNAL_H
-@@ -547,7 +547,7 @@ void sys_tree__update(struct mosquitto_db *db, int interval, time_t start_time);
-  * Subscription functions
-  * ============================================================ */
- int sub__add(struct mosquitto_db *db, struct mosquitto *context, const char *sub, int qos, struct mosquitto__subhier **root);
--struct mosquitto__subhier *sub__add_hier_entry(struct mosquitto__subhier **parent, const char *topic, size_t len);
-+struct mosquitto__subhier *sub__add_hier_entry(struct mosquitto__subhier *parent, struct mosquitto__subhier **head, const char *topic, size_t len);
- int sub__remove(struct mosquitto_db *db, struct mosquitto *context, const char *sub, struct mosquitto__subhier *root);
- void sub__tree_print(struct mosquitto__subhier *root, int level);
- int sub__clean_session(struct mosquitto_db *db, struct mosquitto *context);
-diff --git a/src/subs.c b/src/subs.c
-index 7b9b457c..b1c0fc78 100644
---- a/src/subs.c
-+++ b/src/subs.c
-@@ -12,6 +12,7 @@ and the Eclipse Distribution License is available at
-  
- Contributors:
-    Roger Light - initial implementation and documentation.
-+   Tatsuzo Osawa - Fix subs memory issue.
- */
- 
- /* A note on matching topic subscriptions.
-@@ -314,7 +315,7 @@ static int sub__add_recurse(struct mosquitto_db *db, struct mosquitto *context,
- 		return sub__add_recurse(db, context, qos, branch, tokens->next);
- 	}else{
- 		/* Not found */
--		branch = sub__add_hier_entry(&subhier->children, UHPA_ACCESS_TOPIC(tokens), tokens->topic_len+1);
-+		branch = sub__add_hier_entry(subhier, &subhier->children, UHPA_ACCESS_TOPIC(tokens), tokens->topic_len+1);
- 		if(!branch) return MOSQ_ERR_NOMEM;
- 
- 		return sub__add_recurse(db, context, qos, branch, tokens->next);
-@@ -406,18 +407,18 @@ static void sub__search(struct mosquitto_db *db, struct mosquitto__subhier *subh
- }
- 
- 
--struct mosquitto__subhier *sub__add_hier_entry(struct mosquitto__subhier **parent, const char *topic, size_t len)
-+struct mosquitto__subhier *sub__add_hier_entry(struct mosquitto__subhier *parent, struct mosquitto__subhier **head, const char *topic, size_t len)
- {
- 	struct mosquitto__subhier *child;
- 
--	assert(parent);
-+	assert(head);
- 
- 	child = mosquitto__malloc(sizeof(struct mosquitto__subhier));
- 	if(!child){
- 		log__printf(NULL, MOSQ_LOG_ERR, "Error: Out of memory.");
- 		return NULL;
- 	}
--	child->parent = *parent;
-+	child->parent = parent;
- 	child->topic_len = strlen(topic);
- 	if(UHPA_ALLOC_TOPIC(child) == 0){
- 		child->topic_len = 0;
-@@ -433,13 +434,13 @@ struct mosquitto__subhier *sub__add_hier_entry(struct mosquitto__subhier **paren
- 
- 	if(child->topic_len+1 > sizeof(child->topic.array)){
- 		if(child->topic.ptr){
--			HASH_ADD_KEYPTR(hh, *parent, child->topic.ptr, child->topic_len, child);
-+			HASH_ADD_KEYPTR(hh, *head, child->topic.ptr, child->topic_len, child);
- 		}else{
- 			mosquitto__free(child);
- 			return NULL;
- 		}
- 	}else{
--		HASH_ADD(hh, *parent, topic.array, child->topic_len, child);
-+		HASH_ADD(hh, *head, topic.array, child->topic_len, child);
- 	}
- 
- 	return child;
-@@ -460,7 +461,7 @@ int sub__add(struct mosquitto_db *db, struct mosquitto *context, const char *sub
- 
- 	HASH_FIND(hh, *root, UHPA_ACCESS_TOPIC(tokens), tokens->topic_len, subhier);
- 	if(!subhier){
--		subhier = sub__add_hier_entry(root, UHPA_ACCESS_TOPIC(tokens), tokens->topic_len+1);
-+		subhier = sub__add_hier_entry(NULL, root, UHPA_ACCESS_TOPIC(tokens), tokens->topic_len+1);
- 		if(!subhier){
- 			sub__topic_tokens_free(tokens);
- 			log__printf(NULL, MOSQ_LOG_ERR, "Error: Out of memory.");
-@@ -545,12 +546,14 @@ static struct mosquitto__subhier *tmp_remove_subs(struct mosquitto__subhier *sub
- 		return NULL;
- 	}
- 
--	if(sub->children || sub->subs){
-+	if(sub->children || sub->subs || sub->retained){
- 		return NULL;
- 	}
- 
- 	parent = sub->parent;
--	HASH_DELETE(hh, parent, sub);
-+	HASH_DELETE(hh, parent->children, sub);
-+	UHPA_FREE_TOPIC(sub);
-+	mosquitto__free(sub);
- 
- 	if(parent->subs == NULL
- 			&& parent->children == NULL
diff --git a/package/mosquitto/0001-_GNU_SOURCE-needed-for-EAI_INPROGRESS.patch b/package/mosquitto/0001-_GNU_SOURCE-needed-for-EAI_INPROGRESS.patch
new file mode 100644
index 0000000000..e350e465b4
--- /dev/null
+++ b/package/mosquitto/0001-_GNU_SOURCE-needed-for-EAI_INPROGRESS.patch
@@ -0,0 +1,46 @@
+From d684055b2b92e7ec5793e70c9a80c7f8e45e0696 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 24 Aug 2018 16:38:42 +0200
+Subject: [PATCH] _GNU_SOURCE needed for EAI_INPROGRESS
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Define of _GNU_SOURCE is needed to be able to use EAI_INPROGRESS in
+loop.c.
+
+This patch fixes a build error
+
+loop.c:334:17: error: ???EAI_INPROGRESS??? undeclared (first use in this function)
+        if(rc == EAI_INPROGRESS){
+
+occuring with a glibc-2.27-based buildroot toolchain for sparc64
+
+Target: sparc64-buildroot-linux-gnu
+[...]
+gcc version 6.4.0 (Buildroot 2018.05)
+
+Source:
+http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2018.05.tar.bz2
+
+Patch sent upstream as PR 933.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ config.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/config.h b/config.h
+index 7607019..ba0ba93 100644
+--- a/config.h
++++ b/config.h
+@@ -39,4 +39,6 @@
+ #  define _POSIX_C_SOURCE 200809L
+ #endif
+ 
++#define _GNU_SOURCE
++
+ #endif
+-- 
+2.18.0
+
diff --git a/package/mosquitto/0002-websockets-_GNU_SOURCE-needed-for-S_IF-DIR-REG.patch b/package/mosquitto/0002-websockets-_GNU_SOURCE-needed-for-S_IF-DIR-REG.patch
deleted file mode 100644
index 88f9cbd94a..0000000000
--- a/package/mosquitto/0002-websockets-_GNU_SOURCE-needed-for-S_IF-DIR-REG.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d4442c3df7552756f53e656e446bc1bd7dc79a88 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 18 Jun 2018 19:52:58 +0200
-Subject: [PATCH] websockets: _GNU_SOURCE needed for S_IF{DIR,REG}
-
-Define of _GNU_SOURCE is needed to be able to use S_IFDIR and S_IFREG in
-src/websockets.c
-
-Fixes:
- - http://autobuild.buildroot.net/results/7dcfb6ca9d14a5cd6872590065549356f1ab42a0
-
-[Upstream status: https://github.com/eclipse/mosquitto/pull/862]
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/websockets.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/websockets.c b/src/websockets.c
-index 1e513ae..7722b4d 100644
---- a/src/websockets.c
-+++ b/src/websockets.c
-@@ -29,6 +29,8 @@ POSSIBILITY OF SUCH DAMAGE.
- 
- #ifdef WITH_WEBSOCKETS
- 
-+#define _GNU_SOURCE
-+
- #include "config.h"
- 
- #include <libwebsockets.h>
--- 
-2.14.1
-
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 87ddad9578..96817d464d 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking gpg signature
-sha256 80c9606a906c736fe582b67bdfb650ee45239fea058fe34927f81277d3486e21  mosquitto-1.5.tar.gz
+sha256 8557bc7ae34dfaf32a0fb56d2491b7a7f731269c88337227233013502df4d5b0  mosquitto-1.5.1.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 993da2f925..7ac6487488 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.5
+MOSQUITTO_VERSION = 1.5.1
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
