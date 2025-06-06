Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1803C5B559
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 07:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 948C884EF8;
	Fri,  6 Jun 2025 07:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14J7_5c6NGJ6; Fri,  6 Jun 2025 07:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2C5984EE6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2C5984EE6;
	Fri,  6 Jun 2025 07:02:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D357DD3
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1C3640143
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnkRiadzZPSu for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 07:02:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1DEA940042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DEA940042
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DEA940042
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so1247399f8f.2
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 00:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749193333; x=1749798133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=annWRYCb4ZaGzNItTvLE7pZwTyLI0rmhTIDEKwE0sHw=;
 b=NiimG3WmdEpPIJT0mYKTZ9kBrrDSYULG16yBVzHdQclYDw20QI2q8PlfKiOAFTHTjV
 WOHIyUIj7GC0XKDvmkpdnSrOj5guF3upQEWp0sdbP7Y6laygq/gTLdgdB5igBE0h3PzM
 tAoKkE3X7U82IhverqPRVmYy3Y2AeTWWKtvXfIBJ9GHAboETxUMumoHc1KMThSCHgADU
 1jJzTgGOj2GS2fPV0PdYCIlBOjUg4pY/3Mw+uymSDhkun3iAwEks7hFSa1lU7XGdN665
 Xdoag5edxIOHdF61CipmMCvY70jI/mhChhmeOupYfBnvGN/EIAHMJMrUqpVGfYHvAKf6
 mGZQ==
X-Gm-Message-State: AOJu0Yx8H5EUp5TzOp6T9QR9fU9ur9gLNYgZ+G9cecOl7peHO1K3XVHO
 P/ib6AExM2Gea/OBK91vMldm/LL/7NzmUoDJbG9/MovwBc1V4fbfTNbXjqo+DX03AOsE6GQJjst
 /uhbI
X-Gm-Gg: ASbGncucc5wtnX5NwLRZ80AoV5a3BHVjg9CDDw2YB09oQXIKdRbTNSi02S4lRHIAvVk
 DzhUjUTtzYxWyRBJH5U44pajy/pXeem3EuHBhHtatT2CCwdVvTlEmtFLdlcCaI0tvbhMwFUtdBe
 ElHuhzABNDNPhKhLfbHTd4xrMyuh8Zbp8C7lZ+78a2VHfVIYMN5gqctyljjLR3SWC7HhQtsOryZ
 vLLpJJV4uqVG7WRUi9+UXxycL/Ap1cCDSrv+8xDD7FKfbBTuw78wFWJsf9KXfzKlEAEQPTLl/Jk
 am7lMoST2s0Ke12hYmxV4XrvD9ybaMSFLwJWRTg0Tlf8aSpYHT1IPVsQXEHPPMoH15TfvMZmrsb
 w1tInc+8VnFR/lGV51NodeV0C2Vpm71GUnHBntg+DGntPoA==
X-Google-Smtp-Source: AGHT+IEfOnMSL9TbUhrUB2Jnv53sAo9cSwt/O5etCTXSsEdVT6W1S42RObdRl5wjNTwfM3nAKJ/EAg==
X-Received: by 2002:a05:6000:144b:b0:3a4:e6b4:9c4b with SMTP id
 ffacd0b85a97d-3a5317849cbmr1909011f8f.1.1749193333359; 
 Fri, 06 Jun 2025 00:02:13 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229d96fsm1035353f8f.7.2025.06.06.00.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 00:02:13 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Gilles Talis <gilles.talis@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri,  6 Jun 2025 09:01:52 +0200
Message-ID: <20250606070152.396438-6-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606070152.396438-1-elmehdi.younes@smile.fr>
References: <20250606070152.396438-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749193333; x=1749798133; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=annWRYCb4ZaGzNItTvLE7pZwTyLI0rmhTIDEKwE0sHw=;
 b=tFtG4c72goDTyhvR1glUriktu2V04vZKt8W5KZKua1txct85ciQD/t7f5j51Ks4thL
 vfJm4zrhH4jShOCioqTLXwO8vGlkMMib3TX0SNF47ry+KL1ICtI5VUMKngjx9cfaxVwR
 s+TR5XkWaRx9LgdAzqxtOtz+AsZbivR7SV2lI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=tFtG4c72
Subject: [Buildroot] [PATCH 5/5] support/testing: add runtime test for
 Rusticl
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

this test verifies that clinfo correctly detcts
the rustiCL platform and llvmpipe as device.

We check:
	- exit code.
	- Platform name matches rusticl.
	- Device name matches llvmpipe.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 support/testing/tests/package/test_rusticl.py | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 support/testing/tests/package/test_rusticl.py

diff --git a/support/testing/tests/package/test_rusticl.py b/support/testing/tests/package/test_rusticl.py
new file mode 100644
index 0000000000..d8f05a8636
--- /dev/null
+++ b/support/testing/tests/package/test_rusticl.py
@@ -0,0 +1,53 @@
+import os
+import infra.basetest
+
+RUSTICL_TIMEOUT = 180
+
+
+class TestRusticl(infra.basetest.BRTest):
+    config = """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.31"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_LLVM=y
+        BR2_PACKAGE_MESA3D_OPENCL=y
+        BR2_PACKAGE_MESA3D_RUSTICL=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE=y
+        BR2_PACKAGE_CLINFO=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="1024M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+    """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(
+            arch="aarch64",
+            kernel=kern,
+            kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+            options=[
+                "-M", "virt",
+                "-cpu", "cortex-a57",
+                "-m", "512",
+                "-drive", f"file={img},if=virtio,format=raw"
+            ]
+        )
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+
+        # check the output exit code
+        output, exit_code = self.emulator.run("RUSTICL_ENABLE=llvmpipe clinfo", RUSTICL_TIMEOUT)
+        self.assertEqual(exit_code, 0)
+        # also check if platform name is rusticl and device name is llvmpipe
+        self.assertRegex("\n".join(output), r"Platform Name\s+rusticl")
+        self.assertRegex("\n".join(output), r"Device Name\s+llvmpipe")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
