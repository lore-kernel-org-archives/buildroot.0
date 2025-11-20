Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21716CF887F
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 22:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC0EC80EE5;
	Thu, 20 Nov 2025 22:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_ylRODlf172; Thu, 20 Nov 2025 22:08:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D8EC80EAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D8EC80EAC;
	Thu, 20 Nov 2025 22:08:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74C68122
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66C6180EA6
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOqMmuOP6ZQ3 for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 22:08:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A506880EA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A506880EA2
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A506880EA2
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:08:40 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so15106725e9.1
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 14:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763676519; x=1764281319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BMpEXKtEw+fUpyQxDpSskYyEukmEdz4A77pli6wm5PE=;
 b=GD+9LlZAegu4ckXgu2SrszPIc8ncgesdDlAPjW7Zwne3DbHMVYCRITsK34h/L3+3ed
 nL58WNSaGCWunaS+l63dkp0J0eU20FsiACtHncrNXVYqjNThj3BbogobuXGMNeKmf+uG
 t/dE2KIlTNyM4z4tY0o8yiLNu4PB0Q/6cqIEGmXYlqwYqIz1NjKp3KdABcmoi2leMryO
 5sIHDOaV/R1izUDC86as9RL1HpvFP//trOpmVmT3e0gtx9vw5I0zCbGflAlXydcuOVw+
 dmh4ZbK36oX2CtJSOHPRbE9wzrGax5V8AicpEr9mCh9HubY4qCgnj6ZysbaYBr+jXuiM
 djBA==
X-Gm-Message-State: AOJu0YwbLyeP/y9YItuGfLjFrTvELAaGwVKCtteKkzmAp3qYmFTQFcuw
 YFh3mV0SXQmmJaep4GvAl7XPROnFpaESppoDCeEBycFNRxdAv++NCB3Jp7bMxg==
X-Gm-Gg: ASbGncsEuDzXkFsogMDSVao2kBSjH3IylxHXKiPlXQo3kiJwwgjZm8pTNu8wyxEtv5i
 o7C+mj3eK7jocd2RhmxJJk6D1z4jOIDG3Hq150zRO6ymbXbYEdPhyRSjvr/5JafRnwnt/JDFLaB
 Se2FbLalTkQ/fYn0PPhNZNlzaMKvspjbC7KvaDrjx7+lZPBLD1/YxDR30C67g+6yrm6XySyXdsE
 zdRH+OCh7lp1mE8umcJ2qhuA9ZIy0ELmMa9iig9ita7gjmPPtzoY1FSO4bSccNs6l5XYXz3c+ZK
 7PscX8na777RBbIhsFuTFl1ZuR54sKl3yCHLE2Wq5PM472kaIDro8VTuJCnyrCFRU5amL3HqNtQ
 K0nxKRE3DogPxGy8VxdbN/D4BlQS/cg43Pe1yX5bK86nFElgtWLDYIE00qUTceSop6z98tmE975
 feXF8fqXla4T+unGlCBAowBa5X7RkGlv+JDZ5F/JYAoD6O
X-Google-Smtp-Source: AGHT+IEn/sCdtfjHhGIvcmAGTEj/DA2Z7lPUwoYKRB1d0NgTdC4ZhhISfCAP3B4T9bPoUog0xWp71A==
X-Received: by 2002:a05:600c:a08:b0:46e:1abc:1811 with SMTP id
 5b1f17b1804b1-477c01bdea2mr1947295e9.27.1763676518577; 
 Thu, 20 Nov 2025 14:08:38 -0800 (PST)
Received: from zgyarmati-t580.. (netacc-gpn-5-84-233.pool.yettel.hu.
 [84.225.84.233]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a972141bsm71641275e9.2.2025.11.20.14.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 14:08:38 -0800 (PST)
From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu, 20 Nov 2025 23:08:01 +0100
Message-ID: <20251120220801.1877397-2-mr.zoltan.gyarmati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120220801.1877397-1-mr.zoltan.gyarmati@gmail.com>
References: <20251120220801.1877397-1-mr.zoltan.gyarmati@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763676519; x=1764281319; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMpEXKtEw+fUpyQxDpSskYyEukmEdz4A77pli6wm5PE=;
 b=X7FvMNE++vWKp6Vf/ejTUZHMdhNc2mIKn0t7uvL+lvZct4IDvlA0GJTsdF+s00eovn
 X5tvMA3xyvbZPlsl4LZ5g7QxtLjICuSInilQr2KZSUi8wcRtU5hLVctA5V26+P9C1wVo
 DplMn5YCkZUKGavotS/LYaEvk3AeTp9uZX0auzNKon+2kS2PHpmzcuJDTD9BmTSDIrGS
 jWeoVzk5IxlR5F016HYAgjRkjr4ezlHjRDytq2DAfupbZ5uGUkmAfADRZpNjfE2UpeSw
 N550/uP/BwpSeQpYppQHsbpjGpCYM7qMQKr8JGXm0OTb1Kd9ZPANp1SFG6jJnXgAf/Xa
 r8eA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=X7FvMNE+
Subject: [Buildroot] [PATCH 2/2] package/quazip: add runtime tests
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_quazip.py | 43 ++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 support/testing/tests/package/test_quazip.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 0272b4ba33..86a91332d5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3541,3 +3541,4 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+F:      support/testing/tests/package/test_quazip.py
diff --git a/support/testing/tests/package/test_quazip.py b/support/testing/tests/package/test_quazip.py
new file mode 100644
index 0000000000..ae17546898
--- /dev/null
+++ b/support/testing/tests/package/test_quazip.py
@@ -0,0 +1,43 @@
+import os
+
+import infra.basetest
+
+
+class TestQuazipQt6(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+          BR2_PACKAGE_QT6=y
+          BR2_PACKAGE_QUAZIP=y
+          BR2_PACKAGE_QUAZIP_INSTALL_TESTS=y
+          BR2_TARGET_ROOTFS_CPIO=y
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # qztest returns non-zero if any of the tests failed
+        self.assertRunOk("/usr/bin/qztest", 120)
+
+
+class TestQuazipQt5(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+          BR2_PACKAGE_QT5=y
+          BR2_PACKAGE_QUAZIP=y
+          BR2_PACKAGE_QUAZIP_INSTALL_TESTS=y
+          BR2_TARGET_ROOTFS_CPIO=y
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # qztest returns non-zero if any of the tests failed
+        self.assertRunOk("/usr/bin/qztest", 120)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
