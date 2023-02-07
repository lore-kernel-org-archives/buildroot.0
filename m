Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEBCC636D4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9EAF6100C;
	Tue,  7 Feb 2023 16:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9EAF6100C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uU_x9WylLphC; Tue,  7 Feb 2023 16:50:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C34E61009;
	Tue,  7 Feb 2023 16:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C34E61009
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90D8E1BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AAD981D19
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AAD981D19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ZgdFUgtRRex for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:50:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E879681440
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E879681440
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:50:46 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id u21so16766869edv.3
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 08:50:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dbbe2FtPG2MZ57sotBVUSfs/2muJ8sdR0bQGYxuBEDQ=;
 b=fnZ5bEE9CiFuedrLvOWMSLkTM0Pe1kqndypPPOgbqK6dunU8/EgVX1rIhRutSSlKWn
 DePNHa+QrfQ2FCVNgubwQXJYl+yKgXVmyO143MWYnPt0qwsuxw371+FpI/9BE7chRTU3
 iqJdLTa3ptR00cMYfyvkDo5u2RChvqSNAMqf/1acCx+G6BzhX1hgg9KTryylPWizwXTL
 fb7QIaJbbQbkkfWGMCctpKy2vAjj+tRJVd25uxDXoQCK1c8qdA4xkauF1ZIbWNGOCcJE
 2hNbD5uTvdNiADQeEvtyy77L01ms1EBbe5X8T9/oPQmvX62cKutsQsIN7A5civRwBSqp
 WOmg==
X-Gm-Message-State: AO0yUKXseY92UbwxT5Yk3yYYHmKX5eiXYejZ3khFdbHQ1n+ZwKt+0R2i
 HN6AV5WMgXVk7cJZV1uzUwkgLVCYPfX1mhV9hN0=
X-Google-Smtp-Source: AK7set8Slsv2lBXegqshAPqOEeoCoSMtTx5AaLFFfZaN/AKz1Jmp/jXqoV2mHqTuVTZVsmLdbXF5cw==
X-Received: by 2002:a50:d550:0:b0:4a0:e305:a0de with SMTP id
 f16-20020a50d550000000b004a0e305a0demr4638394edj.19.1675788644683; 
 Tue, 07 Feb 2023 08:50:44 -0800 (PST)
Received: from localhost.localdomain (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 d22-20020a50cd56000000b004aaa8e65d0esm3628838edj.84.2023.02.07.08.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 08:50:44 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 17:50:31 +0100
Message-Id: <20230207165031.17188-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dbbe2FtPG2MZ57sotBVUSfs/2muJ8sdR0bQGYxuBEDQ=;
 b=xu2KYZXDWgab+PnaqPqWMeycfooVq5sySXETMxBRSX6unyVlJUN3tmAur9f7Azm8g+
 vZcqohgj/MhMTRi5cDpTG/ITRQ8Ljhrjf/0vGiecN+gphfiY9QaXnsvKYfFKqzcFwbhU
 ocOvaU8lmgM2l5Hz4bHAC1sbHu4hD5uNYdduDy0Y4N0x8ccYerTQ38tLqb9VCcvMNi0E
 lRHBw4NIxZYVD/batBLWWBUWHFdk0MNfxSniru1v14+BQ2lLUhSDmuU/IZ4UYKemJ4+f
 UxsiysLzEbDHQBpUqanmKT6RdysLiqrLInA2iU+1LEsJnZSBrcvbZGU5PRgMOm2PdcUz
 +Lvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=xu2KYZXD
Subject: [Buildroot] [PATCH 1/1] support/testing: test_rust.py: Add test to
 check correct vendoring
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently the tests TestRust and TestRustBin do check for vendoring by
requiring package ripgrep to be built but only if the download
directory is already empty, otherwise the existing contents of the download
directory will be reused and therefore not be redownloaded.

This new test will only verify that the required packages are downloaded
and vendored correctly without doing a runtime test. It does so by setting a
path to a folder "dl" inside the build directory (output-directory/testname/)
and then setting the environment variable BR2_DL_DIR to this path before the
build starts. This code was essentially copied from the file
test_gitforge.py which was added in commit
1ca6ab6ace3c1f9edfbfd16b57d1280b3ea2c6f5

We want the package ripgrep to be built since it requires vendoring
directly. Additionally we want the package python-cryptography to be
built because it has rust dependencies and therefore indirectly also requires
vendoring.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
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
