Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31986CE79A9
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 20:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C721C80F02;
	Tue, 19 Sep 2023 20:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C721C80F02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pOIvvZe3rL6o; Tue, 19 Sep 2023 20:44:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C02B180BB3;
	Tue, 19 Sep 2023 20:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C02B180BB3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C66381BF20B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 20:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96CA383443
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 20:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96CA383443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9WDrcIk7tnfO for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 20:43:08 +0000 (UTC)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E54C6830B8
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 20:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E54C6830B8
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so5082205a12.1
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 13:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695156187; x=1695760987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8I+wdyMCNeEkJIQEG940taWqHwCQPhNLjFQlpjiZKKg=;
 b=Zju788QUB3/sVtZmRgAeuoRSwe23f57JXqnoyAuY1ilwE2f+2nQLnH+ks9u1C7Z084
 Xry+axZ0qnt0UBeQWZtluo6rk2PbR4iUWy+CWjzIP5598e3rJcuOA4ua4jtgJljIOHJE
 16euBa3KZ5Gm9Ex3Ddsrc7LP8+sTM+9aM9OJ3YGr/RBaCKu+UWac+zpw0sXTQFuttF1D
 ZfE88o7FrjOdjd+ZBMKUvp2d7TyJtbQYvitc+4MMZuRaK8V0VVHianttFR3PxPXhqFbB
 fIM6bns5oSUsnl1jG2A6UlVoU8z1lFQfWXY9trKFVYGzqZNLm0WucBZx0eJPOVW002al
 hlMQ==
X-Gm-Message-State: AOJu0YzXheCipwfdJikcqtcKjtaFud1KqfuPBEVMVYVTyWzmEhN0BKsw
 4Jvs1bthQ6bxRJ33OODryx6xvsUw8nOCT9zSotjkYg==
X-Google-Smtp-Source: AGHT+IGJyh2f56CSB7xNuVA3zY9YkLms9ldpTH6NycUHrrb3VkcZOEwo7d15lej9SNgPMXPdEVMA+Q==
X-Received: by 2002:a05:6a20:f388:b0:13c:ca8b:7e29 with SMTP id
 qr8-20020a056a20f38800b0013cca8b7e29mr661832pzb.12.1695156187065; 
 Tue, 19 Sep 2023 13:43:07 -0700 (PDT)
Received: from Adam-laptop.amarulasolutions.com ([172.56.201.58])
 by smtp.gmail.com with ESMTPSA id
 18-20020a056a00073200b0068844ee18dfsm8918700pfm.83.2023.09.19.13.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 13:43:06 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 14:42:52 -0600
Message-Id: <20230919204252.2272594-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
References: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695156187; x=1695760987;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8I+wdyMCNeEkJIQEG940taWqHwCQPhNLjFQlpjiZKKg=;
 b=KeL3f55McNznkiQTzQPFs/EFUikkQujgdd7ng98liiRTSS5xu6bN9urpzkZv7sNCZu
 MXTqvQhTnVA8CmBtFwMCEDE3C6GE691Hng2rpYS+8OZOe8cYseTdhGDyEO1fEBYBqhWC
 PkZd3VvlMVQe/+gNkwOYxaO3uCCgWD795NMq4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=KeL3f55M
Subject: [Buildroot] [PATCH v9 7/7]
 support/testing/tests/package/test_flutter.py: new runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a simple test that builds and runs the futter-gallery application and
checks if the service is active.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v8 -> v9:
  - Changed to aarch64 to avoid problems with older versions of qemu.
  - Added BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF

 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_flutter.py | 56 +++++++++++++++++++
 .../package/test_flutter/linux-vkms.fragment  |  2 +
 .../flutter-gallery.service                   |  1 +
 .../systemd/system/flutter-gallery.service    | 11 ++++
 5 files changed, 71 insertions(+)
 create mode 100644 support/testing/tests/package/test_flutter.py
 create mode 100644 support/testing/tests/package/test_flutter/linux-vkms.fragment
 create mode 120000 support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
 create mode 100644 support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service

diff --git a/DEVELOPERS b/DEVELOPERS
index 48a4ec776a..f46d83679a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
new file mode 100644
index 0000000000..e17ed9f659
--- /dev/null
+++ b/support/testing/tests/package/test_flutter.py
@@ -0,0 +1,56 @@
+import os
+import time
+import infra.basetest
+
+
+class TestFlutter(infra.basetest.BRTest):
+    config = f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_flutter/overlay")}"
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_INIT_SYSTEMD=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.54"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{infra.filepath("tests/package/test_flutter/linux-vkms.fragment")}"
+        BR2_PACKAGE_LIBDRM=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_PACKAGE_FLUTTER_PI=y
+        BR2_PACKAGE_FLUTTER_PI_RAW_KEYBOARD_PLUGIN=y
+        BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN=y
+        BR2_PACKAGE_FLUTTER_GALLERY=y
+        BR2_PACKAGE_FLUTTER_ENGINE=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        timeout = 35 * self.emulator.timeout_multiplier
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(
+            arch="aarch64",
+            kernel=kern,
+            kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+            options=["-M", "virt",
+                     "-cpu", "cortex-a57",
+                     "-m", "512M",
+                     "-smp", "4",
+                     "-vga", "std",
+                     "-vnc", "none",
+                     "-drive", f"file={img},if=virtio,format=raw"])
+        self.emulator.login()
+        cmd = "systemctl is-active flutter-gallery"
+        output, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "active")
diff --git a/support/testing/tests/package/test_flutter/linux-vkms.fragment b/support/testing/tests/package/test_flutter/linux-vkms.fragment
new file mode 100644
index 0000000000..3fc7a5dded
--- /dev/null
+++ b/support/testing/tests/package/test_flutter/linux-vkms.fragment
@@ -0,0 +1,2 @@
+CONFIG_DEBUG_FS=y
+CONFIG_DRM_VKMS=y
diff --git a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
new file mode 120000
index 0000000000..40993fb16c
--- /dev/null
+++ b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
@@ -0,0 +1 @@
+../../../../usr/lib/systemd/system/flutter-gallery.service
\ No newline at end of file
diff --git a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
new file mode 100644
index 0000000000..88a2bcbf0b
--- /dev/null
+++ b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=flutter-gallery daemon
+After=dbus.service systemd-udevd.service
+
+[Service]
+ExecStart=/usr/bin/flutter-pi --release /usr/share/flutter/gallery/release/
+Restart=always
+KillMode=process
+
+[Install]
+WantedBy=multi-user.target
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
