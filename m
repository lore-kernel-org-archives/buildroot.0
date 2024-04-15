Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFE1C4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 16:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA34C8197D;
	Mon, 15 Apr 2024 16:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11SXv8AuNiM9; Mon, 15 Apr 2024 16:23:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EB42818A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EB42818A2;
	Mon, 15 Apr 2024 16:23:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62B601BF298
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FBAC605EF
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIJ4Hig9QvuG for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 16:23:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C67C3605C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C67C3605C9
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C67C3605C9
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 16:23:00 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4185e80adfbso5448415e9.1
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 09:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713198178; x=1713802978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q2FssxX4Ky5dHnSH3od6FnQgoqju/NaFMEBOi9DYe84=;
 b=Uzgv8y5Hi3KBgiiaQFAjjWKY+yH6kd8iSL7X5mXe92JwC3DMsieaqMfG1e8Zny+/AZ
 7JyhAmlerye/rWNA010IDSjxFL6B+rnXpVZhiL7XVL+yal/1fe3jrCHRmHZUV8b24LKT
 Zes3lJiYR4dYk6KQKbroyPk4dAaMAQK7DLB5JTbox0YzhuxsETnCV2dY4vlggrqb55na
 QGhrKcfLu2m9Fzvutege4FgAB29CeNtwx8Mr9DYYpPkPE8VhnxgpxqkemT1dzxMKDKvx
 fqY6RAM0P5RGahArITqHYOwy/0lUS3n51wFzSwPHvq7iOyV9XoKemjsLeBz5HXfWLDnh
 jsYg==
X-Gm-Message-State: AOJu0YxUBQexovUtUVMfUb29yWuOup2Vhda/6thr8U18Qvi+C0AiwHSv
 Xf/Wci0NKUuKdcZ2OT5odQfEiLKebOntlhQROr4RgC06qzbjqVIaBzQ5qXsMJRh0x/r4f10I/RI
 Xg30=
X-Google-Smtp-Source: AGHT+IH0iwbTWcsGexd/gpgNUwE/uWaSJRok/dhff+LdHzR3PrdSmqiA8NJUy8UNA1CmVm4E4m9XDA==
X-Received: by 2002:a05:600c:350f:b0:417:e327:8b2f with SMTP id
 h15-20020a05600c350f00b00417e3278b2fmr7676695wmq.27.1713198178774; 
 Mon, 15 Apr 2024 09:22:58 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 fl16-20020a05600c0b9000b00418631f91c1sm4302938wmb.28.2024.04.15.09.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 09:22:58 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Mon, 15 Apr 2024 18:22:27 +0200
Message-ID: <20240415162229.1357491-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415162229.1357491-1-thomas.perale@mind.be>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1713198178; x=1713802978; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2FssxX4Ky5dHnSH3od6FnQgoqju/NaFMEBOi9DYe84=;
 b=FX3j3YxWV7DkcHyoXzM9uf47zen+psiDJu7BEp8aPj4i/bmuc7TXJLCDWdQGedlrZN
 m2kH9wz5izuTqlUeJQFNPQ5S4Mx+4SS7bihEkZcEfNRkxLznivwQAFwJco76F1//gc7k
 ZeU60n5LojPlbf9UaYdFx1jzX/n+QwVmpIOfWuOkYyM4lxPhfSpRkWRRgEXNpMyw30PA
 CFRLpjHqIetcxF4igU6FMNmA1CPqV8rDsd47rEz428nQdt6l8Cxmyakj3kOz04n/sdLh
 QdPDqAqveGtmoYprKH1EKB6XHNPHhJokvgTDIxzfJGSeP07/QUtL4sbSMVaigkzvWyjv
 Si+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=FX3j3YxW
Subject: [Buildroot] [PATCH v2 6/6] support/testing: add tests for Go
 providers
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Test the two providers of host-go to build a Go package.

- TestGoBin tests host-go-bin
- TestGoSource tests host-go-src

The tests consist of building and installing a Go package in the root
file system of an ARM vexpress QEMU system.
The tests pass if the program runs on the target.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_go.py | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 support/testing/tests/package/test_go.py

diff --git a/support/testing/tests/package/test_go.py b/support/testing/tests/package/test_go.py
new file mode 100644
index 0000000000..305f8aeb3b
--- /dev/null
+++ b/support/testing/tests/package/test_go.py
@@ -0,0 +1,41 @@
+import os
+
+import infra.basetest
+
+
+class TestGoBase(infra.basetest.BRTest):
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+
+class TestGoBin(TestGoBase):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_PACKAGE_HOST_GO=y
+        BR2_PACKAGE_HOST_GO_BIN=y
+        BR2_PACKAGE_TINIFIER=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.assertRunOk("tinifier -h")
+
+
+class TestGoSource(TestGoBase):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_PACKAGE_HOST_GO=y
+        BR2_PACKAGE_HOST_GO_SRC=y
+        BR2_PACKAGE_TINIFIER=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.assertRunOk("tinifier -h")
--
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
