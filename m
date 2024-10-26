Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33491D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 22:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB2C74023C;
	Sat, 26 Oct 2024 22:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XM6KW-z9XfG; Sat, 26 Oct 2024 22:54:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABE954023D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABE954023D;
	Sat, 26 Oct 2024 22:54:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EB5D85C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB6174010F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tm43Wxrl-_L for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 22:54:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94A8A40175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94A8A40175
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94A8A40175
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:54:44 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a3b4663e40so11802705ab.2
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729983284; x=1730588084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MC+OV5ZP+TyNaR1dJI8488XsflbR4AvtJtcec0XvBJg=;
 b=JMZKvPhZPnct0qggUB+OxcW/QOf6s+zHZEup3bzaDDnK/HmrQc+qaeD0F3DAAIaaX5
 oz95DA8nSmNn3fcVYT1KjAx49sgl+VTv6C1K/caXWAfRPZ2zbNrdWRfN95Dd7pDwBG5P
 wF5H6oS5VEIxnCNMO0mVqJaTEyuXowAn3gVpYQdTftMuFVKvaHQtODL8DMxVrUleveDD
 fEHGf0fuVb1NbFQ77SNqto2dZGOq6DCHwo14g/SiDIk65CXsfbRc1vacDTcFyuGBvXkj
 FmrJi1NDXYduygBUnqnuWzomMGikpX6KpHMPoAJZ35NSgep5aL9nzG5r8bP6LgC78Ns0
 JYgw==
X-Gm-Message-State: AOJu0Yyu6zmJQhf3/4Pu+E06rEoHtQvVPWjiryVg1vcTGif1HeCS9JCH
 sPy0BNrTamR0I8liTgGA706MUPgghx632gXBTLu0eXXg7O75T3iH9vgcHg==
X-Google-Smtp-Source: AGHT+IG7KN9aZx7z9SnxvoT9+LxDD8GxQYrGvoh9gZa/HMqP2Znddsqbmo118pDGLKUGf46kDfHP+g==
X-Received: by 2002:a05:6e02:198b:b0:3a3:632e:f009 with SMTP id
 e9e14a558f8ab-3a4ed36f819mr32775065ab.26.1729983283599; 
 Sat, 26 Oct 2024 15:54:43 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6e591a1sm9138925ab.64.2024.10.26.15.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 15:54:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:54:41 -0600
Message-Id: <20241026225441.3850666-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729983284; x=1730588084; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MC+OV5ZP+TyNaR1dJI8488XsflbR4AvtJtcec0XvBJg=;
 b=aFQIshtteatP26aJCiftQm+oSMSHtwhljz/J0M938RYH04kgAIOCQrsbGcoBXbzmQ2
 I2/evN0hB9+JDGfzo7KiOqynWcios7NYQEzZMX2f1ux+/uGE/Sb1zY9LfhELIMNTRZy1
 GLrtsN8m9AbVvH8SCnrH1ZFl1at8KVy8TVNoVCx2JOT6LF8UDTkzIX4xsyRVVqmYBT0x
 dr3X+He5QGAt3jgDWAGcpwdyXQ9LHO1JEAO5Ol19MWcak8/WuiCzGojBEHY5ODwO1oGb
 eaO/c+kF7N1+z6OEDBOz9L022Kf5nlgh8QvzbmnsB7GK9+7IVfdC16OYzbgmoclS58yy
 KWDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aFQIshtt
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.25.0
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
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 14d5a748ac..8280447a14 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  0f8ba0c69bf7a2939dce9219b40187920ef8ab36c822b441a9ba3ab460cb2e4e  python-pydantic-core-2.24.1-cargo2.tar.gz
+sha256  34fc9b62235ed33320ee6139dff66da88584fc08a7322a808526b95aa3141449  python-pydantic-core-2.25.0-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 727632dd52..0ac54265a4 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.24.1
+PYTHON_PYDANTIC_CORE_VERSION = 2.25.0
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/12/75/85049f16024330b2cb7318530e26ab0da24f3aa17f07191b6851aafdd5d1
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/b5/fc/4e4d9ac36c99c2bbb5a87885abc508f7d274706a571e3be253dc570943eb
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
