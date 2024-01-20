Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84D4C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 21:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E9A6421AA;
	Sat, 20 Jan 2024 21:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E9A6421AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31DGp4sccPqr; Sat, 20 Jan 2024 21:02:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA23D42137;
	Sat, 20 Jan 2024 21:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA23D42137
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F40D41BF2AF
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D988083CDB
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D988083CDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0cGdbFx_ubB6 for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 21:02:01 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFBD98399E
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 21:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFBD98399E
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40ea948fd3fso2512615e9.1
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 13:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705784518; x=1706389318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+hbCQ5TAxjCf3uLWcLgXlqTTAOp/Hsx2W/fAiulv1eE=;
 b=YBRsyHxSNbrPcY82zTMtpigW42JKCPJB1UGD8nmHKh1isQBIEjUFxi41G/cYIIB9Kr
 TfPH2Yme/l6JtwhavZMBVFtlOoaAtUSY8acVwG4Nv1ZGMjZTn209+KlMLvA/OFpzC1jz
 IUfliUGkpd+d8e5Rh7/JgNFpY7pBzA9Av+T2tdM1uUkdX58kl9x0Z/Of9NYZey816Uoj
 KljHYZWUjhRvKnrKA9tlQ2fU0/vH2PKVZK4E4S2lim/ewjp6RPnDYbaRCmrmEFFH5XBe
 Eqwqtuo3SrMsnNLJ0Ft6ZmlxL1NRJ3VQltB79JpiIewAB1KatvK1hPYIC+IrKJWSJXYQ
 UeJA==
X-Gm-Message-State: AOJu0YylJTM7kk/GDjkk9ytyiQO3uVujZ3eduWAGaeOCpmXdoIWliWh2
 BeFK3Ee3vIH+PbEMnFss8VODyeB7HQGvshqplUMA7stTZLjCKXfw1VNbciC7
X-Google-Smtp-Source: AGHT+IH9orOW2gKJTsXW63E5nMPQ31BZybfmz1lL9kcRLpfxMwDoGTU9iT5g/hPhrYMoxGaoRVd7vg==
X-Received: by 2002:a05:600c:1f94:b0:40e:a456:3570 with SMTP id
 je20-20020a05600c1f9400b0040ea4563570mr828098wmb.15.1705784517963; 
 Sat, 20 Jan 2024 13:01:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c45c800b0040e527602c8sm37802814wmo.9.2024.01.20.13.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jan 2024 13:01:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 22:01:52 +0100
Message-ID: <20240120210152.78860-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705784518; x=1706389318; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+hbCQ5TAxjCf3uLWcLgXlqTTAOp/Hsx2W/fAiulv1eE=;
 b=BsMzjR5TTXG7DBakX8lCTx/V11evyflDf0p93t2d+21Me+tpJi5NQWHc7z6h3928gR
 M5HtyxSCqHpoQWgpc8LexNp4WUFy4aAKah/Vt9geoLwLqlqV1DrG6R1jWvh9tb9ShAE+
 1ri7u8KtKcdFziKMKCoNx1Y1XmJMotfVQ4DoyW9u6hGbp9yiK6vIkcNfrjkhTyWq9k28
 umV0wrwDvESkxrjj6v64bCbD2HDiHaYAdPPzmAwbZ3rt1GQ/yUHGBJ7SE1lY5ucO2F64
 5hYCqfjokUpUnojNIuD4yLoPUqCroBdIWtS8ppmO7Hyo6Y9IdXmXQxur8SvxrRaHwGiF
 AB4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BsMzjR5T
Subject: [Buildroot] [PATCH 1/1] package/python-hpack: add CPE variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:python:hpack is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/9DD17147-CB76-4A8F-BE82-4AE1BC7BFCD5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-hpack/python-hpack.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-hpack/python-hpack.mk b/package/python-hpack/python-hpack.mk
index 3cf534d055..4b581c1001 100644
--- a/package/python-hpack/python-hpack.mk
+++ b/package/python-hpack/python-hpack.mk
@@ -10,5 +10,7 @@ PYTHON_HPACK_SITE = https://files.pythonhosted.org/packages/3e/9b/fda93fb4d957db
 PYTHON_HPACK_SETUP_TYPE = setuptools
 PYTHON_HPACK_LICENSE = MIT
 PYTHON_HPACK_LICENSE_FILES = LICENSE
+PYTHON_HPACK_CPE_ID_VENDOR = python
+PYTHON_HPACK_CPE_ID_PRODUCT = hpack
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
