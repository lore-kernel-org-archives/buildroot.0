Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1FAC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A94FF608EB;
	Mon, 25 Mar 2024 22:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQDCG13lO4R4; Mon, 25 Mar 2024 22:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97CCB608EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97CCB608EF;
	Mon, 25 Mar 2024 22:22:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D05C11BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B95D6813C5
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJvOOs0Yu-d8 for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DFED817B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DFED817B1
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7FE0840C5; Mon, 25 Mar 2024 22:22:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 23:18:21 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 800ae4d99149f2ba90d0c96382a88211c0481ccb
X-Git-Newrev: 39466535d0ff49948557430ade1439130d147d65
X-Patchwork-Hint: ignore
Message-Id: <20240325222224.E7FE0840C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/xvisor: use
 BR2_PYTHON3_HOST_DEPENDENCY to ensure python3 is available
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

commit: https://git.buildroot.net/buildroot/commit/?id=39466535d0ff49948557430ade1439130d147d65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 24e996d14d28d (package/xvisor: fix build without python interpreter)
added a dependency on host-python3 for the d2c.py script, but this script
does not use any non-standard python modules so we can instead use
BR2_PYTHON3_HOST_DEPENDENCY to only build host-python3 if the build host
does not have python3.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7f08dc612c2a52a297c50bc047d5fabd7ef7317c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xvisor/xvisor.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index 2a51706b55..c1b61270f1 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -11,7 +11,7 @@ XVISOR_LICENSE = GPL-2.0+
 XVISOR_LICENSE_FILES = COPYING
 XVISOR_INSTALL_IMAGES = YES
 XVISOR_INSTALL_TARGET = NO
-XVISOR_DEPENDENCIES = host-bison host-dtc host-flex host-python3
+XVISOR_DEPENDENCIES = host-bison host-dtc host-flex $(BR2_PYTHON3_HOST_DEPENDENCY)
 
 XVISOR_MAKE_TARGETS = all
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
