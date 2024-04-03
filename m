Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0523DCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8D33418B7;
	Wed,  3 Apr 2024 19:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsMFfP3VrEXT; Wed,  3 Apr 2024 19:54:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F2D418BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57F2D418BF;
	Wed,  3 Apr 2024 19:54:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4303F1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C868E60751
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VqXhqANAhFn for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B27966079A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B27966079A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B27966079A
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:09 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4162514dc22so2000515e9.2
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174048; x=1712778848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91oSwtyemJRy23KCF0JF13OTLIzZTRzYzM3DsARpxC0=;
 b=DNEXH/oqiCbgsXYlLVovCdB2+cv1FIga43kdwmNjO23IXXMoJ8O6qLz2YQ85yiaNqK
 jFl9I6Kknr64dm3HlRhHH7ePh7nlqRq7PhjbhS7BKhzhRPl9Z5D0/bTmEOP4XWUPPI9a
 1/HByZhrgmh5GKyWHpr5bq2A+Qj+zTBNDpAbkyE/1/bJ4rMfSigM4Q1uZX7goi5IsZBd
 0wa2SwFOf6bYowd3uqCTYvvhqRGKO+e88ppEfS5QSQ7gSheQOrS2cxftRtVTrMCx2yCP
 lkgdwe/Nbzu0yNOlv7IPldMnok5dS1NWPPkedYTx+hIiWrRlbaAg4m5BnM8e4w67oe24
 dSDw==
X-Gm-Message-State: AOJu0YyWSZ0qV9jLFQvku07hvWKrL3L2wZ/AKuRFHM2EJTuJfW4WvEWR
 aUV309+20w/kzERYjE01ssbakNueGoIxYbFOpONxqTfLAEYe3mJABHilg2Un1ZyDu4q8LZKtjMM
 D
X-Google-Smtp-Source: AGHT+IF9nc3Oxd2u6DuEI4AZkIhRRJ4rgaAeyAuctUEWZ26HWLtDQntZdQgzuLCcGW4BWUJHAAv34w==
X-Received: by 2002:adf:f052:0:b0:341:e367:e7bf with SMTP id
 t18-20020adff052000000b00341e367e7bfmr387682wro.69.1712174047865; 
 Wed, 03 Apr 2024 12:54:07 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:07 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:37 +0200
Message-ID: <20240403195403.1359007-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174048; x=1712778848;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91oSwtyemJRy23KCF0JF13OTLIzZTRzYzM3DsARpxC0=;
 b=LANWsjqFHKlS29ZZXjH2SG8xUQDI+AjDhiwbNgMBNwOZ0fDw33OgtXVw+P8ffyFoIO
 QuvVdap/Tcp/ZxmHBX7QfgCqRuc30SEZ+VykJkJxQGzHRyt+Yxr68uTU8ltKT7+M+/w4
 XMij/swu4ZNZDVlIQeaRWITXBX4s53olU6k95rogZYcdc7vf8vXxD6GwoZdyxnXljf4K
 2GdBc2br7yGURQvIOr/EbRb7LOqiGvnZbZxJjNKSYkuvoglyDSpK/uquA1w0uaXEKu73
 2pk6KXXRFg+8VxnJ754XB5+fMcv/KwkxWNe1N+ZEn+sEhgv7vUC0063VBdRSo2Wx9XdS
 8N3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=LANWsjqF
Subject: [Buildroot] [PATCH v11 03/17] package/ti-k3-image-gen: disable
 HS-FS for AM65 SOC
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

It seems that some TI K3 SoC variant doesn't provide all SECTYPE.

For example: AM65 provide only GP or HS, there is no HS-FS.

This can be checked in meta-ti:

meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES +=
"tiboot3-am65x_sr2-gp-evm.bin"
meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES +=
"tiboot3-am65x_sr2-hs-evm.bin"

So BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS must not be selected if
BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X is used.

Note: The HS_FS and HS SECTYPE are currently broken in Buildroot
since the package ti-k3-core-secdev needed to sign binaries is
missing [1]. Since this tool is nowaday legacy and superseded by
uboot's binman tool, HS_FS and HS SECTYPE will be fixed by using
binman with the version bump to u-boot 2024.01.

[1] http://lists.busybox.net/pipermail/buildroot/2023-November/680216.html

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v11: moved at the begining of this patch series before any refactoring/rework.

Added in v7
---
 boot/ti-k3-image-gen/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.in
index d76cef82e9..eb0f589fa7 100644
--- a/boot/ti-k3-image-gen/Config.in
+++ b/boot/ti-k3-image-gen/Config.in
@@ -48,6 +48,7 @@ config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
 
 config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
 	bool "hs-fs"
+	depends on !BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
 
 config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
 	bool "hs"
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
