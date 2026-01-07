Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54773D0D16C
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 19:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B5140AB9;
	Wed,  7 Jan 2026 19:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J58u0IsOl07x; Wed,  7 Jan 2026 19:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1989440ABE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767815046;
	bh=TdnQ/zLt+KIbzxP5qxN+pJ1C7PHMk3JqAkyWrTQwlmg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=UaIwrBzgA9pBqrGDmLG+yw154gD9pIzajnLjeUsMX0sEvibatSCIxsnc4V1JLf0Mp
	 SVUjwi12dDwIk7jaAB61L4yXpAwhqQqNd8UtOAyIRdAojjc/4293gaz4NT4ojp0PXT
	 EmbAKmGN686knq9itF+5QyAO6mj9Bd1vW/nbhlUTD2/yH7DOqdDEsHrt8/cUdjGmh4
	 1N4mYGj3SsNuVgCcRsxcm2s8rT+EVp8CD1FLPn4use7t8NkMuFqmKuiHgyAMK2XZOb
	 ny86PRrbGkvnzZoazxSCrpsWrtSKIrEJEjoQUmIZGXTQe6h4jMHGFt6oWYDD0/eu+D
	 tjbhiw3ZZ4tcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1989440ABE;
	Wed,  7 Jan 2026 19:44:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96D569ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 19:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DA10822FF
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 19:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87rvs3MIkYuI for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 19:44:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BFAA810F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BFAA810F0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BFAA810F0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 19:44:03 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b83122f9d78so406042666b.0
 for <buildroot@buildroot.org>; Wed, 07 Jan 2026 11:44:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767815041; x=1768419841;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ybPWzd6EhIXsvb+ADt/CtepIJe2zND6ldymn0mOxj7s=;
 b=fDqEybrskx6bgfxXx7j+rggdfggI1mAoIeEfaddsXpiyysWrueKzAvLy6XKz1JrirS
 o3MbXJg8j7Yhmp5Qbz+7Jg7hgLIZyDvdMFW4Yrs+0eCs1Zw8UzBBt/b2z8uGv1/whX8g
 QSsBXc3UtSzKgMIf56hwsOyLlL9S/Smbvlb3BnG0EGV7Xlnab8MzwlSC8KDxSsmdr2lu
 pN91J2eqihWhSXxYRHXWhyrdr6ER2Zkq0oe1TySckKXnGfpr75gtPINXZ9zH9xrUALhL
 HbirjBVDWOruPv/+eGPSkmayfIjEXmok9XIZG8LXGDS5IxFUMermoBhCX9ryhZtnhWF/
 YIig==
X-Gm-Message-State: AOJu0Yx02v/oeFCOKnhdm4JMJZGm3fqGuipjJVaUiOP9S6n2KxnMg9wD
 9QOSABPratxMMh0aIm02dI60r1HLYjAH2YNduMVl1GpiK2u5ouxLk0xiEWwq88zoKZ74a98VVRY
 eWgZ3
X-Gm-Gg: AY/fxX54TWc0EuBmu+fGGCZfM955OtnE8TsCRr2WfqrNVvShGwF+iD93oviunv1QVrI
 dlKpOslrxvUO4ZKDUO5AWz9GGkSUXzMLO6wJuEMeukisfLmt+B9TL898fsPO9xxkgKPA1kM9sWo
 AGB259DCIyio6qJ+2VaG8+RikcQk5o294tbLdK9Bk0Y7Lj4e54AJGX9QK3DPKOA/o4zlVorjKh4
 Sny3MjzJsF/8lzEpenJ7PRSOQD3DfNGMmoyfJ1meaw9dbU3fAdFZ1ufBiS+qNaS8i010odK6MlF
 rdvUQEz6gZukHAoqKp7kGEoHS4WutrdBgZ/bgYsYtIuKLDceShTYAZ1w+cAzfeGzFRrJynvaM0j
 +/94X/Qo2y4mSzZicaNLjO80Ui98laqGkU0tPiE3uHDX0K30Zk82WlR4j/aVTpG0SsV4J6dWO5W
 JsuAu2go0WlUGr6l6Zgu37dAnW+jxb5mZoEsR7qSsX7qSzW0jVGvvfRvB7G08Z8o2gDdXujIJqv
 6mWcpNnwa4J9QOJ8Y7/bcYqaQwAs/QnKPQ=
X-Google-Smtp-Source: AGHT+IE1I9ifvG5ca8V9rUs6xtqPY15napFkfNKh/vguJzq5Ik1hRNRLZtnl1KF1apLKY9KpduRhvQ==
X-Received: by 2002:a17:906:c10f:b0:b71:854:4e49 with SMTP id
 a640c23a62f3a-b84453f225amr394855266b.56.1767815041396; 
 Wed, 07 Jan 2026 11:44:01 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.122])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a5187afsm587797866b.58.2026.01.07.11.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 11:44:01 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  7 Jan 2026 20:43:57 +0100
Message-ID: <20260107194357.1843652-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767815041; x=1768419841;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ybPWzd6EhIXsvb+ADt/CtepIJe2zND6ldymn0mOxj7s=;
 b=D23iM9AqVbqRTV9LMmHjHelctGwW5P/rcdCphX6aYX66o5yP4BxVX07VIL2eawZA/7
 Nm6Q23ML/7EEPbpD72JGQvc9bw8qMLlKRaBXJZqVlAGXFu1rKSlfl05mvyi2iN6LtuAd
 vlbwwktO6Fm8YOcaTJ1IlnkwSUGu1fBkOHxb4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=D23iM9Aq
Subject: [Buildroot] [PATCH 1/1] configs/beaglebone: bump U-Boot to 2026.01
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps U-Boot to version 2026.01.

Tested on beaglebone black.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
 configs/beaglebone_defconfig                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
index 98a5c53aaf97..b6a925ea4e89 100644
--- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index be11186f8c15..e5d063a57f41 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -27,7 +27,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
