Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7764CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B94B1416E2;
	Wed,  3 Apr 2024 08:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79q3j3sFyGJy; Wed,  3 Apr 2024 08:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8896D416E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8896D416E9;
	Wed,  3 Apr 2024 08:40:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AFD91BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 394CD82023
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqDVrBcwCEnX for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:40:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2FED78202C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FED78202C
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FED78202C
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:40:44 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d718efedb2so92419621fa.0
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712133642; x=1712738442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RxIY4AytLHWxdwhpp3RTgGLqEQbO3nBMD5JvCP54Yb0=;
 b=TRpukD7QZ3cC2Vcz3OA+uNFASrWtRaDagv9ZsWkkvqR8Q+339IdmHdocvpPDp34Fv6
 Cer5S73L/eMnEZI2fSYKtnwG0EK1B5TapXKdxzreLlsCqtMjwyxAs3iIoFOuIPt8LpKy
 XqrNWGNWW5jVMNb1te5gtLWKv3xlHXlognP3i9O1SVKTb1bjJbbzC07xkmTRPcAU5LjY
 iNgOzZs+cbDZmY4dekgQ5sk7kMvNB2vuV4CWZ5Jgy/T6mayBkBoaGFdUnnyKCG3rJvPt
 T2LtySsz/G00Fg9z0mF3P8pWn0GtumeJgYjfpviybc2oOepQE/eN02uoPlRVwyoHFTr/
 fQ0A==
X-Gm-Message-State: AOJu0YxzzgrIhFwhJmNnub70kzvgm5qFLTuwiOIK/qNu5/giHUeeZjUW
 HsMyi6W3Rx7yrPugvh9rDij/A9mvs0W8Odg4SRRbT84KU5LXHh/eshlHDvIgEsM9aHiwlNPmCS0
 =
X-Google-Smtp-Source: AGHT+IFysU/XQL1vkLvQev5p7pG8tnIm15y0qwpTgaOdELOYUhMPe2FrddeZqEib9K70DZedZVg7YQ==
X-Received: by 2002:a19:9148:0:b0:515:b0be:3a42 with SMTP id
 y8-20020a199148000000b00515b0be3a42mr3503537lfj.33.1712133641732; 
 Wed, 03 Apr 2024 01:40:41 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 n9-20020a1709062bc900b00a469d3df3c1sm7510691ejg.96.2024.04.03.01.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:40:41 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:40:33 +0200
Message-Id: <20240403084033.512286-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240403084033.512286-1-francois.perrad@gadz.org>
References: <20240403084033.512286-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712133642; x=1712738442; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RxIY4AytLHWxdwhpp3RTgGLqEQbO3nBMD5JvCP54Yb0=;
 b=K7ohMnx4ZykVCRns1/KKCvLK6eLuEt7FBAWYZ8/jI/BL8qZar6WgVCfB+NMQj6Fe8E
 XclyJcx1brbbIx/y+aDDPCZLoEzgeKT88UTliRyrhgO4+rA6tiVCCBCKm1wA9fTqcHRU
 vnUDiyd9V7lKKfA+ByiOvqs8Xd2epsj44mGhEnnmVhpP4vCJgaF6pE+hvHvJ8iVXVrb0
 CpJ/8KwtElwbIFf/XED4HHC0NkVx2aZzsNHYOssEMWlvll3wzufqalrjuDPEfNDKxH48
 ZAx5hEvi3lLTLqFzQMyfDlsp3EsLXTObiTaZZoiHp+jtbLDIGVFOP99k7PY9PDsemEHA
 RZTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=K7ohMnx4
Subject: [Buildroot] [PATCH 5/5] package/libgpg-error: bump to version 1.48
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
 package/libgpg-error/libgpg-error.hash | 5 +++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 5c445ba0b..3b3464592 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,7 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  94668233fd7bd8e7c0ec5e363134cd53c575da60  libgpg-error-1.47.tar.bz2
-sha256  9e3c670966b96ecc746c28c2c419541e3bcb787d1a73930f5e5f5e1bcbbb9bdb  libgpg-error-1.47.tar.bz2
+sha1  8bdb504750b4da9e7daffa164cf1ed9900671f32  libgpg-error-1.48.tar.bz2
+sha256  89ce1ae893e122924b858de84dc4f67aae29ffa610ebf668d5aa539045663d6f  libgpg-error-1.48.tar.bz2
+
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 60e3da9de..3dd0ec94d 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.47
+LIBGPG_ERROR_VERSION = 1.48
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
