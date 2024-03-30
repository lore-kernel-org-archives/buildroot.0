Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D56FC6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 16:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2734382281;
	Sat, 30 Mar 2024 16:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbE8IEh_Tysb; Sat, 30 Mar 2024 16:03:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F88A822FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F88A822FF;
	Sat, 30 Mar 2024 16:03:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FB051BF3DF
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D3A04056E
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUp8LZPabmmb for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 16:02:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 537604049A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 537604049A
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 537604049A
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 16:02:57 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56c2c41cbdaso1564059a12.2
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 09:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711814575; x=1712419375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OlgqGuh36ehNJiVVoCxNXxhAlXwG6OEjKu1L1xo6aFU=;
 b=Q/xGGxWRJ9MpPaXjI1yK4ZwT1I4hvahLvAoQrYllzFNWA014NTTfwdYZGSaOsHf2mi
 q40BvLbwtmIxBthO/3Tl78Th1XxWDXf10Rx27XnbTRdG3Fatic1JCGHSxPSN+ksUwV3Q
 T+Mp7+P1wnyyLYaCm+n+DlB3G2024gkXoY2D9YvqlTjIOhj6QqBYNYtT8zNqBMtPkzCe
 WrREWyKddnLI+QPtJ43tK5x8JgenHLbmOTEAF0r5SFF4Yw5oFq63LMhpD/fYFaYhUngD
 iguZTXguzWat8FngzCOYd3jvWuJ0rN7aXLldpzbqPTFkLzjxxj2qQhMpSkbF3mxXsWQC
 yNfw==
X-Gm-Message-State: AOJu0YzBaM6e+0sOXHky4TsmQHAHPc9SopICrNfbbC9qPKerKNVDWFbd
 PjQ8Uyk8/hz+hFgzDYXzTEiXrGZ3981MrOtTpixa5v6CEj16U7ZpW66Epv4vRe4Um5/nZQi7Ivn
 BXUo=
X-Google-Smtp-Source: AGHT+IEIy/egLuG9qdB988/Nb/8prvYDsCW+VBqjhvIAGul1+iOKSRTXb4OfZqxKlnyFi/dR/rDWSg==
X-Received: by 2002:a50:ab14:0:b0:56c:5a49:738 with SMTP id
 s20-20020a50ab14000000b0056c5a490738mr4186054edc.10.1711814575243; 
 Sat, 30 Mar 2024 09:02:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056402004d00b0056c633354c6sm2127107edu.45.2024.03.30.09.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 09:02:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 17:02:37 +0100
Message-ID: <20240330160244.3214733-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711814575; x=1712419375;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OlgqGuh36ehNJiVVoCxNXxhAlXwG6OEjKu1L1xo6aFU=;
 b=hpCyKIDXo2ojUZuBebcSoCix0Hh8tgQ3Hk1eZLxqz7nqUUZ7GkeRWATWAkeHCWFjCN
 VpRJ3KfCKsoCU2sLVLydpQTN7mdykbsurpsdgUFXuF7wkHG9oe7aY+KnmkEAgIgvTvnQ
 BQz4UC6Bm8I6VKreSQ/R0fBesdOe6DAQiKnvE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=hpCyKIDX
Subject: [Buildroot] [PATCH v10 05/12] package/ti-k3: disable HS-FS for AM65
 SOC
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It seems that some TI K3 SoC variant doesn't provide all SECTYPE.

For example: AM65 provide only GP or HS, there is no HS-FS.

This can be checked in meta-ti:

meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES +=
"tiboot3-am65x_sr2-gp-evm.bin"
meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES +=
"tiboot3-am65x_sr2-hs-evm.bin"

So BR2_PACKAGE_TI_K3_SECTYPE_HS_FS must not be selected if
BR2_PACKAGE_TI_K3_SOC_AM65X is used.

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v7

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/ti-k3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ti-k3/Config.in b/package/ti-k3/Config.in
index 2a51b1531487..b8545b7bca62 100644
--- a/package/ti-k3/Config.in
+++ b/package/ti-k3/Config.in
@@ -32,6 +32,7 @@ config BR2_PACKAGE_TI_K3_SECTYPE_GP
 
 config BR2_PACKAGE_TI_K3_SECTYPE_HS_FS
 	bool "hs-fs"
+	depends on !BR2_PACKAGE_TI_K3_SOC_AM65X
 
 config BR2_PACKAGE_TI_K3_SECTYPE_HS
 	bool "hs"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
