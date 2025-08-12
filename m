Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA056CA0EDB
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 19:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A15834286C;
	Tue, 12 Aug 2025 19:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvQKgm_IVWoi; Tue, 12 Aug 2025 19:29:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F034A42877
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F034A42877;
	Tue, 12 Aug 2025 19:29:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1C731D1
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 19:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF4C54279E
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 19:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kpm_nYuCYp7Y for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 19:29:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E280542864
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E280542864
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E280542864
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 19:29:50 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-af98841b4abso968060966b.0
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 12:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755026989; x=1755631789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fwdI8n8kkd6aNO2Va9X3ykmPzsoCXXb90aF7rNFtZbo=;
 b=FrZruY8VRZ1XetgRRYe1RM81BFQ0smVC/Od89HNB8M4D6xCR5UUOgRt9ttbqGvoAnA
 LrEUBCkxGJh3bVpckg3F1X7gAKTUx04vnQWMpXiwr4GIPVTMLF9rF+TkhF2ecIOR+Nu3
 GAYVrx6ZxMwGQsMixAuER8UoAp4euEFpuWeJZaKsvAGzOvZYgDvaNL7CshMVpkv4uk1y
 zqrqyzew6gihiO6OY0yjoj4XVhrD94PcJA8hwMHWQ0aYLqogdYH+MDbhcyxcNDduW4RA
 D9dZMeLEbs+f5iLvJfMtQmZorXUF/GecPQ0XYbz3XeURY23TbNYb5sCW0p9SeWJw4L58
 ap8A==
X-Gm-Message-State: AOJu0YzyJ8x5ERyoql2+2BrVOiZ8n7ADcs++JMMyFB7GewaxzkMAv/PG
 fOaip+/WVLGfzrv9Qhyov6BypBAsInliVfSCQ6JfXujthm+S3mJT9GMRSq8hnvg=
X-Gm-Gg: ASbGncuzDtqFDHX864QVY3eEoDN/cgS8jcm8CuWSZByqyV70BWKOl6Ptj5tiNthH8E6
 SctFpddSo2ngihasAHvcISpsL5dwluTWvXal2IWlXaqUkNK+nZ5ZaYLRGzNOAUZ5tAIjAZF6jOg
 EONGZL/Jkx/VqVsSGrshFWp9RWGTjELPJsDIMYNFBq1DFOfgRgtEUhdLLiyHPQZVtgF0gvwNb2O
 aQ3/bTvAAWvkuzW0QpPOq9T6/oFfPJXRkRElKO4kUMRD4clnE+M8TO/EDQoo134K+aaKR3+MVu7
 cij0XpeBTVCyh8EUJVGOC8NF0v7WcKfDAsDbv7JO5KRhbVyUEGFdEm4oyucg0EXNOo3ou6HVYZo
 tCubXXoRdBh4kxQbOzw74PkcYQJB13tdUe+Oo
X-Google-Smtp-Source: AGHT+IEdX6infTx4qg324vFMdZTPJUk9Uo3Dgdpd8AhcYYITisOfoJw26NGxPIN++UkNs8cTptWOHA==
X-Received: by 2002:a17:907:3f1f:b0:ae4:933:5c50 with SMTP id
 a640c23a62f3a-afca4e7c08dmr46752666b.41.1755026988500; 
 Tue, 12 Aug 2025 12:29:48 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a1251sm2265415566b.30.2025.08.12.12.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 12:29:48 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: elmehdi.younes@smile.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, romain.naour@openwide.fr,
 Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 12 Aug 2025 21:28:04 +0200
Message-ID: <20250812192941.3477597-3-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812192941.3477597-1-shirokovalexs@gmail.com>
References: <20250812192941.3477597-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755026989; x=1755631789; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fwdI8n8kkd6aNO2Va9X3ykmPzsoCXXb90aF7rNFtZbo=;
 b=DJ2kTO5PIDEo4h5wpuOuE4ZiG8WKSWsJDPXcpgTUZFsyn8jmAhT1lUXrPT8C5G1RQb
 /25gRCqMeUKCYSQLYVGDKg546lDQ5Q0Q+5a6OUUHAHoaWMBOyfNCgIifX543SvNR+fOh
 yOmuvI+ftoq/njGcEawfsEqcIeSVqhi+CKiLIaecBufskIicaJzboLRoa1FAm23eAcxa
 SSqm/l7VK8dRXiaLWYqPrKZMbVgr7Oz7Ar4Hd5Hi6bcnQiCjHVP2r9fGa/0nEkMUthtz
 grEHf5oHi9DXrnxQ93feVDUbuwX7ldg7MaYO/OqdJUfO37oG7555XOK2ZqW9tzm3RnLU
 QP8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DJ2kTO5P
Subject: [Buildroot] [v6, 2/2] package/uutils-coreutils: new tests
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
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
