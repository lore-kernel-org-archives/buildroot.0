Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645BCC3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 09:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E796083163;
	Sun, 13 Apr 2025 09:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOipsF0-W7eU; Sun, 13 Apr 2025 09:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E7D683122
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E7D683122;
	Sun, 13 Apr 2025 09:59:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D53AEDE
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7171404F0
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JN7L3DH7idDM for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 09:59:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0AFFB40A12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AFFB40A12
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AFFB40A12
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:59:05 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac297cbe017so794695666b.0
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 02:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744538344; x=1745143144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FnKW3RNiBJEBJfyP0/0AvlLFy65ZC1YHNSUk4jDB3Ok=;
 b=LQDkU12IUxPJIATrcsuk7dUjlCykfTmXkzDHQDoEx0u4Fh1V5fzPVLBdg6h0CitSNq
 sEtcV7OvU/Oidw2ZsO+HGUycjSpw512A50aYRz/3V6cUjiAEFdWDxweGcYnh2KAhSv+C
 yi1lGJQpl4i9g6y+afXLUERg43YHCDNAK0DGGpm9ftB687HiJF9pTIGUripKB+qvKu5J
 zq0+qHVPZypDONLK7imzva4LR9OgAVFJ/88jqukx3HgctI/WeAjLDvFEpwGtpBQ10ZaJ
 4GemkRcWnC0/600K2Qx1z0wN7oXzQA1ZV5jaOE/r/oBrDr/dZv1Xwwf3hKfONGqKVN0r
 FTXQ==
X-Gm-Message-State: AOJu0Yz8WaBlkzMWyUACfOCBgNJWSG0ASy67RqsaXL+kDkr6WSVl5BZt
 1labJJL7ru/rZeoBr5eM3J1YxALYDOjYLCptqGFCbn3ErUwJC6gDBi9Tq82cC0tc6tXygCm31iE
 6
X-Gm-Gg: ASbGncstjiwk5+8/VqMY4JAj6i+O0JDH7bXR48HQf/YpyBILSsSOqcAjRLuumDYZVlC
 JY8ExGqyVnq+l6gKOVySn+4BbdBmV+dj8w92zXmv3R96gwRN+KYu2a4XLXAwlVBtV2CkpjcQrAH
 Z01mgN53sn25IP1aydFPfKC0EaGid7y6ktHWsoAFnusKGzmbBa1fyuEY+mK+cwbbkxBf4DxJ5Yf
 Jb1Gj7dhG9zBqne8K4xvXIIXJWO73L7S5vTEBVB0sw2EFivHOep6S7OS3+MezCvHqiLU2ZE4u17
 b8uxz4UD2hjMzhCb5jn886vcpA//vZM7YPWchdf68IPBiOzQZacykmnv8a0Aot8WwNTnG6/jxgn
 uHmhtBNZE9huwKipivA3F4esLSyjIcR+jxtUWYTu6qn9BUch4LlPbFWPiFwB/ladUo8Wd71A2vL
 QHkEjmkUQ=
X-Google-Smtp-Source: AGHT+IGavFleQJQJWSMKO+g6PNVTOOo7cuawdlY8Zb4UT6/IM0FkQ9sW2YMLX0K4rnW74Dph/FHmfg==
X-Received: by 2002:a17:907:da16:b0:ac1:dde7:b57f with SMTP id
 a640c23a62f3a-acad17d015fmr600077966b.23.1744538343662; 
 Sun, 13 Apr 2025 02:59:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-86-232.retail.telecomitalia.it. [79.25.86.232])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1bb3df5sm711709466b.26.2025.04.13.02.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 02:59:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 13 Apr 2025 11:58:59 +0200
Message-ID: <20250413095900.1940373-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744538344; x=1745143144;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FnKW3RNiBJEBJfyP0/0AvlLFy65ZC1YHNSUk4jDB3Ok=;
 b=XGDeHvYoljoD1Wkw3RO9GfBJUCmUF1WMW3q4wCNL1gk7RP8elF4tIuhBFRHlTRCQiV
 vsRQ220pzk3zqTNk6iuFNeuc/lLmo+EXJ6QmWHTZrjfGPP7YKGbnIgNw/OdSAzBE9QTb
 /dL5KYrFvFlxfmksaDt3MInVIvwmOF69/cD9M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XGDeHvYo
Subject: [Buildroot] [PATCH v3 1/2] configs/stm32mp135f_dk: fix optee hash
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

The build command:

make stm32mp135f_dk_defconfig

fails with the errors:

ERROR: No hash found for optee-client-4.3.0.tar.gz
ERROR: No hash found for optee-os-4.3.0.tar.gz

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v2 -> v3:
 - Added in v3

 .../common/stm32mp1xx/patches/optee-client/optee-client.hash    | 2 ++
 .../common/stm32mp1xx/patches/optee-os/optee-os.hash            | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash

diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash
new file mode 100644
index 000000000000..5423bf93a580
--- /dev/null
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  a9a91bdb433df795c87a6d15198effbd648e3671ae611f2a3f8b41229d61cce0  optee-client-4.3.0.tar.gz
diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
index 73d4e2c4dafb..2e12a5cdea78 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  03b91fd7dfdf890e3966f931f07634a2b6a2911bbee2a02ecc48d4a40cf6a9b8  optee-os-4.3.0-git4.tar.gz
+sha256  390b271905c828d6def9fa6a77bbaa425f3b434d733c8eb18f582ccbc6896096  optee-os-4.3.0.tar.gz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
