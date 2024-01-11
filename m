Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2AFC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 10:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B681481E30;
	Thu, 11 Jan 2024 10:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B681481E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQF_m9-mcO6z; Thu, 11 Jan 2024 10:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E82C081A95;
	Thu, 11 Jan 2024 10:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E82C081A95
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C82661BF2F5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADC2641A32
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADC2641A32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-rv4c2JTurM for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 10:38:36 +0000 (UTC)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77614418C9
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 10:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77614418C9
Received: by mail-lj1-x242.google.com with SMTP id
 38308e7fff4ca-2cd5c55d6b8so43905141fa.3
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 02:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704969513; x=1705574313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jBIDqIwLg2U0OBRPnToLH51uhE44jXh6D70Hgt3JDrQ=;
 b=LnlMUrFak6x0/vgrw/HaBcMSewKq/AzOxJXRg844f8Ba+ifxUF2OE6/LSCpTJWU83E
 QbMXF7MzS2vGwYo8Xs1euIoXWfpg298xCgYuZFvyLbqvskO14ad7NxI2D29pp9EfW3U/
 Vkn48YJdiFwRk36VGVGeTpFae82dcfy2SIe3i6CNOQBzl2hoT/8nwSKaB6ppTvjNgFYG
 KNV2AJWtABONNQB4eJ6rNrk4aZx0v0AWme7kVo6Y0e+2vVAFnLoeU3EB63W9PU9xavMa
 hfoACsEH41E5tOkpBvI3OAih554uj/TMd70Tbg5hNlATaVk4SMp/d0QjxSco/rU4RtKP
 rbNQ==
X-Gm-Message-State: AOJu0YzfhW1uhw9kg5XZZt2xs7BRgdDwIHxYy+UjBTQa3TPQWeqR+jsL
 HtL1cSZGZRCM+k9J20G+mvgLcfj9Im14B2dSltqiphTz8hleYVl8
X-Google-Smtp-Source: AGHT+IGxFwikAlzv5OB7YdsuNnx7qN6IgLYkmpkuXvhfCtAbiqZyVxjGEVecMwfBKhabOTJMbX5k3A==
X-Received: by 2002:a2e:9819:0:b0:2cc:cbe7:3acd with SMTP id
 a25-20020a2e9819000000b002cccbe73acdmr183284ljj.87.1704969513503; 
 Thu, 11 Jan 2024 02:38:33 -0800 (PST)
Received: from localhost.localdomain ([80.215.186.92])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a5d6e55000000b0033672cfca96sm869810wrz.89.2024.01.11.02.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 02:38:32 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 11:38:18 +0100
Message-Id: <20240111103819.3984913-2-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240111103819.3984913-1-antoine.coutant@smile.fr>
References: <20240111103819.3984913-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1704969513; x=1705574313;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBIDqIwLg2U0OBRPnToLH51uhE44jXh6D70Hgt3JDrQ=;
 b=Cvk6u0/Idln12ezAjFvCOVYM2XANFaMUb8/k4/pOav/frtdXxf2r0EEflHaHar8Q93
 EIqCBHhDYiFlU2bNCXBScPD9UJHO2J70ofgyhpgW2pxXYPryWCdQYNr3pHKATVM4u8r+
 phn0zCBBnjLkaS6A0MG7iFZbUaYctYsurv6wxJIyq64lbOPPPY7pCnEreEpm8xEUjRX6
 aBNS9qJ/rYdjZ8ZAOVcwTdF93GMy8MkORPzosaO+RKbnmOsjUTzfKoKgZJYVNPeyOoz2
 OfkjIYWpjkuheIjn8yOMsj4vByqqm10+ojxEoqP1tLkQYSpeSYDnRyBZ1sSznLyXkfVT
 UsVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Cvk6u0/I
Subject: [Buildroot] [PATCH v4 2/3] support/testing: test_rust.py: Add test
 to check correct vendoring
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sebastian Weyer <sebastian.weyer@smile.fr>

Currently the tests TestRust and TestRustBin do check for vendoring by
requiring package ripgrep to be built but only if the download
directory is already empty, otherwise the existing contents of the download
directory will be reused and therefore not be redownloaded.

This new test will only verify that the required packages are downloaded
and vendored correctly without doing a runtime test. It does so by setting a
path to a folder "dl" inside the build directory (output-directory/testname/)
and then setting the environment variable BR2_DL_DIR to this path before the
build starts. BR2_DL_DIR is not set in the config options because it would be
overridden by the user's own environment variable if defined. This code was
essentially copied from the file test_gitforge.py which was added in commit
1ca6ab6ace3c1f9edfbfd16b57d1280b3ea2c6f5

We want the package ripgrep to be built since it requires vendoring
directly. Additionally we want the package python-cryptography to be
built because it has rust dependencies and therefore indirectly also requires
vendoring.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
Changes v1 -> v2:
	- make the change proposed here:
	http://patchwork.ozlabs.org/project/buildroot/patch/20230207165031.17188-1-sebastian.weyer@smile.fr/
---
 support/testing/tests/package/test_rust.py | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index fb9dd2d916..763125ca20 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -1,4 +1,5 @@
 import os
+import shutil
 
 import infra.basetest
 
@@ -54,3 +55,44 @@ class TestRust(TestRustBase):
     def test_run(self):
         self.login()
         self.assertRunOk("rg Buildroot /etc/issue")
+
+
+class TestRustVendoring(infra.basetest.BRConfigTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_HOST_RUSTC=y
+        BR2_PACKAGE_RIPGREP=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+        BR2_BACKUP_SITE=""
+        """
+
+    def setUp(self):
+        super(TestRustVendoring, self).setUp()
+
+    def tearDown(self):
+        self.show_msg("Cleaning up")
+        if self.b and not self.keepbuilds:
+            self.b.delete()
+
+    def check_download(self, package):
+        # store downloaded tarball inside the output dir so the test infra
+        # cleans it up at the end
+        dl_dir = os.path.join(self.builddir, "dl")
+        # enforce we test the download
+        if os.path.exists(dl_dir):
+            shutil.rmtree(dl_dir)
+        env = {"BR2_DL_DIR": dl_dir}
+        self.b.build(["{}-dirclean".format(package),
+                      "{}-legal-info".format(package)],
+                     env)
+
+    def test_run(self):
+        self.check_download("ripgrep")
+        self.check_download("python-cryptography")
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
