Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CB1C369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 06:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71CC560A4C;
	Mon, 14 Apr 2025 06:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OqRIhCfJYhOt; Mon, 14 Apr 2025 06:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4346090C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A4346090C;
	Mon, 14 Apr 2025 06:02:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54B5B108
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 06:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A12380BAB
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 06:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7orXo93XI-2b for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 06:02:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD9AC801EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD9AC801EA
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD9AC801EA
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 06:02:44 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-702628e34f2so31660887b3.0
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 23:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744610563; x=1745215363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HaqC51fUP4Er4kV+JZTPCNLYqdmuRPY5Fyxpd/y3hF4=;
 b=peA8rVemVg3WZv07AdQUEz0yQfOcfEa9s+xN6owsNSUrKQsfyN35JfNOxPsSXGnxwn
 3zws9MShCU9DZ+PJCE1O2uZEkbVZrGE0WYMDLp7kh3KLLR0MOc4cN45HwnM5nkLoJCDR
 p5Ssi0GAVzcCBEQRdi1x9umIBEJ61XJB5ANDQZtd5WD+k0PaQr/5+lTcl5PqxfE1T03m
 qsyFWus4c8TS6XTDk7A7SOYVJi+zzqsDv3aluwsRlpZeUfOOQYqWyUtJiLH/sL6fmwui
 xJtKZ5mKDl1PQHYjg7VP0rOyt8Oj5p+CoHgPhnEJK8PMnq+P2CaXA9TplL5IBAFut9nI
 fGeQ==
X-Gm-Message-State: AOJu0YyYOUy/cJHFaWNXV88Jqn/iM933sLDwD65Hv07WdnBFeYMn6Nf7
 UcEFsjnsa1uLcdf3zuByubPIfPRA7HG0nsG1ADviWDvXBzegr8MV+Ssmtg==
X-Gm-Gg: ASbGncsnD5729lGHe2bBdPWCsLtKij4tdbVH1BWBLqt/Tzlv6u3iVPqBL2rrlb2+SL7
 JR7YISke0BCIiSF7sfI9CH4T8YDRUWuWRXdRPI+voAkg/hRBxPa+H5/MqJapM2LFX7yeyIIMZEt
 GwG/6QCdQmaS2N20Xpd0D2H1vjrNFFdFwYNmIQDN9nO8eAkpo9BhepryqCiC4xwtOh3Vrp+Uaud
 a8n7Nu5fqUSHJFI06B0gFEYPRh0A6r0kKrdJRE3G+V2d7wjLi8/fZJxBq/TqNE/0ChbO9UnV2Sr
 uffwXhkw8o4nDFJYgJEwSN2W+csBnsUSRoAmMA==
X-Google-Smtp-Source: AGHT+IEF7t9Y2zUMAYfi0afHO5/BUiIOovBUuMpVxX15EsGBSpjoWTj75yl/u0OTsP0Edk2gp+6bEQ==
X-Received: by 2002:a05:690c:387:b0:6f9:492e:94db with SMTP id
 00721157ae682-7055941ba80mr170512737b3.2.1744610562774; 
 Sun, 13 Apr 2025 23:02:42 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7053e3be600sm29333847b3.121.2025.04.13.23.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 23:02:42 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 14:02:31 +0800
Message-ID: <20250414060233.3292625-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744610563; x=1745215363; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HaqC51fUP4Er4kV+JZTPCNLYqdmuRPY5Fyxpd/y3hF4=;
 b=Bcfsqu5WJKBY7MxxLrB/wrOZAs1CnU6rWWO1EPJzaChlRCn/ME1cejRucosY+LpUAh
 n4FQ/r0cycko795kv2871LBjbUrHyVndTTFUJibOQ7k/iyWUvMZb/RoNvSlfLCqTSRBM
 hgZp/xNhgOCSx2ukLZ2srikNE6Qaf0d+PliyO8GGVoVNvCDVeSb8ILEoZwP3xoyfNBld
 v8jFj318ONC5mxSL4EOoCf60DicPfT8Cs1c3Sy65j4P/1/1PrEJ3qd2fC3kPSoJ5dt66
 wpLlowlX/v4zB//jll6zOoHpa0xyR3zqyRBLVFzzhHnWvG9MIY6JRT7ek7i6hEAoMZb5
 tWUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Bcfsqu5W
Subject: [Buildroot] [PATCH] package/mosquitto: security bump to version
 2.0.21
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- Fix leak on malicious SUBSCRIBE by authenticated client.
  Closes eclipse #248.
- Further fix for CVE-2023-28366.

Also drop the patch that was fixed in the v2.0.21, see the closed issues:
https://github.com/eclipse-mosquitto/mosquitto/issues/3183
https://github.com/eclipse-mosquitto/mosquitto/issues/3193

For more details, see the changelog:
https://github.com/eclipse-mosquitto/mosquitto/blob/v2.0.21/ChangeLog.txt

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 .../0001-Revert-Fix-NetBSD-build.patch        | 390 ------------------
 package/mosquitto/mosquitto.hash              |   4 +-
 package/mosquitto/mosquitto.mk                |   2 +-
 3 files changed, 3 insertions(+), 393 deletions(-)
 delete mode 100644 package/mosquitto/0001-Revert-Fix-NetBSD-build.patch

diff --git a/package/mosquitto/0001-Revert-Fix-NetBSD-build.patch b/package/mosquitto/0001-Revert-Fix-NetBSD-build.patch
deleted file mode 100644
index 180a23565c..0000000000
--- a/package/mosquitto/0001-Revert-Fix-NetBSD-build.patch
+++ /dev/null
@@ -1,390 +0,0 @@
-From 18d41744338d6e291612e66e8baace4faaad7b2e Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Fri, 6 Dec 2024 08:27:53 +0100
-Subject: [PATCH] Revert "Fix NetBSD build"
-
-This reverts commit 88b7bb3521cc51cb1e80630395ae736040cc8ff8.
-
-This unfortunately broke non-thread builds, so revert it until fixed
-upstream.
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/issues/3183
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- lib/dummypthread.h       | 14 ++++++++++++
- lib/handle_pubackcomp.c  |  4 ++--
- lib/mosquitto_internal.h |  6 +++++-
- lib/packet_mosq.c        | 46 ++++++++++++++++++++--------------------
- lib/pthread_compat.h     | 28 ------------------------
- lib/util_mosq.c          | 32 ++++++++++++++--------------
- 6 files changed, 60 insertions(+), 70 deletions(-)
- create mode 100644 lib/dummypthread.h
- delete mode 100644 lib/pthread_compat.h
-
-diff --git a/lib/dummypthread.h b/lib/dummypthread.h
-new file mode 100644
-index 00000000..c0eb2c15
---- /dev/null
-+++ b/lib/dummypthread.h
-@@ -0,0 +1,14 @@
-+#ifndef DUMMYPTHREAD_H
-+#define DUMMYPTHREAD_H
-+
-+#define pthread_create(A, B, C, D)
-+#define pthread_join(A, B)
-+#define pthread_cancel(A)
-+#define pthread_testcancel()
-+
-+#define pthread_mutex_init(A, B)
-+#define pthread_mutex_destroy(A)
-+#define pthread_mutex_lock(A)
-+#define pthread_mutex_unlock(A)
-+
-+#endif
-diff --git a/lib/handle_pubackcomp.c b/lib/handle_pubackcomp.c
-index d70d602d..4568bb40 100644
---- a/lib/handle_pubackcomp.c
-+++ b/lib/handle_pubackcomp.c
-@@ -57,9 +57,9 @@ int handle__pubackcomp(struct mosquitto *mosq, const char *type)
- 		}
- 	}
- 
--	COMPAT_pthread_mutex_lock(&mosq->msgs_out.mutex);
-+	pthread_mutex_lock(&mosq->msgs_out.mutex);
- 	util__increment_send_quota(mosq);
--	COMPAT_pthread_mutex_unlock(&mosq->msgs_out.mutex);
-+	pthread_mutex_unlock(&mosq->msgs_out.mutex);
- 
- 	rc = packet__read_uint16(&mosq->in_packet, &mid);
- 	if(rc) return rc;
-diff --git a/lib/mosquitto_internal.h b/lib/mosquitto_internal.h
-index 31120258..ac71ffbf 100644
---- a/lib/mosquitto_internal.h
-+++ b/lib/mosquitto_internal.h
-@@ -33,7 +33,11 @@ Contributors:
- #endif
- #include <stdlib.h>
- 
--#include <pthread_compat.h>
-+#if defined(WITH_THREADING) && !defined(WITH_BROKER)
-+#  include <pthread.h>
-+#else
-+#  include <dummypthread.h>
-+#endif
- 
- #ifdef WITH_SRV
- #  include <ares.h>
-diff --git a/lib/packet_mosq.c b/lib/packet_mosq.c
-index b063eb71..fd716baf 100644
---- a/lib/packet_mosq.c
-+++ b/lib/packet_mosq.c
-@@ -129,13 +129,13 @@ void packet__cleanup_all_no_locks(struct mosquitto *mosq)
- 
- void packet__cleanup_all(struct mosquitto *mosq)
- {
--	COMPAT_pthread_mutex_lock(&mosq->current_out_packet_mutex);
--	COMPAT_pthread_mutex_lock(&mosq->out_packet_mutex);
-+	pthread_mutex_lock(&mosq->current_out_packet_mutex);
-+	pthread_mutex_lock(&mosq->out_packet_mutex);
- 
- 	packet__cleanup_all_no_locks(mosq);
- 
--	COMPAT_pthread_mutex_unlock(&mosq->out_packet_mutex);
--	COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
-+	pthread_mutex_unlock(&mosq->out_packet_mutex);
-+	pthread_mutex_unlock(&mosq->current_out_packet_mutex);
- }
- 
- 
-@@ -151,7 +151,7 @@ int packet__queue(struct mosquitto *mosq, struct mosquitto__packet *packet)
- 	packet->to_process = packet->packet_length;
- 
- 	packet->next = NULL;
--	COMPAT_pthread_mutex_lock(&mosq->out_packet_mutex);
-+	pthread_mutex_lock(&mosq->out_packet_mutex);
- 
- #ifdef WITH_BROKER
- 	if(db.config->max_queued_messages > 0 && mosq->out_packet_count >= db.config->max_queued_messages){
-@@ -174,7 +174,7 @@ int packet__queue(struct mosquitto *mosq, struct mosquitto__packet *packet)
- 	}
- 	mosq->out_packet_last = packet;
- 	mosq->out_packet_count++;
--	COMPAT_pthread_mutex_unlock(&mosq->out_packet_mutex);
-+	pthread_mutex_unlock(&mosq->out_packet_mutex);
- #ifdef WITH_BROKER
- #  ifdef WITH_WEBSOCKETS
- 	if(mosq->wsi){
-@@ -232,8 +232,8 @@ int packet__write(struct mosquitto *mosq)
- 	if(!mosq) return MOSQ_ERR_INVAL;
- 	if(mosq->sock == INVALID_SOCKET) return MOSQ_ERR_NO_CONN;
- 
--	COMPAT_pthread_mutex_lock(&mosq->current_out_packet_mutex);
--	COMPAT_pthread_mutex_lock(&mosq->out_packet_mutex);
-+	pthread_mutex_lock(&mosq->current_out_packet_mutex);
-+	pthread_mutex_lock(&mosq->out_packet_mutex);
- 	if(mosq->out_packet && !mosq->current_out_packet){
- 		mosq->current_out_packet = mosq->out_packet;
- 		mosq->out_packet = mosq->out_packet->next;
-@@ -242,7 +242,7 @@ int packet__write(struct mosquitto *mosq)
- 		}
- 		mosq->out_packet_count--;
- 	}
--	COMPAT_pthread_mutex_unlock(&mosq->out_packet_mutex);
-+	pthread_mutex_unlock(&mosq->out_packet_mutex);
- 
- #ifdef WITH_BROKER
- 	if(mosq->current_out_packet){
-@@ -252,7 +252,7 @@ int packet__write(struct mosquitto *mosq)
- 
- 	state = mosquitto__get_state(mosq);
- 	if(state == mosq_cs_connect_pending){
--		COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
-+		pthread_mutex_unlock(&mosq->current_out_packet_mutex);
- 		return MOSQ_ERR_SUCCESS;
- 	}
- 
-@@ -274,10 +274,10 @@ int packet__write(struct mosquitto *mosq)
- 						|| errno == WSAENOTCONN
- #endif
- 						){
--					COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
-+					pthread_mutex_unlock(&mosq->current_out_packet_mutex);
- 					return MOSQ_ERR_SUCCESS;
- 				}else{
--					COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
-+					pthread_mutex_unlock(&mosq->current_out_packet_mutex);
- 					switch(errno){
- 						case COMPAT_ECONNRESET:
- 							return MOSQ_ERR_CONN_LOST;
-@@ -296,7 +296,7 @@ int packet__write(struct mosquitto *mosq)
- 		if(((packet->command)&0xF6) == CMD_PUBLISH){
- 			G_PUB_MSGS_SENT_INC(1);
- #ifndef WITH_BROKER
--			COMPAT_pthread_mutex_lock(&mosq->callback_mutex);
-+			pthread_mutex_lock(&mosq->callback_mutex);
- 			if(mosq->on_publish){
- 				/* This is a QoS=0 message */
- 				mosq->in_callback = true;
-@@ -309,7 +309,7 @@ int packet__write(struct mosquitto *mosq)
- 				mosq->on_publish_v5(mosq, mosq->userdata, packet->mid, 0, NULL);
- 				mosq->in_callback = false;
- 			}
--			COMPAT_pthread_mutex_unlock(&mosq->callback_mutex);
-+			pthread_mutex_unlock(&mosq->callback_mutex);
- 		}else if(((packet->command)&0xF0) == CMD_DISCONNECT){
- 			do_client_disconnect(mosq, MOSQ_ERR_SUCCESS, NULL);
- 			packet__cleanup(packet);
-@@ -321,7 +321,7 @@ int packet__write(struct mosquitto *mosq)
- 		}
- 
- 		/* Free data and reset values */
--		COMPAT_pthread_mutex_lock(&mosq->out_packet_mutex);
-+		pthread_mutex_lock(&mosq->out_packet_mutex);
- 		mosq->current_out_packet = mosq->out_packet;
- 		if(mosq->out_packet){
- 			mosq->out_packet = mosq->out_packet->next;
-@@ -330,7 +330,7 @@ int packet__write(struct mosquitto *mosq)
- 			}
- 			mosq->out_packet_count--;
- 		}
--		COMPAT_pthread_mutex_unlock(&mosq->out_packet_mutex);
-+		pthread_mutex_unlock(&mosq->out_packet_mutex);
- 
- 		packet__cleanup(packet);
- 		mosquitto__free(packet);
-@@ -338,9 +338,9 @@ int packet__write(struct mosquitto *mosq)
- #ifdef WITH_BROKER
- 		mosq->next_msg_out = db.now_s + mosq->keepalive;
- #else
--		COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
-+		pthread_mutex_lock(&mosq->msgtime_mutex);
- 		mosq->next_msg_out = mosquitto_time() + mosq->keepalive;
--		COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
-+		pthread_mutex_unlock(&mosq->msgtime_mutex);
- #endif
- 	}
- #ifdef WITH_BROKER
-@@ -348,7 +348,7 @@ int packet__write(struct mosquitto *mosq)
- 		mux__remove_out(mosq);
- 	}
- #endif
--	COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
-+	pthread_mutex_unlock(&mosq->current_out_packet_mutex);
- 	return MOSQ_ERR_SUCCESS;
- }
- 
-@@ -536,9 +536,9 @@ int packet__read(struct mosquitto *mosq)
- #ifdef WITH_BROKER
- 					keepalive__update(mosq);
- #else
--					COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
-+					pthread_mutex_lock(&mosq->msgtime_mutex);
- 					mosq->last_msg_in = mosquitto_time();
--					COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
-+					pthread_mutex_unlock(&mosq->msgtime_mutex);
- #endif
- 				}
- 				return MOSQ_ERR_SUCCESS;
-@@ -571,9 +571,9 @@ int packet__read(struct mosquitto *mosq)
- #ifdef WITH_BROKER
- 	keepalive__update(mosq);
- #else
--	COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
-+	pthread_mutex_lock(&mosq->msgtime_mutex);
- 	mosq->last_msg_in = mosquitto_time();
--	COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
-+	pthread_mutex_unlock(&mosq->msgtime_mutex);
- #endif
- 	return rc;
- }
-diff --git a/lib/pthread_compat.h b/lib/pthread_compat.h
-deleted file mode 100644
-index ca1f27dc..00000000
---- a/lib/pthread_compat.h
-+++ /dev/null
-@@ -1,28 +0,0 @@
--#ifndef PTHREAD_COMPAT_
--#define PTHREAD_COMPAT_
--
--#if defined(WITH_THREADING) && !defined(WITH_BROKER)
--#  include <pthread.h>
--
--#  define COMPAT_pthread_create(A, B, C, D) pthread_create((A), (B), (C), (D))
--#  define COMPAT_pthread_join(A, B) pthread_join((A), (B))
--#  define COMPAT_pthread_cancel(A) pthread_cancel((A))
--#  define COMPAT_pthread_testcancel() pthread_testcancel()
--
--#  define COMPAT_pthread_mutex_init(A, B) pthread_mutex_init((A), (B))
--#  define COMPAT_pthread_mutex_destroy(A) pthread_mutex_init((A))
--#  define COMPAT_pthread_mutex_lock(A) pthread_mutex_lock((A))
--#  define COMPAT_pthread_mutex_unlock(A) pthread_mutex_unlock((A))
--#else
--#  define COMPAT_pthread_create(A, B, C, D)
--#  define COMPAT_pthread_join(A, B)
--#  define COMPAT_pthread_cancel(A)
--#  define COMPAT_pthread_testcancel()
--
--#  define COMPAT_pthread_mutex_init(A, B)
--#  define COMPAT_pthread_mutex_destroy(A)
--#  define COMPAT_pthread_mutex_lock(A)
--#  define COMPAT_pthread_mutex_unlock(A)
--#endif
--
--#endif
-diff --git a/lib/util_mosq.c b/lib/util_mosq.c
-index 4bebcbd0..22f8c4d5 100644
---- a/lib/util_mosq.c
-+++ b/lib/util_mosq.c
-@@ -87,10 +87,10 @@ int mosquitto__check_keepalive(struct mosquitto *mosq)
- 		return MOSQ_ERR_SUCCESS;
- 	}
- #endif
--	COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
-+	pthread_mutex_lock(&mosq->msgtime_mutex);
- 	next_msg_out = mosq->next_msg_out;
- 	last_msg_in = mosq->last_msg_in;
--	COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
-+	pthread_mutex_unlock(&mosq->msgtime_mutex);
- 	if(mosq->keepalive && mosq->sock != INVALID_SOCKET &&
- 			(now >= next_msg_out || now - last_msg_in >= mosq->keepalive)){
- 
-@@ -98,10 +98,10 @@ int mosquitto__check_keepalive(struct mosquitto *mosq)
- 		if(state == mosq_cs_active && mosq->ping_t == 0){
- 			send__pingreq(mosq);
- 			/* Reset last msg times to give the server time to send a pingresp */
--			COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
-+			pthread_mutex_lock(&mosq->msgtime_mutex);
- 			mosq->last_msg_in = now;
- 			mosq->next_msg_out = now + mosq->keepalive;
--			COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
-+			pthread_mutex_unlock(&mosq->msgtime_mutex);
- 		}else{
- #ifdef WITH_BROKER
- #  ifdef WITH_BRIDGE
-@@ -118,7 +118,7 @@ int mosquitto__check_keepalive(struct mosquitto *mosq)
- 			}else{
- 				rc = MOSQ_ERR_KEEPALIVE;
- 			}
--			COMPAT_pthread_mutex_lock(&mosq->callback_mutex);
-+			pthread_mutex_lock(&mosq->callback_mutex);
- 			if(mosq->on_disconnect){
- 				mosq->in_callback = true;
- 				mosq->on_disconnect(mosq, mosq->userdata, rc);
-@@ -129,7 +129,7 @@ int mosquitto__check_keepalive(struct mosquitto *mosq)
- 				mosq->on_disconnect_v5(mosq, mosq->userdata, rc, NULL);
- 				mosq->in_callback = false;
- 			}
--			COMPAT_pthread_mutex_unlock(&mosq->callback_mutex);
-+			pthread_mutex_unlock(&mosq->callback_mutex);
- 
- 			return rc;
- #endif
-@@ -150,11 +150,11 @@ uint16_t mosquitto__mid_generate(struct mosquitto *mosq)
- 	uint16_t mid;
- 	assert(mosq);
- 
--	COMPAT_pthread_mutex_lock(&mosq->mid_mutex);
-+	pthread_mutex_lock(&mosq->mid_mutex);
- 	mosq->last_mid++;
- 	if(mosq->last_mid == 0) mosq->last_mid++;
- 	mid = mosq->last_mid;
--	COMPAT_pthread_mutex_unlock(&mosq->mid_mutex);
-+	pthread_mutex_unlock(&mosq->mid_mutex);
- 
- 	return mid;
- }
-@@ -280,14 +280,14 @@ int util__random_bytes(void *bytes, int count)
- 
- int mosquitto__set_state(struct mosquitto *mosq, enum mosquitto_client_state state)
- {
--	COMPAT_pthread_mutex_lock(&mosq->state_mutex);
-+	pthread_mutex_lock(&mosq->state_mutex);
- #ifdef WITH_BROKER
- 	if(mosq->state != mosq_cs_disused)
- #endif
- 	{
- 		mosq->state = state;
- 	}
--	COMPAT_pthread_mutex_unlock(&mosq->state_mutex);
-+	pthread_mutex_unlock(&mosq->state_mutex);
- 
- 	return MOSQ_ERR_SUCCESS;
- }
-@@ -296,9 +296,9 @@ enum mosquitto_client_state mosquitto__get_state(struct mosquitto *mosq)
- {
- 	enum mosquitto_client_state state;
- 
--	COMPAT_pthread_mutex_lock(&mosq->state_mutex);
-+	pthread_mutex_lock(&mosq->state_mutex);
- 	state = mosq->state;
--	COMPAT_pthread_mutex_unlock(&mosq->state_mutex);
-+	pthread_mutex_unlock(&mosq->state_mutex);
- 
- 	return state;
- }
-@@ -306,18 +306,18 @@ enum mosquitto_client_state mosquitto__get_state(struct mosquitto *mosq)
- #ifndef WITH_BROKER
- void mosquitto__set_request_disconnect(struct mosquitto *mosq, bool request_disconnect)
- {
--	COMPAT_pthread_mutex_lock(&mosq->state_mutex);
-+	pthread_mutex_lock(&mosq->state_mutex);
- 	mosq->request_disconnect = request_disconnect;
--	COMPAT_pthread_mutex_unlock(&mosq->state_mutex);
-+	pthread_mutex_unlock(&mosq->state_mutex);
- }
- 
- bool mosquitto__get_request_disconnect(struct mosquitto *mosq)
- {
- 	bool request_disconnect;
- 
--	COMPAT_pthread_mutex_lock(&mosq->state_mutex);
-+	pthread_mutex_lock(&mosq->state_mutex);
- 	request_disconnect = mosq->request_disconnect;
--	COMPAT_pthread_mutex_unlock(&mosq->state_mutex);
-+	pthread_mutex_unlock(&mosq->state_mutex);
- 
- 	return request_disconnect;
- }
--- 
-2.39.5
-
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index f644f688b9..ff74d9c534 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.20.tar.gz.asc
-sha256  ebd07d89d2a446a7f74100ad51272e4a8bf300b61634a7812e19f068f2759de8  mosquitto-2.0.20.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.21.tar.gz.asc
+sha256  7ad5e84caeb8d2bb6ed0c04614b2a7042def961af82d87f688ba33db857b899d  mosquitto-2.0.21.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 727dd4ff4c..900d1e65cb 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.20
+MOSQUITTO_VERSION = 2.0.21
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
