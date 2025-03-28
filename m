Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD343C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 08:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AEF6857A4;
	Fri, 28 Mar 2025 08:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cv7JXPOAFBDM; Fri, 28 Mar 2025 08:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 342F2857A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 342F2857A2;
	Fri, 28 Mar 2025 08:48:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2653F1B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C9E540251
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ySr66h4GZV2 for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 08:47:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C18740142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C18740142
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C18740142
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:47:57 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-399749152b4so516438f8f.3
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 01:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743151675; x=1743756475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZGsR+sfFcLw4zpvx4rW+mclwpJ5kDkSVq9Cc6K37dhc=;
 b=fH+PwZp/TT3D88WolOBi0aeeWVOfKT6QOpDN1BoXt3EvS16QIAwU2x8NyQ6Go3VjTg
 uy9RbecjgI/j6KwmuHUWlfbNz7ygsvbtrfjdR9XUK74VwcaMaOSLDoXATC4glxzKpnzx
 FUHlibetJHWarGFVL1C1M9TmEAWqJ2m0KC3RY/HHRUfjZZN9T41c+qQ9x4k20OfORE/g
 SmxVIrapWOuzjr1oybYkYuZUmbZYIxgXIyAWZ85/A8tVrc74FwFqNdIpx/oH6lnJYEDg
 KC3WQZMmk9VfGDjcc7NUj93JPCT4wjRHE3Ru4qxM7d8Aq30TtejdLA2uwoH9O34iv2xi
 TerA==
X-Gm-Message-State: AOJu0Yy30ZEkFUEqXmjKHT3Mxeyd6HCGd3fcA4qjmnJxFFNzX/vTfErO
 ZV9v2b6lKJF5GJ0DQss7cPeru1NNJNic5vXjqPtkqvldb4ITqt/8bL/6Qb/K0sQ=
X-Gm-Gg: ASbGncvL3/uedmXLiO4C5M0PePMpYlpy/T29vpR62sBT132bOuQ8Q27GDo6rI1ShwA1
 ktAuYBWXXrDffq6+gM1Ffx0ejYruo2tv4pWeibARav04uLVjSEK3n+DJnq0clXRqgsZyVGAnZe6
 oLi14RS1zay0JJitD52JQQlSguvtuIS6hQ6NiWrFgsjbaX8/+qgybyr44ozNrWdU43Fik+mMw2h
 GF2MKxTZgVJaIVpUhzc3EmqKjP38DrLYfX3J477kVhEMjw5QWofhdkq3MjaGxNpGDHm6uf5jWWQ
 6PS6Ki0dz3cn+ROVPnutjOji91vVy2ue6lj+4hRCqYH2eLyHEg7kN7yY+YY7kz+CHnfd/feVOA=
 =
X-Google-Smtp-Source: AGHT+IHW9i4/cA5e/NnvkOZ4PW62t04nfWpVzto4/3Ea8vHJ+R7oWdEOdUMsV+MRer1rtJBCrnMevg==
X-Received: by 2002:a5d:47c4:0:b0:391:3988:1c97 with SMTP id
 ffacd0b85a97d-39ad1749e41mr6077349f8f.17.1743151675120; 
 Fri, 28 Mar 2025 01:47:55 -0700 (PDT)
Received: from freepad.iliad.local (free-reseau.vlq16.iliad.fr. [213.36.7.12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e12bsm1964481f8f.62.2025.03.28.01.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 01:47:54 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>, Robin Jarry <robin@jarry.cc>,
 Julien Olivain <ju.o@free.fr>, Maxime Leroy <maxime@leroys.fr>
Date: Fri, 28 Mar 2025 09:47:43 +0100
Message-ID: <20250328084743.8759-4-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328084743.8759-1-maxime@leroys.fr>
References: <20250326132655.35729-1-maxime@leroys.fr>
 <20250328084743.8759-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743151675; x=1743756475; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZGsR+sfFcLw4zpvx4rW+mclwpJ5kDkSVq9Cc6K37dhc=;
 b=UsM9zV22Ww2m+ZmQBhw437/Ai1DslLbm71Ua0NsHOFNA8HW3/6Yp9qQu2IKf/VuoMW
 TiXnGduVoGSQemaUiRUZt3OqqXF7D1dXHVZbDtPx5u+h72uoHLgSvEKMBxpzyfwpS+08
 sN1pawNXuW5ZZ9YOzpWks7i1jMEfviBbwwqJj9eY7K/vbnWVGntdKld0KD8FUCFJoJAH
 OgJIagl1aurztW7bR20Tcn9SrpaD51B3OpKduuD181R2TsQnx+FliQi9fjAInaNGhFAh
 ZrZxWX/bVdI+dnOh6GPaQHRZuJxC5PiW1m+A5gksC0MGZAd8kbkBR+3ZWXScRdZSjFRI
 HvZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UsM9zV22
Subject: [Buildroot] [PATCH v3 3/3] RFC: support/testing: add grout runtime
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
 DEVELOPERS                                    |  1 +
 package/grout/Config.in                       | 16 ++++++
 package/grout/grout.mk                        |  8 +++
 support/testing/tests/package/test_grout.py   | 50 +++++++++++++++++++
 .../package/test_grout/linux-net.fragment     |  4 ++
 5 files changed, 79 insertions(+)
 create mode 100644 support/testing/tests/package/test_grout.py
 create mode 100644 support/testing/tests/package/test_grout/linux-net.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index c9871f5d32..82ca05d5c1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2385,6 +2385,7 @@ F:	package/linux-tools/linux-tool-rtla.mk.in
 
 N:	Maxime Leroy <maxime@leroys.fr>
 F:	package/grout
+F:	support/testing/tests/package/test_grout.py
 
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
diff --git a/package/grout/Config.in b/package/grout/Config.in
index a39c3283eb..8d1466fa02 100644
--- a/package/grout/Config.in
+++ b/package/grout/Config.in
@@ -11,3 +11,19 @@ config BR2_PACKAGE_GROUT
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
+
+endif
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 0d6fb8dce9..19f952330e 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -21,4 +21,12 @@ GROUT_DEPENDENCIES = \
 	libecoli \
 	util-linux
 
+ifeq ($(BR2_PACKAGE_GROUT_TESTS),y)
+define GROUT_INSTALL_TEST_SCRIPTS
+	$(INSTALL) -d $(TARGET_DIR)/usr/share/grout-test/
+	$(INSTALL) -D -m 0755 $(@D)/smoke/*.sh $(TARGET_DIR)/usr/share/grout-test
+endef
+GROUT_POST_INSTALL_TARGET_HOOKS += GROUT_INSTALL_TEST_SCRIPTS
+endif
+
 $(eval $(meson-package))
diff --git a/support/testing/tests/package/test_grout.py b/support/testing/tests/package/test_grout.py
new file mode 100644
index 0000000000..3d66033611
--- /dev/null
+++ b/support/testing/tests/package/test_grout.py
@@ -0,0 +1,50 @@
+import os
+
+import infra.basetest
+
+
+class TestGrout(infra.basetest.BRTest):
+    kernel_fragment = \
+        infra.filepath("tests/package/test_grout/linux-net.fragment")
+    config = \
+        f"""
+        BR2_x86_64=y
+        BR2_x86_nehalem=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.13.8"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
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
+                                    "-smp", "4",
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
diff --git a/support/testing/tests/package/test_grout/linux-net.fragment b/support/testing/tests/package/test_grout/linux-net.fragment
new file mode 100644
index 0000000000..6bdd89bd26
--- /dev/null
+++ b/support/testing/tests/package/test_grout/linux-net.fragment
@@ -0,0 +1,4 @@
+CONFIG_VLAN_8021Q=y
+CONFIG_NET_IPIP=y
+CONFIG_IPV6_SEG6_LWTUNNEL=y
+CONFIG_TUN=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
