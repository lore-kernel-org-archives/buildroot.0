Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2413CC282C6
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 15:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC41284C9A;
	Sat,  1 Mar 2025 15:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVeU1cKCNVcp; Sat,  1 Mar 2025 15:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0A6A84C3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0A6A84C3A;
	Sat,  1 Mar 2025 15:06:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3C2068
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 883C740177
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30RyOMp19ATy for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 15:05:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CE1DD40118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE1DD40118
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE1DD40118
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:48 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4397dff185fso27298595e9.2
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 07:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740841547; x=1741446347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WFK01jl1rcmwXg0iiEyltKevREwhwo0ZMKDfYaZIdbs=;
 b=m6C9Ttp3JijFgaLhMmaeEQ/J3E4SoTQtLD5ZSswBnzP62suauEo7kEsyGf370vk6vD
 zGKnIRwKYBiS0lMOGHqcvq5o6ZQDmV3crgm154XV3dZCv5Wb/e+U8bkRYjSFx1TA+8aw
 JECffGFUwHy5JUuVnr2O2HpRwWByCauODYZYKZcTdYSZ9BLhRdivPAKVX52m6Oe4HksU
 mnwCTbjdpE8PjAJLrs9owEbu6opScb+6//n+jabC2nfkF5ysdrF8wgG7GCGuUY0OpSz5
 BNi/fINS7jaN/utj+7DhvmdPTIIK1UwgKqnwqT+amagJbACgcybtlJnjl7LAVFshd24F
 VoiQ==
X-Gm-Message-State: AOJu0YyjiT5Mn6YXUkN6eLpgr3oAm+sWbfTV0K+042BAch7C2Ma1jqX/
 FPJypeLYjRKcwqTGDYLLmIwKVw79hGUDxdYWkMF8XyEiWfzo09dLlElkRg==
X-Gm-Gg: ASbGncsswdhzYy1enSv+PtkkuSlhVzzQvVBAynGo2X962ycbvVIEERkvGLeeqbw07P9
 uxp0H53YqPzt0yxQSceIej648qJgNVauHI3JQrp7sBcth7aI3ytUUw43yJAGdXcJIPMCI6VqyqH
 7Vm4egJf/esOx1MVLe3YjNrfamA57sOyl1YNJvaLfU9Hgyl3Kc8s6/oyWTgj96oEZxhPzbQLl3C
 /5zRe6bWqISVRRcPnZkuSsMyyJljXwH9iTsmPFyE4TZlOCU4sE/KxPzJL+yPldIL8g0DsqYiDGz
 0eT8rJRoYvskX/i1LAAXzz74hNrTVGmxiwX8C3rlRw8GuDLJkl8X/WY=
X-Google-Smtp-Source: AGHT+IHDvFWRnDdCPBZRZdNJE+WgEE+uRxBVi85LUaK6lr6vYIhmaAJg+yI4USj1pMqR4MsKh87EPA==
X-Received: by 2002:a05:600c:45d4:b0:439:6118:c188 with SMTP id
 5b1f17b1804b1-43ba6727cc1mr58753865e9.19.1740841546561; 
 Sat, 01 Mar 2025 07:05:46 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba57145esm123806065e9.30.2025.03.01.07.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 07:05:46 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>,
 "Yann E. MORIN" <yann.morin@orange.com>
Date: Sat,  1 Mar 2025 16:05:40 +0100
Message-ID: <cc2b6999bee8751b7295c60f75d84d451ae96576.1740841539.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740841539.git.yann.morin.1998@free.fr>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740841547; x=1741446347; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WFK01jl1rcmwXg0iiEyltKevREwhwo0ZMKDfYaZIdbs=;
 b=ILMKhzRDf8o5Np0yyHoxuscdQopmMj2JZw9sMYWU1ugfXx0NmVEIvwtFynRk98Bw1w
 JLzpCnCOfQAIGp2w5OMfXYZ7LnFcl6BMIfERt+JSOaRIxhJAXBuPxfsgOxBK8OnV9vB/
 O19HP1Xgd0ILwexch0TFPJfmAs80IGVnjxc1aIdL1j3zrPGHa+RDsiVdUuQHR76S6PrK
 3kfls/msrT2ApSAMV1HR/lmUKGT/vXv+/FY3AERNWbN7EK/L4XO+zOZAhTaQqMlm3JYb
 Mw8gxDOouBhVysWWqUB9N+Qd3gTcn8cJMMjXW1iYfr6JwBOnmKecB+/ixky4QOhvIEZE
 /u3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ILMKhzRD
Subject: [Buildroot] [PATCH 5/9 v3] package/skopeo: add target variant
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
