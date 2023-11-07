Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A436CC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C2EE608D8;
	Tue,  7 Nov 2023 21:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C2EE608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id os6IiJFhZ6bD; Tue,  7 Nov 2023 21:56:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7298C60C0F;
	Tue,  7 Nov 2023 21:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7298C60C0F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9F481BF5A8
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D53D403E7
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D53D403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HAQWvXk_I4fZ for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:56:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D67BE40182
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D67BE40182
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B45BB86C43; Tue,  7 Nov 2023 21:56:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Nov 2023 22:54:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 359eb5072d832aaab9328cbc84e57f0fb093f998
X-Git-Newrev: b660402b5722c8b4c0ead8739dc2ec2f6a8dfa11
X-Patchwork-Hint: ignore
Message-Id: <20231107215607.B45BB86C43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: add patch for
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b660402b5722c8b4c0ead8739dc2ec2f6a8dfa11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This upstream patch restores the connectivity check functionality with
libcurl 8.4.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=15835

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
