Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D67FC54ED1
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 17:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EC1660B26;
	Tue, 27 May 2025 17:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37BPXRSbrV7T; Tue, 27 May 2025 17:14:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F03860B75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F03860B75;
	Tue, 27 May 2025 17:14:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 987C028B
 for <buildroot@buildroot.org>; Tue, 27 May 2025 17:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A22B40286
 for <buildroot@buildroot.org>; Tue, 27 May 2025 17:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NySbnJcss5x for <buildroot@buildroot.org>;
 Tue, 27 May 2025 17:14:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D22E5400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D22E5400F5
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D22E5400F5
 for <buildroot@buildroot.org>; Tue, 27 May 2025 17:14:14 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad55d6aeb07so693515666b.0
 for <buildroot@buildroot.org>; Tue, 27 May 2025 10:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748366053; x=1748970853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SvEXYNhia0Pw3b0ZKdQRhuzhlJCyRxgDjKaxHPiKHe0=;
 b=iZyMqd0k+F27oHktP2AAPM+c4XW+Azn/zpBYC+qLAnr1FYYuyxkkm3fasC+qLYPvOm
 94/A2grSG5130xq/98/KHV3wxd+DGFp40IGK4B7/L6jDlnFWe5R89a2IzVOPb3HRIJ2F
 /8Q8f/opluVQS0HkpSi9PC5CwAY32cpkBzh/uX5gVgTZvUlsvq93fVLhnvkzC6Z8HJqJ
 uIwso1IiXXCisjqramdGzQr0mVVsdFTEyQbOyIkzz2P4rkLGmrNSP2VxMDmDCfBbKHAU
 0QjBFl47p91MSxsuEWWu23OcD1O6kB5ARC0JkkaH8SqRMl8mQffZ9GseNWWAeCfg3QsN
 KATQ==
X-Gm-Message-State: AOJu0YyN0u00M1lFDLZjOx4S8pUkS83zX3rLs8AhcVxaFPOpKfh25e1X
 bb1Iinfnf8WM4+YSIg8DzlGgtoLx6vR5V11+D0yiAMpVufm5o4NRqlyNA5Bv
X-Gm-Gg: ASbGncti1LFUCqfUIQ7fXHE+fYuJI+jcDj5t76Va5H0k4aGouOWb5VHRCn9TPjFYEbl
 rIvo9/U0RGNOee2snbOk92uxY11tn5nQxFkzi9/e/TLXSQiiOI4pVpyxDc0xKY8WI4QInw9qWzj
 ZV0s81pJxBhr/i8+cD+IlamhVzNrYMjk2erHDrNY5+jkcB69Txs1TISw9X+Rj/pWeR/VE12wYt3
 rWLEa8HbxzZKv5HWk+WtoLvGoy8MtQFyni4K0f3w11WxUxwm3F0nzlix8+pT7s8kdoqckk4cYn1
 F4fLeDcKvuJf7AUfpSuDIifKXow4HLkm8fqPjVc7WXE6HjCKk8V3sTkcor7Wf2N7wOlhR1JcqHT
 o
X-Google-Smtp-Source: AGHT+IF1DJXJpSA9edxHkJsxMICpbQyCEgj/DBYfCb4rAZeZhJEIgpHGRIM4DjEH9Vl2itZ6iIPNtQ==
X-Received: by 2002:a17:907:a089:b0:ad8:93a3:299e with SMTP id
 a640c23a62f3a-ad893a32c63mr237133866b.31.1748366052537; 
 Tue, 27 May 2025 10:14:12 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad89bb4ab07sm17151366b.168.2025.05.27.10.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 10:14:12 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: eric.le.bihan.dev@free.fr,
	Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 27 May 2025 19:13:57 +0200
Message-ID: <20250527171400.78560-2-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527171400.78560-1-shirokovalexs@gmail.com>
References: <20250527171400.78560-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748366053; x=1748970853; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SvEXYNhia0Pw3b0ZKdQRhuzhlJCyRxgDjKaxHPiKHe0=;
 b=UtjNB3Lxz4uRuj5cdqHk6Ek2mbfSpYotmivCjAGSfvlYa8hDV9hEfmnMLiBjtrjZ8J
 AqUlTV4x053an2ZkNdc0QpiPyHm/Kz/Sx1BQE0I+NgcYmKKQMo/6b+7oMDeJpY3oUSB+
 Gl8dvVMGkP533jFNRSpaXNH4z4la/5zXBz00v5N5ydHlhyMjdmvfzLJ3LxS85o2RfYoB
 vsroF/+k34LzDCXvzP7JKZP4vYiZekj7jaCBpl/x+bgzblqyCKbFy6I05oxwPyYWfyYE
 cYXkVtgPA7h1jTGNt890iKt7YdjBhxxM4y+czQLTl1lBfYeSS4iBR5iXONyahqdK+2CX
 nKyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UtjNB3Lx
Subject: [Buildroot] [next, v5 2/3] package/uutils-coreutils: new tests
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
