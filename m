Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AACCD1284
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 08:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 955CD41B80;
	Thu,  4 Apr 2024 08:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJ1MPqssYUlR; Thu,  4 Apr 2024 08:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DF3641B6F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DF3641B6F;
	Thu,  4 Apr 2024 08:18:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AECE61BF2B8
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 08:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C10E141901
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 08:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kkdm6b53tkHB for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 08:18:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5FBFA4190A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FBFA4190A
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FBFA4190A
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 08:18:04 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a44f2d894b7so90726666b.1
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 01:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712218681; x=1712823481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uqVo5zZn/bibwMx7a9sWm2vTu0BnN1//M5APzrDAuds=;
 b=SXw3QDXkVuaA2O6BlOZI/HwzenPqeuP3MaHWfxtACkgNE+iAQ2nw9jMRP8Y+euDRYv
 8z7WRJzLoOn7dcfYkxM7BTEbaEpgnS/KLDN39zMtDPG7rgNiF6Hz774g1MIqYDDXliUQ
 gbQJTK82DwZUsWUO4eZfHuLNFezyiXq0VWvD3t9wpJXoE03swMDKccMbhJ5ALAYoDsQt
 XCrmQkA+b+Y9O2WASn534sjjJlBmKjp9u2gcctOIqf+pwHtALdWlXsZUx9QGij/8V2Za
 cOhvcVGX8DCwNXbQOQigoJrqvRff1YuIsZO+4EfQA+TvhnqhZH7m932igBD1R5Fy4XsK
 bBRQ==
X-Gm-Message-State: AOJu0Yx7/lkHpCPNwdvTEkPvxb6flAwITcBCAo0Z16PRlbdO4pZYj7V5
 tQNNIugqQhsQhgm4Gbv5l/x3nvFJ0Mtrlkha/jXo9e3YS9sTpC9LQMRBe/Fo0p4=
X-Google-Smtp-Source: AGHT+IGLYD+VqwFd1WQMicW5fjmJfTYKQfS71DuSqs6CNZ+aKNZ+JkpRMokDaRoxAMnMYWVDlxI5zg==
X-Received: by 2002:a17:907:7d93:b0:a47:16d1:113f with SMTP id
 oz19-20020a1709077d9300b00a4716d1113fmr1490648ejc.47.1712218681103; 
 Thu, 04 Apr 2024 01:18:01 -0700 (PDT)
Received: from hthiery.kontron.local ([95.91.160.230])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a17090609ca00b00a4733982ba9sm8614271eje.160.2024.04.04.01.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 01:18:00 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 10:17:17 +0200
Message-Id: <20240404081714.1190807-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240404081714.1190807-1-heiko.thiery@gmail.com>
References: <20240404081714.1190807-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712218681; x=1712823481; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uqVo5zZn/bibwMx7a9sWm2vTu0BnN1//M5APzrDAuds=;
 b=R7mufeb3nrkM/YnEVe4H3kYv5he0gZ/XfsEgrn71/KAGvgdnhYr9+NXh8aEKWPohgF
 33/tZPmoE4Q4JBL1In8Lqww64xOfc4ycrQ5sWI+b6hkSJMuYyMGr+coIkhtPPRz3WbZk
 BQlvN62zQQBDkw+qvEtRLbYP8eh7JWiluJpgKya0l23ft5+2PIuqIcy8OoeXI6fpmRad
 UnQgr9T+2ql09ZufiX6lC7i5bKWXaLG/ftUs+tudrdc8DQj0lX9fKkBdZbDYbryNuflN
 NqBHHPjGxxJhYTT722pjQkHghI7zgrl4n/dib6riAk7x/z1+JPVxa94Yawm111Vigqrx
 5Rtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R7mufeb3
Subject: [Buildroot] [PATCH v2 3/3] uboot/uboot: add new dependency to
 yamllint
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
Cc: michael@amarulasolutions.com, Michael Walle <michael@walle.cc>,
 Asaf Kahlon <asafka7@gmail.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since U-Boot 2024.04 [1] binman also uses yamllint as dependency [2].

[1] https://source.denx.de/u-boot/u-boot/-/commit/10fee88d42f
[2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt?ref_type=tags#L3

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 boot/uboot/uboot.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 14502d4db2..26b9afdb00 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -279,7 +279,8 @@ ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
 # https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
 UBOOT_DEPENDENCIES += \
 	host-python-jsonschema \
-	host-python-pyyaml
+	host-python-pyyaml \
+	host-python-yamllint
 UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
 endif
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
