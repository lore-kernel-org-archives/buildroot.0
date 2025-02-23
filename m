Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEC8C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 21:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB9B60BBC;
	Sun, 23 Feb 2025 21:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQ821d3MhwQE; Sun, 23 Feb 2025 21:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 656C760BD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 656C760BD7;
	Sun, 23 Feb 2025 21:14:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DD46920
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23AA780C28
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3K3GWKCr4FQF for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 21:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2929B80BC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2929B80BC5
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2929B80BC5
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:37 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so24041545e9.0
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740345275; x=1740950075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7IEm6bPj4eDAVM475vrS+gJ/SxXBjEzQSzf0M1kqWnA=;
 b=nyZxPivTAqm1xfTRF4p55JhK092K23pSWpPxmcy+XJEFThM3zq1TKGwkEOFzMyY3p0
 tq4n6v/vyqFUOAHilViMkq8rD27O1bcqEWSvZzHXO51vzhrA8q6ekQS7T5jNjyVGB+YU
 XGRv8BWk0nnjClATZUHUIpuvAJFt/IJRQEfYXt6l2dRyCfE8snjVcPPTDLhKbQFhwQL+
 UrCruvZYCWNLrJ+VxhWMZYoXI6Fj6ttYU1tuMBSgZh5LcXeNEc+9AwWmldkXcxse7LVD
 zk5TV5T2sP6PFEhgbTqyh7ucS6qCRh6yauXCUB3KtKa6UCX8stmikHcnI5BwEKINCPqf
 kNCg==
X-Gm-Message-State: AOJu0YwBjvNDX4DewG9t+/UJFUs5nRUrLi1BlTmRgPr0RdCBxHasOaLV
 W34/hanqxwKSGWSIdyoLmEPRvToFAkUvOCoovZj3MEWoV/oBumfE4+h8hQ==
X-Gm-Gg: ASbGncuBic9Hamv+NsnHipFFphfqBdLU0dl/efRGj17ACHh4SnzA7puGIqVWVwHcS3a
 capE7GJL/th4iROsX3OOpblWxn0RqIU5yfCeNdp4N9e3/1jBr7CloxDN90dW9rQ3t6gGX2QWmN1
 deTwbxgmX4XAyyymFgdRx7nEknHXJgaeTH3/4oe/1eiGM2Qp/9w3iRMZG06jlhwKkb0ouFLavjG
 x1IpuGswOvTi5+ffWRV87LMv2lKQ22FtCXLC36yh3n9YhN5iFk2MyPBWCejIOGt2LzNhN60bbOr
 ECzjEXlQlxRsIYp0oTsv7XoakDEExJUQPdgX
X-Google-Smtp-Source: AGHT+IGPX0WGvDN2Das0pT1nWWUp1+jzvDyxoe85UB4mQ6rh1Dz0Upje2LU5uqICksJb6InIbSdDlw==
X-Received: by 2002:a05:600c:3c9d:b0:439:88bb:d026 with SMTP id
 5b1f17b1804b1-439aeadf8a3mr90364765e9.5.1740345274716; 
 Sun, 23 Feb 2025 13:14:34 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b030be5esm86757955e9.30.2025.02.23.13.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 13:14:34 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>,
 "Yann E. MORIN" <yann.morin@orange.com>
Date: Sun, 23 Feb 2025 22:14:28 +0100
Message-ID: <53ae20ed1387095f2ee83c6a076ac89baa384604.1740345268.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740345268.git.yann.morin.1998@free.fr>
References: <cover.1740345268.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740345275; x=1740950075; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7IEm6bPj4eDAVM475vrS+gJ/SxXBjEzQSzf0M1kqWnA=;
 b=lOHWWGDzirVnviu7Aa5bxtwKVw1iDpfB7xSENAjL4rbVaN5kAemIaVy5ZG9bmllHdQ
 E8soehjT3e6CiTZ19biI/320lyUH6qZvZ9+xbqIXNcBzW3M1xUS96mUQ7noH2aHAQvo2
 ZD+7fZnWvW8b2E5T8lZw17RB6ZIleTq8jCbfSQGZ+Lt+xsXdx6/M55aPTKzzlsKa/XUB
 rnKtnsh5KKB8GUc7VgAfMTwq+SFQFriSrJ2E2ZuGiYRCjb/DAbzCSpoPe8+M+Z3/YsKr
 ZqnFXVZW4nUrNsOn0JgkQTKs7SWAwJMWPbBDUwM+tHn6rF7rGwR/e0iO0cJVaNYv1uGk
 zOAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lOHWWGDz
Subject: [Buildroot] [PATCH 4/8] package/skopeo: add target variant
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
index bd3a00abc3..da21d45a98 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2891,6 +2891,7 @@ menu "System tools"
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
