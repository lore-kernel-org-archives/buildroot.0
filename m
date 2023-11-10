Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7B8C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 20:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E070341A13;
	Fri, 10 Nov 2023 20:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E070341A13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 95NxxlY6BFrw; Fri, 10 Nov 2023 20:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 908EB41A2D;
	Fri, 10 Nov 2023 20:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 908EB41A2D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DEBA1BF997
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 20:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1190C41A0E
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 20:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1190C41A0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hf1I3XYMYdkq for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 20:11:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAFBE41A00
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 20:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAFBE41A00
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C850786F79; Fri, 10 Nov 2023 20:11:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 18:43:04 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 99148db45619c37dd446c6f8ef8678bd1d533fe9
X-Git-Newrev: 4f5c3b99f9eddc7e5cf8b0156c2778b09413f10d
X-Patchwork-Hint: ignore
Message-Id: <20231110201125.C850786F79@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/network-manager:
 add patch for compatibility with curl 8.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4f5c3b99f9eddc7e5cf8b0156c2778b09413f10d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This upstream patch restores the connectivity check functionality with
libcurl 8.4.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=15835

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b660402b5722c8b4c0ead8739dc2ec2f6a8dfa11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-make-curl-timeout-callback-non-repeating.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
