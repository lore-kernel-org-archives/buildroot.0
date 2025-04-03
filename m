Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7D6C3601E
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 15:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 065A36FBEC;
	Thu,  3 Apr 2025 15:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jejz7Iqjtjhm; Thu,  3 Apr 2025 15:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 225E16F4F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 225E16F4F3;
	Thu,  3 Apr 2025 15:40:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E7DA119
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 352B26F4F3
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfOmoM9tyrlN for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 15:40:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 559E260B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 559E260B0E
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 559E260B0E
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:40:06 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso7726455e9.2
 for <buildroot@buildroot.org>; Thu, 03 Apr 2025 08:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743694804; x=1744299604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HJ7gX5SRNcaYZlwxM+J34w7gELy14nTm9DzEKV/0xQY=;
 b=VKkhzAn+EP3UFWnWeOFKWwtMGse34sNAf0WaJj40MXq4RGhXGVII+ZBjKGQiRShob5
 OgZzd9Ehg58Cy2Anq/rydXh87FX+d3lPCOxtWXGImOLkiQyM/mqZrmv60KgeDZ8Dl+Y8
 8NhfNjGkkZK+u3qdp3D4TwG46NCYXSVVRXWGVHi0Q73R48tAQqGwrx4aBe61AVpMzc04
 DRnFUtv+pFDlPLBo5oXQiHZK7dRueD6GAKGcSpFfiZHcOmx9Zy4UhQogntT5Ps8yJz1c
 sMZ3ZH4aG15zr5qvkt+XKgCZnR0EyY8p0rnOOt4suSs0dEdTRgSnftCxmTeXJ6rozVmm
 B9/w==
X-Gm-Message-State: AOJu0YzhSrDYqdg8R36+ssAwZwr7uZDqMVLkrKxXWNpGOs0pUPqHBt88
 swKvQ87cR/uxGlmCVfMgHHHxlDAI1bht5zaEq3PLIC1E5sd8vbdhducF8WuwLXE=
X-Gm-Gg: ASbGncvvstlYkHnHpPnyUN6STr1MSCIFad6GbBzuEc3WZkFDG8RfjpGd1J9yVU/adPc
 FNrVRGpE1TystKY12h5XqlNZd9KRd0NEQufBgRsV9lAoP9VfEnu6cfM31Jwl7UycHmyBe43QDM7
 v51Y4aMnZJz9uFtMn1oL3lS5VsbFqeucIPmVZKCp+F7acJhh2K93o9AW9oznGNRygi3LFRbMPJO
 2WI9UpVqg3xjiGZwBU074MqP5MSdi4i/ERCwXKbwdfu4XHY4D1armUAiZbdRa2r6O2Q606qxNP0
 GpbDtGKpteyrbFMSkrkTPiCN48u1AOkxTvgR
X-Google-Smtp-Source: AGHT+IEJ64RH6GrQOvJvl3bLk7wAVO9rAGop9HfAXSQYPn2V+pFyF5+DJpV3Opo7Muz0bFYtiePdkg==
X-Received: by 2002:a7b:c845:0:b0:43d:9d5:474d with SMTP id
 5b1f17b1804b1-43ec3c7ad9fmr26135845e9.0.1743694803893; 
 Thu, 03 Apr 2025 08:40:03 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:32bf:237b:9ae:9868])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec34bbd9csm21702215e9.20.2025.04.03.08.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 08:40:03 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>, Robin Jarry <robin@jarry.cc>,
 Julien Olivain <ju.o@free.fr>, Maxime Leroy <maxime@leroys.fr>
Date: Thu,  3 Apr 2025 17:39:50 +0200
Message-ID: <20250403153950.6407-4-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403153950.6407-1-maxime@leroys.fr>
References: <20250328084743.8759-1-maxime@leroys.fr>
 <20250403153950.6407-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743694804; x=1744299604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HJ7gX5SRNcaYZlwxM+J34w7gELy14nTm9DzEKV/0xQY=;
 b=Z/FalmSMXL7dYg6yCgQTyErWXE7hfI+hPwxogFZEeGrbx6wm6m0bgchimWFfshNfWN
 RvN2DlTiRN9wSO2VO5VE/V6VILLaiiOqIsK8TX9T8oLqyT5N6VHbFgzrPW8yKQXTYY/S
 bzZPdWaZFwePwFVFe6vB9YKqV6PDYYMcRYefhBLiO3gmACT7IylQsLstqH2178m2mWxc
 cNial4DywmSiXVeHdvp/EWjeTDGnhVxAPAYbJGpdxHZhfSJpw3JJCkE5fqg6/fbF026K
 3ojDR+EBlLvtB6j1MP07ILSmqQRaRua+JJzVxTA+L8OXdtgZUi2Uuv6kyIcWJvrQvgKX
 wscA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z/FalmSM
Subject: [Buildroot] [PATCH v4 3/3] RFC: support/testing: add grout runtime
 test
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

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 DEVELOPERS                                  |  1 +
 package/grout/Config.in                     | 24 +++++++++++
 package/grout/grout.mk                      | 15 +++++++
 support/testing/tests/package/test_grout.py | 47 +++++++++++++++++++++
 4 files changed, 87 insertions(+)
 create mode 100644 support/testing/tests/package/test_grout.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1cbbf829c5..baec4959fc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2386,6 +2386,7 @@ F:	package/linux-tools/linux-tool-rtla.mk.in
 
 N:	Maxime Leroy <maxime@leroys.fr>
 F:	package/grout
+F:	support/testing/tests/package/test_grout.py
 
 N:	Meena Murthy <meena.murthy@amarulasolutions.com>
 F:	board/engicam/px30core/
diff --git a/package/grout/Config.in b/package/grout/Config.in
index a39c3283eb..5e39697665 100644
--- a/package/grout/Config.in
+++ b/package/grout/Config.in
@@ -11,3 +11,27 @@ config BR2_PACKAGE_GROUT
 	  Graph router based on DPDK
 
 	  NOTE: grout needs a working UTF-8 locale (BR2_GENERATE_LOCALE)
+
+if BR2_PACKAGE_GROUT
+
+config BR2_PACKAGE_GROUT_TESTS
+	bool "Install tests"
+	select BR2_PACKAGE_BASH
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX
+	select BR2_PACKAGE_IPUTILS
+	select BR2_PACKAGE_IPUTILS_PING
+	select BR2_PACKAGE_SOCAT
+	select BR2_PACKAGE_IPROUTE2
+	select BR2_PACKAGE_TRACEROUTE
+	select BR2_PACKAGE_NDISC6
+	select BR2_PACKAGE_NDISC6_RDISC6
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
index a75af27978..702249668f 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -21,4 +21,19 @@ GROUT_DEPENDENCIES = \
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
