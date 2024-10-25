Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3B0D149CD
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 17:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7DAC4077A;
	Fri, 25 Oct 2024 17:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WSiNPetHg15; Fri, 25 Oct 2024 17:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CC0E407BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CC0E407BA;
	Fri, 25 Oct 2024 17:02:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF3522316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF92C60B15
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVVc00DOVbst for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 17:02:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3AB860ADF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3AB860ADF
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3AB860ADF
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:02:07 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a3aeb19ea2so8852335ab.0
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 10:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729875727; x=1730480527;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8wBlSDoyn+Z+Cjhfdh32QEVNFNV5lvzUIdbzDYtkiu8=;
 b=kkKiitg59K3J1p/oiUHv+TNI8KemNJAa0d4j9XT3Oc/N+2lQmx4Hx+i6zLAOwu9PXg
 MD0LJEQEIFZ2XBt0U1H8vp8a1HaDlweZakAmA1xRXnBkpkgCPZVr1quJMw94ZhdZ3vKs
 UmjfOrBdASouH7lR8+MXt+Cmmeon8cE4xKj9+3gIv+RcatHfoeEN3ui53KGxsFo6ykq4
 2+4Vvz1IctudpnT+87VYOSsBfnSxT2qXX1W2eE8RrXhMVIIEISM8r/87/s6YmoLhL1yK
 Dsz4QI2+OnjJEMVBO44SVeMmg63A6TY8xgSyHZNFJd5nZa/89/fAdvHSFIO8YFqNKI7R
 BCww==
X-Gm-Message-State: AOJu0Yx7Sa5bcRZ1AjcWyxASR4cSrh0DhGoz6TG/pD16r/WW/FnQDjcC
 3vhIpWJsHrH9hCtCHF47eBejzupAhTfVD+Lq4F2jWwwcqRjZXUa8qKDMzg==
X-Google-Smtp-Source: AGHT+IHl0LTIw2TeRs1d1j3uyuoyYBbI1qO8k613bGbs8b6Apx+CxK7o72mYnMQJ8Xt1XVCImPmnQg==
X-Received: by 2002:a05:6e02:1ca3:b0:3a0:4250:165f with SMTP id
 e9e14a558f8ab-3a4de6e251dmr67841625ab.0.1729875726486; 
 Fri, 25 Oct 2024 10:02:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc72784f8dsm334677173.150.2024.10.25.10.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:02:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 11:02:04 -0600
Message-Id: <20241025170204.3526159-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729875727; x=1730480527; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8wBlSDoyn+Z+Cjhfdh32QEVNFNV5lvzUIdbzDYtkiu8=;
 b=ENIXG4VzpENzWBaAcRJ5gai/YVH7ZlS4YTyvDZPzH6oG2p6omD8eh+KYvv/4id4Zmo
 6uhCRToyIx/ti1dUtHQX6xTnbB3IZBOIpD8OwFbyd4WJa1PCe0hMegGaGeLiCY/tOvLs
 MXV0pogMHEPHNN2HdPhxrHHz0x1THm6ztI2hN4/kFWX8i6p/gUYaEZYedm89+I/6uz2i
 VpkeaixRy095xjM2XAb1HP+j7KxAdMca0HXjdwtZ27KOSR+iAUBgpO225XTDyhKWCa/O
 Joa1/r1zpineoWmdXWCIk1gmGRDjQyoyGudSHOdNyih0LFQm87dTYNuAcJQVAtqz4aG6
 vsvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ENIXG4Vz
Subject: [Buildroot] [PATCH 1/1] package/python-bitarray: bump to version
 3.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bitarray/python-bitarray.hash | 4 ++--
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index d5141ec728..1a75424e02 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  476b9153ce4842182a5fed2ee0f83280  bitarray-2.9.3.tar.gz
-sha256  9eff55cf189b0c37ba97156a00d640eb7392db58a8049be6f26ff2712b93fa89  bitarray-2.9.3.tar.gz
+md5  2a23854c5c9c777625996456c9c88883  bitarray-3.0.0.tar.gz
+sha256  a2083dc20f0d828a7cdf7a16b20dae56aab0f43dc4f347a3b3039f6577992b03  bitarray-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6b5e04f6e0462e1b97be833f9d65e66cd5eceb3283f4a6f532261087d0ab1233  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index a15de6774c..5f47976a41 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 2.9.3
+PYTHON_BITARRAY_VERSION = 3.0.0
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/0d/c7/a85f206e6b2fddb93964efe53685ad8da7d856e6975b005ed6a88f25b010
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/85/62/dcfac53d22ef7e904ed10a8e710a36391d2d6753c34c869b51bfc5e4ad54
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
