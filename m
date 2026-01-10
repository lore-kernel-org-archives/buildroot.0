Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C06D277D9
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 10:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C6548397F;
	Sat, 10 Jan 2026 10:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPoHZ2Z1xSik; Sat, 10 Jan 2026 10:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A9C683916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768041029;
	bh=1N6D6rx5/KtXLLIFV+DNbF13GKa08P2hka1/uf7KiOg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hTdjtYjWU+lez367XZkReCTAujJaK0r7AiWnU+2uNpOibIZv1+ReF7+bSs7YyHMHi
	 hD7POiR60Ua6/wCrwDKFzMezYNGKIEqUD+ZoJh2Iaz/N/3HmHe2vtubPZp/cMulxR0
	 qg1OZll/gbxDTNvUQcsHYr+XJStWRQA28z0fXmaYgRGcO9Jp3VPvbQUA1hxQK0a9b5
	 hpON1wFLD6aFjwi74PgR30snnC6KhIrpfeEhpeEl9Q6/G7VYf2rR8vKbyChgUuxpmm
	 rCpdnF5CkoKfT4FtkLAJZFMIxrYfLEVahZ1Sv8agrU/wLSAsmAY1Dr8L4oLiHKgG5w
	 kKf2VkGf5fxwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A9C683916;
	Sat, 10 Jan 2026 10:30:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D39E612E
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 10:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA96940A03
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 10:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FQ0QGUGzPfE for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 10:30:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE75C409B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE75C409B0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE75C409B0
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 10:30:26 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b86f69bbe60so27988566b.1
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 02:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768041024; x=1768645824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yTFvKXxg3XxgMHMMWO4gZ/V0K5790+KcLg5RKaObi/Q=;
 b=A5+tgRwCQcrK5bcprw4iZGIxkvxjuOHPmVm5QPoWdVuj7Y8cBmw6Mg/HjtxneZ/xnF
 SJELytoe0zrZvFVk2lbPsyw/UxQ5kvZeyfrRmy3l4aG0Mq7ocFXkdd2iyH0ASD3VpKTr
 JRARi3+5jfh5twcjhu4b1AJcuu/0gHZaOD/j7vzUelZbVfCB2zlDAN+uNwwL5PrenC34
 ztJS55yeCnZ7zYG3mjcWsD4s/fYfEl3b/xs5J1bDdzv6JJ3w/8I3fyzQc2M/O+4yVHWR
 XnqGfwfUMSMJ/rRdKo4gFLfnrrVCHe1fAdpUHQTvio6jKWaUsXu9jGqiUI6dJNZ0VziF
 7b0Q==
X-Gm-Message-State: AOJu0YwbGpQi4tpOaumfY0CgQVWCXzuq+m28jn5XkMDXafULW93iNVZC
 pjxjWJ4VUl2RSn5OUgKNWxSfjqNTVF4ti9VzdfiGrveuIBkrFdixd6Btk3Ja9EmX9qv4TlXNfWP
 AXnQj
X-Gm-Gg: AY/fxX7tvd8KcvT8hqMhW1H8LBKGSi6Cd1plqBDvAVWUEqjcWc4Q+WPFGlFm6+XHbnz
 hX3FuleDekHUhUVnsFlb1sWK9dpb908buMKTdmirwIOC9pzl7BkQHtc0trEzjSD2FjKZPf6D8ng
 OZQ55L2HVSP3PIwGxHznaqTSXz0MS4vfyzEYBfk3WXAb8Lm0O8vtJdDJcpBIS6AIiaYE0zOi3xE
 RkfwMWNIBZ2FdDd9F2duHg+6cr5vDAcnYZiFpEtMBkKu+BmsJzd+IAqBnhfU9bMewUq29uMJwKs
 suAVvKJPdLFohkUEyjn1/qTv2HHtCQBjsgGCFYd9Fl0hItwybkobJ9IpWfzbRiw51hvzIl6Oizj
 7eRBPmJ0vjQnYaVAkHJHJfdPx8Jgyr3DE1xoQmUnJdxkvKeYCosgr+WeGt4G6FUc6amNexrrhY6
 r+5wij3J1Ft9XuQFIdHyNRjy/lNRiH4Z+reGP/UBOvKS+UN5v8zi//gYv4FrcW0tX1AchecwvjE
 HFzcmTNNbuE6dJLP0yz3TAroRXc17qqQN/0eFrm1x0pdtetXXKLWCZ6oYkEHdIb/4rVynqPgqbw
 ksSPozettSg=
X-Google-Smtp-Source: AGHT+IGyRweDKcrRRlTncaULGJ/dbYRdi0QPkI6oGg3i1mF1h5hG9MY7wIxWhQoeMFUWEuXXRj7rPA==
X-Received: by 2002:a17:907:6d20:b0:b7d:1cbb:5dfb with SMTP id
 a640c23a62f3a-b844516a807mr1174260966b.7.1768041024113; 
 Sat, 10 Jan 2026 02:30:24 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86f88f90a4sm100824566b.37.2026.01.10.02.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 02:30:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 10 Jan 2026 11:30:21 +0100
Message-ID: <20260110103021.2630877-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1768041024; x=1768645824;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yTFvKXxg3XxgMHMMWO4gZ/V0K5790+KcLg5RKaObi/Q=;
 b=j3obB2wYpgmCtuo8wsI3QS/nZd8ufJUK+sbE17ejCVZ625CxrxEsrxY4KJa5seOzkB
 igncr8N7WJeNkvpYu7D0MzcWFw1XMhtEvw0ftM0dbgrJMDvJbJUJjkAd/pWqvhhsRgTr
 RmLRU79HmZ0Vw4QXZp66DTOXYgpfv2JSbu6Yk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=j3obB2wY
Subject: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux to
 6.1.159
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.1.159. The size of
xipImage has increased by only 181 bytes (1673625 bytes compared to
1673444 in version 6.1.155).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 +-
 configs/stm32f429_disco_xip_defconfig                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
index 6450f4b2d48c..82b6e47e73b6 100644
--- a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c29387aeee085fbcbd91236224b9df805063bac43615e75cea2c6b29604a5c73  linux-6.1.155.tar.xz
+sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index c22b6e1135ee..7bce025261db 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.155"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.159"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
