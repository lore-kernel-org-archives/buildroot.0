Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E88C4345F
	for <buildroot@archiver.kernel.org>; Fri, 26 Apr 2024 18:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 249C3613E2;
	Fri, 26 Apr 2024 18:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbrMpbVXqQB4; Fri, 26 Apr 2024 18:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36B126142B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36B126142B;
	Fri, 26 Apr 2024 18:47:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC0021BF3D2
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 18:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5CA86142B
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 18:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVFdXjg2oxuL for <buildroot@lists.busybox.net>;
 Fri, 26 Apr 2024 18:47:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=aleksandr.o.makarov@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1CD9A613E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CD9A613E2
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CD9A613E2
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 18:47:41 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2a564ca6f67so2239075a91.2
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 11:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714157261; x=1714762061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pcMJlKqdRPNLj0LOXOZ11yH/q4xuGLqEn+KJpW/fqVI=;
 b=t3iy+P8J/Rvn21B0vryACrXN8O3t4cTdhO8l/LByE6xh0dH0XIhFg861+61/81AxPn
 vHvvUHx1yhBhL7TE6/bBf5s7fWm9GOOq7hKiGkPgM4SOCgdS4dTSn/a0apy2d7wxt2bS
 +sstSQEszRQW18n1yDVfWiMw3xVPcA1lELwdUm0GzIom9L190ox8YCDA9VyqgEgRZza3
 rwecb5W5Pitm2Yh0ELyeW2QvR4dJkL1+d+OCnvwfYoJxDNCnUOaT02vXlhSh7BboT8bm
 s/qppMQkt048xqcf0qOeDHP6/btAq3lAKrukBIiSRHsh59wujrrzPc2MIJBwSp0Ew/wR
 wI1A==
X-Gm-Message-State: AOJu0YxN3Pgc3pVY0q8Fqx6mRc9qEiZr4q2g0B7yL7EVS7op/d5174jq
 J8/528iFOrzFRREJ9hen3i02/U0yD4PGP7dOqMjb2Z2Cm8CtmYB7G8suNGx9
X-Google-Smtp-Source: AGHT+IFK4OYv3BnZTiUvN0D5670NEAWjKpckerYo+t2wAOuDCCaFlCg6wUHgaMAeVN+bplBi7CNKUg==
X-Received: by 2002:a17:90b:510:b0:2af:3a82:53ce with SMTP id
 r16-20020a17090b051000b002af3a8253cemr3913137pjz.9.1714157260741; 
 Fri, 26 Apr 2024 11:47:40 -0700 (PDT)
Received: from aleksandr-System-Product-Name.lan ([146.70.124.204])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090a114200b002a533330849sm16445494pje.16.2024.04.26.11.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 11:47:40 -0700 (PDT)
From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Apr 2024 21:47:32 +0300
Message-Id: <20240426184732.1390508-1-aleksandr.o.makarov@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714157261; x=1714762061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pcMJlKqdRPNLj0LOXOZ11yH/q4xuGLqEn+KJpW/fqVI=;
 b=aPDlCfBxGOY4UG+njktyMGFoRoXcEajvSbn6qmVRjdOWoyB8AiF7CAlEwoEZWK9ECP
 U80Q0c9q5DXMdX2ujdck1ruHkFVn6k23rFfyiTSArWe3GJOXImg77ApbG2dEeUgZu9NG
 N2m86HSAI0U49dIFao2Da0vIVsCAEVogUbN0Ba93AMs6EYyweqnpjG9FCZOwo+enksiP
 Crk16DcmTGAxuX+CJSOy41+Qxygk9wsFvWK9/iH1RK1kpXLDRzniafb+nZDef8zNMWHz
 GQ81WAiKqBuhUghGPFmsnXO6XKSJdtXVZOAzfZ5KeNPpOexv1gkUXg9BsndBg8DMvppD
 aexA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aPDlCfBx
Subject: [Buildroot] [PATCH 1/1] board/pine64/rockpro64/linux.fragment:
 integrate stmmac driver
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, the stmmac driver is configured as a module in the defconfig, which
means that the network functionality is not available until the driver module
is manually inserted.

Use extra config fragment to integrate it directly into the kernel, ensuring that network
functionality is available immediately upon boot.

Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
---
 board/pine64/rockpro64/linux.fragment | 3 +++
 configs/rockpro64_defconfig           | 1 +
 2 files changed, 4 insertions(+)
 create mode 100644 board/pine64/rockpro64/linux.fragment

diff --git a/board/pine64/rockpro64/linux.fragment b/board/pine64/rockpro64/linux.fragment
new file mode 100644
index 0000000000..ed7dfd3d3e
--- /dev/null
+++ b/board/pine64/rockpro64/linux.fragment
@@ -0,0 +1,3 @@
+CONFIG_STMMAC_ETH=y
+CONFIG_STMMAC_PLATFORM=y
+CONFIG_DWMAC_ROCKCHIP=y
diff --git a/configs/rockpro64_defconfig b/configs/rockpro64_defconfig
index 472b9aded2..0c6cdd477a 100644
--- a/configs/rockpro64_defconfig
+++ b/configs/rockpro64_defconfig
@@ -40,6 +40,7 @@ BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rockpro64"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pine64/rockpro64/linux.fragment"
 
 # Filesystem
 BR2_TARGET_GENERIC_HOSTNAME="rockpro64"
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
