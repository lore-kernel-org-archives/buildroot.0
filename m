Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DEBC531F9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 06:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B35F18110D;
	Fri, 24 Jul 2026 06:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZ4l9XqXm2Q0; Fri, 24 Jul 2026 06:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6669081112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784875819;
	bh=aBpgDzVWDRcESszSb2FZazSRb7aaWSR+U47fEyVB5Es=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JDzq+bZ8gGoubGrDdlLgN+XDwsIAO4mV5jQ7UhYaw1rdqznw5IemgijCz9wxAHL/W
	 CODJ72RpKhxWVaaOOhoGBslIhPWD9b7jACJT7hHk1xhDM8ubWCvTCHrb8NpDPh5eZr
	 QvgClBdCmnGZGdYDMh/a+aleGbqj1YUtpA6tIYEDKZssAgzAG1YRAPQT7RyzJyxUv+
	 lB/eW+eR5FZZs0zvAOF/xslgzf3OOecm3iPtVs2E7KRn3UJMp9s5wtVxVfRw4HWDgL
	 ryr6+Z2om7xvBskaSTiAacJKV3dMdiGJihbSsvymjLKqXRSjW3LqT2iogyTLn2s3Lt
	 Yrchkfbc94gtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6669081112;
	Fri, 24 Jul 2026 06:50:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC3083B0
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 06:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0A0D81112
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 06:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgLXSqCyf4L3 for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 06:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C203A810CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C203A810CF
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C203A810CF
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 06:50:14 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-47f96c5b722so69359f8f.0
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 23:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784875812; x=1785480612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ArHTF/b7m6WaFW0vgbuI0b16PaioXltRlVpbo7loVT4=;
 b=rJI97yJwEz3aDMBTNWXiekqQT1mIos0/nQ2lyORBbBfadlKscceyKAi7ekM8L6klM+
 uD5s6vt9xJib1APegKCVUNY7/B9dUl9H7NbI+gjne9B7AbHsjhMx5GNF2ADBcMVwIiJH
 W5bDAH5A4t2Iy+hAvarv8NSrCACGyuk3d5lXh7YGsgm1lI/pRyE2CnlPDAVyszRXsXYq
 ljEwiLiyRzq1EikxHTq2QuzJh0K/3BqUAifoAQ8G4IkhcIO33gHk7zx80pJYjQgSJWeI
 MESDQ40EC2QyB0lPASweWY+WJ/ruDKlLaAjpluQqMWJ3kfkWDT0QlYZE1L9Ho4GLHWu1
 /ypg==
X-Gm-Message-State: AOJu0YwzvC24kteONCJA2nEitqbo31jrTVPE3jKEY87lVa4Z2cmkq5eB
 RRRJD7b/9hyuRSdmtrKvWvsa2M+aRDDsw8ROP2hVMtfqAZYgAHHikGzGXidq0vvA
X-Gm-Gg: AR+sD10XsRRNqkZ68U+PZ9FZjEseJziLMnV6u8d+58emUUSc/pNwusKGM/gCLwrbGpO
 hU1S/zGMdJoOg2KvHYdP54VbtXHSEGUx3VecGwyXYHj8sOt0xP41IXe6ylXB7BA8Py6vY0rIJVz
 Wp+R5eOYjjdPJE1aJbVSCNo/Lwyj7h5ULdMrtv5iBbonvsrwV1cSZnWBlU7O1Bg/sX2TwWSbnyJ
 WWE53kOgYT/IYuOWrtRFUVaDRWTCHwOK5M7gTLBsv5bS3xgnbJmtSBJgbLis22IFj1auWx2EB6O
 RpuThN+nowJM41ew1y7Y1memDZ3Hkat1EVNgujIZTVn9D40XDFu41LZYRFt7wfueM8LLczNuEAs
 NTZPuC6m0cFuiGbBsGIrsrjLQiZmSMWX5/q2pQIWsHCSZKYe5LkGqy7eF8sVrctZF4+KOt87nBm
 B7IDYB44Cy536OMCFvOs50C5RhHttnD6U6X8JLp7zNU5nvU9XwXNwTRw==
X-Received: by 2002:a05:6000:420e:b0:47e:bf36:a612 with SMTP id
 ffacd0b85a97d-47f8dc963f3mr7537889f8f.50.1784875812322; 
 Thu, 23 Jul 2026 23:50:12 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.94])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c53052sm21166675f8f.18.2026.07.23.23.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 23:50:11 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 09:50:03 +0300
Message-ID: <20260724065004.217411-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724065004.217411-1-flaviu.nistor@gmail.com>
References: <20260724065004.217411-1-flaviu.nistor@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784875812; x=1785480612; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ArHTF/b7m6WaFW0vgbuI0b16PaioXltRlVpbo7loVT4=;
 b=V+xFEKlZ3siEbCtRlX0EjAw7m+hfaRr3ixGCMB05b5WEy4mjIks+6Icw5xbB02Jxmp
 fcyqRxhyC7B1x3PNRGwh5BQWQWJaezjopI480UqSvyQ9DjM4iu1+EzAVpl/xRUqAD86l
 SXwgl7S0TQx2A6z8P/STRcMomrGcHd2KFByZ+Fy/vSyySHR3xCFnEKUK4n1RwSBz/MDw
 p3i+9GjE29eGdEDP+/XheRSDRzBKN9Tx7zFkEYb9xMq4g8s/XyYJ/+tPSGSNKlcRVoXX
 3Ia0Tiu8yTXOLd4iaflItoHuVxd5MZdObrPE709pcYc+URhN6Oj2Y8+1haH+E7XnE9q7
 Jcmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=V+xFEKlZ
Subject: [Buildroot] [PATCH v3 2/2] package/python-snappy: bump version to
 0.7.2
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release
on the project homepage, hence the bump to 0.7.2.
Since 0.7.0 is switched from snappy library to cramjam so
update the PYTHON_SNAPPY_DEPENDENCIES.
Add also PYTHON_SNAPPY_SOURCE for correct package on Pypi.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v3:
- Add new package cramjam and to fix error indicated by Julien Olivain.
- Link to v2: https://lore.kernel.org/all/20260717061943.4491-1-flaviu.nistor@gmail.com/
Changes in v2:
- Fix error indicated by Julien Olivain when running make python-snappy-legal-info.
- Link to v1: https://lore.kernel.org/all/20260409152520.5894-1-flaviu.nistor@gmail.com/

 package/python-snappy/Config.in          | 1 +
 package/python-snappy/python-snappy.hash | 4 ++--
 package/python-snappy/python-snappy.mk   | 7 ++++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-snappy/Config.in b/package/python-snappy/Config.in
index fd7f84050f..2853e4331c 100644
--- a/package/python-snappy/Config.in
+++ b/package/python-snappy/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_SNAPPY
 	bool "python-snappy"
 	depends on BR2_INSTALL_LIBSTDCPP # snappy
+	select BR2_PACKAGE_PYTHON_CRAMJAM
 	select BR2_PACKAGE_SNAPPY
 	help
 	  Python library for the snappy compression library from
diff --git a/package/python-snappy/python-snappy.hash b/package/python-snappy/python-snappy.hash
index c4dbc72077..2f40b6c531 100644
--- a/package/python-snappy/python-snappy.hash
+++ b/package/python-snappy/python-snappy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-snappy/json
-md5  fc84cfa3526fba06d66f0d0b2e764300  python-snappy-0.6.1.tar.gz
-sha256  b6a107ab06206acc5359d4c5632bd9b22d448702a79b3169b0c62e0fb808bb2a  python-snappy-0.6.1.tar.gz
+md5  04a4e58b0a932403bb285900e67c778d  python_snappy-0.7.2.tar.gz
+sha256  04bf182f9d9f67b7a846dae2f1df36180ceeee8d3380e4b6799deff5272c4978  python_snappy-0.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a  LICENSE
diff --git a/package/python-snappy/python-snappy.mk b/package/python-snappy/python-snappy.mk
index e80aa861df..5d34b6d493 100644
--- a/package/python-snappy/python-snappy.mk
+++ b/package/python-snappy/python-snappy.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SNAPPY_VERSION = 0.6.1
-PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
+PYTHON_SNAPPY_VERSION = 0.7.2
+PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
+PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
 PYTHON_SNAPPY_SETUP_TYPE = setuptools
 PYTHON_SNAPPY_LICENSE = BSD-3-Clause
 PYTHON_SNAPPY_LICENSE_FILES = LICENSE
-PYTHON_SNAPPY_DEPENDENCIES = snappy
+PYTHON_SNAPPY_DEPENDENCIES = host-python-cramjam python-cramjam
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
