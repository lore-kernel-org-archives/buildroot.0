Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BCEC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5370D408D1;
	Wed, 27 Jul 2022 09:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5370D408D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3z2L_GTiaGW; Wed, 27 Jul 2022 09:27:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 705C040187;
	Wed, 27 Jul 2022 09:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 705C040187
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C10B91BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A862740073
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A862740073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYh_kDN8Jcbh for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:27:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7E3640187
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7E3640187
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1254C864E7; Wed, 27 Jul 2022 09:13:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:11:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90932b407c00ce31e8fd7e1627907d0caf6fa901
X-Git-Newrev: 5e050a8849b74636682913f6ad57b0b052c0bb51
X-Patchwork-Hint: ignore
Message-Id: <20220727091332.1254C864E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in: move toolchain menu before
 build options
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e050a8849b74636682913f6ad57b0b052c0bb51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many of the build options depend on the toolchain configuration. In
addition, it's pretty logical that you select first target architecture,
then the toolchain, and only then things like debug and pic/pie.
Therefore, move the "Toolchain" menu before the "Build options" menu
instead of after.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 28406b08de..3c57c591a8 100644
--- a/Config.in
+++ b/Config.in
@@ -87,6 +87,8 @@ config BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
 
 source "arch/Config.in"
 
+source "toolchain/Config.in"
+
 menu "Build options"
 
 menu "Commands"
@@ -934,8 +936,6 @@ comment "Fortify Source needs a glibc toolchain and optimization"
 	depends on (!BR2_TOOLCHAIN_USES_GLIBC || BR2_OPTIMIZE_0)
 endmenu
 
-source "toolchain/Config.in"
-
 source "system/Config.in"
 
 source "linux/Config.in"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
