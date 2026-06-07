Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E59CD8C90
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 21:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91432428E2;
	Sun,  7 Jun 2026 21:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jDdU6G0f0rx; Sun,  7 Jun 2026 21:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CCAF428A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780867840;
	bh=s/Q+0LSQNc+N7c5EbBrUFuMDpVVw3ZhQ0Q/wcyRLCtY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=keh1P/ryjM4VgSmYD66kUDhIXRyr+IqVVwum9MGG4BUxzHzqy3VHq55Ci+hGzX0T8
	 CtFV4BcqOTsLJdSu9q27hFaB/eNaNoYc0/CbA4oqlokpDOCqBz358LJABsGx9G5fK5
	 bxW4KXPgWY4z3HtNqg6ZxNEki6YnHFqqE71HCebwpbaeeElrV8ohJQ0SJWh7aBKDeV
	 L/rEyETq0yjOIG3vW40ss1W36YtLCifHdzcQ3CdPNScLvlogEi+hJIbDAUaV1jcclN
	 QtJMP6do7p1+OMP+obj6HYduN+xp8jEMP7LDxXdEakVb2wqKEH/VWztgrvcmfumeCT
	 jmJjSwmUwEISQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CCAF428A4;
	Sun,  7 Jun 2026 21:30:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7A032C1
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 21:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D12F8499B
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 21:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57RTviQc98zy for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 21:30:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C81584992
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C81584992
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C81584992
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 21:30:37 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-45fd45e596cso1689999f8f.1
 for <buildroot@buildroot.org>; Sun, 07 Jun 2026 14:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780867835; x=1781472635;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ht5Q7Ms3uf6+TjxByuy+AiWbLEBWFpHm2xC28OMMoBk=;
 b=D6ycVpeyRuVcqUq5vCEmvuaKkpDKdJTFDZqrl26WccDIAHqiOoMUUIHpedf0bRVmkX
 BrB2SXl7+zDozr/nxUKkm3/MeZoMvZAT0yRn2fwY2mI8rqZ2A87t+J5KyBpjFz/G3/Uy
 Itn3+QmhML2AwVCIh36PocY97mk/LPw7YdnvsntA62z3UO9+jXTjkVpqrNHa8olD0heI
 5aQoeAWUljbYyu6vx3OVzZbK2nzvN5jyLAG0lgUVnScIRS5FPtWS5tZm1FoEPuAuSaLq
 MamLfi31fvEzwXEqQ1AHBJmUyjYfJ4cU3RXdc7ldsp2XNWG6Ru/MqIRaTo65FpCPdKPl
 xX9g==
X-Gm-Message-State: AOJu0Yx/lJdJmmgBpsNPG7OHt/yUTy0+Zl2i/9DZpkA+dCld2+bTVupi
 RDuG5+KkC3n2ZVQD0PCO18SHlFNM3LqrSRH8bS6VSYjzK6YczI+LCJBbTzOUsKZyAOlL0dHcjXm
 vnje9
X-Gm-Gg: Acq92OGrKspPe7MbofXj8xSoaWiTqnO2kogS7nNUlRf//nRgpmhIKwJysulYUDjEqW9
 D/pP08Yv8sn9k35bj67YxWP7LpMJ1SvQKCRv44EEGSkmk9oun17fX8M113ZSYHfsGrPl9cFV7A9
 eGNgByAbhHsXn1AkXtuXM4BV8H5uYD1fc/aDeHzVRAVgrJ7zj8hXB4WFu8hifQnwfSPP/RkrMs9
 kzaNI0J10Ti8Vi118Eev4Tu6DKRKIvynXOQIvmrt+y/P3Nl9MCcqV0HkjPlvUQ5tIxIH61PEawt
 pMtFW2PfCGXAyXOmrrdiSxt7IJUlQbzMDchYvMxlwVzJW8xv5xZEWlaI5ra+1fVwrTr4U+jO+a5
 Of3v5LrI1iNL+jP8fqmeJA50xFKKZ2GMqzb/wHm557ZMNOf4RpVAzA2/8eY2aTdZkKayREp4jQZ
 0yiVpPltLxHwbs90hQC4KTvFXGuBLgCYz+26Sm6v1XdBzo7lvMsNJyBcTOhhCPAzZUxvcY0rrgb
 yUbjpqhybyFQsE5P6fqmdE8M8JihtV7x0GP
X-Received: by 2002:a5d:54cc:0:b0:45e:ea9b:edfb with SMTP id
 ffacd0b85a97d-46030766c2amr15206066f8f.39.1780867835082; 
 Sun, 07 Jun 2026 14:30:35 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344762sm50290131f8f.23.2026.06.07.14.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 14:30:34 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  7 Jun 2026 23:30:29 +0200
Message-ID: <20260607213030.1509913-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780867835; x=1781472635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ht5Q7Ms3uf6+TjxByuy+AiWbLEBWFpHm2xC28OMMoBk=;
 b=kJ7xyS81lZsY7rYHV5/YwBZyVtIP4aurDj3DakyUgMqVJFMiQqV2yUxavZ9IjO/JqY
 e2F1xaRGMVce6XWpS6MPviLDdJTdHyRUhPOMTgnma1bjWNjDDPcSMiSHXo3HUwgaGY8a
 1iTha4EMw6dcWNZP2pzVNOSoY13BZPYBCLHk0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=kJ7xyS81
Subject: [Buildroot] [PATCH 1/2] configs/sipeed_licheepi_4a_defconfig: glibc
 needs gcc >= 15
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The sipeed_licheepi_4a defconfig doesn't build since the glibc version
bump to 2.43 [1]. Glibc increased the minimal gcc version for riscv
w/ ISA RVV in commit [2].

Select gcc 15 in this defconfig to be able to build a glibc based
toolchain.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914049 (sipeed_licheepi_4a_defconfig)

[1] 227378b5930b681c79a13476ae60a98753a98a03
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=47975914fb106b83c42bc0baf6435a0944a23d30

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/sipeed_licheepi_4a_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/sipeed_licheepi_4a_defconfig b/configs/sipeed_licheepi_4a_defconfig
index c7867ed05d..602cd50e0b 100644
--- a/configs/sipeed_licheepi_4a_defconfig
+++ b/configs/sipeed_licheepi_4a_defconfig
@@ -2,6 +2,7 @@ BR2_riscv=y
 BR2_RISCV_ISA_RVC=y
 BR2_RISCV_ISA_RVV=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GCC_VERSION_15_X=y
 BR2_GLOBAL_PATCH_DIR="board/sipeed/licheepi_4a/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="licheepi4a"
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
