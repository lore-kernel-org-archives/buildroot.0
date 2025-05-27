Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B89C54F30
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 07:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3FC560A92;
	Tue, 27 May 2025 07:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9Xg4ryZhki7; Tue, 27 May 2025 07:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 742E260A8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 742E260A8B;
	Tue, 27 May 2025 07:48:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 340E419D
 for <buildroot@buildroot.org>; Tue, 27 May 2025 07:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31AC860A8B
 for <buildroot@buildroot.org>; Tue, 27 May 2025 07:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yFvjQisSVYgU for <buildroot@buildroot.org>;
 Tue, 27 May 2025 07:48:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B36C60A80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B36C60A80
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B36C60A80
 for <buildroot@buildroot.org>; Tue, 27 May 2025 07:48:11 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-604e2a2f200so2224203a12.1
 for <buildroot@buildroot.org>; Tue, 27 May 2025 00:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748332089; x=1748936889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SvEXYNhia0Pw3b0ZKdQRhuzhlJCyRxgDjKaxHPiKHe0=;
 b=B5hfncp89+4DSNcmoN47AJrcPw7QDat6JXZq9FdQ5MhntDsMlkjnMg9V0+tHILq1Rp
 KEJZhb804p5p+ikwx8FrVg2Yn7LhuwKnMIbJy7eWAhw4TWJohIl4ghJLAy6J/Z+FeBmS
 NCIxd/PoczwC4TZzRpBHt1Y+BIv+XP/oMDAaW2ByYJAQdKhddM59/pNV3v8HKgWShCLU
 OPWQ23wQHhVhOWdjTsjXJ+EkRdRJimiH7GffbkJyWq4z6T17ncaJiKf4mpRda18oTJYa
 PbmFlqMhAH730qs/p6jrNBt3CWuG7Mwxjp+fiUPjPsUHEdacW4uZZwPekgabtmOx9Xbi
 ExvQ==
X-Gm-Message-State: AOJu0YwYgyj9nuic6JajGjREGVjX4jOVJ1jHcNq4kxjnL4CPAvAdIxGU
 yR6O2Ga7vStuwRR6hwuMHvmSuMfq31dJKPLPuHMlq8yGHu/I9+WIldLDLt3B
X-Gm-Gg: ASbGncs5Mnjya8care6ZigvzJG0PAn1TidpaptOcj0qwGR2f4RvFoDR20RMb8l8oPSq
 x7ss1ONx1dXdEWmDAzeW3sNTk3TSy15YD8cVY1fqhr7LIWu912cX4fUchT608iI4cUIWs1UnIws
 f3CXARRJTmwMpAwA6AJ8iurpR7S38gVLyzvVu4cVc7F/eidofFb1sLbrx7YUz9sfUKXwS5c+vcS
 0OTD730nD7xzmjMaBCAdp/qXDz62ZosB7XAMVz9Vt5AurZwkJFz2EpCYYypFEWJewGLi7nSsbwP
 rN5zf112XeVdPAdam4td/BGjajaUJKGk6/yq3xATRCiKGfa4lldpNyZbTjcCu6wlHA==
X-Google-Smtp-Source: AGHT+IHByCKAB3ZM0ZN2OFMT3I+BSg3Oow68RSsBkfix3s2niAbG0oCyvyUwDZdgsEJ/SNErgQxJZQ==
X-Received: by 2002:a17:907:a089:b0:ad8:93a3:29c1 with SMTP id
 a640c23a62f3a-ad893a32c71mr52784166b.37.1748332088864; 
 Tue, 27 May 2025 00:48:08 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d047749sm1803199266b.8.2025.05.27.00.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 00:48:08 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 27 May 2025 09:47:33 +0200
Message-ID: <20250527074745.8981-2-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527074745.8981-1-shirokovalexs@gmail.com>
References: <20250527074745.8981-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748332089; x=1748936889; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SvEXYNhia0Pw3b0ZKdQRhuzhlJCyRxgDjKaxHPiKHe0=;
 b=ijNl701Eo79uJsB6Mdw9utjxO5wKgJCk9M4mVLIXb5x6V7fDjfTMUa6X+xu1qyg4qm
 fXlxhV3g2ZK/uYuymZKBCVB68oHHQj+ccMHJv/nOf6nSFaXX98VE5DN0C/lH5xj1MFNZ
 zkgRGAk18e8vp2kfU8yMOKVOQ56Ymipo4SFITQg1mp9sZvrXNTbQYWxhBMScW2nrGT3v
 sutb+oaz2z/wLE69VwwaRWmuW3E2uiihPBZSAg8a6WoVJdyRtWdgwP5CTSU+S4yKRT4T
 Qj8lwsTw+yd9QXC2u1xc0BnujHTxscfwWgOOMJpGI0tE6et62MaYDDMswXip7t1+fefS
 Rmvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ijNl701E
Subject: [Buildroot] [PATCH v5 2/3] package/uutils-coreutils: new tests
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

Add a small set of tests for uutils-coreutils to ensure that the binary
is present and executable.

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 support/testing/tests/package/test_rust.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index 8160cb6053..c0fe56f1be 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -28,11 +28,14 @@ class TestRustBin(TestRustBase):
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_PACKAGE_HOST_RUSTC=y
         BR2_PACKAGE_RIPGREP=y
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_UUTILS_COREUTILS=y
         """
 
     def test_run(self):
         self.login()
         self.assertRunOk("rg Buildroot /etc/issue")
+        self.assertRunOk("coreutils --help")
 
 
 class TestRust(TestRustBase):
@@ -50,11 +53,14 @@ class TestRust(TestRustBase):
         BR2_PACKAGE_HOST_RUSTC=y
         BR2_PACKAGE_HOST_RUST=y
         BR2_PACKAGE_RIPGREP=y
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_UUTILS_COREUTILS=y
         """
 
     def test_run(self):
         self.login()
         self.assertRunOk("rg Buildroot /etc/issue")
+        self.assertRunOk("coreutils --help")
 
 
 class TestRustVendoring(infra.basetest.BRConfigTest):
@@ -70,6 +76,8 @@ class TestRustVendoring(infra.basetest.BRConfigTest):
         BR2_PACKAGE_RIPGREP=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_UUTILS_COREUTILS=y
         """
 
     def setUp(self):
@@ -95,3 +103,4 @@ class TestRustVendoring(infra.basetest.BRConfigTest):
     def test_run(self):
         self.check_download("ripgrep")
         self.check_download("python-cryptography")
+        self.check_download("uutils-coreutils")
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
