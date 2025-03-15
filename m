Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D67C28B30
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 19:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D8A607CC;
	Sat, 15 Mar 2025 19:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgbOxuKvkZAa; Sat, 15 Mar 2025 19:57:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CC0C607CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CC0C607CF;
	Sat, 15 Mar 2025 19:57:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59594EA
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54EC641147
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llkG8C_Ly9GZ for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 19:57:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9750411C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9750411C9
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9750411C9
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:16 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3913cf69784so2685504f8f.1
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068635; x=1742673435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xTDN7M/Lta4WbKsKJKorzomyBjMruz/wp1mx5/mqwsM=;
 b=Pq1jjwwfVUd2U6jvU/96Fy2U8yhl6hJ+kMOtF/Cts8q4aRscfhvFrnh75RovlQeqWF
 hGjqcL6+3jLq7RXKDkTP4tXOpAbl1N2rlpo3TGprcbeV2jYbyF4eiaecCQWrMeGd6X2C
 gFezjWGcU+3nJZV7hjRbogmAjtuqTDV+ymgg4osStaGFQhLQ7huIbE/q+lWHVrz1NKvt
 +Q9uNTJIOR/hL/vOTS/XuG/V7i8rJ1ouRFvbFDEgeWSBsMgVTwg6MshD3snjeicnw6Vh
 LZfzYAmyCQNlFV3tXUfbCPGptoZwyu68h4VMGfsmi4s1IKE5s1PgXtVlOfb37k1LUCn3
 dpeQ==
X-Gm-Message-State: AOJu0Yz4loANshad8XC+Cq0oTqu+Q2YNHJiK/f5pr/CKmFJYnhm1uNjl
 Ck+4jmdiGAmggCnNj2aTf0QBdaTBqnRh++IT1IgN32xENFSVTxqbrg0R9w==
X-Gm-Gg: ASbGncvXMToAeOV39Oe0QrWcWgZL9WKS+IN1diCTxqs7Q6t2H1+PA53WhXRMlt/I7M1
 Mc0v2m+Rr8Hlee2GeuIAWqswSn2BnJO/tJKr7h/ouXw9X9A8fqnhXB075fE5VW+ngnwFtfX1mm1
 Gd1eP9LOJV1uvfwjXXzxhPtg6I+QpRXuatZos1xg1/VbdZgrJgyterLfw2jTfxgdu/rM7rnH0RG
 KGr3cUbfRcB6l2YgfK5lp3SkWiwruJZPSQaDEyhEVN+k16WA5qNqRNXtq53Xnl5VTCIn59zFwMy
 Fxdqwy04V4TMSOO492k6aNtUyDeiYDVAH7/adwiM8IepgIZ9fvutHng=
X-Google-Smtp-Source: AGHT+IGqmY7UbO+5aASe5t5vvsjEbBT+7LfUZZEGV22NmxYsZ4E1F06Cg743wnBAKjW3tUCygLCEhQ==
X-Received: by 2002:a05:6000:1a89:b0:38f:3245:21fc with SMTP id
 ffacd0b85a97d-39720a5c4f9mr9283331f8f.50.1742068634815; 
 Sat, 15 Mar 2025 12:57:14 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975afesm9756836f8f.47.2025.03.15.12.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 12:57:14 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>,
 "Yann E. MORIN" <yann.morin@orange.com>
Date: Sat, 15 Mar 2025 20:57:03 +0100
Message-ID: <ec4ffe4ea43f71d7bcf44586721c707e0d625645.1742068624.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1742068624.git.yann.morin.1998@free.fr>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068635; x=1742673435; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xTDN7M/Lta4WbKsKJKorzomyBjMruz/wp1mx5/mqwsM=;
 b=iqv3Zd1e4YvKTEz1TOgqhmowLDzsrqh2FklpYghDX8DhDhrr9edKBZovM0s1DeysXY
 nrj6VucILsrAenb/p7Wa3vIv7nGvaPlIrfA8DvsblkmcEF8vpseu8F+uQYdrvme5de8e
 NZoZmbi5ZRpS0r27yQBduF+Sc97S3gNsFYWxnUEKd7UEKR50tsbY6kVemEfEL4KpatJs
 SK7nD5gYPXriS2tVR9UvZ8/EKNHVqSZQSQiWRnB3BjhtLG19aScOdFn8mCXDYDrr2k1z
 c6jGbnkfIrBq08qWuL1EyqQHCC2onqAVHpDDMd7R8iwaXdq6vxva2E7ghwgxiNo6l5wG
 w9Xg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iqv3Zd1e
Subject: [Buildroot] [PATCH 05/14 v4] package/skopeo: add target variant
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
index ce8cb95d7e..0c9b5bb6cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2893,6 +2893,7 @@ menu "System tools"
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
