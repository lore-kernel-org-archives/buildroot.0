Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B12C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 13:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92D06608C5;
	Fri, 12 Apr 2024 13:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qsy1AARtqYOv; Fri, 12 Apr 2024 13:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB57960899
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB57960899;
	Fri, 12 Apr 2024 13:28:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 402451BF3A9
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D68C60863
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzDyG8aItOin for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 13:27:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8465F607D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8465F607D5
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8465F607D5
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 13:27:44 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-343d7ff2350so596103f8f.0
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 06:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712928462; x=1713533262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q2FssxX4Ky5dHnSH3od6FnQgoqju/NaFMEBOi9DYe84=;
 b=SfwKgiZTseLsEjVhyb/g2mTxrOUWDXWOzmSbruWM0TF1Ml3fVky8UycAzXWckfnlme
 xJPIzwp9owLn+IBk+tDf0xeq+pktPXEKgiqLHp1FzAy2jvPXlnIyqIB038y+pCqv9L4C
 eVAJhwNF+53Rf+yjhBbfIM8V6M60/Ky2/5cnemn9LGI1SJViJAbHErnRT3WdehhKobRi
 vwFVpgSI0FJ9DFmGKYaTFQ6iwYxOLt5OKsAmS5KXxwV45K1RsY2leVV3z4wC85NSPyd0
 Rh07jQpQMeSkXGK/C3hjue4X2F8waCb59Ubg4PlOHdXrBvzMeY90O+ml5zNCU9TBJ4Lp
 GeNw==
X-Gm-Message-State: AOJu0YwpTUzRIy5x9aaMUdHeuyPZvqVpR1Tq5KnVEFa9vK620lIV1Wl+
 cwkF7DzlWIg+zEKDFB3YlwTR9N6kQXbDjkK4ISiMFvzGfjnT3FGokx6dOcWWFmDnm8pgNovfT7O
 mTGY=
X-Google-Smtp-Source: AGHT+IHOjcjNI7VXqiLiptjaNsF7WBfkD/VGlkInq+0BN9KLltPoImYkEp8KDSoY6h8U+UprjXZ1RA==
X-Received: by 2002:a05:6000:402c:b0:346:1ab6:dbd5 with SMTP id
 cp44-20020a056000402c00b003461ab6dbd5mr2176537wrb.20.1712928462511; 
 Fri, 12 Apr 2024 06:27:42 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a5d6a84000000b00343a66f6be4sm4288163wru.24.2024.04.12.06.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 06:27:42 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 15:26:58 +0200
Message-ID: <20240412132659.1168317-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412132659.1168317-1-thomas.perale@mind.be>
References: <20240412132659.1168317-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1712928462; x=1713533262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2FssxX4Ky5dHnSH3od6FnQgoqju/NaFMEBOi9DYe84=;
 b=GV5cV7UJKtd2cji92LGtdOLBbbyFei2WfddAKT5XeoQTL4JC2T+ZUdPvkJ5h9oJybV
 dfKonB9mjckAHt90d1WjJFzvIz0o0AnJ8/NdhEX4ALz6ivx4ApbJc0wx8AEDfx4QA+fF
 qf5bB7SmVQsLChd+MaGImo1qQhJzIP+NQI4E8vQZnj4kdR5PqvYUAXyt04nwe+zgp1ZR
 QdOHx5gc80ZyBmH2ci2uxF84RdHQK8ZtW2QIWVdvzVpiu5NxqaZ9EM3YSBybLA9x/Bx1
 DkshuWZsjLvYmDVbCeFSrEOLnvnT7YzgKkmD/8tscwWSCluts/RIoksPzIxzHA8+sWYe
 nfsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=GV5cV7UJ
Subject: [Buildroot] [PATCH 6/6] support/testing: add tests for Go providers
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
Cc: Christian Stewart <christian@aperture.us>,
 Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Thomas Perale <thomas.perale@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
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
