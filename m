Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAEAC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3684B42E2B;
	Fri, 28 Feb 2025 16:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xauX15jgaAw8; Fri, 28 Feb 2025 16:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E30942E29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E30942E29;
	Fri, 28 Feb 2025 16:34:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F5A768
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BF2A41954
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nyx19qAjRR1s for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E939F419C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E939F419C1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E201086307; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Dec 2024 10:50:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 10f892b19d9ede510bc448f4fb4346231b9afa41
X-Git-Newrev: 0f886158b993d54b40de181f79a745fa234f12c2
X-Patchwork-Hint: ignore
Message-Id: <20250228162932.E201086307@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mosquitto: revert an
 upstream change in 2.0.20 breaking nonthread builds
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0f886158b993d54b40de181f79a745fa234f12c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/1998881e9ab9ff396e6fd47b0d7c1298ccb25266/
http://autobuild.buildroot.net/results/0cb8e2dcee51007ee09506fa143e52cefbde5335/

And many more.

A change in mosquitto 2.0.20 to fix builds on NetBSD broke WITH_THREADING=no
builds as it unconditionally calls pthread functions.  The issue has been
reported upstream for ~1 month, but so far no fix so revert the NetBSD
change for now instead to fix the build.

https://www.eclipse.org/lists/mosquitto-dev/msg03003.html
https://github.com/eclipse-mosquitto/mosquitto/issues/3183

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../mosquitto/0001-Revert-Fix-NetBSD-build.patch   | 390 +++++++++++++++++++++
 1 file changed, 390 insertions(+)

diff --git a/package/mosquitto/0001-Revert-Fix-NetBSD-build.patch b/package/mosquitto/0001-Revert-Fix-NetBSD-build.patch
new file mode 100644
index 0000000000..180a23565c
--- /dev/null
+++ b/package/mosquitto/0001-Revert-Fix-NetBSD-build.patch
@@ -0,0 +1,390 @@
+From 18d41744338d6e291612e66e8baace4faaad7b2e Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Fri, 6 Dec 2024 08:27:53 +0100
+Subject: [PATCH] Revert "Fix NetBSD build"
+
+This reverts commit 88b7bb3521cc51cb1e80630395ae736040cc8ff8.
+
+This unfortunately broke non-thread builds, so revert it until fixed
+upstream.
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/issues/3183
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/dummypthread.h       | 14 ++++++++++++
+ lib/handle_pubackcomp.c  |  4 ++--
+ lib/mosquitto_internal.h |  6 +++++-
+ lib/packet_mosq.c        | 46 ++++++++++++++++++++--------------------
+ lib/pthread_compat.h     | 28 ------------------------
+ lib/util_mosq.c          | 32 ++++++++++++++--------------
+ 6 files changed, 60 insertions(+), 70 deletions(-)
+ create mode 100644 lib/dummypthread.h
+ delete mode 100644 lib/pthread_compat.h
+
+diff --git a/lib/dummypthread.h b/lib/dummypthread.h
+new file mode 100644
+index 00000000..c0eb2c15
+--- /dev/null
++++ b/lib/dummypthread.h
+@@ -0,0 +1,14 @@
++#ifndef DUMMYPTHREAD_H
++#define DUMMYPTHREAD_H
++
++#define pthread_create(A, B, C, D)
++#define pthread_join(A, B)
++#define pthread_cancel(A)
++#define pthread_testcancel()
++
++#define pthread_mutex_init(A, B)
++#define pthread_mutex_destroy(A)
++#define pthread_mutex_lock(A)
++#define pthread_mutex_unlock(A)
++
++#endif
+diff --git a/lib/handle_pubackcomp.c b/lib/handle_pubackcomp.c
+index d70d602d..4568bb40 100644
+--- a/lib/handle_pubackcomp.c
++++ b/lib/handle_pubackcomp.c
+@@ -57,9 +57,9 @@ int handle__pubackcomp(struct mosquitto *mosq, const char *type)
+ 		}
+ 	}
+ 
+-	COMPAT_pthread_mutex_lock(&mosq->msgs_out.mutex);
++	pthread_mutex_lock(&mosq->msgs_out.mutex);
+ 	util__increment_send_quota(mosq);
+-	COMPAT_pthread_mutex_unlock(&mosq->msgs_out.mutex);
++	pthread_mutex_unlock(&mosq->msgs_out.mutex);
+ 
+ 	rc = packet__read_uint16(&mosq->in_packet, &mid);
+ 	if(rc) return rc;
+diff --git a/lib/mosquitto_internal.h b/lib/mosquitto_internal.h
+index 31120258..ac71ffbf 100644
+--- a/lib/mosquitto_internal.h
++++ b/lib/mosquitto_internal.h
+@@ -33,7 +33,11 @@ Contributors:
+ #endif
+ #include <stdlib.h>
+ 
+-#include <pthread_compat.h>
++#if defined(WITH_THREADING) && !defined(WITH_BROKER)
++#  include <pthread.h>
++#else
++#  include <dummypthread.h>
++#endif
+ 
+ #ifdef WITH_SRV
+ #  include <ares.h>
+diff --git a/lib/packet_mosq.c b/lib/packet_mosq.c
+index b063eb71..fd716baf 100644
+--- a/lib/packet_mosq.c
++++ b/lib/packet_mosq.c
+@@ -129,13 +129,13 @@ void packet__cleanup_all_no_locks(struct mosquitto *mosq)
+ 
+ void packet__cleanup_all(struct mosquitto *mosq)
+ {
+-	COMPAT_pthread_mutex_lock(&mosq->current_out_packet_mutex);
+-	COMPAT_pthread_mutex_lock(&mosq->out_packet_mutex);
++	pthread_mutex_lock(&mosq->current_out_packet_mutex);
++	pthread_mutex_lock(&mosq->out_packet_mutex);
+ 
+ 	packet__cleanup_all_no_locks(mosq);
+ 
+-	COMPAT_pthread_mutex_unlock(&mosq->out_packet_mutex);
+-	COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
++	pthread_mutex_unlock(&mosq->out_packet_mutex);
++	pthread_mutex_unlock(&mosq->current_out_packet_mutex);
+ }
+ 
+ 
+@@ -151,7 +151,7 @@ int packet__queue(struct mosquitto *mosq, struct mosquitto__packet *packet)
+ 	packet->to_process = packet->packet_length;
+ 
+ 	packet->next = NULL;
+-	COMPAT_pthread_mutex_lock(&mosq->out_packet_mutex);
++	pthread_mutex_lock(&mosq->out_packet_mutex);
+ 
+ #ifdef WITH_BROKER
+ 	if(db.config->max_queued_messages > 0 && mosq->out_packet_count >= db.config->max_queued_messages){
+@@ -174,7 +174,7 @@ int packet__queue(struct mosquitto *mosq, struct mosquitto__packet *packet)
+ 	}
+ 	mosq->out_packet_last = packet;
+ 	mosq->out_packet_count++;
+-	COMPAT_pthread_mutex_unlock(&mosq->out_packet_mutex);
++	pthread_mutex_unlock(&mosq->out_packet_mutex);
+ #ifdef WITH_BROKER
+ #  ifdef WITH_WEBSOCKETS
+ 	if(mosq->wsi){
+@@ -232,8 +232,8 @@ int packet__write(struct mosquitto *mosq)
+ 	if(!mosq) return MOSQ_ERR_INVAL;
+ 	if(mosq->sock == INVALID_SOCKET) return MOSQ_ERR_NO_CONN;
+ 
+-	COMPAT_pthread_mutex_lock(&mosq->current_out_packet_mutex);
+-	COMPAT_pthread_mutex_lock(&mosq->out_packet_mutex);
++	pthread_mutex_lock(&mosq->current_out_packet_mutex);
++	pthread_mutex_lock(&mosq->out_packet_mutex);
+ 	if(mosq->out_packet && !mosq->current_out_packet){
+ 		mosq->current_out_packet = mosq->out_packet;
+ 		mosq->out_packet = mosq->out_packet->next;
+@@ -242,7 +242,7 @@ int packet__write(struct mosquitto *mosq)
+ 		}
+ 		mosq->out_packet_count--;
+ 	}
+-	COMPAT_pthread_mutex_unlock(&mosq->out_packet_mutex);
++	pthread_mutex_unlock(&mosq->out_packet_mutex);
+ 
+ #ifdef WITH_BROKER
+ 	if(mosq->current_out_packet){
+@@ -252,7 +252,7 @@ int packet__write(struct mosquitto *mosq)
+ 
+ 	state = mosquitto__get_state(mosq);
+ 	if(state == mosq_cs_connect_pending){
+-		COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
++		pthread_mutex_unlock(&mosq->current_out_packet_mutex);
+ 		return MOSQ_ERR_SUCCESS;
+ 	}
+ 
+@@ -274,10 +274,10 @@ int packet__write(struct mosquitto *mosq)
+ 						|| errno == WSAENOTCONN
+ #endif
+ 						){
+-					COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
++					pthread_mutex_unlock(&mosq->current_out_packet_mutex);
+ 					return MOSQ_ERR_SUCCESS;
+ 				}else{
+-					COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
++					pthread_mutex_unlock(&mosq->current_out_packet_mutex);
+ 					switch(errno){
+ 						case COMPAT_ECONNRESET:
+ 							return MOSQ_ERR_CONN_LOST;
+@@ -296,7 +296,7 @@ int packet__write(struct mosquitto *mosq)
+ 		if(((packet->command)&0xF6) == CMD_PUBLISH){
+ 			G_PUB_MSGS_SENT_INC(1);
+ #ifndef WITH_BROKER
+-			COMPAT_pthread_mutex_lock(&mosq->callback_mutex);
++			pthread_mutex_lock(&mosq->callback_mutex);
+ 			if(mosq->on_publish){
+ 				/* This is a QoS=0 message */
+ 				mosq->in_callback = true;
+@@ -309,7 +309,7 @@ int packet__write(struct mosquitto *mosq)
+ 				mosq->on_publish_v5(mosq, mosq->userdata, packet->mid, 0, NULL);
+ 				mosq->in_callback = false;
+ 			}
+-			COMPAT_pthread_mutex_unlock(&mosq->callback_mutex);
++			pthread_mutex_unlock(&mosq->callback_mutex);
+ 		}else if(((packet->command)&0xF0) == CMD_DISCONNECT){
+ 			do_client_disconnect(mosq, MOSQ_ERR_SUCCESS, NULL);
+ 			packet__cleanup(packet);
+@@ -321,7 +321,7 @@ int packet__write(struct mosquitto *mosq)
+ 		}
+ 
+ 		/* Free data and reset values */
+-		COMPAT_pthread_mutex_lock(&mosq->out_packet_mutex);
++		pthread_mutex_lock(&mosq->out_packet_mutex);
+ 		mosq->current_out_packet = mosq->out_packet;
+ 		if(mosq->out_packet){
+ 			mosq->out_packet = mosq->out_packet->next;
+@@ -330,7 +330,7 @@ int packet__write(struct mosquitto *mosq)
+ 			}
+ 			mosq->out_packet_count--;
+ 		}
+-		COMPAT_pthread_mutex_unlock(&mosq->out_packet_mutex);
++		pthread_mutex_unlock(&mosq->out_packet_mutex);
+ 
+ 		packet__cleanup(packet);
+ 		mosquitto__free(packet);
+@@ -338,9 +338,9 @@ int packet__write(struct mosquitto *mosq)
+ #ifdef WITH_BROKER
+ 		mosq->next_msg_out = db.now_s + mosq->keepalive;
+ #else
+-		COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
++		pthread_mutex_lock(&mosq->msgtime_mutex);
+ 		mosq->next_msg_out = mosquitto_time() + mosq->keepalive;
+-		COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
++		pthread_mutex_unlock(&mosq->msgtime_mutex);
+ #endif
+ 	}
+ #ifdef WITH_BROKER
+@@ -348,7 +348,7 @@ int packet__write(struct mosquitto *mosq)
+ 		mux__remove_out(mosq);
+ 	}
+ #endif
+-	COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
++	pthread_mutex_unlock(&mosq->current_out_packet_mutex);
+ 	return MOSQ_ERR_SUCCESS;
+ }
+ 
+@@ -536,9 +536,9 @@ int packet__read(struct mosquitto *mosq)
+ #ifdef WITH_BROKER
+ 					keepalive__update(mosq);
+ #else
+-					COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
++					pthread_mutex_lock(&mosq->msgtime_mutex);
+ 					mosq->last_msg_in = mosquitto_time();
+-					COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
++					pthread_mutex_unlock(&mosq->msgtime_mutex);
+ #endif
+ 				}
+ 				return MOSQ_ERR_SUCCESS;
+@@ -571,9 +571,9 @@ int packet__read(struct mosquitto *mosq)
+ #ifdef WITH_BROKER
+ 	keepalive__update(mosq);
+ #else
+-	COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
++	pthread_mutex_lock(&mosq->msgtime_mutex);
+ 	mosq->last_msg_in = mosquitto_time();
+-	COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
++	pthread_mutex_unlock(&mosq->msgtime_mutex);
+ #endif
+ 	return rc;
+ }
+diff --git a/lib/pthread_compat.h b/lib/pthread_compat.h
+deleted file mode 100644
+index ca1f27dc..00000000
+--- a/lib/pthread_compat.h
++++ /dev/null
+@@ -1,28 +0,0 @@
+-#ifndef PTHREAD_COMPAT_
+-#define PTHREAD_COMPAT_
+-
+-#if defined(WITH_THREADING) && !defined(WITH_BROKER)
+-#  include <pthread.h>
+-
+-#  define COMPAT_pthread_create(A, B, C, D) pthread_create((A), (B), (C), (D))
+-#  define COMPAT_pthread_join(A, B) pthread_join((A), (B))
+-#  define COMPAT_pthread_cancel(A) pthread_cancel((A))
+-#  define COMPAT_pthread_testcancel() pthread_testcancel()
+-
+-#  define COMPAT_pthread_mutex_init(A, B) pthread_mutex_init((A), (B))
+-#  define COMPAT_pthread_mutex_destroy(A) pthread_mutex_init((A))
+-#  define COMPAT_pthread_mutex_lock(A) pthread_mutex_lock((A))
+-#  define COMPAT_pthread_mutex_unlock(A) pthread_mutex_unlock((A))
+-#else
+-#  define COMPAT_pthread_create(A, B, C, D)
+-#  define COMPAT_pthread_join(A, B)
+-#  define COMPAT_pthread_cancel(A)
+-#  define COMPAT_pthread_testcancel()
+-
+-#  define COMPAT_pthread_mutex_init(A, B)
+-#  define COMPAT_pthread_mutex_destroy(A)
+-#  define COMPAT_pthread_mutex_lock(A)
+-#  define COMPAT_pthread_mutex_unlock(A)
+-#endif
+-
+-#endif
+diff --git a/lib/util_mosq.c b/lib/util_mosq.c
+index 4bebcbd0..22f8c4d5 100644
+--- a/lib/util_mosq.c
++++ b/lib/util_mosq.c
+@@ -87,10 +87,10 @@ int mosquitto__check_keepalive(struct mosquitto *mosq)
+ 		return MOSQ_ERR_SUCCESS;
+ 	}
+ #endif
+-	COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
++	pthread_mutex_lock(&mosq->msgtime_mutex);
+ 	next_msg_out = mosq->next_msg_out;
+ 	last_msg_in = mosq->last_msg_in;
+-	COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
++	pthread_mutex_unlock(&mosq->msgtime_mutex);
+ 	if(mosq->keepalive && mosq->sock != INVALID_SOCKET &&
+ 			(now >= next_msg_out || now - last_msg_in >= mosq->keepalive)){
+ 
+@@ -98,10 +98,10 @@ int mosquitto__check_keepalive(struct mosquitto *mosq)
+ 		if(state == mosq_cs_active && mosq->ping_t == 0){
+ 			send__pingreq(mosq);
+ 			/* Reset last msg times to give the server time to send a pingresp */
+-			COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
++			pthread_mutex_lock(&mosq->msgtime_mutex);
+ 			mosq->last_msg_in = now;
+ 			mosq->next_msg_out = now + mosq->keepalive;
+-			COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
++			pthread_mutex_unlock(&mosq->msgtime_mutex);
+ 		}else{
+ #ifdef WITH_BROKER
+ #  ifdef WITH_BRIDGE
+@@ -118,7 +118,7 @@ int mosquitto__check_keepalive(struct mosquitto *mosq)
+ 			}else{
+ 				rc = MOSQ_ERR_KEEPALIVE;
+ 			}
+-			COMPAT_pthread_mutex_lock(&mosq->callback_mutex);
++			pthread_mutex_lock(&mosq->callback_mutex);
+ 			if(mosq->on_disconnect){
+ 				mosq->in_callback = true;
+ 				mosq->on_disconnect(mosq, mosq->userdata, rc);
+@@ -129,7 +129,7 @@ int mosquitto__check_keepalive(struct mosquitto *mosq)
+ 				mosq->on_disconnect_v5(mosq, mosq->userdata, rc, NULL);
+ 				mosq->in_callback = false;
+ 			}
+-			COMPAT_pthread_mutex_unlock(&mosq->callback_mutex);
++			pthread_mutex_unlock(&mosq->callback_mutex);
+ 
+ 			return rc;
+ #endif
+@@ -150,11 +150,11 @@ uint16_t mosquitto__mid_generate(struct mosquitto *mosq)
+ 	uint16_t mid;
+ 	assert(mosq);
+ 
+-	COMPAT_pthread_mutex_lock(&mosq->mid_mutex);
++	pthread_mutex_lock(&mosq->mid_mutex);
+ 	mosq->last_mid++;
+ 	if(mosq->last_mid == 0) mosq->last_mid++;
+ 	mid = mosq->last_mid;
+-	COMPAT_pthread_mutex_unlock(&mosq->mid_mutex);
++	pthread_mutex_unlock(&mosq->mid_mutex);
+ 
+ 	return mid;
+ }
+@@ -280,14 +280,14 @@ int util__random_bytes(void *bytes, int count)
+ 
+ int mosquitto__set_state(struct mosquitto *mosq, enum mosquitto_client_state state)
+ {
+-	COMPAT_pthread_mutex_lock(&mosq->state_mutex);
++	pthread_mutex_lock(&mosq->state_mutex);
+ #ifdef WITH_BROKER
+ 	if(mosq->state != mosq_cs_disused)
+ #endif
+ 	{
+ 		mosq->state = state;
+ 	}
+-	COMPAT_pthread_mutex_unlock(&mosq->state_mutex);
++	pthread_mutex_unlock(&mosq->state_mutex);
+ 
+ 	return MOSQ_ERR_SUCCESS;
+ }
+@@ -296,9 +296,9 @@ enum mosquitto_client_state mosquitto__get_state(struct mosquitto *mosq)
+ {
+ 	enum mosquitto_client_state state;
+ 
+-	COMPAT_pthread_mutex_lock(&mosq->state_mutex);
++	pthread_mutex_lock(&mosq->state_mutex);
+ 	state = mosq->state;
+-	COMPAT_pthread_mutex_unlock(&mosq->state_mutex);
++	pthread_mutex_unlock(&mosq->state_mutex);
+ 
+ 	return state;
+ }
+@@ -306,18 +306,18 @@ enum mosquitto_client_state mosquitto__get_state(struct mosquitto *mosq)
+ #ifndef WITH_BROKER
+ void mosquitto__set_request_disconnect(struct mosquitto *mosq, bool request_disconnect)
+ {
+-	COMPAT_pthread_mutex_lock(&mosq->state_mutex);
++	pthread_mutex_lock(&mosq->state_mutex);
+ 	mosq->request_disconnect = request_disconnect;
+-	COMPAT_pthread_mutex_unlock(&mosq->state_mutex);
++	pthread_mutex_unlock(&mosq->state_mutex);
+ }
+ 
+ bool mosquitto__get_request_disconnect(struct mosquitto *mosq)
+ {
+ 	bool request_disconnect;
+ 
+-	COMPAT_pthread_mutex_lock(&mosq->state_mutex);
++	pthread_mutex_lock(&mosq->state_mutex);
+ 	request_disconnect = mosq->request_disconnect;
+-	COMPAT_pthread_mutex_unlock(&mosq->state_mutex);
++	pthread_mutex_unlock(&mosq->state_mutex);
+ 
+ 	return request_disconnect;
+ }
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
