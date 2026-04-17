Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDD2F43683
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AE1060C20;
	Fri, 17 Apr 2026 08:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Et2RfOR0NLpU; Fri, 17 Apr 2026 08:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 448CF6072B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416394;
	bh=PVVItC/1IosiwAg67IYr6o0WL14wesQ0GAoIEbbtskA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DILzGrCkLGxb5H3bscmoDV6lKHjsTAuy3bVgxdr4FGPntXc9LWD3/TnnL2EK4LfLd
	 p16RUxC3DbjzFN9bf37Y4Xvb59iS3LB9QzT2jYsYqetBNG/DKahICIWYn8ISEbnjvW
	 8m70DvkmEBCV/y+Ze+S2nEaQJWLHk8MWfFpt5bOKwbi706QKiTIbbze40NNHDEhwEV
	 F0My+4CCfogp1IzkIqJ0W93vzQqbSBUMX/mKjrodQXATwGv+ZlDOt11mImF0MLP63x
	 S0c+0RwN2PG1EswT9FirxbzYIkU06H4n/5E8KF8Z8l39Ne220JoFuNatmPYX02C+Fh
	 X0Q02A86k2ZTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 448CF6072B;
	Fri, 17 Apr 2026 08:59:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E2AA4E0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FD0A40578
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-ztLPnD3w_W for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8177240015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8177240015
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8177240015
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:47 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488c21c636dso2625835e9.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416385; x=1777021185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W6z0ih4GU64MIU6v+3DruzcU1VwxIj0aJrryOphXsTs=;
 b=A+rb0XgmaWZe3sRkLuq8hB5TRCrSE+cY6ExoaA00Df5DkV1BKEgc1YnlYpbNaxlJXD
 /NVsAnxPIx+hhppdUOwwk5kUloGpKEHwddOpSpvMsitIE63ez5ywkVMaPLQu3iMLVFmt
 Dvkqf+laTBvi18WQxSaQJGO3hxOZu3IQNFKLNS/8kc0vzNkR5yw93T64sGGszm0nPWur
 B0+4NaIHPPelo5pWZfg0ze3Ym8XOPvhxLFiALtvVosQ513UXkr4283G4b0/GDQ8ZIbBE
 /URWDzzp94NHZlJpMSYamAjckp5pRNMgy9m1PmWUVTM1ReMniL9ghpJhiJmhHsd/T+77
 DQYA==
X-Gm-Message-State: AOJu0YylVQbUOGd87Tfl2UnePZ8IwMtXNrhB5tJbVR70iLRrcBZGryrm
 thX5nsl0qXqJyD49vqkWcvFjQLQjRKNET7zkiNuN7txbF1jmVsqL3XOlwKbLYMVQA4gYtids37l
 UTT6k8WY=
X-Gm-Gg: AeBDiesKaE6rltbE4/Q25CF+/3wzP5D6rSTuqci+HQZVUMlrVIq1UwAk9M+ZGPEv6LL
 aKW0tUuHz/Vnl52llQhyoH70JdykwQfvilJN+P0K5mCZKevEb6NYQWNEysoInWQDCf3bnVzrOp2
 QBwIirW45VlvQLDBIzl0BOgqUHVT3PNYsKK4TjVeG9eymHKfQ0CUmxOodckWpdRxJ7kVyATuQO6
 YBIRwqGdOiP4q4HO9WBjFZTeI9fGOM3GkKT6BTKqb+aYTVUHdx2IAwUO+O1Ac0IznyybyKC0Thn
 +zEGRdaS+qWmbVFJUdsOWS4pgwnGJc/5YakptWp1D0EfmAnk7wXy18sqT6sY90SUZ9tT4u/1NBR
 cmkEGOcOMLAbmK5QEbi64q9NdRQ4pzJbfuhWOA2fvP39vaF/SFPD6w5075Ix/f4K/s5h4tDuOuS
 8MowJHUxPIC97IE5eF4TDc275SCHwVd84Hbjhn3tpYOhe8ne2uoVt/gtzDP1QpqVE2U3ck6GUXM
 Xj8IALJIOhuc3Aq+gwd9dODjuJfAAg=
X-Received: by 2002:a05:600c:a102:b0:488:ba19:da25 with SMTP id
 5b1f17b1804b1-488fb759f0fmr20899275e9.12.1776416385320; 
 Fri, 17 Apr 2026 01:59:45 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:45 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:22 +0200
Message-ID: <20260417085936.200528-8-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416385; x=1777021185; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6z0ih4GU64MIU6v+3DruzcU1VwxIj0aJrryOphXsTs=;
 b=WNcI/tUVsEAPawGoUGdDSV8zA1eakn/6I/7so0fZxN203y9l827E5GZwit1b5/JVfX
 WgsgAmPR9Kyq6Ynp8ssUwVwKwgeG0MEev2Q4mCnWUqDK5ipb1dkjbef1+67bbDR3XJ9h
 dOrvD31lAYfaxmBQFqXQCGrrW7MrVhZDSb0Uc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=WNcI/tUV
Subject: [Buildroot] [PATCH v1 07/21] support/testing : test_glxinfo : Bump
 kernel version to last LTS (6.18)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/package/test_glxinfo.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
index f96ee0aaeb..8680477b15 100644
--- a/support/testing/tests/package/test_glxinfo.py
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -14,7 +14,7 @@ class TestGlxinfo(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
         BR2_PACKAGE_MESA3D_DEMOS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
