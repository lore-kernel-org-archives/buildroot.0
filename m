Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE419C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 00:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35DFB60ED2;
	Tue, 10 May 2022 00:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dUFQ-MM8dSQ; Tue, 10 May 2022 00:31:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 174AC60DC6;
	Tue, 10 May 2022 00:31:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8EF11BF9A4
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 00:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7D2E80A95
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 00:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7fr3Z77ktWVW for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 00:31:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D307081385
 for <buildroot@buildroot.org>; Tue, 10 May 2022 00:31:22 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 31-20020a9d0822000000b00605f1807664so11227397oty.3
 for <buildroot@buildroot.org>; Mon, 09 May 2022 17:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UkUQGR2LtjWQOL9fKWZqsyLZ286yOmlD3WRvoQP61Pc=;
 b=Qk5IdrH4S6Xdo73S9n0Xus1e+4kgI8Oojsy2OQFfUUMcmpt234RFdZFJ94Y7gdkZ9I
 U5M+afZjmOlWlTBGu2RDr/S5vu8RJ/TodpVRiyzzfzI3sGBEiVoSkBsi5viencnprJix
 Rm1+s3l7CPwF7GJ+xp5Bwhev3p+6UzlYeXSazStstR8oZ6M+GCrPhir0HqDzmBEOpn7k
 1mfFcgK8/cWv/5/8ClnAG8kfuputWozgqDl11fd5Bl6EZC685LSy5jDutadEga5g3td+
 +HPyDNS2XGGYexYU9XYnX6FVu6kHEcLFOznXJ8WEDgTg7yijLPpMqd62tBKHw94nkbo0
 kC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UkUQGR2LtjWQOL9fKWZqsyLZ286yOmlD3WRvoQP61Pc=;
 b=TzgQIPr5OWBcZFvyMij4sLwHjiKMUy8Oh1liR0ymBrpbgFBN7j3ErqcJSSpnQW7TvJ
 7M1hl9RP7mcU6ZXdmbvC1CO7MZvNjEaAFkjB+cIy3hiTALN2KjHD0rp9qhfMSllmunBp
 LKah4BlwA1V/SKseSek9wdOmfsq9J6ZuRyaPHW+M5n+2MuR7M2n8T7T+MvuGxVCNrk12
 cHezetZaaTjzQThoK8R1I+XkjSOry65IK72ewzi3T3EV78W3Qn3TclIteGmrsoNU8r8O
 Rb73jLZtU/QQQi3v/hkX3IEOIcCRbILVMW4qtsTwqKisKJkBGDwaQEPxhYFOVVEdsta4
 J2KQ==
X-Gm-Message-State: AOAM531EDnVDy9UkRAcUoaqw0auUKkqkIdP+ULZDMPL/4rIQffjrd/Oe
 2ZZ9HdXJFmZiDTLvEDee5btO7GHx5yU=
X-Google-Smtp-Source: ABdhPJypBd7Nf+CEAT5LOi7cTqxyjJX/S2DSrV5e8dxSMgusgkE51w7ectq4ZOsBnjhI55snnCHlEA==
X-Received: by 2002:a05:6830:12d2:b0:605:e67e:edc5 with SMTP id
 a18-20020a05683012d200b00605e67eedc5mr6987087otq.326.1652142681607; 
 Mon, 09 May 2022 17:31:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-126-237.hlrn.qwest.net.
 [71.218.126.237]) by smtp.gmail.com with ESMTPSA id
 i7-20020a9d53c7000000b006060322127esm5161159oth.78.2022.05.09.17.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 17:31:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 18:31:15 -0600
Message-Id: <20220510003116.336797-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/python-maturin: new package
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
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is pep517 pyo3 build backend that's an alternative to
python-setuptools-rust.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - update patch comment to backport as it is merged upstream
---
 .../0001-Fix-invalid-pyproject.toml.patch     | 62 +++++++++++++++++++
 package/python-maturin/python-maturin.hash    |  5 ++
 package/python-maturin/python-maturin.mk      | 20 ++++++
 3 files changed, 87 insertions(+)
 create mode 100644 package/python-maturin/0001-Fix-invalid-pyproject.toml.patch
 create mode 100644 package/python-maturin/python-maturin.hash
 create mode 100644 package/python-maturin/python-maturin.mk

diff --git a/package/python-maturin/0001-Fix-invalid-pyproject.toml.patch b/package/python-maturin/0001-Fix-invalid-pyproject.toml.patch
new file mode 100644
index 0000000000..91e9a3db94
--- /dev/null
+++ b/package/python-maturin/0001-Fix-invalid-pyproject.toml.patch
@@ -0,0 +1,62 @@
+From 9ad69941d02e494d45ee67f3bcccc83c0bb4cdcd Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Mon, 9 May 2022 14:37:36 -0600
+Subject: [PATCH] Fix invalid pyproject.toml
+
+These attributes should be marked dynamic.
+
+Fixes:
+configuration error: `project` must contain ['version'] properties
+
+Fixes:
+The following seems to be defined outside of `pyproject.toml`:
+
+`description = 'Build and publish crates with pyo3, rust-cpython and cffi bindings as well as rust binaries as python packages'`
+
+According to the spec (see the link bellow), however, setuptools CANNOT
+consider this value unless 'description' is listed as `dynamic`.
+
+Fixes:
+The following seems to be defined outside of `pyproject.toml`:
+
+`license = 'MIT OR Apache-2.0'`
+
+According to the spec (see the link bellow), however, setuptools CANNOT
+consider this value unless 'license' is listed as `dynamic`.
+
+Fixes:
+The following seems to be defined outside of `pyproject.toml`:
+
+`authors = 'konstin'`
+
+According to the spec (see the link bellow), however, setuptools CANNOT
+consider this value unless 'authors' is listed as `dynamic`.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+9ad69941d02e494d45ee67f3bcccc83c0bb4cdcd]
+---
+ pyproject.toml | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 207ceb7..329faae 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -13,6 +13,13 @@ classifiers = [
+     "Programming Language :: Python :: Implementation :: PyPy",
+ ]
+ dependencies = ["tomli>=1.1.0 ; python_version<'3.11'"]
++dynamic = [
++    "authors",
++    "description",
++    "license",
++    "readme",
++    "version"
++]
+ 
+ [project.optional-dependencies]
+ zig = [
+-- 
+2.25.1
+
diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
new file mode 100644
index 0000000000..e9ba83e78e
--- /dev/null
+++ b/package/python-maturin/python-maturin.hash
@@ -0,0 +1,5 @@
+# Locally calculated after vendoring
+sha256  092db51dfd1479e3abfc8eef4b109b6ab504481959e383090827e2024f09aab3  maturin-0.12.15.tar.gz
+# Locally computed sha256 checksums
+sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
+sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
new file mode 100644
index 0000000000..f6daabc008
--- /dev/null
+++ b/package/python-maturin/python-maturin.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-maturin
+#
+################################################################################
+
+PYTHON_MATURIN_VERSION = 0.12.15
+PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/30/4d/b8a32e0bd711f7905fa8f10487be7dbf9992c5b5b3bfa8734abf2487d967
+PYTHON_MATURIN_SETUP_TYPE = setuptools
+PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
+PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
+HOST_PYTHON_MATURIN_DEPENDENCIES = host-python-tomli host-rustc
+HOST_PYTHON_MATURIN_ENV = $(HOST_PKG_CARGO_ENV)
+# We need to vendor the Cargo crates at download time
+PYTHON_MATURIN_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_MATURIN_DOWNLOAD_DEPENDENCIES = host-rustc
+HOST_PYTHON_MATURIN_DL_ENV = $(HOST_PKG_CARGO_ENV)
+
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
