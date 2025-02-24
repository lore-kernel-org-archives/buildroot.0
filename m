Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A1DC021B6
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 21:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E7AF40C46;
	Mon, 24 Feb 2025 21:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1cxLo5qg_qq; Mon, 24 Feb 2025 21:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D849240C26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D849240C26;
	Mon, 24 Feb 2025 21:22:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDF2B94E
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1A2460E4A
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XifrXHIcqQ1g for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 21:22:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7B44B60E2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B44B60E2C
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B44B60E2C
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:26 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-439950a45daso30295535e9.2
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 13:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740432144; x=1741036944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WFK01jl1rcmwXg0iiEyltKevREwhwo0ZMKDfYaZIdbs=;
 b=gm5SyyRY/cOprEKAMI6tiO6wwTHjdiMZxf/YcRnSVY9TyKtkJCJmaXTuDNrRxpXHug
 qgmqtd3jfz0fHnu9BaIV1eKNL+9RGeK0V1hcJdNs0wQZcTuIh2HDCC9l7BDHuWdaAywJ
 qwBlPoUasewzHbkw76Ct1E+qB+O823tFcXwEbU3Vqa4L5mFIxz9s+qoMko4WVps/VkAp
 tY1SeHPGRvO7DVSg3aPrJHsOmcGuMjMJUsz3cWBZMXeKq3HnmD5/4wNegUUQCM8VXwi7
 dhlRYVVJZM74Ws8UXHbTxVHwbz0GrFrHoRRcmIpnf2Ge2R14fO6qJBSbqGODhiEa0X5J
 VdHw==
X-Gm-Message-State: AOJu0YzWdRiEQUFR5fRDYzCmDqynhN9MdZRxgjBpA+AJx7iSXX2jCjLH
 aqrK5uj8PIvuGM1vKd1l4j6aEA7SsLQZ5ogpdsRl0xMQ5JOcD8jyWoIqbQ==
X-Gm-Gg: ASbGncvp1utHeIwChekXFoxGS+EmTjiHxgvBKNiH+CEPbRfIErweFgd1eltvEJpaEz8
 5WoFAWrAi1ljIzaosYI+1TJrLluDFv260Yx7Tovc0nLUPhQOlsfQYuEKi4/aGH0KpJHm9p3vg8E
 lIhtElxdlWTPRaiFyKa6WqyDLPsnQPrOpGCZRKxdPBeS/6EEsBDAHSY+hNhy9enUAsZEoYVXLt2
 ZIP8JQukkC2eYskb6RibPi9wSR3fouEAZ3aWEH+N1L0569JkZt66Me29T/N9XQ3buxCMQ8vGav8
 htR0wjW/sOMrkteQaE1IbSzGDqt6g/MXYbg7
X-Google-Smtp-Source: AGHT+IH5IT/ugfbiie5MFOFF9KRbDULKnWnnvoT4JxG5taplyJ00Am5s4QnlxSrD1ffv++4tsTSX0A==
X-Received: by 2002:a05:600c:4588:b0:439:88bb:d020 with SMTP id
 5b1f17b1804b1-43ab0f2dcb1mr5978735e9.8.1740432144300; 
 Mon, 24 Feb 2025 13:22:24 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b01346d1sm119875635e9.0.2025.02.24.13.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 13:22:24 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>,
 "Yann E. MORIN" <yann.morin@orange.com>
Date: Mon, 24 Feb 2025 22:22:17 +0100
Message-ID: <9eb0ca0486be3e1eb52d44f4fe96fc276eb1a48a.1740432132.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740432132.git.yann.morin.1998@free.fr>
References: <cover.1740432132.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740432144; x=1741036944; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WFK01jl1rcmwXg0iiEyltKevREwhwo0ZMKDfYaZIdbs=;
 b=iG1xuloGILNMQbcZaUWljcBsEdaTrxciHBxDhd89bFjLxzIBb/ol6DcArcOlF9UTHa
 zfWOzyxPpbvE60xnONl+PN3JyB68rkuecRTdZY6uatfksecDmg2rjSnetgm7riIBkrRi
 xZnAwPY9Tt1oBeEtGTrdM3fW9oxbcPexbduVea8ZO1Px2Wh3vCAP/yPgOpbGxL4Icjqb
 1OTra4njgigqzCb8npQiX1z/gLcEs7XR0sIN5jJ3ge3lalSUUgcUDxcSIrzILvK53qg8
 PpkcJiThIf4SASQHvdNSUBKZakjmuWz2XtUkMX09rKJYYkHg+uqvf9hWuVIBV2FnNtJD
 9Uxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iG1xuloG
Subject: [Buildroot] [PATCH 4/8 v2] package/skopeo: add target variant
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

Skopeo can be used to manipulate container images, and so can be usefull
on target devices that are going to be used as a host to run containers.

So, add a target variant for skopeo.

... with a runtime test while at it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
Cc: Yann E. MORIN <yann.morin@orange.com>
---
 package/Config.in                            |  1 +
 package/skopeo/Config.in                     | 25 ++++++++++++
 package/skopeo/skopeo.mk                     | 10 +++++
 support/testing/tests/package/test_skopeo.py | 41 ++++++++++++++++++++
 4 files changed, 77 insertions(+)
 create mode 100644 package/skopeo/Config.in
 create mode 100644 support/testing/tests/package/test_skopeo.py

diff --git a/package/Config.in b/package/Config.in
index 4a81a62ec4..33fcfd0597 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2892,6 +2892,7 @@ menu "System tools"
 	source "package/sdbusplus/Config.in"
 	source "package/seatd/Config.in"
 	source "package/shadow/Config.in"
+	source "package/skopeo/Config.in"
 	source "package/smack/Config.in"
 	source "package/start-stop-daemon/Config.in"
 	source "package/supervisor/Config.in"
diff --git a/package/skopeo/Config.in b/package/skopeo/Config.in
new file mode 100644
index 0000000000..f1acc3a50f
--- /dev/null
+++ b/package/skopeo/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_SKOPEO
+	bool "skopeo"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_USE_MMU  # btrfs-progs, libgpgme, lvm2
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # btrfs-progs, lvm2
+	depends on !BR2_STATIC_LIBS  # lvm2
+	select BR2_PACKAGE_HOST_GO
+	select BR2_PACKAGE_BTRFS_PROGS
+	select BR2_PACKAGE_LIBGPGME
+	select BR2_PACKAGE_LVM2
+	help
+	  skopeo is a command line utility that performs various
+	  operations on container images and image repositories.
+
+	  https://github.com/containers/skopeo
+
+comment "skopeo needs a toolchain w/ threads, sahred libs"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 8e3a302e8d..b3b213983f 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -11,13 +11,23 @@ SKOPEO_LICENSE = Apache-2.0
 SKOPEO_LICENSE_FILES = LICENSE
 SKOPEO_CPE_ID_VALID = YES
 
+SKOPEO_DEPENDENCIES = \
+	host-pkgconf \
+	btrfs-progs \
+	libgpgme \
+	lvm2
+
 HOST_SKOPEO_DEPENDENCIES = \
 	host-btrfs-progs \
 	host-libgpgme \
 	host-lvm2 \
 	host-pkgconf
 
+SKOPEO_GO_ENV = PKG_CONFIG_PATH=$(HOST_DIR)/lib/pkgconfig
+SKOPEO_BUILD_TARGETS = cmd/skopeo
+
 HOST_SKOPEO_GO_ENV = PKG_CONFIG_PATH=$(HOST_DIR)/lib/pkgconfig
 HOST_SKOPEO_BUILD_TARGETS = cmd/skopeo
 
+$(eval $(golang-package))
 $(eval $(host-golang-package))
diff --git a/support/testing/tests/package/test_skopeo.py b/support/testing/tests/package/test_skopeo.py
new file mode 100644
index 0000000000..79c3da8b3d
--- /dev/null
+++ b/support/testing/tests/package/test_skopeo.py
@@ -0,0 +1,41 @@
+import infra.basetest
+import json
+import os
+
+
+class TestSkopeo(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_PACKAGE_CA_CERTIFICATES=y
+        BR2_PACKAGE_SKOPEO=y
+        BR2_PACKAGE_HOST_GO_BIN=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file, "-nic", "user,model=rtl8139"])
+        self.emulator.login()
+
+        self.assertRunOk("skopeo --version", timeout=30)
+
+        # First, check we can reach the default registry: docker.io
+        output, _ = self.emulator.run(
+            "skopeo inspect docker://busybox:latest",
+            timeout=60,
+        )
+        bb_info = json.loads("".join(output))
+        self.assertEqual(bb_info["Name"], "docker.io/library/busybox")
+
+        # Now, check we can reach an arbitrary registry: quay.io
+        output, _ = self.emulator.run(
+            "skopeo inspect docker://quay.io/quay/busybox:latest",
+            timeout=60,
+        )
+        skopeo_info = json.loads("".join(output))
+        self.assertEqual(skopeo_info["Name"], "quay.io/quay/busybox")
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
