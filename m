Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CB2C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0356D6100E;
	Tue,  7 Feb 2023 17:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0356D6100E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jg10vhjOXpGT; Tue,  7 Feb 2023 17:11:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 398A560BB1;
	Tue,  7 Feb 2023 17:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 398A560BB1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21D5F1BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55B7240A6D
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55B7240A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gbhw0-PjASWq for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:10:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CFD240120
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CFD240120
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29B82842D3; Tue,  7 Feb 2023 17:10:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 18:10:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09ac5a9e18e96ba6d3cd13e5e8d34aeccfcb603d
X-Git-Newrev: cf92dcfaa92f6564830d10d4e18ae00fd8102ab2
X-Patchwork-Hint: ignore
Message-Id: <20230207171058.29B82842D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: don't let uClibc build
 system strip uClibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf92dcfaa92f6564830d10d4e18ae00fd8102ab2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let Buildroot handle this, so we can have an unstripped uClibc if
needed.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
[Thomas: extracted from
https://patchwork.ozlabs.org/project/buildroot/patch/20220803200629.3172370-1-Ben.Wolsieffer@hefring.com/
and split into its own independent patch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/uclibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 125aa4cdcf..d2baffc95e 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -397,6 +397,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(call KCONFIG_SET_OPT,RUNTIME_PREFIX,"/")
 	$(call KCONFIG_SET_OPT,DEVEL_PREFIX,"/usr")
 	$(call KCONFIG_SET_OPT,SHARED_LIB_LOADER_PREFIX,"/lib")
+	$(call KCONFIG_DISABLE_OPT,DOSTRIP)
 	$(UCLIBC_MMU_CONFIG)
 	$(UCLIBC_BINFMT_CONFIG)
 	$(UCLIBC_AARCH64_PAGE_SIZE_CONFIG)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
