Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAF1C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:32:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C982960FE6
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C982960FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4703830C1;
	Thu, 26 Aug 2021 22:32:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6MuInl5yZ7F; Thu, 26 Aug 2021 22:32:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48FCF82F6C;
	Thu, 26 Aug 2021 22:32:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 246191BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31316407B0
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wdQ7GCmBiZu5 for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2640407C5
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3E19E8DC52; Thu, 26 Aug 2021 22:01:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:58:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b61c93645da26a2b6a674881e61c5d72297fc74a
X-Git-Newrev: 63943ecf455fabba2b91f5c2a901f220d3975cb4
X-Patchwork-Hint: ignore
Message-Id: <20210826220132.3E19E8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lmbench: fix build
 failure due to gcc bug 101915
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=63943ecf455fabba2b91f5c2a901f220d3975cb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The lmbench package exhibits gcc bug 101915 when built for the
Microblaze architecture with optimization enabled, which causes a build
failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101915=y.

Fixes:
http://autobuild.buildroot.net/results/ae1/ae1e4d61ed367c6cb64442c60d98882cc7985346/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lmbench/lmbench.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 2f3b19b5f8..b0f99ff106 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -18,6 +18,10 @@ LMBENCH_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
 LMBENCH_LDLIBS = `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101915),y)
+LMBENCH_CFLAGS += -O0
+endif
+
 LMBENCH_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 define LMBENCH_CONFIGURE_CMDS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
