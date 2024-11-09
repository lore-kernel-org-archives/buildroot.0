Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4545BD5E376
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91B33423A2;
	Sat,  9 Nov 2024 17:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yo0iYQ8q4iF0; Sat,  9 Nov 2024 17:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25BE7423BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25BE7423BF;
	Sat,  9 Nov 2024 17:01:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B74BD8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C2A7423A2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xV6UCS9xlW8f for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:01:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1ABAA42495
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ABAA42495
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1ABAA42495
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:01:01 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-83ac817aac3so127745839f.0
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 09:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731171661; x=1731776461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3eZRuqwhacH5O014la9r9+ZDaCW3NfqZea1xZZW1UNY=;
 b=ZxNxy4qcg89DH7D9/HxpAHD3DMqInjnBzrdfQIsH5THZxVTJjVjj+jW8Cy3TNnq4wM
 h4asKoJxv1RWosIQXpfiGeUkt54p614i6Fsd5Mov/K8pw7HBDy6KQlhNyY2xh1u8y4Wm
 /mGV24AnqnpX2gjK3owsg4pGnlHyeFdp6nZHdRL9yvy60Vp30wUtBTF/GITIz0aHiGO+
 UJbndOXv2bmlcsQI6qXhC0PAWBz1v1XeN9fZ8ciUbN3oybqSfbcFThGtWqt39SuwMVUH
 ncd6ahM4SPrhobRHBVtV1308BNfOdWuxf4Kg1y7BZcDtQxYPsVASq7lD46eot0BdkNkO
 QCLw==
X-Gm-Message-State: AOJu0YzC/WHc17Xxzo0lwibEcgzQ0zow3C3SRh/ktUA9dOBqpTuMRJ0B
 nX5RUfccg70m60hPm7jzcWivzliHTi9+XHEkFSmCBjn0W0T4XyvtCn+ZBRsO
X-Google-Smtp-Source: AGHT+IHPIm6amsG7WvXH1SbCxzB1DpEH85tE29UgmFdDvIXCg76J/s4t/urpG08pegc6mcPLDXntFg==
X-Received: by 2002:a05:6602:3f83:b0:83a:b7a2:74e6 with SMTP id
 ca18e2360f4ac-83e03073f5cmr914328539f.0.1731171660733; 
 Sat, 09 Nov 2024 09:01:00 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de787effd1sm401052173.118.2024.11.09.09.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 09:01:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 10:00:58 -0700
Message-Id: <20241109170058.565528-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731171661; x=1731776461; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3eZRuqwhacH5O014la9r9+ZDaCW3NfqZea1xZZW1UNY=;
 b=E5R6FHx/ovmQmEE/XJkn2ORxd88hNBSAHhkTqRoIlQurB4kmrIW/uJNKPJLpd9yEB6
 BwRx/Q5gOEVdu0SBzQIyC1kxEzclChZO1F+5SzOVMTHPz3gciiz8cuCFqOCilOtyjZkI
 61PRDi6UVveLrEcH8Maepv5NXkkbV4J1IEWtarpDuoZgEAYHw+chLALWdzzisLCuvu9s
 y46id0emBI4ajZkXuNidSNYxJs+8nHkCRoX01cJsoXG1AhTsjOJwg7/fozkWWfIxVIKJ
 Vi5odWZthfvVEZDeDVCAdDiQYBwV/DHpogg4fv/6aRPaf6oOf3oDDo9No1yTTiPyeuDB
 gYqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E5R6FHx/
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.35.57
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 0f156fa9e7..c274da5540 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  c9518551b25ab97e6c63b94061c6895f  boto3-1.35.53.tar.gz
-sha256  f4124548bb831e13504e805f2fbbfcee06df42fffea0655862c6eb9b95d6d1be  boto3-1.35.53.tar.gz
+md5  ec76b10d3c22a3ff81420a3d443c3492  boto3-1.35.57.tar.gz
+sha256  db58348849a5af061f0f5ec9c3b699da5221ca83354059fdccb798e3ddb6b62a  boto3-1.35.57.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index c50f0562bc..d0984f9f24 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.35.53
+PYTHON_BOTO3_VERSION = 1.35.57
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/12/c1/1dc34b322d2f022d190c34dd4aa7f1a242d73633c25061bf56bd1319fe05
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/c5/73/fb880ce301129a7116ff47b1aab1ca7427c7d63a163676701abc168309eb
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
