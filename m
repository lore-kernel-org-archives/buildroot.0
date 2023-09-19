Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C9ECD3425
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 00:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0DF741699;
	Tue, 19 Sep 2023 00:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0DF741699
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z837EtG44-cv; Tue, 19 Sep 2023 00:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFB2B40012;
	Tue, 19 Sep 2023 00:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFB2B40012
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67B3F1BF95F
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 00:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EE9040EC1
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 00:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EE9040EC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B3wJ8GD9HaOw for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 00:33:51 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B8C140961
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 00:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B8C140961
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c3cbfa40d6so46021355ad.1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 17:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695083630; x=1695688430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KmdN13LXcVP2Thc5koluhxd1eCxrvuRRg6tvvP6vorQ=;
 b=pz1ghS/KSs+1kQv70OOiUVwPi0jWJi8jy8x2wgV8jIFWCtiQ6XC1fILRb2iQkL7dI4
 6UoNvHb4GsLYYmnRapm+R+CewsXfKnDYaK31KATH02gdx+G6xFtW73v6Spm9syAlQm0l
 kKlbm2xmsE9XLRwuwc/UQxIUOa53EvkH2vtqcI4iVZZTulH8VzIZtwC53XK7DSzQm3Cr
 DdKviofvPxoJ8E/AyXIgsAV9c+1j40fOpSOAGARFVN1BMG2qcuq7iSQ27PH/MTIMSEKT
 cAObVpsW4ediZrYgZiGYo7InywyGtCPel70o5NeEKP2dSIYWSU1liy70rKlMvUlpMrh/
 kB8w==
X-Gm-Message-State: AOJu0YxTf6uQXlUr2HFQ3pFyQm58U++SDWDOtLTO0mJZI6qoaLJxgc3p
 Ev2eUID8PVEhTYwpqffqMKAJ+Av2ULo52XrJFrur6A==
X-Google-Smtp-Source: AGHT+IEoajmxRWe9kVvbQ+UzYJJlEtEh+BB2xWbAm4eG3FCGkjOCIz2NY4+RQCxgMnBYE4hBJ+3L9A==
X-Received: by 2002:a17:902:e5c7:b0:1c0:ec66:f2b2 with SMTP id
 u7-20020a170902e5c700b001c0ec66f2b2mr14078220plf.27.1695083630479; 
 Mon, 18 Sep 2023 17:33:50 -0700 (PDT)
Received: from Adam-laptop.amarulasolutions.com ([172.56.200.164])
 by smtp.gmail.com with ESMTPSA id
 iw13-20020a170903044d00b001c582de968dsm1558001plb.72.2023.09.18.17.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 17:33:50 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 18:33:37 -0600
Message-Id: <20230919003337.565432-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919003337.565432-1-adam.duskett@amarulasolutions.com>
References: <20230919003337.565432-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695083630; x=1695688430;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KmdN13LXcVP2Thc5koluhxd1eCxrvuRRg6tvvP6vorQ=;
 b=ml9HYwA3ItNIxOCNgX8GhGxz4ZC3GZZxqjjJkaouPP0aXMEey34Caz4Njl/pg/1zGi
 vCD5exi8fM+vzBz5vxzvPwc3wpN8cmWn1M6yCkXjh8tMSk9jQjm5nkzTWsTrWYkwahFA
 y2eGrKbKfZrc27cJMSR+i9pM2EM2JidFdFFu4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ml9HYwA3
Subject: [Buildroot] [PATCH v8 7/7]
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
v7 -> v8:
  - Remove -enable-kvm
  - Remove -vga virtio
  - Add -vnc none

v6 -> v7:
  - Call /usr/share/flutter/gallery/release/ in the flutter-gallery.service
    file.

 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_flutter.py | 58 +++++++++++++++++++
 .../package/test_flutter/linux-vkms.fragment  |  2 +
 .../flutter-gallery.service                   |  1 +
 .../systemd/system/flutter-gallery.service    | 11 ++++
 5 files changed, 73 insertions(+)
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
index 0000000000..7e1227d8be
--- /dev/null
+++ b/support/testing/tests/package/test_flutter.py
@@ -0,0 +1,58 @@
+import os
+import time
+import infra.basetest
+
+
+class TestFlutter(infra.basetest.BRTest):
+    config = f"""
+        BR2_x86_64=y
+        BR2_x86_corei7_avx=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
+        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_flutter/overlay")}"
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_INIT_SYSTEMD=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.49"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{infra.filepath("tests/package/test_flutter/linux-vkms.fragment")}"
+        BR2_PACKAGE_LIBDRM=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
+        BR2_PACKAGE_MESA3D_LLVM=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
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
+        kern = os.path.join(self.builddir, "images", "bzImage")
+        self.emulator.boot(
+            arch="x86_64",
+            kernel=kern,
+            kernel_cmdline=["root=/dev/vda console=ttyS0"],
+            options=["-M", "pc",
+                     "-cpu", "IvyBridge",
+                     "-m", "512M",
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
