Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14ABEECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 07:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CE53826C1;
	Mon, 29 Aug 2022 07:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CE53826C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7MZ4hSXv6p7; Mon, 29 Aug 2022 07:32:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDE5581C0A;
	Mon, 29 Aug 2022 07:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDE5581C0A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B27261BF2FB
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 07:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 986AC81C0A
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 07:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 986AC81C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SrXRmxJ3udTK for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 07:32:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2DEE81A73
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 07:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2DEE81A73
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3A70087F15; Mon, 29 Aug 2022 07:17:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 09:30:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0be1c3e921036ff870b6d60c0d55ceac81367c3c
X-Git-Newrev: ed22879d309699156dff4126c51f25818cdf0621
X-Patchwork-Hint: ignore
Message-Id: <20220829071754.3A70087F15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/collectd: disable
 libupsclient"
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed22879d309699156dff4126c51f25818cdf0621
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 0be1c3e921036ff870b6d60c0d55ceac81367c3c.

The actual issue is more complex. The problem purportedly fixed was not
caused by a missing libupsclient (it was present), but by a missing type
definition for time_t (on a musl toolchain).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/collectd/collectd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index e0f40095aa..5751757040 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -45,7 +45,6 @@ COLLECTD_CONF_OPTS += \
 	--with-nan-emulation \
 	--with-fp-layout=$(COLLECTD_FP_LAYOUT) \
 	--with-perl-bindings=no \
-	--without-libupsclient \
 	--disable-werror \
 	$(foreach p, $(COLLECTD_PLUGINS_DISABLE), --disable-$(p)) \
 	$(if $(BR2_PACKAGE_COLLECTD_AGGREGATION),--enable-aggregation,--disable-aggregation) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
