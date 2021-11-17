Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8B6C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA73482A53;
	Mon,  6 Dec 2021 18:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWHF7_j78yUx; Mon,  6 Dec 2021 18:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E4E882893;
	Mon,  6 Dec 2021 18:25:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C33121BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 636BE60D6C
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RMGbIvEJqxaK for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EA2960D63
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0AC6A81503; Mon,  6 Dec 2021 18:07:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:00:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86f46249b397d01e1ed9bd9df0885d0034de0722
X-Git-Newrev: 84e90ce45c34eb21596e4208510605ddb507419a
X-Patchwork-Hint: ignore
Message-Id: <20211206180740.0AC6A81503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: use lcms2 for if
 available
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

commit: https://git.buildroot.net/buildroot/commit/?id=84e90ce45c34eb21596e4208510605ddb507419a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make wpewebkit support color management if the lcms2 package
has been selected.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpewebkit/wpewebkit.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 606a1531c0..fbe87862a7 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -23,7 +23,6 @@ WPEWEBKIT_CONF_OPTS = \
 	-DENABLE_ACCESSIBILITY=OFF \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_MINIBROWSER=OFF \
-	-DUSE_LCMS=OFF \
 	-DUSE_SOUP2=ON \
 	-DSILENCE_CROSS_COMPILATION_NOTICES=ON
 
@@ -67,6 +66,13 @@ else
 WPEWEBKIT_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_LCMS=ON
+WPEWEBKIT_DEPENDENCIES += lcms2
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_LCMS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WOFF2),y)
 WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=ON
 WPEWEBKIT_DEPENDENCIES += woff2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
