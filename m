Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73F5C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 21:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EB7560881;
	Tue, 23 Jul 2024 21:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Hw11IWNQ52u; Tue, 23 Jul 2024 21:05:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EF9A6085B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EF9A6085B;
	Tue, 23 Jul 2024 21:05:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 219471BF2F9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EDF74038B
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8J7SCuKfSU5X for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 21:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1BC74035C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1BC74035C
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 21:05:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA25C873E4; Tue, 23 Jul 2024 21:05:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 23:05:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a73ef093f7b40297d69c6813c44fd4626883632e
X-Git-Newrev: 28be64c1e0ad0ba014257cda116c2f07236d0d4b
X-Patchwork-Hint: ignore
Message-Id: <20240723210543.EA25C873E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/speex: ARM5E needs ARM mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=28be64c1e0ad0ba014257cda116c2f07236d0d4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a dependency on ARM mode for ARM5E to fix the following build
failure on Cortex-M3 which only supports Thumb2 mode:

/tmp/ccJHSu7y.s:158: Error: selected processor does not support `smulbb r1,r6,lr' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/1575da3a8ea2bcde7fa9885df317a12d5c36918f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/speex/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/speex/Config.in b/package/speex/Config.in
index c4e3df5dcd..134e6e4b35 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_SPEEX_ARM4
 config BR2_PACKAGE_SPEEX_ARM5E
 	bool
 	default y
-	depends on BR2_arm && !BR2_PACKAGE_SPEEX_ARM4
+	depends on BR2_arm && BR2_ARM_CPU_HAS_ARM && \
+		!BR2_PACKAGE_SPEEX_ARM4
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
