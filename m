Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FC9C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEFD241921;
	Tue,  9 Jan 2024 07:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEFD241921
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HHDfxcECCh56; Tue,  9 Jan 2024 07:40:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29DB941904;
	Tue,  9 Jan 2024 07:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29DB941904
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03F3C1BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDC6182457
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDC6182457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRRVn2lUOF-O for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:40:28 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0941B82430
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0941B82430
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3606ef221dbso16127925ab.2
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704786026; x=1705390826;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cdReqljb5KUSaGJbsZ2IjnPK4/pva5bIzVkxn+rryDs=;
 b=H5e0ZapRHjzlHXrMVm9X95US071Xzq0o9D7jnrF+7D9VsaPhN3E+uckTVOJOC8SZc1
 8B3zzDUsxgIdhwb29bbbuhbB1nnOz/9FOi2IIafBhhMD+Brk3g1Kf6CBBjrL5Hl4RTXJ
 /iq5WVwzKG8qSpRZ+Vfp3QIF1QMa7R0JK3Li69GwU0AQanRwH36ynM+ULaN5JCogIHcL
 MXWqh8nCJZqNxsMFfXV5RmOHPrFAzVKC6YTSC4+a6apGdAXSSEiSC1ITtLqqCxu9Kjhu
 HSu/IT4xj7Sme499EeZd8cddYQ8GRksx15ljNu+yALsJbYgdbw2eRYYQEIODJTLcpVzc
 jMaw==
X-Gm-Message-State: AOJu0YyA3gXKD6KKvN+7iPNP+MbWdpmP+Rk2xSIpKRZWjK9ZP5ov7X6P
 J/zsmxYjTfVvh382mTQ3J222m5jVl+UlrA==
X-Google-Smtp-Source: AGHT+IGW7V4WURykte21gUHJsD4NSVMrknG+6rffp4vKYD9WhSkPgfrXUKswzHC7UMlH6WFKpUBbIw==
X-Received: by 2002:a05:6e02:1aa2:b0:360:8ea0:e3ab with SMTP id
 l2-20020a056e021aa200b003608ea0e3abmr4146408ilv.53.1704786026715; 
 Mon, 08 Jan 2024 23:40:26 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 b4-20020a023804000000b0046df404203dsm477272jaa.96.2024.01.08.23.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:40:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:40:24 -0700
Message-Id: <20240109074024.4045632-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704786026; x=1705390826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cdReqljb5KUSaGJbsZ2IjnPK4/pva5bIzVkxn+rryDs=;
 b=nKhQs90FMmmVphvJS/C17jv0x5KtJW3O7GnV7FQ+iexQEO6zz6GD8c13EKQL88R9Xt
 dtLfA+rF4XLcHouXfIFoAqLPlNM+Z6As+hvGOJQC2b/r7Z1lQFPxfPaQZNRE0z7vq7t2
 OZdjC0RqYuGVkm5RFUR9aWhcnnJtLMZ4N9fEP0FcYwRI0TcbFoP0hAOoV9wxuMnBH7vc
 aPqItrw1ONLr2gE8cxVeAusMzLZnm+PCTEed0JLBp1vmIc5eAB0jDFC1DA5ImKApXUr+
 OOHoeCh9HiIuVwYFYHgIfOD81NiE90Lu4taoGX4c3sdnl/Ik8Mt2kTO1rv4xrHhXCoKw
 i1Gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nKhQs90F
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.47.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 8bcabb0c45..7476656410 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  717f907e93dd6be3dd46fbdcdc33bbd7  fonttools-4.44.0.tar.gz
-sha256  4e90dd81b6e0d97ebfe52c0d12a17a9ef7f305d6bfbb93081265057d6092f252  fonttools-4.44.0.tar.gz
+md5  767059d1d373ade070d38295feaa3f92  fonttools-4.47.0.tar.gz
+sha256  ec13a10715eef0e031858c1c23bfaee6cba02b97558e4a7bfa089dba4a8c2ebf  fonttools-4.47.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 2f8a738600..e2472aa184 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.44.0
+PYTHON_FONTTOOLS_VERSION = 4.47.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/6d/f8/d3116b436553856df4ed9094584ac55c5e99ee9d9f3369f2912bbb8d0b90
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/dd/e5/9adc30ebca9009d5ad36c7e74462ee5fc51985ca9a845fd26f9f5c99b3df
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
