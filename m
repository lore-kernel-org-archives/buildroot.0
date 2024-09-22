Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF59CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C03A04067F;
	Sun, 22 Sep 2024 09:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbVxLN7PFKkB; Sun, 22 Sep 2024 09:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B760640674
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B760640674;
	Sun, 22 Sep 2024 09:23:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF6B11BF4D6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE8E6606B8
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rjGbM6ewE1QO for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:23:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9CFA606B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9CFA606B1
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9CFA606B1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:23:37 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c4226a56a8so4133509a12.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726997015; x=1727601815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D4p/uqH+E0QejI4dRMKNUT/grPbll7PtBMaTT6zZuWo=;
 b=ZN23nOof/h7LZLA3t0E1+oFOCTNTw7TWXEc5YCQscRMqKXOktm6qGM36o82sWXjwej
 Ijhj3zWhUw9/fEyuRqFwrBLeaFy3Ou+3GEg1PqNyTQs4ZjvO59zLvSUlGaOwscJP2W84
 PwdY4Piid4MOaawlumFKperMWt1pnngZICtfyP3EujslA1QFtzdsFDh41KES0Z51M1pO
 Q/YwgUGiC7l/KKLIb6ZcAUDz3vFB6qOoDV/Y92V96NbTlbW7pNP2CDTGaP2yuBBHUTXC
 IGgxe7CI5DXZX+xf37Kxi+h9uuA55UFCLa2Gpx28+EGq2auaT139mzYoB+NvGM0UPEyN
 RSsw==
X-Gm-Message-State: AOJu0YxCfUgqbbBFMF4R4w9Am542gPr/iNBU7aNflAlvecCTbRMFyRy3
 6YC86sij1beibkRikUbBMUWKbVn3UyQMP+QskNrJqmdHvb7YfLxHgZ1TJe7wzzy6MKhXQp7AVVo
 z1/Y=
X-Google-Smtp-Source: AGHT+IHbH+siApoSO6RfeK7QgS+AN+tSV3BU/4JtxH21AJSwBovmeKDeAVScOuKurgGNi8OZV5wgbQ==
X-Received: by 2002:a17:907:f19c:b0:a86:789b:71fe with SMTP id
 a640c23a62f3a-a90d50eed3amr792745766b.48.1726997015320; 
 Sun, 22 Sep 2024 02:23:35 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-102-52.retail.telecomitalia.it. [79.20.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b33fasm1065235866b.139.2024.09.22.02.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 02:23:35 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:23:05 +0200
Message-ID: <20240922092312.2061358-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
References: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726997015; x=1727601815;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D4p/uqH+E0QejI4dRMKNUT/grPbll7PtBMaTT6zZuWo=;
 b=TYGM1dVT1UevP4e1RixcetKjNkutW8aptd6A+5DBJRSKNiuhNxLmxHGworZ46C85cD
 BZeIHD+MoT3eazXU1cENuLxLiZFQtiz7CRp+wN4YrTVojPOCZmybHplewpuJs/rYsvZh
 LWJqIGMJnQWyJFcm/s1dOLgatK4aMuji4hndE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=TYGM1dVT
Subject: [Buildroot] [PATCH v2 2/9] arch: don't enable FDPIC binaries by
 default
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
Cc: Ben Wolsieffer <ben.wolsieffer@hefring.com>, yann.morin.1998@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ben Wolsieffer <ben.wolsieffer@hefring.com>

FDPIC support is being added as a new option for an existing
architecture (ARM), so we don't want to suddenly change the default.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
No changes since v1

 arch/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index bd5f9ce47058..e57f4b2baa06 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -433,7 +433,6 @@ endif
 choice
 	prompt "Target Binary Format"
 	default BR2_BINFMT_ELF if BR2_USE_MMU
-	default BR2_BINFMT_FDPIC if BR2_ARCH_HAS_FDPIC_SUPPORT
 	default BR2_BINFMT_FLAT
 
 config BR2_BINFMT_ELF
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
