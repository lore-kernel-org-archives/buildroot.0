Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD81F013CC
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 08:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C9C382F11;
	Mon, 16 Mar 2026 08:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cL7OHNv9Z1xz; Mon, 16 Mar 2026 08:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E2882E4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773649540;
	bh=8+PjnAk/mTtbIyaROjHILQ4VROgNBLtR5S0WeuwISMk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hwsfGE+411sBmbm6U+iQqvqzyowNwH2UK+tBP82hjo5331VvdAs4tDNDB6sAwPnU1
	 FXZTIK3WSE0w4aYYurUZ7tkutstccqRVmSlID4VSte2EjJsnah6RuonN8PEd/rhATv
	 RsPiwA8TiA0yhdcFYg+qGJ9xzyejtHBMvf6Z78yKwwvcb6lc5/rQpmKEnSasBRSXmb
	 VxbknqmvFCeihwMdoK0sB957qlGeAyMXDf78Begr4HXJ3sLKGqklOHKalHWKRnsW/4
	 CEQSu7ixLZDR4dL5co8VYyrVIBc8b9xLse57Av8s9EU5FcllB2nhHxSMLoGfAaJmZ0
	 rEGbheUEKUXfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4E2882E4C;
	Mon, 16 Mar 2026 08:25:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0394DD3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9C3182FA9
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMDsYMNHcOdW for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 08:25:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE38682F57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE38682F57
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE38682F57
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:36 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-439c5b40f60so3293744f8f.0
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 01:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773649534; x=1774254334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9nGlfb7Bv5isbE1Km65ERnKM9phmRxZ6R4ZwHhW8qEI=;
 b=S0cR5jZfU7FYTKHvBEgRn0tdur/EvldcskcIUcsZ2V9r0Dit6IoYgPYojo9FODlahO
 pTK59ePDDQV0d+MA90sagBPVjxzQ1/wOhSVarxuPRgvaW2DY2jgCkP1/7XhMIi/kLjMf
 NJMyJ6rtaTwfuCfSwmD3I7/zXoxM1eDDkDk884d9SVVyqcpsqxGr4+25M/4Guom5V7qA
 O3SACPZ3U8oEIeuyYJX5g9RWk/gZ7D6MoqQU0pnUq1oDXuwae6PbrAxig1huPoagbXcA
 nNhAdxqU6Jn9yxVsQMThVkgDntBZLAzreZSwzl5gTokq0E/j5wANRHxtPFXjLFKNCSkx
 bb1Q==
X-Gm-Message-State: AOJu0YzzS2GFcX59iR3hAikt9V4URKIQe+3iF3lHV1LxHuC3NxoiObce
 LuOhk4xvcJfTUeOl029/tLKndzhujOL4E5RKXPGqdC3adNzzsc5la+M3+jXGTcd5r3P1o47E4eI
 4AJZJ
X-Gm-Gg: ATEYQzzqI/Vs3THXh1zwm2Gho4Ivlb82YQ5s8yML8oEy7zdvc1xPTZ9W3rjS7gjO/jf
 L88k12bAGZTXQGStiUn1nTEg241sbHsz8IEFb2JRym21ngzmZP+NtMqvYbDPBScefbqsdivneQC
 d7ousU/Pvu3f34rpzuZFe73rhYcTphXian7UkMmYRw2tyCefU8YHH7uIG3NSEF7A8mTOTpgcm3I
 aBjN4+rlJH0Jr9fzU5xiH6BT9Tx5t4RaaxpZxat9qo2ZS0B1sZnEjCf+rmt3hzup/jhR0d8JEci
 HOVsiI7R0Wt4aYk0ifLxcKADhGuaES6UDbjLpElTmm32+TTFYI95Cjg7pQOCWWyPIUzPe3Q6Ueq
 J/WcRysxuWMoWqPXDclOxUr4c12fRWaj+mdd+Ls/DjH8dwr8Ufqa/pzM6qygAaMTbRHtMFFJIP3
 g0VNs7+6FV928Ngc5ACBiyuZQnMQ/+/PlC1FveYjipqgQIE5VH9bnQDlwc0WRU9sBBvEf3v0rba
 SM/UR58IybuDHiWgMtACQ==
X-Received: by 2002:a05:6000:2dc2:b0:439:b1d8:608f with SMTP id
 ffacd0b85a97d-43a04dc25c3mr21700961f8f.46.1773649534438; 
 Mon, 16 Mar 2026 01:25:34 -0700 (PDT)
Received: from FRSMI25-BOLET..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe1a72cdsm43151174f8f.9.2026.03.16.01.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 01:25:34 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>, El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Mon, 16 Mar 2026 09:24:55 +0100
Message-ID: <20260316082455.1392636-6-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316082455.1392636-1-elmehdi.younes@smile.fr>
References: <20260316082455.1392636-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773649534; x=1774254334; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nGlfb7Bv5isbE1Km65ERnKM9phmRxZ6R4ZwHhW8qEI=;
 b=PUQL3rjSQ20cTblNZmx0uttCJmRdaGCUUSVL7e9To3Yw5rXWG4u1ek4Z3tSuEguiM/
 K6bU6bbyZOWrQwndv4FRah5xAFM41aJHETKgHIOa7TU8gl4EoSn4GN1WbFQydadkLaUj
 KouyLuB+bgTqZcMTAb4/vkj10o+S5tgvT6yCY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=PUQL3rjS
Subject: [Buildroot] [PATCH v3 6/6] support/testing: add rust-kernel test
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

Add a new runtime test for Linux Rust support. This test verifies the
compilation and runtime functionality of Rust within the kernel. It
uses a custom kernel fragment to enable the minimal Rust sample driver
and validates its execution by checking dmesg for the expected init
message.

The fragment explicitly includes 'CONFIG_RUST=y', because
'CONFIG_SAMPLES_RUST' depends on 'CONFIG_RUST'. In theory, this
should be handled automatically by LINUX_KCONFIG_FIXUP_CMDS as
defined in linux.mk (introduced in commit e8a9b81d4c). However,
Buildroot's kernel build process merges configuration fragments
before applying the fixups.

Including 'CONFIG_RUST=y' directly in the fragment ensures the
dependency chain is satisfied during fragment merge step.

Since the used packages are host packages, the rootfs size is not big,
so we use the default value.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
Even though passing CONFIG_RUST in the fragment resolves the issue here,
it might be necessary to investigate the order of fragments and kernel
fixups. Switching these two steps in the infra could prevent this kind
of dependency issue for other drivers.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 .../testing/tests/package/test_rust_linux.py  | 49 +++++++++++++++++++
 .../test_rust_linux/rust_linux.fragment       |  4 ++
 2 files changed, 53 insertions(+)
 create mode 100644 support/testing/tests/package/test_rust_linux.py
 create mode 100644 support/testing/tests/package/test_rust_linux/rust_linux.fragment

diff --git a/support/testing/tests/package/test_rust_linux.py b/support/testing/tests/package/test_rust_linux.py
new file mode 100644
index 0000000000..3ad655cc97
--- /dev/null
+++ b/support/testing/tests/package/test_rust_linux.py
@@ -0,0 +1,49 @@
+import os
+import infra.basetest
+
+
+class TestRustKernel(infra.basetest.BRTest):
+    kernel_fragment = infra.filepath(
+        "tests/package/test_rust_linux/rust_linux.fragment"
+    )
+
+    config = f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.17"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_LINUX_KERNEL_RUST_SUPPORT=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
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
+        output, exit_code = self.emulator.run(
+            "dmesg | grep 'rust_minimal: Rust minimal sample'"
+        )
+        self.assertEqual(exit_code, 0)
+        self.assertRegex("\n".join(output), r"Rust minimal sample \(init\)")
diff --git a/support/testing/tests/package/test_rust_linux/rust_linux.fragment b/support/testing/tests/package/test_rust_linux/rust_linux.fragment
new file mode 100644
index 0000000000..fe76df4181
--- /dev/null
+++ b/support/testing/tests/package/test_rust_linux/rust_linux.fragment
@@ -0,0 +1,4 @@
+CONFIG_RUST=y
+CONFIG_SAMPLES=y
+CONFIG_SAMPLES_RUST=y
+CONFIG_SAMPLE_RUST_MINIMAL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
