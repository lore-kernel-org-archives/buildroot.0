Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD84C369D1
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 09:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B069A61B32;
	Thu, 24 Apr 2025 09:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAGg7JvPNWYJ; Thu, 24 Apr 2025 09:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCE6F6F4B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCE6F6F4B9;
	Thu, 24 Apr 2025 09:48:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2B5828C
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 09:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3BD3401F1
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 09:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhXxNVC8Hmfp for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 09:48:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 918044012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 918044012A
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 918044012A
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 09:48:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so757256f8f.2
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 02:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745488101; x=1746092901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JK7yHlqbvuNozoxyIjcr0ZWw+Jr9alRsxs1ozYyu2NM=;
 b=ignKfBPOjXwChXzJIgEQMhasJl/FoujqVcNaaOtfUR6nft8jwQPNvzuCnakfiE8xcn
 1fyJ0gMo9ZhAMKq+Hqc8L043DOmDMVrqU1pH4cRFkLK/neUoYamslygJcdVO1iaaBeCt
 askSj1HRsX7cY2IvW0OOpGeOhH+QM9cUCWJJzZrEmsjSopdUTM2FPVnVtIeqBK8KFy7d
 JSwxw67uaCOFfYHkVl5CL7bTady+woars2zzztUMmCtWfXaw76XulGrB3nCoi+WT15SG
 IVjS2Ce7y5oOAcXRoQ68+NhH8ukgN+NkoTjk/VQZUlTF+JreVJZXfgWSdBRCWW28oRYA
 /99g==
X-Gm-Message-State: AOJu0Ywn5XsmJqcBV8PF2c2bTz4Fb+SjMN5q2ait+XmcGSvX5LezufJU
 2cvxciTMTavtOdlQweNDRHlv8snyw/cd6aQuFejfLfIv2oWmemNN3qqEmYVdDlFSpCNdjJp/VgR
 fI1Y=
X-Gm-Gg: ASbGnct+njuh7Q+SB+tetecfw1tu/Z+VLqctR3AumR577+ENErPbK9cGjI3uf1DPgva
 73bZKC1jbN9cPnl8kgxpslBWxGhqbyNlq9nnHIaZRbBnzvmcI2nQ1vTpKnOMSlFYyT+hYqz9Zi1
 mp/8eo90jQ30Mc2JLVsYJkxZYQz0MNLojt9GF8fHw+Bl3oN5nqFXTNPDcrFv+mjnH6t/YX/PGri
 IKOELm4vbzMVSUZhQl/mRufEZHrzM37CUGwInUXsJ5Qug17LOB8nKHCSsWZkD/k5Y2c5KyQvxt5
 d1P73dy5W5YSF9ftu7IkdhFU48q7LNKXrgXoBMxLg/tl2gccc1aN/hbVDQk4YequnLdEJQyI8zw
 DhUe0fnk3oag6uNm9XjWIt9xEi3IdVlK6DwS+ey471BZzcQ==
X-Google-Smtp-Source: AGHT+IFQldQe5jjzOlw2q4dDguq+3MmuyFAkNBJdfhd4ZPxABm0KVsZUEQfxR//+DFf5FqTRKx1Y4Q==
X-Received: by 2002:a5d:584e:0:b0:391:3915:cffb with SMTP id
 ffacd0b85a97d-3a06cfa9dd3mr1386698f8f.43.1745488101481; 
 Thu, 24 Apr 2025 02:48:21 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2ac26dsm13852975e9.21.2025.04.24.02.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:48:21 -0700 (PDT)
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Thu, 24 Apr 2025 11:48:07 +0200
Message-ID: <20250424094807.2799328-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745488101; x=1746092901; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JK7yHlqbvuNozoxyIjcr0ZWw+Jr9alRsxs1ozYyu2NM=;
 b=OL9SoPDMpOGfDjt3tfm2fKvAeG091v5JNA7PwYOfSxjKU4eCCTo47QVwwPBKGXw5Ln
 MDipKL+g5g/yMeWEfs4XY+hJeOxX6u2dViEuWAWnxI4X79xlXmLTUtdB8NZDceYkXldX
 ayMZi97gRDCBSwruf+PJVEL9ftHG0wiL2EK7s=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=OL9SoPDM
Subject: [Buildroot] [PATCH v2] support/test: new bat runtime test
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a runtime test for the 'bat' package to verify that the binary executes
correctly in a minimal Buildroot rootfs.The test cheks that:
- 'bat --version' runs without error
- 'bat' can read and display a text file
- the displayed content matches the expected string

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

---
Changes v1 -> v2:
  - split output and exit_code from emulator.run()
  - check exit code with assertEqual()
  - join output using "\n"

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 support/testing/tests/package/test_bat.py | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/test_bat.py

diff --git a/support/testing/tests/package/test_bat.py b/support/testing/tests/package/test_bat.py
new file mode 100644
index 0000000000..018d0e002f
--- /dev/null
+++ b/support/testing/tests/package/test_bat.py
@@ -0,0 +1,27 @@
+import os
+import infra.basetest
+
+
+class TestBat(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+            """
+            BR2_PACKAGE_BAT=y
+            BR2_TARGET_ROOTFS_CPIO=y
+            # BR2_TARGET_ROOTFS_TAR is not set
+            """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the programs can execute
+        self.assertRunOk("bat --version")
+        self.assertRunOk("echo 'hello test' > test.txt")
+
+        # Run bat and capture output
+        output, exit_code = self.emulator.run("bat test.txt", timeout=10)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("hello test", "\n".join(output))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
