Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F72C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 07:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C5FC402C6;
	Sun, 15 Sep 2024 07:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLAvxyfM4nTq; Sun, 15 Sep 2024 07:14:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB03140981
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB03140981;
	Sun, 15 Sep 2024 07:14:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9535C1BF282
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84B11402C6
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsJZMUKJm-ix for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 07:14:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A2A0400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A2A0400D3
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A2A0400D3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:14:52 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-82a626d73efso125646839f.1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 00:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726384491; x=1726989291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JaWBsNwR/KZdF98MxGo6qzlnV5ynbEEOHrC3b1sgEnM=;
 b=PQdaz1nehRTndxIaT064UyJuFBLIM4wfko+ec1p3bDNe+ABnXqANPo5AZQ/fx5x6S8
 onfnqs5ztQTUlm22pz4m+q3cYc34ChGF9HALj/Qhi8vTo6UADOwgduAQLaCX4jZeN3EA
 5xGzl2BX3xA8yncLSUOr9yPRunl7ppziHPdyWsNhY2qnml755Es6puMlt8erHG6xypd2
 D2wdY00ghWrwU0GS0AqBTEGf/DQ0PZZ/PPyjwkBMCatNKaMJqjdZJrwYZ8pjRvIycf5H
 YFtEyOoCgDnX08tbSvzxioESTIC4lVNm5oVds55vdrxyUmEmLOmngbOhy3kB+Fk7CCeo
 MxeA==
X-Gm-Message-State: AOJu0Yy7RqC1Km0zXuQ8f4OVPxSPX4XnEn5zOJ/AvXg97dVI3ZIQGGvE
 E7ix8zHkpxDiSKbdu0e3Q88Ie6qlQickTY90EDZJypdyJCUc/EKgDFeKdQ==
X-Google-Smtp-Source: AGHT+IEJCjFI8V162h5ze/LJwpMOQAFVZFf3dUNsUZLTdYnXbz4bxDNij9wlXwTQ9sTvt0zzDlj0/A==
X-Received: by 2002:a05:6e02:198b:b0:39e:68f8:43e5 with SMTP id
 e9e14a558f8ab-3a0848cb45cmr118411625ab.9.1726384490822; 
 Sun, 15 Sep 2024 00:14:50 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e71ccasm8852965ab.69.2024.09.15.00.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 00:14:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 01:14:47 -0600
Message-Id: <20240915071447.1540596-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240915071447.1540596-1-james.hilliard1@gmail.com>
References: <20240915071447.1540596-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726384491; x=1726989291; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JaWBsNwR/KZdF98MxGo6qzlnV5ynbEEOHrC3b1sgEnM=;
 b=BLmBRc7Mnxk90MUA0ey7V4+UUEstqfEa0pwVY29EaSV5EGGJL6V1ragfT20g3hafRZ
 7sJ3bJ+LWXwOE7Gg5m44VI6jCJgwSYKdVH70snDC4Jg16O2xOzuWequBP4Lzf8AgxLLq
 K22BEMUj28GZ93+QuxrJCHcshTHEZAedcc3y6LCtomTi5bc6fXdWqjhrxtr0d9zWoLTD
 yO/W/gTycJF+oDw1Nih/rYW0b2Usdq/lLq3Ez9ZEnV8KZGMtaOO4iRETNSsfebSeT6la
 4JZf72MXCldLbTTlJXSg8Dpl5uhEGSH7HbHuJ8yXURivSwHHfL45pr4MADW4gNAwDwNp
 9dyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BLmBRc7M
Subject: [Buildroot] [PATCH 2/2] package/python-google-api-core: bump to
 version 2.19.2
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-proto-plus runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-google-api-core/Config.in                   | 1 +
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-google-api-core/Config.in b/package/python-google-api-core/Config.in
index 689923a2f4..21fe361e07 100644
--- a/package/python-google-api-core/Config.in
+++ b/package/python-google-api-core/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_GOOGLE_API_CORE
 	bool "python-google-api-core"
 	select BR2_PACKAGE_PYTHON_GOOGLE_AUTH # runtime
 	select BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS # runtime
+	select BR2_PACKAGE_PYTHON_PROTO_PLUS # runtime
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	help
diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 5a1cd7f1cb..7a52c94417 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  58a4ce34a405e514cdb5295c80834cfd  google-api-core-2.15.0.tar.gz
-sha256  abc978a72658f14a2df1e5e12532effe40f94f868f6e23d95133bd6abcca35ca  google-api-core-2.15.0.tar.gz
+md5  39052bc872e39093248cc1841b0037ca  google_api_core-2.19.2.tar.gz
+sha256  ca07de7e8aa1c98a8bfca9321890ad2340ef7f2eb136e558cee68f24b94b0a8f  google_api_core-2.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 84042d8d7a..b2bf049624 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.15.0
-PYTHON_GOOGLE_API_CORE_SOURCE = google-api-core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/2c/e4/56b14d35057a23cab9067dd8fb841407d05d32b5d6c7a3c66c1360e8a7c0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.19.2
+PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/78/14/99c2514b3ccc5aad1e0776f0ae8295c9f7153aead4f41d07dd126cecdc14
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
