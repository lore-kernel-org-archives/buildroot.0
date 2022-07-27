Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA52C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE07C81551;
	Wed, 27 Jul 2022 13:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE07C81551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_p88i-XSVrI; Wed, 27 Jul 2022 13:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE5B881489;
	Wed, 27 Jul 2022 13:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE5B881489
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A7F21BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E84B5410B5
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E84B5410B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEKv8dXuD5R3 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:34:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EF5940A7A
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EF5940A7A
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:34:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h8so24193989wrw.1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5XeJKY6Sv493fQAvc7igTPNt4tw8z+X+3Kj0L7HQ6dM=;
 b=Pm/c7YNfhyiWHzqUI7Qn040+6ckO45Jh2HvY86pzAJvA6yM9XVflfAk7zK8f4jQsYL
 tdQmwCm0QswqxDOihwrIoUVhY9Ps6IMvPymq9op9txjNbhMCtyeitKSqM/OZciGSZb6n
 bJNG31feGGmKGQcnsT6UdZMM4VaC+9b0vXNb8GNf7ET9PpQXtlY4oczjxepJUpfv/nPE
 ZxXs9rs7lDMbquhkt2ftT87glzWAfD/XYugmee1JxfUBdsx9Of1x6p+vc76NIpAKMf35
 /xsI7QrYs9pQx+JNEp4UDBiwWUjaFzlbN3kl/MxQKKy+jg0GZdFkuRjEQT+UYcHOkVD/
 1YLw==
X-Gm-Message-State: AJIora94UtXTXc3mdeeyG0F9JsSKkuzg0F8Y9493WsNrnI9p/fnYGpEy
 +GQWrPGRHzr34ji1OVbqF+5C78hOjYg=
X-Google-Smtp-Source: AGRyM1svNoKVTFTky36burVw7qzyvsKfJoufSVOJ/jsCkV2G4FQL5YYg7dyJmwMxgKAs6FZd6ydTwA==
X-Received: by 2002:adf:f5cf:0:b0:21e:2ebc:4126 with SMTP id
 k15-20020adff5cf000000b0021e2ebc4126mr14470658wrp.195.1658928871480; 
 Wed, 27 Jul 2022 06:34:31 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 r41-20020a05600c322900b003a2e89d1fb5sm1557738wmp.42.2022.07.27.06.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:34:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 15:34:28 +0200
Message-Id: <20220727133428.1324337-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5XeJKY6Sv493fQAvc7igTPNt4tw8z+X+3Kj0L7HQ6dM=;
 b=k5MChEaGzwy+lQh4YuBWkWHVEZW9DGpR4oASkHAhA7l37Bj7eMtAii+q03HwLDNkal
 eNeNJKKTKzmoz+pfoEcUGCWUhwNQusdxx5k2LwY2PC5INPUKR1ZjQXVnqd+Pb+HwMR3P
 1VrI/rOOWR1JgjZUFLCdbQN3o0eR18pj/L38m2uEsqAGRJoSBSVMF/YMViy+kQFzxJSx
 Z46PlfehaJOdX+9lXQWz/GtdY97pr9PQxAQA4TXFVWKP9dbDHIWWSsZAyPdHonAgXlMa
 8/i/mrS3uRm8cWc+IKJyVub6M4TGNPYEMZeCGv2u7kZkxJAwiHC2pOp03QDojV/KjgQ8
 l/mQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=k5MChEaG
Subject: [Buildroot] [PATCH 1/1] package/gdal: add GDAL_CPE_ID_VENDOR
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:osgeo:gdal is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aosgeo%3Agdal

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdal/gdal.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 0d42037ad6..c75b7743ce 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -9,6 +9,7 @@ GDAL_SITE = https://download.osgeo.org/gdal/$(GDAL_VERSION)
 GDAL_SOURCE = gdal-$(GDAL_VERSION).tar.xz
 GDAL_LICENSE = MIT, many others
 GDAL_LICENSE_FILES = LICENSE.TXT
+GDAL_CPE_ID_VENDOR = osgeo
 GDAL_INSTALL_STAGING = YES
 GDAL_CONFIG_SCRIPTS = gdal-config
 # gdal at its core only needs host-pkgconf, libgeotiff, proj and tiff
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
