Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA9BC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 16:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3797543681;
	Wed, 10 Jan 2024 16:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3797543681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kq1C-8PeyHTl; Wed, 10 Jan 2024 16:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E55DD4370A;
	Wed, 10 Jan 2024 16:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E55DD4370A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 933D41BF2C7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 16:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CCA842126
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 16:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CCA842126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id biz2OOUBvsty for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 16:35:42 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3741E408D0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 16:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3741E408D0
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e4d515cdeso24487905e9.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 08:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704904539; x=1705509339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jBIDqIwLg2U0OBRPnToLH51uhE44jXh6D70Hgt3JDrQ=;
 b=edSco/Y6K/o/+TVRgLef86EO1GouChXGb0kG5umse6OZ5HXuYKzcaKdmxi6yW1EZ1b
 BuU+PvPp50Q2gVli7CR6Kxb+J8tHA6cBl1VsML0Zv7HYzEuLooVpN31eqddgWy8hoe+R
 gfvS8mY0lSywitaoQeJLX+5rA7yXTI/OteRXUp4oEX5QBxerVmg9oR1ldhXQq4+cW6ES
 6i/NPMZP29beigWO+bkitDvZQfawsrTrCCW/f8X7M/SQvmBqtqlC9olhe4MYMcgIPVFF
 ZxdOhhr8159OZSK9llTy5uC/BQolj5Zz0Y2e/fD4AnfylsqLUha0jHr416nvLfifFxwe
 nRkg==
X-Gm-Message-State: AOJu0YxAMpPzTDbSfIkn6X1R+zgcSUQnhk8vWN7PcFPTsU1BK4CDdRcc
 1wCGYr4l5mTfbuslJW6q1O/xkNZ+OF+2GuHhXYclVx5zHNk=
X-Google-Smtp-Source: AGHT+IHWLkl+3f3Jt9qB2K0uElVAwVmmiFFFM6XahCOWPMhEjirNCOmQ12VMNvPARaRl06FJikWINg==
X-Received: by 2002:a05:600c:1e15:b0:40d:38ba:544e with SMTP id
 ay21-20020a05600c1e1500b0040d38ba544emr654696wmb.60.1704904539593; 
 Wed, 10 Jan 2024 08:35:39 -0800 (PST)
Received: from localhost.localdomain (176-161-53-116.abo.bbox.fr.
 [176.161.53.116]) by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c450800b0040d7b340e07sm2720202wmo.45.2024.01.10.08.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 08:35:39 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 17:34:12 +0100
Message-Id: <20240110163412.3977522-3-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240110163412.3977522-1-antoine.coutant@smile.fr>
References: <20240110163412.3977522-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1704904539; x=1705509339;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBIDqIwLg2U0OBRPnToLH51uhE44jXh6D70Hgt3JDrQ=;
 b=zV6SF+UszfcAyoygTjP782lFokgOWenq+oHw93ajNNI+OKkv644dAHQabBubVGusIP
 LEMIP/eAkXrCM4mwD1AF/CPOhKVFfCvPg0rk3HES5I6WJd89byj8DNQwEIgKlAKhQrla
 CuPHVsDa3GfQCIk0TWQvgpzfVZzw4Vq2SwB+MgPsAHNvl04Uw5+pW5GFhCw3dciVQoXS
 8FYmexzSGPylzrBDwKOQleg3VGazXehdNuX0Gcx69VBBoFb5HnLbma6MeQ9izINdSrQ+
 frCl90oTosi1gmqB4KRw2YAXdxGNQDS0oMWcwYYeM9gu05BME8UUsn6JHNTTjT7kfBxw
 hWrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=zV6SF+Us
Subject: [Buildroot] [PATCH v3 3/3] support/testing: test_rust.py: Add test
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
Cc: sebastian.weyer@smile.fr, Antoine Coutant <antoine.coutant@smile.fr>,
 romain.naour@smile.fr, yann.morin.1998@free.fr
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
