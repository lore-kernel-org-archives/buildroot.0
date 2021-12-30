Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B3FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C6F9410B2;
	Thu, 30 Dec 2021 20:41:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JXW5E2CMWxbk; Thu, 30 Dec 2021 20:41:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83204409C0;
	Thu, 30 Dec 2021 20:41:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7321E1BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DC58405C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 720JtV5ZGG1r for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:41:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3183D402D0
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:41:16 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so23675842pjf.3
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4IIB2S7LmJz+rG3zEymDrgN+53TZ3JTfjXBBaqoyVH0=;
 b=Dk9/DexZnXqQkJfP788vti0YCx2NG0HhhKCt/lbLMQVU6D9tlugrm6fHgxGvi4rgPE
 D5pi7T+v54WSz4pZuAlK/OceqhURmWaq/TQn8bIlYzxjm/V0fG93hgxF0TODb3nXMp0h
 C2KEqI+XZuTMaIMeQv4p1SdWKllTg0WmfV21gSqVSMCad5Aj7EPe9knj8f+Ojhg83NKO
 hnloBEDzcJT+cXAEt6ASvDHpGiU2DoBpFvUZ3ovWmKyS0dk5Ov5sJFI47PirnuB3dRiR
 4ScGQB5t/KOu7yMHiIp3NuVkc6tZgfWnbTEA7sfBLusil9P4dqfKXmN23P/ot/C17w/0
 FKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4IIB2S7LmJz+rG3zEymDrgN+53TZ3JTfjXBBaqoyVH0=;
 b=z+ukUOGR7paPQi+yPMF0xwHdZ4kquWZy7/GB0PoRkUYRE70laKTByBVFLrC23kV+df
 xhNGz/SnHe5NVFmnsl2gfImO/S2X8w7agYRJFhWkrWlyFzn8pmq6GLjS6bZsLaA5xf90
 BoMZv/WMWZP2jMRhV5LEiXfNZn5h54Hx0uRMvm5ZZjCva8UGRxg9nWIKpn57VCPgzab8
 qWw8DdtW/smTaWIjVUBSCFhtzkjz9+BQmxXtCylS9PUCu7SGnWV4B8oqgkG5Rv58sBIX
 k1/Gd8yxIBjrM7lDTUUMi0xHwyX27/ePPr8JK4OhyfOjyZpBzy2jJkqVWPGFBcNGHU3D
 J7Fw==
X-Gm-Message-State: AOAM531XcPIzfqbKbq/mKqoPEABB+lXnA1DGkQZI/CWQYXSTwHM17Czp
 kaH+nTTTDyz0VgW3Q4NdtqPbLJnWGg8=
X-Google-Smtp-Source: ABdhPJzg93fBCWQ8Vo06d1m+RW6xAj7i5nPnuyRA66QITpwqS3C9a9v834sa1e2kBU1+L9dl8MDAWw==
X-Received: by 2002:a17:902:bb87:b0:148:a2f7:9d8e with SMTP id
 m7-20020a170902bb8700b00148a2f79d8emr32269445pls.173.1640896875386; 
 Thu, 30 Dec 2021 12:41:15 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id ot7sm33315078pjb.12.2021.12.30.12.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 12:41:15 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 12:41:03 -0800
Message-Id: <20211230204103.282138-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211230204103.282138-1-aduskett@gmail.com>
References: <20211230204103.282138-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/3] package/python3-setuptools: bump to
 version 60.2.0
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
Cc: Adam Duskett <aduskett@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-setuptools/59.8.0/python-setuptools.hash       | 4 ----
 .../{59.8.0 => 60.2.0}/0001-add-executable.patch              | 0
 package/python-setuptools/60.2.0/python-setuptools.hash       | 4 ++++
 package/python-setuptools/python-setuptools.mk                | 4 ++--
 package/python3-setuptools/0001-add-executable.patch          | 2 +-
 package/python3-setuptools/python3-setuptools.hash            | 2 +-
 package/python3-setuptools/python3-setuptools.mk              | 4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 package/python-setuptools/59.8.0/python-setuptools.hash
 rename package/python-setuptools/{59.8.0 => 60.2.0}/0001-add-executable.patch (100%)
 create mode 100644 package/python-setuptools/60.2.0/python-setuptools.hash

diff --git a/package/python-setuptools/59.8.0/python-setuptools.hash b/package/python-setuptools/59.8.0/python-setuptools.hash
deleted file mode 100644
index 285919639d..0000000000
--- a/package/python-setuptools/59.8.0/python-setuptools.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://pypi.org/pypi/setuptools/json
-md5  675f2089d970bf0bbfc3f49c80e4c7c3  setuptools-59.8.0.tar.gz
-sha256  09980778aa734c3037a47997f28d6db5ab18bdf2af0e49f719bfc53967fd2e82  setuptools-59.8.0.tar.gz
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/59.8.0/0001-add-executable.patch b/package/python-setuptools/60.2.0/0001-add-executable.patch
similarity index 100%
rename from package/python-setuptools/59.8.0/0001-add-executable.patch
rename to package/python-setuptools/60.2.0/0001-add-executable.patch
diff --git a/package/python-setuptools/60.2.0/python-setuptools.hash b/package/python-setuptools/60.2.0/python-setuptools.hash
new file mode 100644
index 0000000000..2c8fb96bb7
--- /dev/null
+++ b/package/python-setuptools/60.2.0/python-setuptools.hash
@@ -0,0 +1,4 @@
+# From https://pypi.org/pypi/setuptools/json
+md5  3638c36eaf67f24bacb147c011fe6d30  setuptools-60.2.0.tar.gz
+sha256  675fcebecb43c32eb930481abf907619137547f4336206e4d673180242e1a278  setuptools-60.2.0.tar.gz
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 3e48e56be4..766eb724cd 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -7,9 +7,9 @@
 # For the target variant, we adapt the version depending on whether
 # Python 3.x or 2.x is selected for the target.
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-PYTHON_SETUPTOOLS_VERSION = 59.8.0
+PYTHON_SETUPTOOLS_VERSION = 60.2.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/75/2bc7bef4d668f9caa9c6ed3f3187989922765403198243040d08d2a52725
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/9b/be/13f54335c7dba713b0e97e11e7a41db3df4a85073d6c5a6e7f6468b22ee2
 else # Python
 PYTHON_SETUPTOOLS_VERSION = 44.0.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
diff --git a/package/python3-setuptools/0001-add-executable.patch b/package/python3-setuptools/0001-add-executable.patch
index 6fc7595a8d..442a3bda2e 120000
--- a/package/python3-setuptools/0001-add-executable.patch
+++ b/package/python3-setuptools/0001-add-executable.patch
@@ -1 +1 @@
-../python-setuptools/59.8.0/0001-add-executable.patch
\ No newline at end of file
+../python-setuptools/60.2.0/0001-add-executable.patch
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.hash b/package/python3-setuptools/python3-setuptools.hash
index 91d8bc0887..fa4b0bd23f 120000
--- a/package/python3-setuptools/python3-setuptools.hash
+++ b/package/python3-setuptools/python3-setuptools.hash
@@ -1 +1 @@
-../python-setuptools/59.8.0/python-setuptools.hash
\ No newline at end of file
+../python-setuptools/60.2.0/python-setuptools.hash
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
index d459094c26..ecf829450d 100644
--- a/package/python3-setuptools/python3-setuptools.mk
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-setuptools/python-setuptools.mk
-PYTHON3_SETUPTOOLS_VERSION = 59.8.0
+PYTHON3_SETUPTOOLS_VERSION = 60.2.0
 PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
-PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/75/2bc7bef4d668f9caa9c6ed3f3187989922765403198243040d08d2a52725
+PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/9b/be/13f54335c7dba713b0e97e11e7a41db3df4a85073d6c5a6e7f6468b22ee2
 PYTHON3_SETUPTOOLS_LICENSE = MIT
 PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON3_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
