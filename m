Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A16C3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 16:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A683E6083B;
	Sun, 13 Apr 2025 16:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6_1-T7wxXsc; Sun, 13 Apr 2025 16:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C78D0605C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C78D0605C6;
	Sun, 13 Apr 2025 16:47:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DA8DD4
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 16:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03D1183365
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 16:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1BkkfLpLidY for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 16:47:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECB4E83280
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECB4E83280
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECB4E83280
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 16:47:13 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac345bd8e13so613887166b.0
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744562832; x=1745167632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C2a49VrPgC+oSDU//X7P2evyihtXL9VjVbDsR+q5u0g=;
 b=FUifq2mNB8HVUzTu50sG9BUePbzIhiTbPhu6cb8dHaiTluB8PLmWolOXXGs5uFWpT+
 QH1TyWjp9/lPxf1Cn2bS6fQBDnnKkUs4Q+rUoR5CBN655JCGrNreQ+499WjIPgGZPXhB
 4Bm2Q49GrRS2kzWueuH/L56QERVGFMr0GZTmuGvSnEAQusMnU/atPse8zGeeCsCISfYq
 KM51ptHOj7gHtsPzE8/ICH4BHf+skaltlQD7PeNoNv4Ij5ztukMvesecLSvQ0iBqa30Q
 vYzx/ZVW7TSaM4DL2ix+ZbylDhyJRxdiJmzpe0q6rSpK7QJWl7u1vD3xI4kkqyrHlUdI
 t2Ig==
X-Gm-Message-State: AOJu0Yzfa0/0wkTazEBkrBgduOYnxyh8UJK0q3BbgGvA34mwrOfVUBi2
 iyl80x9kRinlA4uKcRkR3K2QVhP22uzb38sczE599QQB0Awbm4PQdEJTmqvKlFUNxs/v+BNwUny
 C
X-Gm-Gg: ASbGnct/OT/ELM+MztH18RsTffiF4FAqaKUAgxLVPYH/ujx8jXqBcAQSC2u6V7iZv00
 PtXVPDXr9mKlca0WWqJsXbLFCUOXDp7nysEuMsO9nWS9XlqViuI+4QpO5ydl31QNnNuyXce2HiQ
 keTzJC9w5E8Icj+9iHh4iO/L4WD7Q2P9a/k0JY3AVQGz+yJUEwnjvLgJuQgQLseXy52Ff9LGDCB
 rul9Aa4QwOPQZcfG0pN9BOKQs3q/6M3NzTirZFejQkKY+lu4T07OUkbCpBwEUyaYYq7eR1SQu9H
 AuY9OfaGceTC4xVeL24EDNIVjtV8R9YS70v7iinLBseYC7gaOkoB+SaP8HGQ9ceeuk8NTonMcEb
 2Xb23VUpGrrnmv+Mrgmx7glGXWx/nIGBLGMRAkJyUN4D8jDyHiCyVBsj2ONpy2r+YR7rTlA0O6f
 82+sDrAy4=
X-Google-Smtp-Source: AGHT+IHk7rPJKeub3xKgcW7UXNqBTBkgnT13uA4RrJNya7mQ7z7n//XRa+r9lZa19mCVr0AiULTeug==
X-Received: by 2002:a17:907:6e9f:b0:ac2:66ff:878 with SMTP id
 a640c23a62f3a-acad36d55f4mr745172266b.50.1744562831018; 
 Sun, 13 Apr 2025 09:47:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-86-232.retail.telecomitalia.it. [79.25.86.232])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1c0126asm766648066b.78.2025.04.13.09.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 09:47:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 13 Apr 2025 18:47:07 +0200
Message-ID: <20250413164708.1943803-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744562832; x=1745167632;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C2a49VrPgC+oSDU//X7P2evyihtXL9VjVbDsR+q5u0g=;
 b=lq/nzo1wEbR+j6+Y5ZHt/mUNYdz4yi5bNcjzD/bpPeMYa/BECyti+yw68P0BwiljQN
 id7z6bQTYVQRqwKzCxTzNu67tdHR+ajxu6v0dJfTElPnx7EcFTeLEbD0PkqddRxhUD3r
 zZG+IF/VFqozNWbuq7lkmDTJCwWLSB7mJxzBc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lq/nzo1w
Subject: [Buildroot] [PATCH v4 1/2] configs/stm32mp135f_dk: fix optee hash
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

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/9690369624

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v3 -> v4:
 - Add Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/9690369624
   in the commit message

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
