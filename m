Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D2DC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09A014F417;
	Tue, 21 Feb 2023 00:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09A014F417
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8sG_Aeluz_eX; Tue, 21 Feb 2023 00:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D618B4F418;
	Tue, 21 Feb 2023 00:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D618B4F418
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8799A1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63317417E8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63317417E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1bHZ2sxazon for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75392417DD
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75392417DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 662B186496; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 18:10:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 17481bd0bf6abff260ccc579974b813050f91d4e
X-Git-Newrev: f9867a725c12975af52dda9dffbdc33c3b0312db
X-Patchwork-Hint: ignore
Message-Id: <20230220205253.662B186496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/uclibc: enable DODEBUG
 when BR2_ENABLE_RUNTIME_DEBUG
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9867a725c12975af52dda9dffbdc33c3b0312db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The DODEBUG=y option of uClibc causes uClibc to be built with -O0 and
-DDEBUG, which has a significant runtime performance
impact. Currently, DODEBUG=y is passed when BR2_ENABLE_DEBUG=y, but
BR2_ENABLE_DEBUG is only about enabling debugging symbols, not about
runtime debugging additions. The more recently added
BR2_ENABLE_RUNTIME_DEBUG option is precisely designed for that, so we
changed the logic to pass DODEBUG=y when BR2_ENABLE_RUNTIME_DEBUG=y,
and not BR2_ENABLE_DEBUG=y.

This allows to build uClibc with debugging symbols when
BR2_ENABLE_DEBUG=y, without disabling optimizations and adding more
debugging features that have a runtime performance impact.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
[Thomas: extracted from
https://patchwork.ozlabs.org/project/buildroot/patch/20220803200629.3172370-1-Ben.Wolsieffer@hefring.com/
and split into its own independent patch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/uclibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 342d841087..4c05d36ab3 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -217,7 +217,7 @@ endif
 #
 # Debug
 #
-ifeq ($(BR2_ENABLE_DEBUG),y)
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
 define UCLIBC_DEBUG_CONFIG
 	$(call KCONFIG_ENABLE_OPT,DODEBUG)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
