Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39833107BCCB
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 16:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B56C540BD9;
	Fri, 13 Mar 2026 16:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aajV2A-T6Tss; Fri, 13 Mar 2026 16:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D90340BC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773418756;
	bh=8+PjnAk/mTtbIyaROjHILQ4VROgNBLtR5S0WeuwISMk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FGTvEoj4gfC1AxztHOrk/queC+q3PFdVd/FIbGaCDrpSIjdDqCBiXhcdKK82jersC
	 oKMIKYuaAGs5m3VpevWV0LHDvAt6iiSjTCPmXAlpvl15I5llafhVPZ1Ee+aNksxsQS
	 LoLMSmU++ecskWUeIa3QW0TbtvfMs4g9suxp60bWictTAY8hC5JFe2OiNjkFUBOJR4
	 U9ni47gyxhKo3BMPIqbVAAlg/9lb6G2e4617F/JD6I9UDe9ZjxmZycSLy9W8yM22Yg
	 BMuSG1xq1ouobb2rpld3r6073nKac3XPr5sXvMiEfX1nL/4VSC6VP0JdTPGqOiRgci
	 2p42P5QDCiJqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D90340BC8;
	Fri, 13 Mar 2026 16:19:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2B0E786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92F1440BBC
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jb_9lg6aHsQG for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 16:19:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3ADD440B20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ADD440B20
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3ADD440B20
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so19475035e9.0
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 09:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773418750; x=1774023550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9nGlfb7Bv5isbE1Km65ERnKM9phmRxZ6R4ZwHhW8qEI=;
 b=YknSZ7vpXHWjJK+/Bar+Ch+vl4y53zAVW5N63xiHoNJxgDuVvQmAjFmo2WHT6wcpI9
 z4I8Qn+ihPL1C7rEQNWPDJI8qiENwPtf0JOWJ4Rf3u6Y3bGpv01gS4+3367jQkK4tMJs
 JtpfhTG58NvJLeTmGD1LuMWOibJ2wgKlS9TnpTrlMCyLgmo4EeogDs//wMyS5TEvUHfn
 rwv9SHsQfGeIGkyQdioGFrq/eOMYAflKLs1JE6ctcHTqwAX5WFkIZBi8RQ7Hvb0rF00E
 npqEylktL1me9a95MoGmkaLgM6TgGDR3mHdivOlF+eRCM2pD/ZCmBPVTjUEhH1CH19Zz
 lRaw==
X-Gm-Message-State: AOJu0Yx7bM0XoLMTM4JKZh3bgt0vmgnY+pFHsA9AYqvGXDA+zTxKaVaT
 zraeut/1T9LIF4exJZuEssmIk2hu5Q6P4cj0tEnZQsQLwOapypzfoF/hsUWizw+rQ+UWufT2gJX
 Ww0WJ
X-Gm-Gg: ATEYQzwnsVy3RXEtbuogzpg+JkrDSN73g3d5x6hbH+xeVW7aPFpLmNtwg22p3gkkpSR
 HPkh9N2WnpijeouSlhI9z2ltfx1l2iMLhytcSbNGhb3xcI4K94Pr5CUgy3Zd3kLQo1H+H0ukf8/
 bZHmQR4GLMu5E06EdJSRgZjOa4e2dGcghPZRTu+ArIa7CYnUmS2V0GwHGggPsbjsFpi7FIehWXN
 S/1Gz1iwbIGbGppAhKyXTRzeQWR6g0kuCgYq5kUeM821ln0TmiOM1Y1iC6KEVudToxoSczC8TFc
 5EiVL4PizeNgbnzJBp5UYPs7S4i5/QkrQAHtEuqgnBSasF4sPkXjZ4DvGmFPQlSlI8Nejv/+7bz
 XINHf9NvaxUarV8e2vkWkSE870ho2fk6vntntRC8wK1y9iZpEe6/wguBPz+OpERP5ltq3O2UR/d
 S7cao6XylU9N+271UH/GqsngwfY3B3cffYWe6COOIUGT8u3ZJtWcTU8w12K+L4gDiHDpQ9bsdCI
 CH3hOY/Cs9HMZbu8ELpNg==
X-Received: by 2002:a05:600c:c162:b0:485:45fb:3472 with SMTP id
 5b1f17b1804b1-485566cf8b9mr58230605e9.7.1773418749674; 
 Fri, 13 Mar 2026 09:19:09 -0700 (PDT)
Received: from FRSMI25-BOLET..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5f6bb4sm215503345e9.4.2026.03.13.09.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 09:19:09 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri, 13 Mar 2026 17:18:25 +0100
Message-ID: <20260313161825.1224877-6-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313161825.1224877-1-elmehdi.younes@smile.fr>
References: <20260313161825.1224877-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773418750; x=1774023550; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nGlfb7Bv5isbE1Km65ERnKM9phmRxZ6R4ZwHhW8qEI=;
 b=3AOLHuHlfjYBo23WGLvcnAfiiP3TEqN3IjZlM9fe+ScJrJvzzcWy+Y2Y1LUA2kw4Kk
 ar5WbzzKC6TJpXrDtk/kOxl1vY4YOvvbV57V3oOq1lh9KBKy6jjZhYC0UNbrgaRPhLnT
 rV2Z4JfRl47Cl2JHkDHpxQC3BaY8keTOckJCg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=3AOLHuHl
Subject: [Buildroot] [PATCH v2 6/6] support/testing: add rust-kernel test
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
