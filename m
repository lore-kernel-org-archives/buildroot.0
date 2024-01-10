Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A51C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 09:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2905443636;
	Wed, 10 Jan 2024 09:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2905443636
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DzdEr7Vfhrf8; Wed, 10 Jan 2024 09:40:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 274F04362E;
	Wed, 10 Jan 2024 09:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 274F04362E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F8181BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4884480BCE
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4884480BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9X4c2VSRo4R2 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:39:00 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E34880BCC
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E34880BCC
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7bbec1d1c9dso218337039f.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 01:39:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704879539; x=1705484339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JWhKZoF3ZsZbf8l5Tflty4bvwv5pkXNieN+0mAJy7O8=;
 b=QUhom0ni6LUz5d8e4nrkOred5Uhqb5aJJYo3n+BOSc2u3FYhmbjew6f4kk9TlI62Vp
 gZs/2rd9f3GOPmKwIKRHYElz7iACKaKn7y+XYNPY6U/ph3ZiaW2bzEUiZaUK0KGnETXW
 MzgxooIZMjssJMpznVFKJ+m/2LCr7ec3C0NYFF8rdlznriGvjD1K+jfOSZmxWQp8bE3S
 vVfLIUVsozo4NMsknwwiQ2ppe//4rUk3iZvfjwpMnUl6bMd6IcroqpPTtrrLD1B/pSvP
 Xot6fmvGCwxjJuY3wrcxVZPv7xFYEczvjQMuFQbDFhrNjg2ZnEZg0Cur8fEfsmLbCQgS
 Agow==
X-Gm-Message-State: AOJu0Yz+1ATEwCBa+ZkQRbjkwFb+s0zzRM31PRR/pDDJMKED6HxK+hE5
 KWWMQ/sl36qcW3FTRQhkjPbxWaLuT6mz/Q==
X-Google-Smtp-Source: AGHT+IFx+bo1QTX+iSHL7bF3MxUZwMm/KIOt55ByiqpepPBxl6REfrBJf6Xsh2+HaQKs3Wd1VMCY1A==
X-Received: by 2002:a05:6e02:12eb:b0:360:fd1:b30b with SMTP id
 l11-20020a056e0212eb00b003600fd1b30bmr1026528iln.5.1704879539033; 
 Wed, 10 Jan 2024 01:38:59 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cw9-20020a05663849c900b0046d950cf82bsm1185395jab.85.2024.01.10.01.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 01:38:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 02:38:50 -0700
Message-Id: <20240110093850.2302133-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110093850.2302133-1-james.hilliard1@gmail.com>
References: <20240110093850.2302133-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704879539; x=1705484339; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JWhKZoF3ZsZbf8l5Tflty4bvwv5pkXNieN+0mAJy7O8=;
 b=DtJWSkxWvjVtdALKmKAUFJ1x3zdAJ6CWM7N/eVvI9RrC+Vrj3oJobTuDAsROnPFOj+
 eZ6/ywCZVUlX6rnDlqvQXgMZnS3XhDqBl7KkIQmT1Ra8ugLneircZBtlj55dVc9DPvLL
 DtikjhGtrOx9aQV7AWMazEO0XYpch4TBQALCGUQcnH0JBjSN7znJVXU9FVL6aRwDsM0m
 GYB/kO0gTIx5Zkl+0/Aok5bNXO4pLAwDIZMFarmQCQnJXOFbrvXyuZNPyBN/+4sIXo1F
 ZaG5GuXJjBfj3VDaH6/nmw9lry13+udKdiRRAR7B0iVmcvZnl45Yr82mxUgpUSiX3GhJ
 k7HA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DtJWSkxW
Subject: [Buildroot] [PATCH 6/6] package/python-pymupdf: bump to version
 1.23.9rc2
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate to in tree pep517 based build backend.

Note that version 1.23.8 is not compatible with mupdf 1.23.8 due to
header conflict bugs that were fixed after the 1.23.8 release.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymupdf/python-pymupdf.hash |  4 +--
 package/python-pymupdf/python-pymupdf.mk   | 33 ++++++++++++----------
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
index 9fd8150088..e57652ab69 100644
--- a/package/python-pymupdf/python-pymupdf.hash
+++ b/package/python-pymupdf/python-pymupdf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymupdf/json
-md5  468fe56375a1fca99e83fe0aa0b9f8bd  PyMuPDF-1.22.0.tar.gz
-sha256  6e1694e5c0cd8b92d503a506ee8e4ba1bed768528de586889d3ec90e9dc4a7d3  PyMuPDF-1.22.0.tar.gz
+md5  eb0b65eaa063c2417d89c5453e7c82ad  PyMuPDF-1.23.9rc2.tar.gz
+sha256  ba6fdd907814acb968ce669f49b0c14ef9ef8b1e2d161829b7a31461aab04429  PyMuPDF-1.23.9rc2.tar.gz
 # Locally computed sha256 checksums
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index 639ce0e00e..ac76afa3f6 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -5,25 +5,28 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-PYTHON_PYMUPDF_VERSION = 1.22.0
+PYTHON_PYMUPDF_VERSION = 1.23.9rc2
 PYTHON_PYMUPDF_SOURCE = PyMuPDF-$(PYTHON_PYMUPDF_VERSION).tar.gz
-PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/28/ba/d6bb6fd678e8396d7b944870286fb25fd6f499b8cb599b5436c8f725adbf
-PYTHON_PYMUPDF_SETUP_TYPE = setuptools
+PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/b4/ff/db44303d60b8cc310a7187d500c7765b3b48aa113c86428d5d1c390b8fb5
+PYTHON_PYMUPDF_SETUP_TYPE = pep517
 PYTHON_PYMUPDF_LICENSE = AGPL-3.0+
 PYTHON_PYMUPDF_LICENSE_FILES = COPYING
 # No license file included in pip, but it's present on github
-PYTHON_PYMUPDF_DEPENDENCIES = freetype host-swig mupdf zlib
+PYTHON_PYMUPDF_DEPENDENCIES = \
+	host-python-libclang \
+	host-python-psutil \
+	host-python-setuptools \
+	host-python-swig \
+	host-swig \
+	freetype \
+	mupdf \
+	zlib
 
-PYTHON_PYMUPDF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/mupdf -I$(STAGING_DIR)/usr/include/freetype2"
-
-# We need to remove the original paths as we provide them in the CFLAGS:
-define PYTHON_PYMUPDF_REMOVE_PATHS
-	sed -i "/\/usr\/include\/mupdf/d" $(@D)/setup.py
-	sed -i "/\/usr\/include\/freetype2/d" $(@D)/setup.py
-	sed -i "/\/usr\/local\/include\/mupdf/d" $(@D)/setup.py
-	sed -i "/mupdf\/thirdparty\/freetype\/include/d" $(@D)/setup.py
-endef
-
-PYTHON_PYMUPDF_POST_PATCH_HOOKS = PYTHON_PYMUPDF_REMOVE_PATHS
+PYTHON_PYMUPDF_ENV = \
+	PYMUPDF_INCLUDES="$(STAGING_DIR)/usr/include/freetype2:$(STAGING_DIR)/usr/include" \
+	PYMUPDF_MUPDF_LIB="$(STAGING_DIR)/usr/lib" \
+	PYMUPDF_SETUP_FLAVOUR=p \
+	PYMUPDF_SETUP_IMPLEMENTATIONS=a \
+	PYMUPDF_SETUP_MUPDF_BUILD=
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
