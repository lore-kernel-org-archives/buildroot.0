Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4D2EA8547
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 21:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B3C540BD4;
	Sun,  8 Mar 2026 21:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egLe6XlZvec9; Sun,  8 Mar 2026 21:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFA8C40AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773005637;
	bh=64XRs4p15T6q50ubhXjPwdG6d7bTNQifeDAOKXyADiQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gAbWQy04gW5F73cgH6mL9/t6BWadnGTEuP6QTDWBf5Ji96etIJEM9C39yFiAdqdh2
	 nY8xrIotgcCNvvhtzPgXR0874bhw793OlTB2Mbler8GOfxrPHNys+ycGth7nEkPouE
	 YgJjgj1O+XdP2JS8rgAGQoZSgb8BsbgNw8deuMMIRcvh2UMY1rN9GVzEaCW1+eeCHo
	 +6wqRpGbCUfE2ZkWUlciJysjV8SLf9F7+yfHN79RsWsZpYi19pKz8AdIFWbDxUhh0+
	 3EGnClRy70SZ81aNVaSRCSHAW7eKS+Sz6jEWBoF4rT9gfxm9SJPpCBj3AYpO2JbWBz
	 BpiGMnvM39uNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFA8C40AE8;
	Sun,  8 Mar 2026 21:33:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC006358
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D25E060706
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hS5POSBqTYjU for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 21:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F0F4860702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0F4860702
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0F4860702
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:53 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso1335535e9.2
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 14:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773005632; x=1773610432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+2ER6L9gEYECt8/EFeygdxUlVs2gXdTSNju+dWSBbH8=;
 b=IJiRml8mNINWH8yl6AYjLYA1SbAXGxOxRnaX9dzYdfbJiuQxeROZ77RhrpIcsqau64
 vpzKkeszo0RShn9Y8F1lPmsNFSmcHntOaAb0Swo091oeb9skSNGhAI1z/P7HF86CsukX
 P4yFjHxR5PQMzSGUUqeTAWyKj4OYMf7xz7TfcsjZyKfbcp5122y/7VfxRbtXjGR+5SX/
 eBpvnHXnWnmHGHlmnjb99pB8UsqipNEPoCcKWJEBK6zq+VMAkwZiOj27LsXKjrTjnq8n
 7vD1PQ4hhBFk2p5m2lNQgoQyTnJLodGj31WMrwEbtGbhNdifjH+VOlI/4mSw7nHPP2VQ
 LMbw==
X-Gm-Message-State: AOJu0Yy5gxzOjJgBQIBYAtTpcbe25eyoIlGSnaRHcM4v5k/tIW+GU2vB
 VAywfi8swKrXy+XfnbTsiZBGcx0T+9jLw/aeAuNbyr98bM6ZPL8quqw36Aamj7mxqpgehaIkhT8
 pCIq9
X-Gm-Gg: ATEYQzwK1w1WqFS3kWbPD6OTd7wmwnod0+MxVdNZojNdYftyf1W1pilb5i5R1c9K0go
 WbRJTV6PJwbr3aPLDp6+bDq0pCqC7Ox4NW9I8mM6hKTy989tG7+ywO5Bq+QnQOo5Eq1CG5b4zP3
 yoLhjCYwWVj22Y/LljrmCGsP46L0zFnZo8d+RksbTJ3qbje+q+PqDeky6SvSIoprULUvpW02+wp
 rZ86mYVSTz7zeg/jsDsCkIhY+gdyYltBnF3VKQ4bn2Mwg8L9xxobzv5WOL1vzhfhRZ2DDTu2p0/
 Bg8jRZYsmIjxFjnf6dPp34nHbDm2bUn6cmD8LEU7VBUJIFZGcDre9oRDN+bfkUDuD2il51Vqx44
 Kh9/h4krCITjrn5KD5eLr1tpj2x/hmg3vzWi3PyZ5lc3+gHvbTR4Hx0ud2kj134Z5WnoQk1kQcn
 enAVkfbQcSMnlbIoTqqOUc0ZmD9abvY2x4sQbyBtEOD89BrS9WK42f8aRQRHxF+5m7d78M3CPX+
 V9nIs3Iijuq6jJjrSD/j6wa3A==
X-Received: by 2002:a05:600c:b95:b0:483:7980:4687 with SMTP id
 5b1f17b1804b1-48526951b71mr164602445e9.17.1773005631795; 
 Sun, 08 Mar 2026 14:33:51 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb3668csm458929445e9.13.2026.03.08.14.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 14:33:51 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  8 Mar 2026 22:33:45 +0100
Message-ID: <20260308213348.708846-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260308213348.708846-1-romain.naour@smile.fr>
References: <20260308213348.708846-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773005632; x=1773610432; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2ER6L9gEYECt8/EFeygdxUlVs2gXdTSNju+dWSBbH8=;
 b=WwYqkm50rn/z7FQhlitFVJ9fXAuYhv9mY78YH4DeDMOxOZpaOqas1U+HBrWYjDC7Tx
 lt33lcIzRMKus36Bjbka1qqXM3ZftCQuTqQralbkdvc3jWV9JrawGfJb53e2gbRrjMLp
 j4RXfP4HTej+ZIe5sHPq9VO7eXhGR4+RsYewg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=WwYqkm50
Subject: [Buildroot] [PATCH 1/4] configs/beagleboneai64_defconfig: remove
 unused file hash
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

The commit [1] update arm-trusted-firmware to v2.12 LTS without
removing the custom file hash.

While at it, remove unused linux-headers.hash since we already use a
prebuilt toolchain.

[1] 4abb8a98b26922796b41bc913e72be487337640e

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 --
 .../beagleboneai64/patches/linux-headers/linux-headers.hash     | 1 -
 2 files changed, 3 deletions(-)
 delete mode 100644 board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 delete mode 120000 board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash

diff --git a/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
deleted file mode 100644
index 6f02bfbb22..0000000000
--- a/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
diff --git a/board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash b/board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
