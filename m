Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752EBC02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F53D41E69;
	Sat,  8 Feb 2025 14:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPHllJr3etBG; Sat,  8 Feb 2025 14:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8569F427C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8569F427C4;
	Sat,  8 Feb 2025 14:23:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 394961BA
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 356FB83626
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kidadEjYq3d for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 177908322E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 177908322E
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 177908322E
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:34 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so29546085e9.1
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 06:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739024613; x=1739629413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sPT97qY6TEN6Z/kloAjlZhOPyPZF5R1p3qhTFnBh9tc=;
 b=Cse98wgvYV1P2y/sA27VmTUeU6QMK0rOaZ1bRQiwdheifELV4Ea2TYpcdoH2NRyTT/
 lGXnTnm5UNDw56xqax31dVjC8xdTo6GDRnLrM2wGt2+jEb/T/Vshh1N8JkxJ7W9/clEF
 Fg5jlY2jeQQh4X7H3mp0OZPww/CUdZBxjXa3Az5CflyK2ZM2Ls9d++GRgd1Jke1uVIk7
 j8fPgxv4PQZ6zuFIZMVdSG9zGkBkXHKdDHoLfVIEVxKFBHz/gsrAx12YdhHeOJ34AzJd
 QUDtIfXy9dx3Ogx06L+GZ9vEe6qNsDjgBOV5kgNKt/7vkSAjGndKINWrbPnILoWlIIJ5
 r7VQ==
X-Gm-Message-State: AOJu0YwwXA+LkdQRBCKNt78kQw6mNyv6BKystWwMxxCHsx0+8BJfpEYi
 Y0Pm/daxp4wZrI6ZWRIuJ6S3Cdticx2ElLB8GWrByjFzBLzYZR8A+rW2MqYeBLD/JpmkzecH/lH
 r
X-Gm-Gg: ASbGncsKn8umXoMXNvsKDTfpFyGvR2N8ngL2Lh57gOYwnrPqMg1Oi47e5kE1ypqiBaR
 wEt34rpwiyXyKvehw7aHnAkMsA1QYn21iFJUqpI944CIjXTML4qlfM593pzSVwDFRHMEJFWOsb9
 1Sh9C3Q9rh61tpoY/DzYlsZgHSVCfpMx07xOePr8J4ATXM4PS1JwJME7F6OtmAnJcxFFFECAQBm
 1Uanev8aTdRY4IPaSzMqBgzi5I097w8SNAb1foK/Wayn3EmWG0rLkiqNn9q47onOU8lc4LBCZUJ
 KFxeRH2/NGxFZrDEPdNTBBgmXeMhQZBhZx+Rj7KBwahHJxQFrnB4Ibxn9YsgfbDkENWAz98CMAS
 rWa24BmjZKYQT
X-Google-Smtp-Source: AGHT+IG9Ht0kl9x3t82+zdEviaAjjsAgngDYC2kiYIKUIFD/Tim3UGdWrvXdWA1T8Hj8y5pD4E7xYw==
X-Received: by 2002:a05:600c:1d0d:b0:431:5632:448b with SMTP id
 5b1f17b1804b1-439249c658cmr46393405e9.25.1739024612633; 
 Sat, 08 Feb 2025 06:23:32 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm124290665e9.30.2025.02.08.06.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 06:23:32 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  8 Feb 2025 15:23:20 +0100
Message-ID: <20250208142327.418271-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208142327.418271-1-romain.naour@smile.fr>
References: <20250208142327.418271-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739024613; x=1739629413; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sPT97qY6TEN6Z/kloAjlZhOPyPZF5R1p3qhTFnBh9tc=;
 b=kW/Wd9+jRZ5ln+pzW4EHKx6hZMgejqwBdUEXkgMl0rqgGTzKHjMyj03rIZPV/NNHzu
 MaqU0zjGmDOty6Z9nU9Gkd/91eZHsqQhXeTU3SYcp+PMh1NsMcbIT2hNao0rGXVqXKDS
 eakvXufJQRkHsSMzkn3Z9iGs1RPPWrHZaHuXI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=kW/Wd9+j
Subject: [Buildroot] [PATCH 04/11] board/terasic/de10nano_cyclone5: disable
 shellcheck SC2276
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

Disable shellcheck SC2276 warning introduced in v0.7.2 [1]
for barebox environment file.

[1] https://github.com/koalaman/shellcheck/commit/fbb14d6b384a65ee16781966d9d240db9ed7b644

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/terasic/de10nano_cyclone5/barebox-env/boot/mmc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/terasic/de10nano_cyclone5/barebox-env/boot/mmc b/board/terasic/de10nano_cyclone5/barebox-env/boot/mmc
index fed2b0b45d..6cf307b80b 100644
--- a/board/terasic/de10nano_cyclone5/barebox-env/boot/mmc
+++ b/board/terasic/de10nano_cyclone5/barebox-env/boot/mmc
@@ -1,5 +1,6 @@
 #!/bin/sh
 
+# shellcheck disable=SC2276
 global.bootm.oftree="/boot/socfpga_cyclone5_de0_nano_soc.dtb"
 global.bootm.image="/boot/zImage"
 
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
