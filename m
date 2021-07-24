Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B01C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:45:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA3FF60E90
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA3FF60E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9253F40227;
	Sat, 24 Jul 2021 21:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VWtIjG1rdb5i; Sat, 24 Jul 2021 21:45:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00633400EA;
	Sat, 24 Jul 2021 21:45:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A8DB1BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77031400EA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZorU6CS_XG3 for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:45:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 872F9400BE
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:45:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id e19so9214890ejs.9
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 14:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N7RpTJjr3gaisKxavMR5UnohEj5K4ilX1DxRBXSna4U=;
 b=Q7M+AkHoJSelHFNSNNPgj9uLaHR/aXzrOq8GB/OuASw8p8NMwdwevwd4I5TbTjKcJf
 I1UdyEHN4KPaIKMy2rAgq9sQs+SYfXTS+0w5qdSy5JqpkvACMYb1i7G2dfOTTmxZB8PF
 3bppG7GjTmhRQ1Tjcp+eCOm3ZxhwgAvZ1AkRbWWbu4Jkl17iZKS0vrCHWs9t3/yG+vjD
 D+v13ZoDvEL7SUqiUZAa5DrHs3LYszYmVOMGqbexJ9os9mdYdaFBX63rkrSQs9RL12NN
 njCUs8TfjevuFCl3xq4CRk/KfFyWMfOULPDDhxGR8lWNt9Po7MeJJQ69pFww1SmniClz
 eCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N7RpTJjr3gaisKxavMR5UnohEj5K4ilX1DxRBXSna4U=;
 b=rCohIos6/TWUJLL6kRuPcr8igFrFFd4s62Hnko6ChTcybkKAE9fVePhDZPLjwDrNSU
 LwniqSiCQb6AzPUKz5DlbY1HaV4h1guAviOQtxx9Dd6Azt2fngpwqaFZbtBddXVPOuEq
 JWtNemXfAHGRxFVj1oFsN088+LZ0kSRs28RvgrbxxcFuFhTqqm1Ckw8Mn9JdFPYQmD8O
 QU3OjUreZpvRP7W/NCA/VRKm1zS6cI9f7OdV8of566b/ny2Zob0/pNG3y1I7yVWPoYYf
 igk5HI0PUAl5Y1ZkLuNeB/MGlRtFgoY1SQVyD2PyGXr4R+cmg2+/ESXCy36SRatStn5a
 I1uA==
X-Gm-Message-State: AOAM5328T3HE9cxLldVErPeUVZ3sicN3tHgRnQaDqkj4XPuBVPqp3+As
 TtZhR08LEdFChqK6PVD3XduWUZeYjwqzvtYi
X-Google-Smtp-Source: ABdhPJy+38kzqswbqTBTc+uZuo4HK0QUNDIsBG1LCo+Fy9CZeMgZjI7iby7HINqN+VSJ69zRXD3ksg==
X-Received: by 2002:a17:906:a202:: with SMTP id
 r2mr10246839ejy.398.1627163134537; 
 Sat, 24 Jul 2021 14:45:34 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n26sm12325235eds.63.2021.07.24.14.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 14:45:34 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 23:45:24 +0200
Message-Id: <20210724214526.47637-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/3] package/clapack: introduce
 BR2_PACKAGE_CLAPACK_ARCH_SUPPORTS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This makes it easier for packages that depend on clapack to get
their dependencies correct.

Since the glibc dependency only exists for PowerPC, treat it as
an architecture dependency.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/clapack/Config.in | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/clapack/Config.in b/package/clapack/Config.in
index a912eb6c91..98f94b0e60 100644
--- a/package/clapack/Config.in
+++ b/package/clapack/Config.in
@@ -1,14 +1,19 @@
+config BR2_PACKAGE_CLAPACK_ARCH_SUPPORTS
+	bool
+	default y
+	# assembler: Error: value out of range
+	depends on !BR2_m68k_cf
+	# _fpu_control is used on PowerPC, but not available with
+	# uClibc or musl
+	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
+
 comment "clapack needs a glibc toolchain"
 	depends on BR2_powerpc
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_CLAPACK
 	bool "cblas/clapack"
-	# _fpu_control is used on PowerPC, but not available with
-	# uClibc or musl
-	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
-	# assembler: Error: value out of range
-	depends on !BR2_m68k_cf
+	depends on BR2_PACKAGE_CLAPACK_ARCH_SUPPORTS
 	help
 	  BLAS and LAPACK C implementation (f2c'ed version of).
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
