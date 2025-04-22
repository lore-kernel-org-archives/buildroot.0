Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA66C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 14:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9DF5406D6;
	Tue, 22 Apr 2025 14:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Km1VBvpBbmX2; Tue, 22 Apr 2025 14:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E8F240729
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E8F240729;
	Tue, 22 Apr 2025 14:56:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E5801BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8047A40C24
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oN3CyHSfMzei for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 14:56:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B1E940B77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B1E940B77
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B1E940B77
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:56:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39c1ef4acf2so3330440f8f.0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745333778; x=1745938578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zukaq4sdbFUJnjFOZJaHj1y8ySiJqISfexgCcvTRZfQ=;
 b=RqymftHQTUYaxruGXAwAdJS3ilSbBOyO12h970I925XzCn/GkpjIdeF0snbWLEi+dg
 BbJJqEbJSTNuXoZDE2I0Yo1GTcGRK2j1JM5PXlopWn4tCboPyWPPbddI2z1TGkCZUwqh
 167ihxsXm+sTAxaesPecFf0AmVI2LHWWuM1zGJcG8XVBYrxnN9QiPOVEjZ58gRcDYGFw
 AqmPoKFNN5YvFxxkoLoar60K096JgfxNfPNOZXRX4vycyDxutWTFUU4yfAOXgZqwSt4O
 5X7+8Jy1gGRBus2HcwbUbQxcMadk9MIg+zNOoQNN8wZ7YMYGOkwccfVXfMEnSxLgaE5h
 aHfw==
X-Gm-Message-State: AOJu0Yy55s7UY+XMHzL27rurRSmn5M7+2wdlu0mgG7f3l4gx92UvGkBM
 O7S1Whr6UOtlW20Ya4JBgDyB44lbksHMZYb0++YePkA7Jxsvt6C0uKja0cvTkPIczhQTyx5hSFv
 /WJU=
X-Gm-Gg: ASbGnctuH1nH/Imzt6kqW5FXxQtWTq7y8M/nGMoG5YlNmcCpue76OUpfzv91LMah4EZ
 CXi9qaZvnA/RPdr90VMkOC2KIgALFYVt36Pc/+PDGowqpHM/BM6MT1/9e68M9ipfgjX6KIc59kJ
 NvQdgemgJWXvPOp47FZpUkv7LWpYwt0eSUqFTfp24buJDyftLLnEl+/YEnhvKkSYF20C+2TIoVN
 yyENr7Xq2jjWt6xnNAqcRnZI7O5XlADAwHDW4Y/jM+F0MWAr4BS53/hLLGTTTXymH4bkTam6jOB
 BtqR9Is80Vw8kZ8TaaWg1fEVHzVWBr0o0f5NtaDkTOD96oLDo1CdSqx7PT/Wn48Hg4zAdT6u2XE
 cxswicFim9GCJ7CXxZytRlTn/dF/3eOcRW90=
X-Google-Smtp-Source: AGHT+IGsB17gWtIkJj2IeR/qLupx9i4AEBzRR+llNKIf5IRkvFAJbtg9c3Rx/blLN7YuJTooZTN2ag==
X-Received: by 2002:a05:6000:4313:b0:39c:310a:f87e with SMTP id
 ffacd0b85a97d-39efba3cc7dmr13015349f8f.16.1745333777638; 
 Tue, 22 Apr 2025 07:56:17 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5acddfsm177352025e9.15.2025.04.22.07.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 07:56:17 -0700 (PDT)
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Tue, 22 Apr 2025 16:55:52 +0200
Message-ID: <20250422145553.1278313-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745333778; x=1745938578; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zukaq4sdbFUJnjFOZJaHj1y8ySiJqISfexgCcvTRZfQ=;
 b=2KioYzQ9cVbgQPdqyVsSvlUm8uj6x7e964KA3ORmPPPHzYnAIqYv7shoBEIYZYFvb5
 JzYTbPsgHBMPVnxdVi3BA3IHEs3R/PjF1Sz/WbixhfYKfy6a+uG2ZbpledIlXdpT8czc
 NZ0c5ewsQrwTqEDWxLIlLGHBuos5zs0hLcfjg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=2KioYzQ9
Subject: [Buildroot] [PATCH 1/2] support/test: new dust runtime test
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

Add a runtime test for the 'dust' package to verify that the binary
executes correctly in a minimal buildroot rootfs. The test checks that:
- 'dust --version' runs without error
- 'dust' can analyze a directory structure with files
- The output includes the expected directory names

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 support/testing/tests/package/test_dust.py | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 support/testing/tests/package/test_dust.py

diff --git a/support/testing/tests/package/test_dust.py b/support/testing/tests/package/test_dust.py
new file mode 100644
index 0000000000..85c05934e5
--- /dev/null
+++ b/support/testing/tests/package/test_dust.py
@@ -0,0 +1,31 @@
+import os
+import infra.basetest
+
+
+class TestDust(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_DUST=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check that dust is installed and can be executed
+        self.assertRunOk("dust --version")
+
+        # Create a test directory structure with some files
+        self.assertRunOk("mkdir -p testdir/subdir")
+        self.assertRunOk("dd if=/dev/zero of=testdir/a bs=1K count=10")
+        self.assertRunOk("dd if=/dev/zero of=testdir/subdir/b bs=1K count=5")
+
+        # Run dust on the test directory and capture the output
+        output = self.emulator.run("dust testdir", timeout=10)
+        self.assertIn("testdir", ' '.join(output[0]))
+        self.assertIn("subdir", ' '.join(output[0]))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
