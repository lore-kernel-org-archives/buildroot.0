Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDFBD10BE3
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 05:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B5C1408AE;
	Sat, 26 Oct 2024 05:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GZSiu6iiE5j; Sat, 26 Oct 2024 05:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1280A408D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1280A408D2;
	Sat, 26 Oct 2024 05:50:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DDBB5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81E8A81F16
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-61G2XRSPKi for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 05:50:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F10581F15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F10581F15
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F10581F15
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:50:12 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-20e6981ca77so29290185ad.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 22:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729921812; x=1730526612;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fLVAQ7vsM6ud25pQ09+VaDEFuRN0UGCAHPctPpq1yps=;
 b=MPTFsWFEG5h6UBAs3/gyVUIsgi6EBAvSVcxLBLakQCwNZ+5cCE7UQ4leIjdvVBs3JQ
 2yWRwNDPc6HIHNBRJZTzdMH+1MbXQ4w3Wv6DrLQ29A+p3HNSfCFwzJHcqa5ot2vpNuba
 fvn4krnssCwaWSnXqvj8XSZDYqrezdm3dHoOCsTaz+AWPPeCEkU+x9PkGwWjiYIuwy8t
 fyVcBGAXZLhCY2NKc6sA8zLrsBnlKnjYMLY9Vb3Rnusv57dyi/hHwMC4hFI/ogzXmopv
 RJHfJhl3mZcJscNzZ9/xz7X40/KSXHQ91zX2SCoCRum3fY4oQhEUHO3EVafQA5bY9jUu
 uAjg==
X-Gm-Message-State: AOJu0Yz622+suQHY664CT//xwtruy2CIIw7vk5ZuY2LnvPSAn4ZrRhK0
 Ghat5qHlexkeXcWHn3kIWROvOjgX75Tt7m4Bgke1WAM25ZkUY8CFzF0GZKPoBh61sZrSJjjmpb+
 XXPo=
X-Google-Smtp-Source: AGHT+IFC6jcQbjOVy7xIcur/+Og0GQeDe8/Fn77AKqiEz38KKohItbzPuT1vBIxfnen6sU1tPB1CjQ==
X-Received: by 2002:a17:903:2289:b0:20b:7ec0:ee21 with SMTP id
 d9443c01a7336-210c68cf5a9mr22636985ad.19.1729921811786; 
 Fri, 25 Oct 2024 22:50:11 -0700 (PDT)
Received: from localhost.localdomain ([192.145.118.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc063e7esm18019335ad.276.2024.10.25.22.50.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Oct 2024 22:50:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 22:50:03 -0700
Message-ID: <20241026055003.69253-1-christian@aperture.us>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729921812; x=1730526612; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fLVAQ7vsM6ud25pQ09+VaDEFuRN0UGCAHPctPpq1yps=;
 b=IZ1b8I/MH2emw4vY/q60peqYRv8rEbeB9tLSk2T97GTIH/yIo+BZYivbtq3uCVYBgq
 UZXRC6L1nJjsYxvyxLmxlqQAuKcqZ1ZoMmYWHyvDYFsgVEgahKR3zU2UdUb3WWWxCgXt
 e68oST1FDdk25ApJtqBg87NhZjFlBMDOBNi1d+fare9/UoOBcMa2jxEBq8eBHx9P2p59
 L+NBmztwKSWD7Gdry418+RjmlGA/T32kLwBpzMxsmE4fuqd5Jv86fTxNEnaIcgzX7wP0
 5geXtlBZRxmnkB7y7joGgKM5yI8Bw5xix/6dIqIr9urfVCNO3XFR/Z656CXUiPyupuUf
 s0ew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=IZ1b8I/M
Subject: [Buildroot] [PATCH v1 1/1] package/linux-firmware: fix missing
 rtl8723 bins
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix a build failure due to these changes:

Commit 2bb8fb26599302c9cbc69a5aff329a8559c91e48:
rename rtl8723bs_config-OBDA8723.bin -> rtl_bt/rtl8723bs_config.bin

Commit 5a017996c6de64ebd7f7c60e1233a45ba04086ca:
remove rtl_bt/rtl8723d_config.bin

https://lists.buildroot.org/pipermail/buildroot/2024-October/765934.html

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/linux-firmware/linux-firmware.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b48bb80713..9ffd52dff5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -79,8 +79,7 @@ endif
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX_BT),y)
 LINUX_FIRMWARE_FILES += \
 	rtl_bt/rtl8723a_fw.bin rtl_bt/rtl8723b_fw.bin \
-	rtl_bt/rtl8723bs_config-OBDA8723.bin \
-	rtl_bt/rtl8723bs_fw.bin rtl_bt/rtl8723d_config.bin \
+	rtl_bt/rtl8723bs_config.bin rtl_bt/rtl8723bs_fw.bin \
 	rtl_bt/rtl8723d_fw.bin rtl_bt/rtl8761a_fw.bin \
 	rtl_bt/rtl8761b_fw.bin rtl_bt/rtl8761b_config.bin \
 	rtl_bt/rtl8761bu_fw.bin rtl_bt/rtl8761bu_config.bin
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
