Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F939CA0EDA
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0BC9416D3;
	Mon, 11 Aug 2025 16:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5o6Z19w8UnCa; Mon, 11 Aug 2025 16:55:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1B40416C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1B40416C8;
	Mon, 11 Aug 2025 16:55:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE3DA138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0600409E0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8ZEfMd56zXE for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 199D24012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 199D24012B
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 199D24012B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:53 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-af940717331so62427366b.1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931351; x=1755536151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G+EVzKyWBjKI78+L1Gn6hQ/lsdIHniIEF75XrHS+Jo8=;
 b=R1nr6w8u5CtdQTDbtz906bqu6Hh6QLRDfRoETvnRNkdt9C/P3c47mts6vXoGvrrBzQ
 HRXYZLHwmw/qU286v9YwTsvAdyaqxvgY956q7bvdi9oFdPn642u+6SVFTdQTJqZ8MIGu
 QO+tmC7YAq4LwYBrZSFtYQxZWTxSfuh999C6rv7LK971E/zVaX8b5FlrlP4svr99YC48
 hNlKbAz0AZLHgjHH8IQaH2t/ADjPZ1q/BqwNK+oaibxXTn6547bYoNh5KZVrzXgmn0dc
 mqHCSpbFUByNWJLnNjcpnNnZ7tWpbnaS1A2QltaWzH/JiVYJ/OhEYI2bbW9OkA7VX9I2
 bFCw==
X-Gm-Message-State: AOJu0YyLNBm9SejrmTj/djdeWyyinErDVANEDtObVeuxE/q4I0wIKsF3
 W5akPEV5kReWm1j358DAzDpSwV+HsZZbgoKojK4aXvcdohxscD+/6BZ3g/ZMaA==
X-Gm-Gg: ASbGncusn38t/waDh2Oi1c7hEzuvrr7dPOT87w0fHbLK0MNFKA8uvZuS5+rDKwLS74N
 ofF8ETYsn6H+O8JDyN2wOYqCQ83YqHPW4yAbjWd/LhyFlDh1UFqrvwFP+igICaTTTd1YuAgho8m
 G0gNXIW70Y2ZqiZ5nPqo0JtSwPP9gfgV8nnWdSxMB2TBE78I+5rsDCVEqIC52ePwBtjs+cerGsi
 EfEfNfTeonnJvYuX6N7CCIt8BEcVFxKkZMvkBrM5FsnAu5WBJnyy2s3UCWiBv+SKWBj1KZ3f4AX
 W0vWJi1csKPtz234a4E81qOxjL7YALOv6+k6gi7YvIHSiVlOIKQ2dH103EAyscbWENCOWwYjv3/
 TNAJI3Rvjyd8lNNTVjn4=
X-Google-Smtp-Source: AGHT+IHVcWXGG28Alj6xAQhIXsE4z1EpeLSZ+0yrrY/1OZ0ZZdOl5OrwIV4WKSfflrbISAHdLHFQaQ==
X-Received: by 2002:a17:907:7f25:b0:af9:3d0a:f370 with SMTP id
 a640c23a62f3a-af9dec3bb5dmr414965066b.8.1754931350660; 
 Mon, 11 Aug 2025 09:55:50 -0700 (PDT)
Received: from skbuf.lan ([2a02:2f04:d005:3b00:15ff:6865:527:c8f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766e2sm2044629166b.27.2025.08.11.09.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:55:49 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@mind.be>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 11 Aug 2025 19:55:23 +0300
Message-ID: <20250811165531.1533913-4-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811165531.1533913-1-olteanv@gmail.com>
References: <20250811165531.1533913-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754931351; x=1755536151; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G+EVzKyWBjKI78+L1Gn6hQ/lsdIHniIEF75XrHS+Jo8=;
 b=kI46mzFCEk4rSuCt1Q5sE9qfyUVvscrZA684TkmKEa/mogzZ8mJRs1oOHaqoXcQoWt
 lnueAQf8dLtm6Qv1cBmpYr8MezwYabyYHRSBTEkf8WZPd1QVlP+TjjCXRBx2HefwzLpn
 HB/Qb9C42xN/iInOSmeyMLBfudoR5NkwLOZTV69/+FDOJAJdRgDP1/2Q2DlpfwtNeEZe
 R546R97dQYvNFTxyBXsnWOQTZyr/qIl1UJaFdXzSitKhkyS1kPthKiaMId3GZKzsHVP9
 IClW6t+eyiZ0qhr948so1Aod2pfFxZspP6Z8uE9C7ywnNIcfcyvtERecV9gh516fiE52
 mA8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kI46mzFC
Subject: [Buildroot] [PATCH v3 03/11] package/fmlib: bump version to
 lf-6.12.20-2.0.0
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

No change.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: patch is new

 package/fmlib/fmlib.hash | 2 +-
 package/fmlib/fmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index 2d63a615c0d2..7293ecbc07cf 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  087e1be3584a390cf0a75fa3730589edf76aa9a4832fa012a67c381cbf5b57a3  fmlib-lf-6.12.3-1.0.0-3-g7a58eca.tar.gz
+sha256  491315e35fb8d411305f4e66413ee3fe0e265f9cc8b5f27ec7587d15bf79991f  fmlib-lf-6.12.20-2.0.0.tar.gz
 sha256  5d7770fa9f70f0c6f0b4784bbca8401811259a4b1e03455dbd863ffd0d34d2ca  LICENSE
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 2d25c0845c65..14bcca5e403c 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMLIB_VERSION = lf-6.12.3-1.0.0-3-g7a58eca
+FMLIB_VERSION = lf-6.12.20-2.0.0
 FMLIB_SITE = $(call github,nxp-qoriq,fmlib,$(FMLIB_VERSION))
 FMLIB_LICENSE = BSD-3-Clause
 FMLIB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
