Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC8EC19F29
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24D1260BB8;
	Wed, 27 Jul 2022 10:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24D1260BB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TPezCaYW5ZyN; Wed, 27 Jul 2022 10:59:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41F7C60BAD;
	Wed, 27 Jul 2022 10:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41F7C60BAD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 396861BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 105B981B53
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 105B981B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLx8I3sqW5D1 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:58:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5849081B35
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5849081B35
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:58:13 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id n185so10282160wmn.4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 03:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/U/fXpWdSBuD9cbR5Uo7NTq2XJV8aTh9XpcNncuHamU=;
 b=AzyHVVpmLFNh57n87yf8nscqPnxJP3GNGpTvLe2f0JVMrsvnHKDxALGf21uv9vQo7n
 wGMUwwhjtYwewSXfndkpjBk1kUSSyO21jOsqlhMitgUXnkqr4QKbCgoDT2/aOjoNWXu2
 XiNAQ0l44Mlr468EIFpJRT9TJtS9336OkRetnkbnLhYFfaiV7qStTEvrfE5bzR8nwuUb
 p+FzIPap+b736FrsveDOAA2siFCQp6KhwAwuvN8FqXyCnTVdvrTveTExJC4cyFJM12tI
 bTfGtJxtZT4u/gClY0MGga/jOMEYOzFm0skYFenjGEdBH0ratORYMcghTLMDdq3BqTgc
 zutA==
X-Gm-Message-State: AJIora+AoS0eNnms+I217ru0jGfDTvD/p/cvdHMkG8LrWhSRVpWFdFNi
 nrXHHvYFrifx8rm5FweMMPHaXH4X72M=
X-Google-Smtp-Source: AGRyM1u8XhqZwqbxDog4SS9hSZrBwgtvFtwSsh2vX2dA//RL7eZPbPtt0/JZf/LbGLoIB7axO2+YdA==
X-Received: by 2002:a05:600c:3845:b0:3a3:227d:c1c6 with SMTP id
 s5-20020a05600c384500b003a3227dc1c6mr2678881wmr.9.1658919491513; 
 Wed, 27 Jul 2022 03:58:11 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a5d65cd000000b0021e47386eb8sm17005038wrw.2.2022.07.27.03.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 03:58:11 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:58:08 +0200
Message-Id: <17142b21883aee6c2402099128c36500baf8498e.1658919469.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658919469.git.yann.morin.1998@free.fr>
References: <cover.1658919469.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/U/fXpWdSBuD9cbR5Uo7NTq2XJV8aTh9XpcNncuHamU=;
 b=mibYqmXpe2KRhxA1InkT4SgyCTDlJkt8uQbrSJYpC3S4moXfpmpH6Fa+INVBa+k137
 aAaRMKxRxg0aId2Q1Ez96Dz52coZ4LO44WmALfjq/E2uO5n4WEP5xLQHI0R9MHAFBcgA
 Zx+DsVFusaYjDwAKONq7svPH7uHocCCqASMrJErWcv7tRUMj/TrlI/JZ0+oOhhrxjF9k
 jXA3/nbac8wcozN9snfprrj6ILnD8L2vTcrc7TsypvD/H2gv4bg2f1crH9WXWduD33qm
 PgO4uOQmd0X4VuBduKFo8wRSAq1Ui+QyhDogtaL8VICo+t9+JarX5n3lrRWM7RoywR0j
 HoXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mibYqmXp
Subject: [Buildroot] [PATCH 5/5] package: drop csky conditionals
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-greenlet/Config.in | 1 -
 package/sedutil/Config.in         | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
index c73eeb7b15..9f66ebe119 100644
--- a/package/python-greenlet/Config.in
+++ b/package/python-greenlet/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_aarch64
-	default y if BR2_csky
 	default y if BR2_m68k
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
diff --git a/package/sedutil/Config.in b/package/sedutil/Config.in
index f3452b60fb..e695f2bed7 100644
--- a/package/sedutil/Config.in
+++ b/package/sedutil/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS
 	bool
 	# no big endian support
-	default y if BR2_arcle || BR2_arm || BR2_aarch64 || BR2_csky \
+	default y if BR2_arcle || BR2_arm || BR2_aarch64 \
 	       || BR2_i386 || BR2_microblazeel || BR2_mipsel \
 	       || BR2_mips64el || BR2_nios2 || BR2_powerpc64le \
 	       || BR2_sh4 || BR2_sh4a || BR2_x86_64 \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
