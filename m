Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD5EE77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 19:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 784F560E5D;
	Fri, 10 Jan 2025 19:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0bA5eFziHji; Fri, 10 Jan 2025 19:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 577B460BE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577B460BE3;
	Fri, 10 Jan 2025 19:54:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB0D676C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98D368375B
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRFkDLsqbO6Q for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 19:54:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B8E28372B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B8E28372B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B8E28372B
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:08 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4368a293339so27978225e9.3
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 11:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736538846; x=1737143646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IgfGlRNGT0dy+qj/JigKQugtcQXSltdQ2GQ6O7ZIZdI=;
 b=WyVoxT7khVDSmUt4YL5+QO4jLSXjitvSb7Apb2swwfkA2qdzuo8uZPrwawKwLj4A5b
 AOcZxM6i81Ra4fqLeJTLUAoV1MP5rhhDENbtxMNDIc6tq2OHNe2d1x6CUmr9dPvjUFlj
 y9cX02NNVq1i2VzWXQWt37KrgDstmwvG1p22K08fC5qfySoyVeMuPjqfkraGt9mK6y7Y
 iX+2gkMAkrlib42zXcKzluRbQRAnAGvDTtg4QsrUcU0g6EtJKeRma0PWlH7lHlQoHd3o
 z7m4xxR4WYT1/kRlvG9n6ZNiyhAdJyG6F09VyC/PDXOX3sS285QzZzCPSAnRe7PJHWot
 Am6w==
X-Gm-Message-State: AOJu0YxgXclu6kGElQwcE+3jpQ1aOxm2tEsngIb4XAS8xw/lo3fGa1cW
 StBCqfEqUguv0Ziyxe5lyDnazPyCcoNpdB9XJlhjlxZgG0PCrija5eSuJAfh/Oyx7Ry3zY7a4Nx
 0
X-Gm-Gg: ASbGncvRWafYY9hruQ7DyODAmbl9TZnS5ifot3AT5Wn9micKLnGaGgsX48ed/HaAvaU
 szIAPRpLCVcArNEglkjXJlsZb3QI129IUPT4RkVdj5/3UuhOYf9oPqI5pLiS2iwXESYDt5zmZQn
 LI2Y6+EN3SBkNQOW4nAPn0D93/TzF5LpBLOW+81PYLnNkcJBpOcLU0lWhfwog+DWOwxvM2Njitc
 IeFCv72UH57oc64Dx+W5fR7x59ha7qboq55y4u/xEbW3XsRheYdap2l0I7740gFtSHL3qcdZeBZ
 f62QWAqvQ6FfzhBL40znk9jecYUYv70jWMI0TPwMaPw+9/We2nE0VQ==
X-Google-Smtp-Source: AGHT+IGpO9ezWjL/ybPeVRfuLpbkaBDHdV9Hf0WDZ6sm1AcGEjWrmyoKEyh/BFE6D45EOqTe8ggaNw==
X-Received: by 2002:a05:600c:1c8f:b0:434:f586:753c with SMTP id
 5b1f17b1804b1-436e2686096mr115156815e9.7.1736538846358; 
 Fri, 10 Jan 2025 11:54:06 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66fcsm96439635e9.6.2025.01.10.11.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:54:06 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2025 20:53:49 +0100
Message-ID: <20250110195359.3358022-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110195359.3358022-1-romain.naour@smile.fr>
References: <20250110195359.3358022-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736538846; x=1737143646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IgfGlRNGT0dy+qj/JigKQugtcQXSltdQ2GQ6O7ZIZdI=;
 b=AI5o1kRrkUNzDSdeSs10om0gZWTrU15QZrLe6nihRCUQzCzFv2YpZJqFC5KEjv3bYZ
 8JmX7rp6O7JUy+j26eXsDrieKy01HmxODFzx2bZq26K2QTAcMlkgPW1+Xkrft2hab2na
 Gelc4d8TtPQbddcV9hqhIfwxoozTBYq4fqQgc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=AI5o1kRr
Subject: [Buildroot] [PATCH v2 02/12]
 support/scripts/gen-bootlin-toolchains: remove nios2 toolchain
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

Nios2 will be removed from Buildroot, so Bootlin toolchains will
no longer provide nios2 toolchain in further releases.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/scripts/gen-bootlin-toolchains | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index bd1beec995..df16cff5c4 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -118,10 +118,6 @@ arches = {
         'conditions': ['BR2_mips64el', 'BR2_mips_64r6', 'BR2_MIPS_NABI32', '!BR2_MIPS_SOFT_FLOAT'],
         'prefix': 'mips64el',
     },
-    'nios2': {
-        'conditions': ['BR2_nios2'],
-        'prefix': 'nios2',
-    },
     'openrisc': {
         'conditions': ['BR2_or1k'],
         'prefix': 'or1k',
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
