Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E1CCCF9E5
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 21:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F05A83FC5;
	Mon, 27 Oct 2025 21:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSBYyf2-UTgr; Mon, 27 Oct 2025 21:19:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A0CC83F00
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A0CC83F00;
	Mon, 27 Oct 2025 21:19:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2602243F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FBE2413E0
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgEHzXcX3d40 for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 21:19:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0EFE41318
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0EFE41318
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:19:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF40787917; Mon, 27 Oct 2025 21:19:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 27 Oct 2025 22:10:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50954cc5e00e8ba1ad0768c9f45aabd8a2897eff
X-Git-Newrev: 8282aaf094d526499085445e33295aa960e39c1c
X-Patchwork-Hint: ignore
Message-Id: <20251027211909.BF40787917@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hostapd: add patches for
 CVE-2025-24912
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8282aaf094d526499085445e33295aa960e39c1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://jvn.jp/en/jp/JVN19358384/

This fixes the following vulnerability:
- CVE-2025-24912:
    hostapd fails to process crafted RADIUS packets properly. When hostapd
    authenticates wi-fi devices with RADIUS authentication, an attacker in
    the position between the hostapd and the RADIUS server may inject
    crafted RADIUS packets and force RADIUS authentications to fail.
    https://www.cve.org/CVERecord?id=CVE-2025-24912

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-request-only-when-accepting-the-response.patch | 82 ++++++++++++++++++++++
 .../0002-RADIUS-Fix-pending-request-dropping.patch | 74 +++++++++++++++++++
 package/hostapd/hostapd.mk                         |  4 ++
 3 files changed, 160 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
