Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDA9CD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2B8D40B32;
	Mon,  1 Apr 2024 13:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNP_uxXoHIUf; Mon,  1 Apr 2024 13:13:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5D9A40AFD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5D9A40AFD;
	Mon,  1 Apr 2024 13:13:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 988F81BF232
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8407E81E7F
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAYT-JtRVhnH for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:13:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F6C081C44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F6C081C44
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F6C081C44
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 13:13:14 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a4a3a5e47baso465313666b.2
 for <buildroot@busybox.net>; Mon, 01 Apr 2024 06:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711977192; x=1712581992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s3I2tV4iomtdZOLaINkRBx5xFocVe49aBeT/JsRVios=;
 b=SPIByEdTR2kBS3KnRUS1ysZkFOOm3LFHn3H/jQK9CGaOoZBaeH53PsO5NgA+llgKJE
 rd3mREyMPTn26soPZA9zZIcUcZix/qGlnWiICbXHGEoSGTi4/bUdNu/3xC9ZEU2UXt7C
 Ds3n7Q+Fps16EoNy0aAF0qUXGqkyn/qgD4BXELPMCf7Cc1pejVJkEgh2g7iznuf16FkX
 2eDuahWjbiWWOn/YIAH1ozX4RAj0Ve+1/oRpGJBbOIFf0ERU9Qp6x3wpLZPjpZAl1nsd
 RvqwiEECPChiDUhPX9YA1B8DaL7AIfR2aSfxpbX/g85FQB709RHHeggliSdHYv8epYMq
 aGAw==
X-Gm-Message-State: AOJu0YztJ6QSayClqGKJRgH3NO8RkB/VAfYFr2vs4o0uR+cF+IxVXkMZ
 xuQAkdMLKRLOiQcbQBz2wZ+HvLG+jCtDhy+Et3S+ViDmIKQbYrkUWPeGhNQK
X-Google-Smtp-Source: AGHT+IFAniADR4GjyVerf35avzHe2YNEj+U3x5lG3bJMTYImDH1uA/NFT8V+MG9zRx5nA7WQCnnZ2g==
X-Received: by 2002:a17:906:b286:b0:a4e:44f7:9cf4 with SMTP id
 q6-20020a170906b28600b00a4e44f79cf4mr5587003ejz.36.1711977192308; 
 Mon, 01 Apr 2024 06:13:12 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 p6-20020a170906a00600b00a46d04b6117sm5308984ejy.64.2024.04.01.06.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 06:13:12 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  1 Apr 2024 15:12:57 +0200
Message-Id: <20240401131300.511245-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240401131300.511245-1-francois.perrad@gadz.org>
References: <20240401131300.511245-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711977192; x=1712581992; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s3I2tV4iomtdZOLaINkRBx5xFocVe49aBeT/JsRVios=;
 b=ZJxcq/5CkFGbzbgi3sUOnGEdui5qnKZWd3ryMn7ilsFXHD2MWPO1rEQLXcyBWrydho
 opzXxa+LjV0s5/dEx02wQEfmPdXWl799QX4y3gvEdyeGMJj2wJYWtTecKww9uMUEn1Bf
 2pPZbIH2e7p37O471p5kCFiwuzLUvfIFBYgYXLDuS0DMt6zFrZNzKTQCSNhXc3rhewKf
 1R98vytCix9B4wQIqQmfLb9beK0a4aHrnhfDzSbbKNZFoxoI11SAx6Jo0ynTyXXriNYv
 YTEinqhBoR50Ura3+/v12u/Kqz1Hh8kwamk6PS8IR09sjHQF9yl/TyepzzpfrfYxTw2h
 +BEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZJxcq/5C
Subject: [Buildroot] [PATCH 2/5] package/libassuan: bump to version 2.5.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libassuan/libassuan.hash | 4 ++--
 package/libassuan/libassuan.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index 084a09848..6bb5022d1 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  b1e8754dbf89b3a3eb175f5df75048dbca1fce57  libassuan-2.5.6.tar.bz2
-sha256  e9fd27218d5394904e4e39788f9b1742711c3e6b41689a31aa3380bd5aa4f426  libassuan-2.5.6.tar.bz2
+sha1  b6ccd955085dac902a09871f94a3d41a7667d0c8  libassuan-2.5.7.tar.bz2
+sha256  0103081ffc27838a2e50479153ca105e873d3d65d8a9593282e9c94c7e6afb76  libassuan-2.5.7.tar.bz2
 # Locally calculated
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index fb95a6fd6..9553c630a 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.5.6
+LIBASSUAN_VERSION = 2.5.7
 LIBASSUAN_SITE = https://gnupg.org/ftp/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPL-2.1+ (library), GPL-3.0 (tests, doc)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
