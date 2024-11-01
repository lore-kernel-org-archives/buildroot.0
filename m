Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58750E6F092
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 22:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03201405E7;
	Fri,  1 Nov 2024 22:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tpyur6JRk5xj; Fri,  1 Nov 2024 22:14:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B80C5405E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B80C5405E8;
	Fri,  1 Nov 2024 22:14:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2092E112A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0E3E813E9
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQETeh55uVHR for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 22:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A9C8B813EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9C8B813EB
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9C8B813EB
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:14:27 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-83aac75fcceso86523839f.0
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 15:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730499266; x=1731104066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xx1aUJeelbg2ybkIQUPkupvHJb4jVG9x98hAk1mDqgc=;
 b=OnltopiNxkQ634LyWEFZZtMZHUuGc8Pd4Yam0JDusn3MN4DOqZauIsefRWYnWi4ZDP
 aUAVGpxsaBWyBK84vKB+TZeKRA/12pmthc0X1L/Bt0synUcn2trGXi1tccFEvcfcFc4S
 /VNpFe0q1PIsH9CmmuPnDlmare/g7f8NbhwKPuK2haTgIjr8SqNE98UZmdFyBHrcWeoN
 rsd/bpVC1tba9e8aL4bCB/XLqeRUXF7BaSMULEZzn9tFmvPpFd2kkEVbpRYXEYIOPqdC
 EG9weCdPI7G99lZi4TYO7v4zkV/mfJYF0RrMD7Yzfu1Hnfpiphiul7HQWZNltQYnjO5h
 6c5w==
X-Gm-Message-State: AOJu0Yx+mjNuh3HL7bds3v2bJUcMqVzHHr8+ia0VblYhERFMVDGtA+/A
 6E4IG6w653sIB3BWd6tmqediEZ0MDeSW3SlC4qiOiczEUdy1WOigtRw2YA==
X-Google-Smtp-Source: AGHT+IEgerKR+B8az/SKXoSqkhcSzuWtHdofWNHNADTjkyjVhQ/k/NDrZClNVZwCLSlonPUV33mG4w==
X-Received: by 2002:a05:6602:6015:b0:83a:b33a:5e0a with SMTP id
 ca18e2360f4ac-83b71947e2emr522938739f.4.1730499266346; 
 Fri, 01 Nov 2024 15:14:26 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de048bf432sm928025173.44.2024.11.01.15.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 15:14:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 16:14:23 -0600
Message-Id: <20241101221423.1303398-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101221423.1303398-1-james.hilliard1@gmail.com>
References: <20241101221423.1303398-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730499266; x=1731104066; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xx1aUJeelbg2ybkIQUPkupvHJb4jVG9x98hAk1mDqgc=;
 b=cetuUdnSuRXYJTmuxwAKo1dZv+wG8MZ8C8gZ6R1Pe1T5FiKjRRFoHAQMWSOBWVBHI/
 rWxJVJ7LIM55m2BeUiPac4odOLX8kS5Sf3dCYsx2GVrx8AMSel+hNahdFU0O1DBq4jIy
 3mVBGxbhCuM83PspmzkUffd+vDm8pAPBdcKShROhOLSQ69Hkfq7ttYNLipMQDZvLDFLo
 JPcfMDEU9NTQ1kpqH9fZL3EEgq0pIEg3U/CcBD9GjYgqO3AgrCijadND0uwvjL+1FWyT
 ofvugmMcHv7q4C04CfWojoqlEYMfWgm+GkKbuIeEkaORiVdpow39UYRefEupHQazHUbe
 F8Pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cetuUdnS
Subject: [Buildroot] [PATCH 2/2] package/python-weasyprint: bump to version
 63.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace python-html5lib dependency with python-tinyhtml5.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-weasyprint/Config.in              | 2 +-
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-weasyprint/Config.in b/package/python-weasyprint/Config.in
index 65210fb1eb..5ed84e075e 100644
--- a/package/python-weasyprint/Config.in
+++ b/package/python-weasyprint/Config.in
@@ -5,11 +5,11 @@ config BR2_PACKAGE_PYTHON_WEASYPRINT
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CSSSELECT2 # runtime
 	select BR2_PACKAGE_PYTHON_FONTTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_HTML5LIB # runtime
 	select BR2_PACKAGE_PYTHON_PILLOW # runtime
 	select BR2_PACKAGE_PYTHON_PYDYF # runtime
 	select BR2_PACKAGE_PYTHON_PYPHEN # runtime
 	select BR2_PACKAGE_PYTHON_TINYCSS2 # runtime
+	select BR2_PACKAGE_PYTHON_TINYHTML5 # runtime
 	select BR2_PACKAGE_PYTHON_ZOPFLI # runtime
 	help
 	  The Awesome Document Factory.
diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 01a3488739..3e27405846 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  4d3fd0b160d17d5cb36c2f2c1c231723  weasyprint-62.3.tar.gz
-sha256  8d8680d732f7fa0fcbc587692a5a5cb095c3525627066918d6e203cbf42b7fcd  weasyprint-62.3.tar.gz
+md5  3c9e76bdee0db8aaef391d658cbdcb7c  weasyprint-63.0.tar.gz
+sha256  ec24c64fdcc63e4168b2c24eb89b1ee8a711281a7d7fdb3eed3f54995489c9d1  weasyprint-63.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index 06f41fcfb8..2619351cde 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 62.3
+PYTHON_WEASYPRINT_VERSION = 63.0
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/fd/22/2d76310cd2ea5bbf03c691a08d48626f49853b7261a51bbdc0f834d746ca
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/78/57/213cd566b7e14130d62babd91c5c5c2b94cbdbcdc0c7a0936a236bc88db0
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
