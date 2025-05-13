Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B144C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 08:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5279D80BBF;
	Tue, 13 May 2025 08:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZahg1sBCfA5; Tue, 13 May 2025 08:56:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 161AF80C5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 161AF80C5B;
	Tue, 13 May 2025 08:56:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B750712A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 08:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CC9140D52
 for <buildroot@buildroot.org>; Tue, 13 May 2025 08:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkw11Vcm7uON for <buildroot@buildroot.org>;
 Tue, 13 May 2025 08:56:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3E7740D5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3E7740D5D
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3E7740D5D
 for <buildroot@buildroot.org>; Tue, 13 May 2025 08:56:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-442ec3ce724so2505185e9.0
 for <buildroot@buildroot.org>; Tue, 13 May 2025 01:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747126596; x=1747731396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uw4nPKTSE0zl+zwmRp+vhO/xR8tS+SPhPG0coyrtisI=;
 b=mW0tt18jTBTWc/TYrJTmm/wY+2lzOeAPqDkQ9ONP8+VM+zImF4W90PuhAX3cE/APRk
 rzNBPTr6GKKoKeG+A3ByfQns4o1o3YsWUtZVLVK3NmMq0WG3VF4NnLvC+s4n2KTlKnnP
 ywhqr647Kl4l27UMAsTneahworZNI8J7Ac9bI+br3oOkxWHVxhUZrma7eiMpzEtPBllj
 UjJxFazYwsTCtD0qgq3D6N2AtTOJVP/aIvr60PROIXZLYZQ1pcdsS/BgP0MY6cOG/QgG
 ph1u9Se00Ngv5JJQz9tnvIPuo75Vey+YFMDq1qv+bzhTATnOmCyjQon+XnAPbZYBVDvE
 P6GA==
X-Gm-Message-State: AOJu0Yzym4NQyJXqTMIdhUBTBH1SxMARPKjamThnJH4RSM20Y7805Is+
 wD74uPbvVXhZ5XSsp0bkKNf160j16nLwwxvgB3MUgiioL3CHZ099+LsskQ==
X-Gm-Gg: ASbGncto2GwekVTWCH9WHcc7yiOUrdofWxrQ9hkzAzFwJJ9hRWRMnwqaeINNirSXzxJ
 H5lyTFrvvu+K5prJpTDafudIMiBwyZE+dTJql4YwEmiNRjzcrs5Dq2CGtGQyUK8YzkfGOhUrjl1
 dV9RiXjoy12TDUOG9e0CK6eCg37Eb0BjN/P1uPAsAYt8rz4Y1w+9MxwTOHB8s8bJ2cHAx9eSJBO
 YaLMu9L/V6yWn6cGkscA3JBIEc5YmD0Z03b6vAsiFS3iiwdZPVDBg1CQUvORArO42p/wBEupk01
 z1A30skL+/Od4yx1/hZEcFk9bq/fy1ctfYO0C+mjsX5I
X-Google-Smtp-Source: AGHT+IEQGna/HgHV42pW36wd1N0/TjzLYKZslAh1u6qsSLj0FE1nY1vSdoBiumdbNBVk79yNG0t+5w==
X-Received: by 2002:a05:600c:34ce:b0:43c:f4b3:b094 with SMTP id
 5b1f17b1804b1-442d6d18c72mr140103875e9.6.1747126595736; 
 Tue, 13 May 2025 01:56:35 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:b478:b417:f636:165c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f194sm203748035e9.10.2025.05.13.01.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 01:56:35 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com,
	Maxime Leroy <maxime@leroys.fr>
Date: Tue, 13 May 2025 10:56:28 +0200
Message-ID: <20250513085628.38864-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513085628.38864-1-maxime@leroys.fr>
References: <20250513085628.38864-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747126596; x=1747731396; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uw4nPKTSE0zl+zwmRp+vhO/xR8tS+SPhPG0coyrtisI=;
 b=gsRg70J7i3VAaAdQsphNFD2wPr4E0z5NXrkTIMI4OX+ohljNpQ0VOLlxfgnw54lZ+i
 0gUyaaOJILVGU+WnRyLsKWne8sQ55xGjdCrEbyY/zGmHnoKm6Qw5/065ebbZqffxXwB5
 /TmTqgxT5717fj8VSMHzSAsKc8v6gOVIKgSOi7HMfpXF/Ys9xrnANa8ycGYrrpTBezZw
 xBG5Md/IK1WLiNXewUN8Y3Q7+PEK1EU1rXSkhI3omqY6pE/WqQLaZRleo/QBcsXc+wIe
 crUDX41to6KFkXaZRMSntJHgViWPn6y9GR3dWZULgypjThBTecU/DprOqeGnpVHQw0Hn
 ZIvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gsRg70J7
Subject: [Buildroot] [PATCH 2/2] support/testing: add grout runtime test
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

This adds a runtime test for Grout, inspired by test_dpdk.py.

It uses the smoke test normally used to validate development on Grout.

The smoke test are copied into the image by enabled the new option
BR2_PACKAGE_GROUT_TESTS.

Note: Dependencies have been added for the new option for clarity.
They have been commented out, as they are already satisfied by selecting
BR2_PACKAGE_GROUT.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 DEVELOPERS                                  |  1 +
 package/grout/Config.in                     | 28 ++++++++++++
 package/grout/grout.mk                      | 15 +++++++
 support/testing/tests/package/test_grout.py | 47 +++++++++++++++++++++
 4 files changed, 91 insertions(+)
 create mode 100644 support/testing/tests/package/test_grout.py

diff --git a/DEVELOPERS b/DEVELOPERS
index c4d14aa875..861af8f153 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2390,6 +2390,7 @@ F:	package/linux-tools/linux-tool-rtla.mk.in
 
 N:	Maxime Leroy <maxime@leroys.fr>
 F:	package/grout/
+F:	support/testing/tests/package/test_grout.py
 
 N:	Meena Murthy <meena.murthy@amarulasolutions.com>
 F:	board/engicam/px30core/
diff --git a/package/grout/Config.in b/package/grout/Config.in
index 0ebf772e51..b80760c806 100644
--- a/package/grout/Config.in
+++ b/package/grout/Config.in
@@ -28,3 +28,31 @@ comment "grout needs a glibc toolchain w/ dynamic library, threads, wchar, gcc >
 		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+
+if BR2_PACKAGE_GROUT
+
+config BR2_PACKAGE_GROUT_TESTS
+	bool "Install tests"
+	# depends on BR2_USE_MMU # bash, iputils, ndisc6, socat,
+	# depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2
+	# depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # ndisc6
+	# depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # linux-schedutils
+	select BR2_PACKAGE_BASH
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX
+	select BR2_PACKAGE_IPROUTE2
+	select BR2_PACKAGE_IPUTILS
+	select BR2_PACKAGE_IPUTILS_PING
+	select BR2_PACKAGE_NDISC6
+	select BR2_PACKAGE_NDISC6_RDISC6
+	select BR2_PACKAGE_SOCAT
+	select BR2_PACKAGE_TRACEROUTE
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
+
+	help
+	  Install smoke tests.
+
+	  These tests check basic functionality like packet forwarding,
+	  SRv6, VLAN, ICMP, etc.
+
+endif
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 228601dbec..5b157ae011 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -20,4 +20,19 @@ GROUT_DEPENDENCIES = \
 	libecoli \
 	util-linux
 
+ifeq ($(BR2_PACKAGE_GROUT_TESTS),y)
+define GROUT_INSTALL_TEST_SCRIPTS
+	$(INSTALL) -d $(TARGET_DIR)/usr/share/grout-test/
+	$(INSTALL) -D -m 0755 $(@D)/smoke/*.sh $(TARGET_DIR)/usr/share/grout-test
+endef
+GROUT_POST_INSTALL_TARGET_HOOKS += GROUT_INSTALL_TEST_SCRIPTS
+
+define GROUT_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_VLAN_8021Q)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_IPIP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6_SEG6_LWTUNNEL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+endef
+endif
+
 $(eval $(meson-package))
diff --git a/support/testing/tests/package/test_grout.py b/support/testing/tests/package/test_grout.py
new file mode 100644
index 0000000000..f14e481c52
--- /dev/null
+++ b/support/testing/tests/package/test_grout.py
@@ -0,0 +1,47 @@
+import os
+
+import infra.basetest
+
+
+class TestGrout(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_x86_64=y
+        BR2_x86_nehalem=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.13.8"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_DPDK=y
+        BR2_ENABLE_LOCALE=y
+        BR2_ENABLE_LOCALE_WHITELIST="C.UTF-8"
+        BR2_GENERATE_LOCALE="C.UTF-8"
+        BR2_PACKAGE_GROUT=y
+        BR2_PACKAGE_GROUT_TESTS=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="300M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "bzImage")
+        self.emulator.boot(arch="x86_64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda", "console=ttyS0"],
+                           options=["-cpu", "Nehalem", "-m", "2G",
+                                    "-smp", "6",
+                                    "-device", "virtio-rng-pci",
+                                    "-drive", f"file={img},format=raw,if=virtio",
+                                    "-net", "nic,model=virtio",
+                                    "-net", "user"])
+        self.emulator.login()
+
+        # Remove graph, no needs to check we can generate svg (only for developpement)
+        self.assertRunOk("rm /usr/share/grout-test/graph_svg_test.sh")
+
+        # Run smoke tests
+        self.assertRunOk("/usr/share/grout-test/run.sh .", timeout=600)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
