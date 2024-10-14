Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C398ACFC538
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 10:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9087C60619;
	Mon, 14 Oct 2024 10:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ighg2Hwqb7n; Mon, 14 Oct 2024 10:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63BEA607E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63BEA607E0;
	Mon, 14 Oct 2024 10:21:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA29F1BF2F0
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 10:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8FFF4029F
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 10:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V18FeKyh7dUf for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 10:21:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B32240286
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B32240286
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B32240286
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 10:21:33 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4312484334eso2927345e9.0
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 03:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728901291; x=1729506091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s+CbtcNEG4VYAApvV+Hryk4GFfztQCPtPSlrqKl54/g=;
 b=Wc639+2Q77epwB8YJLoh3ntTrcaKIHUs5eZ8k0MxWi2g5AEy8o8Px0tx4NJxRKfkJy
 s5vow0uRA1sWecWQa+6yub53idqYHOFibwmb7kZGrL9zOKGhsFA2WLbpOhoEUByODN2w
 aU6S/3IkA8IcQoY1Z1Km4/aWvly5/77cHYmrD/DMkKGhms/P0HhZFxxwAKz+A+aOHqPL
 cQc2NKXMPSHhb+jrWmaTHnyYIUffjiFnlFvw+BPRT0OKXFxq87h3hMADw5l9il/CvLpo
 3X8uMinYPRyeqPZwrLNcpAp7ogpbFli4YFF/D59DnnX/C3xRRooMVxt+kFsQUI1+hcTE
 QQHQ==
X-Gm-Message-State: AOJu0YztvCsZD8ANG9UXMnim/NSHaxx9vreKdnEfYz/oiQFoZPT9PYt5
 06dslAerF8W4vUySegKRcGuAgoy/AB8hyn35wMnGsZkf25SC2hCkGtwgMH4VjkndGf1P1CCBTuY
 hlfs=
X-Google-Smtp-Source: AGHT+IFHKkGOe+uS43opTfrsyHpQsWcgeUkE4Iho7jlg2BbCoG4poTWZVeo3C3sUK5L5Pj20XV0Fbg==
X-Received: by 2002:a05:600c:470e:b0:42c:b55f:f4f with SMTP id
 5b1f17b1804b1-4311df6050dmr41514785e9.6.1728901290884; 
 Mon, 14 Oct 2024 03:21:30 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 ([2001:b07:6467:4426:e642:fe3c:c003:b424])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d7ca3sm116402605e9.2.2024.10.14.03.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 03:21:30 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 14 Oct 2024 12:21:20 +0200
Message-ID: <20241014102123.3727883-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
References: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728901291; x=1729506091;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s+CbtcNEG4VYAApvV+Hryk4GFfztQCPtPSlrqKl54/g=;
 b=H4JgCDXdbNFmSFiC3h4qgWP4flNHaCVTP93b5O5ZPRhlDDS4+GpP42hTgDRqgB3oil
 +fWZZ0/wkuQ0yxbH3KFsayAdNJlOAwrUNeb7VuQ2dFMngJhFkxoth+PfQbPqfR6Vq7+s
 Q2W7M/2kyBZnA/v56TMxupzcXtLfh3RZevWLc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=H4JgCDXd
Subject: [Buildroot] [PATCH 3/6]
 support/testing/tests/package/test_mender.py: Add RO fs test
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a test for read-only file systems.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 support/testing/tests/package/test_mender.py | 40 ++++++++++++++------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/support/testing/tests/package/test_mender.py b/support/testing/tests/package/test_mender.py
index fdf55ed616..0938cb77e1 100644
--- a/support/testing/tests/package/test_mender.py
+++ b/support/testing/tests/package/test_mender.py
@@ -3,23 +3,23 @@ import os
 import infra.basetest
 
 
-class TestMender(infra.basetest.BRTest):
+class TestMenderInfra(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
-        """
-        BR2_PACKAGE_MENDER=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        BR2_ROOTFS_OVERLAY="{}"
-        """.format(
-           # overlay to add a fake 'fw_printenv', used by Mender
-           infra.filepath("tests/package/test_mender/rootfs-overlay"))
+             """
+             BR2_PACKAGE_MENDER=y
+             BR2_TARGET_ROOTFS_CPIO=y
+             BR2_ROOTFS_OVERLAY="{}"
+             """.format(
+                 # overlay to add a fake 'fw_printenv', used by Mender
+                 infra.filepath("tests/package/test_mender/rootfs-overlay"))
 
-    def test_run(self):
+    def base_test_run(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5",
-                           kernel="builtin",
+        self.emulator.boot(arch="armv5", kernel="builtin",
                            options=["-initrd", cpio_file])
         self.emulator.login()
 
+    def run_mender_test(self):
         # Check if the Daemon is running
         self.assertRunOk("ls /var/run/mender.pid")
         self.assertRunOk("ps aux | egrep [m]ender")
@@ -30,3 +30,21 @@ class TestMender(infra.basetest.BRTest):
         cmd = "mender show-artifact 2>&1 | grep -i 'err'"  # Check if no 'error' among the traces
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 1)
+
+
+class TestMenderRW(TestMenderInfra):
+    def test_run(self):
+        TestMenderInfra.base_test_run(self)
+        self.run_mender_test()
+
+
+class TestMenderRO(TestMenderInfra):
+    config = \
+        """
+        {}
+        # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+        """.format(TestMenderInfra.config)
+
+    def test_run(self):
+        TestMenderInfra.base_test_run(self)
+        self.run_mender_test()
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
