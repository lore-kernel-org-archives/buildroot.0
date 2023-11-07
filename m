Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE3EC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 12:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F27581285;
	Tue,  7 Nov 2023 12:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F27581285
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pzbYFT3_pMUl; Tue,  7 Nov 2023 12:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E94188125B;
	Tue,  7 Nov 2023 12:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E94188125B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D3AC1BF39E
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 12:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4506141807
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 12:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4506141807
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_G_A8juHrZM for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 12:50:07 +0000 (UTC)
X-Greylist: delayed 474 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 07 Nov 2023 12:50:06 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D00174138F
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D00174138F
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 12:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id DD26C168F9;
 Tue,  7 Nov 2023 13:42:08 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id YaAVduJ6xlEz; Tue,  7 Nov 2023 13:42:08 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 7CE0A168ED;
 Tue,  7 Nov 2023 13:42:08 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  7 Nov 2023 13:41:56 +0100
Message-ID: <20231107124157.594529-1-christian@klarinett.li>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from; s=sel2011a; t=1699360928; bh=+N
 /fTqBpZ/L1MYSCSccIzVzeUs+KpFvRVFJtqN6Dm8s=; b=IMFuvqUso8TVPbLzvj
 l9bhHYYjCveWnswIU0GrDsy3TO1K/G7NEGaSFvs68P2U2XOD+mVLS+cRLp6MDvtn
 nsQdH/ahIoJgvUfYU4PtFby+1lloFXOl1PxF55QI2p2MEl8vkDjwxGraWzQhx/X5
 aWnjBy//VK4mSCA8sJHjMk0aE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li
 header.a=rsa-sha256 header.s=sel2011a header.b=IMFuvqUs
Subject: [Buildroot] [PATCH 1/1] package/network-manager: add patch for
 compatibility with curl 8.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Cc: Christian Hitz <christian.hitz@bbv.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

This upstream patch restores the connectivity check functionality with
libcurl 8.4.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
Backport to: 2023.02.x, 2023.08.x
---
 ...-curl-timeout-callback-non-repeating.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch

diff --git a/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch b/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
new file mode 100644
index 0000000000..8e25805d0c
--- /dev/null
+++ b/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
@@ -0,0 +1,44 @@
+From abc6e1cf258ab332bed161036a358bbe9c2d1e90 Mon Sep 17 00:00:00 2001
+From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
+Date: Fri, 13 Oct 2023 16:46:09 +0000
+Subject: [PATCH] connectivity: Make curl timeout callback non-repeating.
+
+This reverts commit 05c31da4d9.
+
+In the linked commit the callback was made repeating on the assumption
+that forward progress would result in the callback getting canceled in
+cb_data_complete. However, this assumption does not hold since a timeout
+callback does not guarantee completion (or error out) of a request.
+
+curl tweaked some internals in v8.4.0 and started giving 0 timeouts, and
+a repeating callback is firing back-to-back without making any progress
+in doing so.
+
+Revert the change and make the callback non-repeating again.
+
+Fixes: 05c31da4d9cb ('connectivity: don't cancel curl timerfunction from timeout')
+Upstream: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/abc6e1cf258ab332bed161036a358bbe9c2d1e90
+Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
+---
+ src/core/nm-connectivity.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/core/nm-connectivity.c b/src/core/nm-connectivity.c
+index 92de44f17d..d8b0004c38 100644
+--- a/src/core/nm-connectivity.c
++++ b/src/core/nm-connectivity.c
+@@ -406,9 +406,10 @@ _con_curl_timeout_cb(gpointer user_data)
+ {
+     NMConnectivityCheckHandle *cb_data = user_data;
+ 
++    cb_data->concheck.curl_timer = 0;
+     _con_curl_check_connectivity(cb_data->concheck.curl_mhandle, CURL_SOCKET_TIMEOUT, 0);
+     _complete_queued(cb_data->self);
+-    return G_SOURCE_CONTINUE;
++    return G_SOURCE_REMOVE;
+ }
+ 
+ static int
+-- 
+GitLab
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
