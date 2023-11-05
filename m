Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE10C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 08:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8583D60FDF;
	Sun,  5 Nov 2023 08:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8583D60FDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xkSJX2ppb5bW; Sun,  5 Nov 2023 08:56:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8EE060FF0;
	Sun,  5 Nov 2023 08:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8EE060FF0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2BA1BF2F9
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 08:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 645D481495
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 08:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 645D481495
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yelGiFLexRa4 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 08:55:53 +0000 (UTC)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EB8D8144F
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 08:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EB8D8144F
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-357cc880bd8so13490175ab.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 01:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699174552; x=1699779352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qjbMexu9cVURpq02LSdPdDm7UKGiPg+A7FE4EWjHxSo=;
 b=voLwjWFoNdocHgTwZWzk5dWQCR8MtLF4sv+ItuGA4nzmbc/qW7udMsAc55RQRajNkF
 k5EEl/+f73/6MJZBtXZBc/ptY4vMJUlUEN+Mc9Lk0IYeQH5HQPE8HCsOQZQhlqFoHG8z
 gZi1ETJPgL1YbEEsYhE3VrhSLEkeU2eTOc3ByxINeEaj8bzPmmOin2hfGHE/upWmvL6T
 7o5qi3mfS+8rCo6jBzXPGNKe8JIai2CHUrGt5wYyykSLxfRQazkxCyPyHRZJVHAix2wN
 0DUMhE83FSCVRADB/jpxfken5chMVM8NigtAe3YofLSGaJaN6l1Q+XpMV94H37zhIoXL
 DdzA==
X-Gm-Message-State: AOJu0YwOFxSyysdMv1H1MKZuu5oJMGo8fXsq9YzjAowsrjJgyiu645bH
 qMn0gZ+n/vwYcnu12kL2kEQ8+Mrn3lNXLA==
X-Google-Smtp-Source: AGHT+IEyv8lOs+Mg0vyuQjVD3aM/JI/oqI1+XX1emN+/qXhE9ZB+443oV9Pmbjre/6JpbUMs778cNQ==
X-Received: by 2002:a92:d186:0:b0:359:4f85:b230 with SMTP id
 z6-20020a92d186000000b003594f85b230mr9283393ilz.18.1699174551887; 
 Sun, 05 Nov 2023 01:55:51 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 a13-20020a056e0208ad00b003576e122389sm1774216ilt.24.2023.11.05.01.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 01:55:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:55:46 -0700
Message-Id: <20231105085546.2919443-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231105085546.2919443-1-james.hilliard1@gmail.com>
References: <20231105085546.2919443-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699174552; x=1699779352; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qjbMexu9cVURpq02LSdPdDm7UKGiPg+A7FE4EWjHxSo=;
 b=Bn/h6UHLlqIFu9BbuoacMCAfIJG/4Bf4rBgyqUMy3iv6//AHQMwepMWA1GLKMAjQQB
 +t181oe73TYNSXHlAfOWurm+Yh/4BX8Lbmfds9rBCIVKee87K9Vuebs5+yPgWgB8GkxX
 9cwcIKQxLZXrbIGYBpILj9sDjFIIsgKhsPn4Kse/l/XJGXPBd2SMF48DLC2kf1m45vHb
 JakQhKmBYPFaRxTLGWpWuJ+77GUtAenKf+t3QEytMj2IFMuJsO7EJMFD6O0Oe06TC0iB
 uhT2VZQ8sliyQ02LacoGnC24yw91UyJoHXtKOiSa3OW/6TNDuyG9f5M2Xl6MOG6zZav2
 j/lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bn/h6UHL
Subject: [Buildroot] [PATCH 3/3] package/python-jsonschema: bump to version
 4.19.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-pyrsistent runtime dependency.

Add new python-jsonschema-specifications runtime dependency.

Add new python-referencing runtime dependency.

Add new python-rpds-py runtime dependency.

Propagate python-rpds-py target rust support requirement to
python-jsonschema reverse dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dtschema/Config.in                | 1 +
 package/python-flask-expects-json/Config.in      | 1 +
 package/python-jsonschema/Config.in              | 7 +++++--
 package/python-jsonschema/python-jsonschema.hash | 4 ++--
 package/python-jsonschema/python-jsonschema.mk   | 4 ++--
 package/python-pytablereader/Config.in           | 1 +
 6 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/python-dtschema/Config.in b/package/python-dtschema/Config.in
index 961d0e04b2..5baad45e64 100644
--- a/package/python-dtschema/Config.in
+++ b/package/python-dtschema/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_DTSCHEMA
 	bool "python-dtschema"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jsonschema -> python-rpds-py
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
 	select BR2_PACKAGE_PYTHON_PYLIBFDT # runtime
 	select BR2_PACKAGE_PYTHON_RFC3987 # runtime
diff --git a/package/python-flask-expects-json/Config.in b/package/python-flask-expects-json/Config.in
index 901234762e..55a752bf22 100644
--- a/package/python-flask-expects-json/Config.in
+++ b/package/python-flask-expects-json/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_EXPECTS_JSON
 	bool "python-flask-expects-json"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jsonschema -> python-rpds-py
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
 	help
diff --git a/package/python-jsonschema/Config.in b/package/python-jsonschema/Config.in
index d9508c3705..66d2417adc 100644
--- a/package/python-jsonschema/Config.in
+++ b/package/python-jsonschema/Config.in
@@ -1,8 +1,11 @@
 config BR2_PACKAGE_PYTHON_JSONSCHEMA
 	bool "python-jsonschema"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
-	select BR2_PACKAGE_PYTHON_PYRSISTENT # runtime
+	select BR2_PACKAGE_PYTHON_JSONSCHEMA_SPECIFICATIONS # runtime
+	select BR2_PACKAGE_PYTHON_REFERENCING # runtime
+	select BR2_PACKAGE_PYTHON_RPDS_PY # runtime
 	help
 	  An implementation of JSON Schema validation for Python.
 
-	  http://github.com/Julian/jsonschema
+	  https://github.com/python-jsonschema/jsonschema
diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
index f710576461..f421b8a48b 100644
--- a/package/python-jsonschema/python-jsonschema.hash
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema/json
-md5  7c65ceb8923c83cb1f22c2b5a86d99b0  jsonschema-4.17.3.tar.gz
-sha256  0f864437ab8b6076ba6707453ef8f98a6a0d512a80e93f8abdb676f737ecb60d  jsonschema-4.17.3.tar.gz
+md5  8bf5f0a2342dc4c8390c28a99be555e7  jsonschema-4.19.2.tar.gz
+sha256  c9ff4d7447eed9592c23a12ccee508baf0dd0d59650615e847feb6cdca74f392  jsonschema-4.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
 sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 16fc660ec9..dee87e8f9d 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_VERSION = 4.17.3
+PYTHON_JSONSCHEMA_VERSION = 4.19.2
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/36/3d/ca032d5ac064dff543aa13c984737795ac81abc9fb130cd2fcff17cfabc7
+PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/95/18/618159fb2efbe3fb2cd32b16c40278954cde94744957734ef0482286a052
 PYTHON_JSONSCHEMA_SETUP_TYPE = pep517
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
diff --git a/package/python-pytablereader/Config.in b/package/python-pytablereader/Config.in
index 889cb79820..00be18510f 100644
--- a/package/python-pytablereader/Config.in
+++ b/package/python-pytablereader/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYTABLEREADER
 	bool "python-pytablereader"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jsonschema -> python-rpds-py
 	select BR2_PACKAGE_PYTHON_BEAUTIFULSOUP4 # runtime
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
