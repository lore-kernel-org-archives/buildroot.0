Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5345C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 06:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 351E880FA2;
	Mon,  5 Aug 2024 06:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqOZLBciA6mq; Mon,  5 Aug 2024 06:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D6CA80F92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D6CA80F92;
	Mon,  5 Aug 2024 06:11:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 853671BF3B5
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 06:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7174B80F92
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 06:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1Q7XjgZUE49 for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 06:11:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD5CE80F91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD5CE80F91
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD5CE80F91
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 06:11:43 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 57E6E3535FBF; Mon,  5 Aug 2024 08:11:40 +0200 (CEST)
Date: Mon, 5 Aug 2024 08:11:40 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrBtHPY63Wyfy++l@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722838300; bh=HpmQDgh93OQyjmdAJCyHcTcVr/hdWQszD8+7vJ2DYrY=;
 h=Date:From:To:Subject:From;
 b=j6m8CFSjewxN3NNQ7X4QzOpo5CbuRpAqlNWdZKGRv7otlM0/vMf1lq4EvJt5+7w5W
 BDWL33ZWD+Y5oJULZrECYkcVi3kS8+KW0c4j5G91DuOQg9iboSGnhpw4/B2OktStAO
 Mmk9Nk3EIOUeaFw5StOwTcTPsL+EqDwtVa1co+c6hY6/xyRdzgKsHMwqKGB28QZCuv
 xVauRvkkZYfMjRddfq92MuLA62aqaoQmAHUnz4DGwYWzR7zUQTXWWfvnizVUTKxWxm
 bOP7iJ1Fz3MYsbV/WR+BWDNsim2ZPLBcMy3TQ529UlGekcVGYHHvEMYbumV0HS5PE/
 qloS6tks+ynqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=j6m8CFSj
Subject: [Buildroot] [PATCH] package/fluent-bit: fix issue with uClibc-ng
 toolchains
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When SSP in the toolchain is disabled, the compilation will
fail. So handle the situation for SSP enabled and disabled
toolchains.

Fixes:
 - http://autobuild.buildroot.net/results/c9e/c9ed27a51a68429b2ed2d8eebb1afc919ecbead1/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/fluent-bit/fluent-bit.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 5463682e45..a744a61c9b 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -20,6 +20,14 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_PREFER_SYSTEM_LIBS=Yes \
 	-DFLB_BACKTRACE=No
 
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
+FLUENT_BIT_CONF_OPTS += -DFLB_SECURITY=Yes
+else
+FLUENT_BIT_CONF_OPTS += -DFLB_SECURITY=No
+endif
+endif
+
 ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
 FLUENT_BIT_WAMR_ARCH = $(call qstrip,$(BR2_PACKAGE_FLUENT_BIT_WASM_ARCH))
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
