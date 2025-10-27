Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F94CCF9EA
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 13:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3350483E29;
	Mon, 27 Oct 2025 13:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ycje27LjMwpT; Mon, 27 Oct 2025 13:15:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1847083E9D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1847083E9D;
	Mon, 27 Oct 2025 13:15:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1974615F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 13:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AFBF40850
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 13:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dc7Lp33Pdo7l for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 13:15:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16C5D40530
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16C5D40530
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16C5D40530
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 13:15:52 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b3e9d633b78so1060102266b.1
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 06:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761570950; x=1762175750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JqZbJqCoNHowlJIHMCQC6aWBKOQbGrf1kIndOSP4B2s=;
 b=mvkRQOqcYeXQlw3jOu1YGubbgq994cLTwKWGlHxMd14zGbcwO+si5/UIj/cptsTsbO
 E1B7YtpaDoKfBZ4F3tp+nZCZ0PbKJoRnSQWR3CXV+DirUU2QmHqnSv5wexA+Zb8lqkrI
 AAvI4JgE32UDs+ywxEmHO72QdHiZ5PlU8Oxzz8x/zjOQnJbabvOlkk7kJmbrTqap2Dir
 KrIg+Jlb71Urslpq80qU+0Z0i7MUjLW00n3BNcZfnqVktC05rk9N0H4hve656qRsM3Xk
 3xWSKL+uJxvJqL8Hany7ve8gRXL3QPE+dyxFqvzqcA0dNTsogvCAMgcGqRqoszrgrC06
 DiSg==
X-Gm-Message-State: AOJu0YyDOXGpBv+m44JkC37q8nufF9FX1KaV/WQ7rJVZ1dJmNsITVscD
 nJvhJGwIQ4US/MNksM09C2leH/vhYgaviMJJNuVwfvhdgrxTd9ygSXd3bVU8+LEpb31ZmU4MKMn
 hD/75m/Q=
X-Gm-Gg: ASbGnctBXo2UYyP92pBVrzVnx9e8Rv5P8eoXKcPN0NXJeQMLo/9McsWzRhAUbc+3eQ2
 YYuLGfBfLx/pED+tUj876jgZNxFwqX1W5/Zj2r1qNTfIwEOBJQYqOt1Z8zaTuIHZ3CKdPARN42r
 uQExfRth8sHLwglOCKTCuUqeAksBfe30EPrvfr3+nmqLUpW6K0cSRYtkQ/we/xznZY8PM514ZG/
 07wGdy7UQW3FUGtZXkqAQFVnF/bg8ZnaJbgarhG59t/bG/gw8SfcIcVSMIZDfS72ghym9o53uaX
 iA6da6dGVwl991aqcanAXL4o0Iamk6MzK5Ez/ON7Nyelz0wrAws25y/BfWXxQT4y7tv6/0gWUVk
 zXuKNDKTfouXWJYFDSdBxKdbzOFn4Z2Hqg2ai8CuFL+X2lJ70nQ6mt6fqCP/m2sAWT9EgVgZOrt
 DJEvNv6rCzzzF56Q==
X-Google-Smtp-Source: AGHT+IGpi7SqtH/mYj2NPSZ/rtzJHrfAfzbojV3t3FVBQVwsA2o+WvIOkvrmzKax0VEyco5orqgU4w==
X-Received: by 2002:a17:907:6d15:b0:b50:9f92:fde0 with SMTP id
 a640c23a62f3a-b6db9d91055mr850366b.29.1761570949650; 
 Mon, 27 Oct 2025 06:15:49 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8548eda6sm749529966b.75.2025.10.27.06.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:15:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 27 Oct 2025 14:15:39 +0100
Message-ID: <20251027131539.11774-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761570950; x=1762175750; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JqZbJqCoNHowlJIHMCQC6aWBKOQbGrf1kIndOSP4B2s=;
 b=L7iJc8FLte37SZMOaNYpuUSS4ZoEx43XfC51kLiN5d66uVmUxTzArJAkOfJTNy7ZO6
 +PUxV/jVWEi3kBCwWWDeQazGuC4HKYYO1CP59MJyWBWRXB/WBSAjaPYVafEkQpHdFTBS
 EH1VTRWEP5nGMUVxGNOCbSl7hr5baS+K/Sqd9lNZ3EJi8S9e052Svr7vuEz91+NMPJLs
 Rojpd/rbbfD4phivyWOnWBDdnmHX6MeUsuu0aBS1GFoYEmEPUmzmbZLUuwKA6wjaGyfb
 JaysdKgkfQZac51pJ+Ln5xVTkRlAJqoFF4zBWxH5O8N0A2+ORVtGcnMOtZd1Q/Hp2mqz
 JvsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=L7iJc8FL
Subject: [Buildroot] [PATCH] package/hostapd: add patches for CVE-2025-24912
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See https://jvn.jp/en/jp/JVN19358384/

This fixes the following vulnerability:
- CVE-2025-24912:
    hostapd fails to process crafted RADIUS packets properly. When hostapd
    authenticates wi-fi devices with RADIUS authentication, an attacker in
    the position between the hostapd and the RADIUS server may inject
    crafted RADIUS packets and force RADIUS authentications to fail.
    https://www.cve.org/CVERecord?id=CVE-2025-24912

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...est-only-when-accepting-the-response.patch | 82 +++++++++++++++++++
 ...-RADIUS-Fix-pending-request-dropping.patch | 74 +++++++++++++++++
 package/hostapd/hostapd.mk                    |  4 +
 3 files changed, 160 insertions(+)
 create mode 100644 package/hostapd/0001-RADIUS-Drop-pending-request-only-when-accepting-the-response.patch
 create mode 100644 package/hostapd/0002-RADIUS-Fix-pending-request-dropping.patch

diff --git a/package/hostapd/0001-RADIUS-Drop-pending-request-only-when-accepting-the-response.patch b/package/hostapd/0001-RADIUS-Drop-pending-request-only-when-accepting-the-response.patch
new file mode 100644
index 0000000000..fb86d1303d
--- /dev/null
+++ b/package/hostapd/0001-RADIUS-Drop-pending-request-only-when-accepting-the-response.patch
@@ -0,0 +1,82 @@
+From 726432d7622cc0088ac353d073b59628b590ea44 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 25 Jan 2025 11:21:16 +0200
+Subject: RADIUS: Drop pending request only when accepting the response
+
+The case of an invalid authenticator in a RADIUS response could imply
+that the response is not from the correct RADIUS server and as such,
+such a response should be discarded without changing internal state for
+the pending request. The case of an unknown response (RADIUS_RX_UNKNOWN)
+is somewhat more complex since it could have been indicated before
+validating the authenticator. In any case, it seems better to change the
+state for the pending request only when we have fully accepted the
+response.
+
+Allowing the internal state of pending RADIUS request to change based on
+responses that are not fully validation could have allow at least a
+theoretical DoS attack if an attacker were to have means for injecting
+RADIUS messages to the network using the IP address of the real RADIUS
+server and being able to do so more quickly than the real server and
+with the matching identifier from the request header (i.e., either by
+flooding 256 responses quickly or by having means to capture the RADIUS
+request). These should not really be realistic options in a properly
+protected deployment, but nevertheless it is good to be more careful in
+processing RADIUS responses.
+
+Remove a pending RADIUS request from the internal list only when having
+fully accepted a matching RADIUS response, i.e., after one of the
+registered handlers has confirmed that the authenticator is valid and
+processing of the response has succeeded.
+
+Upstream: https://git.w1.fi/cgit/hostap/commit/?id=726432d7622cc0088ac353d073b59628b590ea44
+CVE: CVE-2025-24912
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/radius/radius_client.c | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
+index 2a7f36170..7909b29a7 100644
+--- a/src/radius/radius_client.c
++++ b/src/radius/radius_client.c
+@@ -1259,13 +1259,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 		       roundtrip / 100, roundtrip % 100);
+ 	rconf->round_trip_time = roundtrip;
+ 
+-	/* Remove ACKed RADIUS packet from retransmit list */
+-	if (prev_req)
+-		prev_req->next = req->next;
+-	else
+-		radius->msgs = req->next;
+-	radius->num_msgs--;
+-
+ 	for (i = 0; i < num_handlers; i++) {
+ 		RadiusRxResult res;
+ 		res = handlers[i].handler(msg, req->msg, req->shared_secret,
+@@ -1276,6 +1269,13 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 			radius_msg_free(msg);
+ 			/* fall through */
+ 		case RADIUS_RX_QUEUED:
++			/* Remove ACKed RADIUS packet from retransmit list */
++			if (prev_req)
++				prev_req->next = req->next;
++			else
++				radius->msgs = req->next;
++			radius->num_msgs--;
++
+ 			radius_client_msg_free(req);
+ 			return;
+ 		case RADIUS_RX_INVALID_AUTHENTICATOR:
+@@ -1297,7 +1297,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 		       msg_type, hdr->code, hdr->identifier,
+ 		       invalid_authenticator ? " [INVALID AUTHENTICATOR]" :
+ 		       "");
+-	radius_client_msg_free(req);
+ 
+  fail:
+ 	radius_msg_free(msg);
+-- 
+cgit v1.2.3
+
diff --git a/package/hostapd/0002-RADIUS-Fix-pending-request-dropping.patch b/package/hostapd/0002-RADIUS-Fix-pending-request-dropping.patch
new file mode 100644
index 0000000000..474f40da0c
--- /dev/null
+++ b/package/hostapd/0002-RADIUS-Fix-pending-request-dropping.patch
@@ -0,0 +1,74 @@
+From 339a334551ca911187cc870f4f97ef08e11db109 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Wed, 5 Feb 2025 19:23:39 +0200
+Subject: RADIUS: Fix pending request dropping
+
+A recent change to this moved the place where the processed RADIUS
+request was removed from the pending list to happen after the message
+handler had been called. This did not take into account possibility of
+the handler adding a new pending request in the list and the prev_req
+pointer not necessarily pointing to the correct entry anymore. As such,
+some of the pending requests could have been lost and that would result
+in not being able to process responses to those requests and also, to a
+memory leak.
+
+Fix this by determining prev_req at the point when the pending request
+is being removed, i.e., after the handler function has already added a
+new entry.
+
+Fixes: 726432d7622c ("RADIUS: Drop pending request only when accepting the response")
+
+Upstream: https://git.w1.fi/cgit/hostap/commit/?id=339a334551ca911187cc870f4f97ef08e11db109
+CVE: CVE-2025-24912
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/radius/radius_client.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
+index 7909b29a7..d4faa7936 100644
+--- a/src/radius/radius_client.c
++++ b/src/radius/radius_client.c
+@@ -1099,7 +1099,7 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 	struct radius_hdr *hdr;
+ 	struct radius_rx_handler *handlers;
+ 	size_t num_handlers, i;
+-	struct radius_msg_list *req, *prev_req;
++	struct radius_msg_list *req, *prev_req, *r;
+ 	struct os_reltime now;
+ 	struct hostapd_radius_server *rconf;
+ 	int invalid_authenticator = 0;
+@@ -1224,7 +1224,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 		break;
+ 	}
+ 
+-	prev_req = NULL;
+ 	req = radius->msgs;
+ 	while (req) {
+ 		/* TODO: also match by src addr:port of the packet when using
+@@ -1236,7 +1235,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 		    hdr->identifier)
+ 			break;
+ 
+-		prev_req = req;
+ 		req = req->next;
+ 	}
+ 
+@@ -1270,6 +1268,12 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 			/* fall through */
+ 		case RADIUS_RX_QUEUED:
+ 			/* Remove ACKed RADIUS packet from retransmit list */
++			prev_req = NULL;
++			for (r = radius->msgs; r; r = r->next) {
++				if (r == req)
++					break;
++				prev_req = r;
++			}
+ 			if (prev_req)
+ 				prev_req->next = req->next;
+ 			else
+-- 
+cgit v1.2.3
+
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 3eda1c7e83..d83b574fad 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -16,6 +16,10 @@ HOSTAPD_LICENSE_FILES = README
 HOSTAPD_CPE_ID_VENDOR = w1.fi
 HOSTAPD_SELINUX_MODULES = hostapd
 
+# 0001-RADIUS-Drop-pending-request-only-when-accepting-the-response.patch
+# 0002-RADIUS-Fix-pending-request-dropping.patch
+HOSTAPD_IGNORE_CVES += CVE-2025-24912
+
 HOSTAPD_CONFIG_ENABLE = \
 	CONFIG_INTERNAL_LIBTOMMATH \
 	CONFIG_DEBUG_FILE \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
