Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000E6C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 18:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C15A540160;
	Mon, 25 Mar 2024 18:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7R-Eyf4uwtGF; Mon, 25 Mar 2024 18:19:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F26D4075B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F26D4075B;
	Mon, 25 Mar 2024 18:19:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB2961BF955
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8DF640BCA
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoeegVdm2X8Z for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 18:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D3AA40476
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D3AA40476
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 18:19:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0855882DE5; Mon, 25 Mar 2024 18:19:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 19:17:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a480207fda5ebfba0b4138f491975880ed773cc
X-Git-Newrev: 7f08dc612c2a52a297c50bc047d5fabd7ef7317c
X-Patchwork-Hint: ignore
Message-Id: <20240325181908.0855882DE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xvisor: use
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f08dc612c2a52a297c50bc047d5fabd7ef7317c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 24e996d14d28d (package/xvisor: fix build without python interpreter)
added a dependency on host-python3 for the d2c.py script, but this script
does not use any non-standard python modules so we can instead use
BR2_PYTHON3_HOST_DEPENDENCY to only build host-python3 if the build host
does not have python3.

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
