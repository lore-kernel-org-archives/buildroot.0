Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCE2C369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 11:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD375813D7;
	Thu, 24 Apr 2025 11:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-L2Wf1Xu9Bc; Thu, 24 Apr 2025 11:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1621B810A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1621B810A3;
	Thu, 24 Apr 2025 11:22:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C8CCEC
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 11:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61C4840A19
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 11:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHTP2cLZTxGg for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 11:22:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65534400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65534400F6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65534400F6
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 11:22:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso8320425e9.3
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 04:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745493737; x=1746098537;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qTf4JhYpveXYYLTeKpwo5wW6zENeChTRgGhtR6jHiYs=;
 b=WmYwJN/Cff3Ldv/lR54yPtdKaeZJWIeo8l1vZQb8VdqAmC+WD6YHtruPlZeeuW0kTR
 jwgRFTNzf3axNv3hCLWg98CKGWaotgXpneDpoU/1QCrp4lC0Z91quXIEh6L7gKM9aDEK
 iFGyLwIxFbeZnsHh0ZASGP3uHOyp6o0euqzQAuPrnCVAlhyqTuMMCKLjbIJqqJDKAq4s
 gWFTZ+0CjeHj3Igf07ocIyoDO3gJBcbHv2yc9paki1NSBdK2vwAdNOSp93tkGzkCuvmj
 mp3R5xPB3mOvFIWKUTQV9N8nlL3tlRvVR+7p/6JzOAgfHPbTFc1aBR4CWOwrxi/41Y+Q
 OoaQ==
X-Gm-Message-State: AOJu0Ywdrl3yu18yS44eoIFeB+Yz5lF9lXagqJUNhRmm/ecs9Nk2E7bh
 2l7kJJUWUgJTFPH4s/rUbmq1qLkF/cgkRFZhIzDKN//SL26KOWYcH0PV7jO7Q4m2gLxI/HZtSad
 iGjo=
X-Gm-Gg: ASbGnct0Y8imrltobDrSPUxg8kDaurLahxorIuj5X7WXO6kftIX3CLdS9kNBvf1KKbI
 dvYPSeifvnNwFeLk938Ssed4RAwiIvvDEPWylJpUcg0fL7v/b3qYjNwrpuMFTJp+z11NWv2Hmiq
 B8FqWQzDZH78YyyBo4pBXjt10/nZIN7iHErYyZOUnyWslOFEfV1WAz9hLE57LbLttWivLVuT74m
 Ll3WYGpGbKcyx12TM+Cg+DOhqTZwIIVGR2qd9uZlrVU5CPH/odN89sirz1ET3L77caaNXnOe+sL
 rmJPNQ/VtTX/APZBk5jamfEwcoPNQCNKM2PngWoa051PIkZbN9M7qZBNSj9pSPuXzxXPP1SSvZp
 PKEDeuB0gQCPjaXeYhRbiNpQVV6y7mHV+LY8=
X-Google-Smtp-Source: AGHT+IFO71YB+uvVwA0j2tglWRNM92r2N3y83M6xs3xVUds+H2+zA2nUxIKPmLfMb6D+qKcA6tvc2w==
X-Received: by 2002:a05:600c:3149:b0:439:9e13:2dd7 with SMTP id
 5b1f17b1804b1-4409bcfa3a6mr20071745e9.2.1745493737636; 
 Thu, 24 Apr 2025 04:22:17 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2bf8dbsm17408385e9.35.2025.04.24.04.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 04:22:17 -0700 (PDT)
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Thu, 24 Apr 2025 13:22:02 +0200
Message-ID: <20250424112203.2858147-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745493737; x=1746098537; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qTf4JhYpveXYYLTeKpwo5wW6zENeChTRgGhtR6jHiYs=;
 b=jIdmKXGQCoMBe9mYZBJdD//cilo9+o7b2eaQsZBochFBFPVQRUoSQ+ZZ7aNJwENdBE
 Q+o7PW03tc6nq80OKchg0yCkA9Sh6l/4K1RmGUnM86T+Yf14RLPygnw+SRJVy1qeRKVD
 D7pmfZOM+wtaQhoWZrp2lLSIGP0YraQlgxL4g=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=jIdmKXGQ
Subject: [Buildroot] [PATCH v2] support/test: new dust runtime test
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
Changes v1 -> v2:
  - split output and exit_code from emulator.run()
  - check exit code with assertEqual()
  - join output using "\n"

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 support/testing/tests/package/test_dust.py | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 support/testing/tests/package/test_dust.py

diff --git a/support/testing/tests/package/test_dust.py b/support/testing/tests/package/test_dust.py
new file mode 100644
index 0000000000..8243024981
--- /dev/null
+++ b/support/testing/tests/package/test_dust.py
@@ -0,0 +1,32 @@
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
+        output, exit_code = self.emulator.run("dust testdir", timeout=10)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("testdir", "\n".join(output))
+        self.assertIn("subdir", "\n".join(output))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
