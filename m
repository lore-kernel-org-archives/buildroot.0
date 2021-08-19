Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A913FC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:59:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63BAD610A0
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63BAD610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39CC942514;
	Thu, 19 Aug 2021 20:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vmudclreRSnT; Thu, 19 Aug 2021 20:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEACD42527;
	Thu, 19 Aug 2021 20:59:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4D0E1BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1E81404E5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xmTxyb_YzXTL for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:59:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21C1B40176
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:59:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CF2D08D5E6; Thu, 19 Aug 2021 20:58:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:58:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b61c93645da26a2b6a674881e61c5d72297fc74a
X-Git-Newrev: 63943ecf455fabba2b91f5c2a901f220d3975cb4
X-Patchwork-Hint: ignore
Message-Id: <20210819205817.CF2D08D5E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lmbench: fix build failure due to
 gcc bug 101915
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
