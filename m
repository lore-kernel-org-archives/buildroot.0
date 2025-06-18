Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC51C7115A
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 09:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8C5E80711;
	Wed, 18 Jun 2025 09:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_5uiAjPiFp3; Wed, 18 Jun 2025 09:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6904880725
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6904880725;
	Wed, 18 Jun 2025 09:53:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F16ED151
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 09:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF700607C0
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 09:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUAyCj11gvJV for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 09:52:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F24F0607DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F24F0607DB
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F24F0607DB
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 09:52:58 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4530921461aso57810885e9.0
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 02:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750240377; x=1750845177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i4sYS2ltfI5qILWPfIOo5PPB67FGJhFXy5/1c8UUCJE=;
 b=RnlP/wO4G81vjx3WSCTdtw1RyTu9/gCQ/z+GacrtNBtDbH6ettk+zTHxBDH9XorHTr
 OPjqPksc9ZUhMlVlaNq6Qh42JXSCKCyQobJJW3jOk2gC3o9XKpgq3wM4CBCcae/GRcox
 ERE3wFNcbc2wqIUKxY+osvz/INE9hKFnWJxupyv3vZ64HYQ71BwCjAEvPoerrvDViDMU
 W+hYwGbtnqUx6QyXRadElnQawo+4xMR30UhjHuW9SHDhqndTwKy+TVR8VycsBAjllCFS
 2VVKTPlMr4vkrZSqeUa2tvVAUxNVlxd1NMjj/+KjojJmD7+1yTzy1PCEdxIToqiNfrjI
 r3oQ==
X-Gm-Message-State: AOJu0YzjVmzixBISam6xWwgON0oFqwjEmkd50YRyGFgMYJxDmN5GXqqJ
 DqzZpzAdgp4bOl3H7WQsQmg7cD89gxf/+iLzUxQOjh4JUijcxW9sVcK2BH4/FQ==
X-Gm-Gg: ASbGncvmUap2sCMl5eRyo1Nzuk566KYvhZPtSW5k7tEJKeYA6W11UOmQJm+/cJ2E8Zy
 SV2F465/grLHUX05gdrA27JykRNmCmNlflDmsIysCVZ4ijSzAWV7tTzOT93ADy+D1T8ItYD6aCS
 ek9LZsEeifVQsAI5VfdCrbO11kFXN0NFL+7MRTEzpWfVI6g049m9Mu8JLKyQHqULvI2wDpF2i/t
 cXdTRbp27fb08964u16fcGoARTP0J0cvNILF3+lA4BKsA0tyzWsuoBma/LpqdyZveJ3PdDnuK5J
 MGexWThNuvErjg8UpcT/AqTM3pQYjf9B4mBEGCKEgk3ZRG1rdd6EGkZMjIAmBAE++Xxht+oWcIW
 Q0to6
X-Google-Smtp-Source: AGHT+IEFnQJ482f9ClariIewpeYt1H2BhWPoj3CDutBI4OP9CxQpd8xKN2ZVUF021RebgsI7iV4iNA==
X-Received: by 2002:a05:6000:64e:b0:3a5:8565:44d1 with SMTP id
 ffacd0b85a97d-3a585654578mr6066635f8f.25.1750240376585; 
 Wed, 18 Jun 2025 02:52:56 -0700 (PDT)
Received: from freepad.iliad.local (z6.kawaii.iliad.fr. [213.36.7.76])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a67361sm16582112f8f.30.2025.06.18.02.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 02:52:56 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, ju.o@free.fr, Maxime Leroy <maxime@leroys.fr>
Date: Wed, 18 Jun 2025 11:52:40 +0200
Message-ID: <20250618095240.25712-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618095240.25712-1-maxime@leroys.fr>
References: <20250618095240.25712-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750240377; x=1750845177; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i4sYS2ltfI5qILWPfIOo5PPB67FGJhFXy5/1c8UUCJE=;
 b=XPK7P4+BVaEe1qWre+9GgfgwTv9OAvKnofuXKkl2hywlvU3PlK65v/JK60aAB7TRxZ
 RrZoIBeoz/Ng4UKYLqN2ddeECYt2qJe1jNNtOhWlXMeqeAUKfTAkHMarbSa+fBbjOurF
 ennewhx+HEkUGFfNgvQUxQMUTdE7Sh0JhIxPhw7wl0gwsDzfM3jDybY0ZD5DwkDkg6cq
 zwRes7leZ30i2O7G/Gy2oI3NvSbj/9hEvjmmQj0QaSrR7ssN8QPY3grdlwfY5inpExg3
 S6NzCyqss0uTNeWv4SfcM/t2izpKc6ZM4+3FYygkBonDEHPaf4NZsa7G8GwlgB2YFmX9
 tLvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XPK7P4+B
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

It uses the smoke tests normally used to validate development on Grout.

The smoke tests are copied into the image by enabled the new option
BR2_PACKAGE_GROUT_TESTS.

Note: Dependencies have been added for the new option for clarity.
They have been commented out, as they are already satisfied by selecting
BR2_PACKAGE_GROUT.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 DEVELOPERS                                  |  1 +
 package/grout/Config.in                     | 28 ++++++++++++++
 package/grout/grout.mk                      | 15 ++++++++
 support/testing/tests/package/test_grout.py | 42 +++++++++++++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 support/testing/tests/package/test_grout.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d127364a58..42cfd233d4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2414,6 +2414,7 @@ F:	package/linux-tools/linux-tool-rtla.mk.in
 
 N:	Maxime Leroy <maxime@leroys.fr>
 F:	package/grout/
+F:	support/testing/tests/package/test_grout.py
 
 N:	Meena Murthy <meena.murthy@amarulasolutions.com>
 F:	board/engicam/px30core/
diff --git a/package/grout/Config.in b/package/grout/Config.in
index 7e6e34e07f..43e3f9e349 100644
--- a/package/grout/Config.in
+++ b/package/grout/Config.in
@@ -26,3 +26,31 @@ comment "grout needs a glibc toolchain w/ dynamic library, threads, wchar, gcc >
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
index 46d3cf5f0a..514036665e 100644
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
index 0000000000..29e406acef
--- /dev/null
+++ b/support/testing/tests/package/test_grout.py
@@ -0,0 +1,42 @@
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
+                                    "-drive", f"file={img},format=raw,if=virtio"])
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
