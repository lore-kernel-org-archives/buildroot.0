Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576DFC83F11
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 18:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CD0440B3A;
	Mon, 28 Aug 2023 18:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CD0440B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pkAYKBqjXy8S; Mon, 28 Aug 2023 18:00:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CA1140B33;
	Mon, 28 Aug 2023 18:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CA1140B33
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9D611BF271
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 17:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 816D1405BC
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 17:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 816D1405BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5JOD8lInYqa for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 17:59:31 +0000 (UTC)
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8DC7405F8
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 17:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8DC7405F8
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3a7aedc57ffso2533118b6e.2
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 10:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693245570; x=1693850370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hn6KQ2O4ECx+Cri3Gmwv458vyKfTp8lJqT3vWdf/074=;
 b=VvyPcCAd7IDhL3nz1rdzz0A9m0rbx0T7aaOmjkjms9GWtL2Y30XnyOlEgRihexhtvT
 XShPaTyUWZRkjCBB0VYLdT8muyW2lpGW52BP1Ennfb29VaYiZJtQRaoKRIRHqYb30OJN
 q+noOwiMVzv9096n1YFzkV9yLlfemVJMRIJqZ2ki/wV9AGGCUWKlmjvqZtXFRHuFWLHk
 LBXXV55MFABkv2n6tgM7L9e+ulKfaeAWvWGmiD2hhP+UxrZmJMhRIZNKAOzsTUmUheNy
 iuA7aBh8/Vt15LuabBUk8ymWZi++A6Umtx+Fr2XkIH5CxXk/P6B+4Jcss5giF4wxg4ZS
 qwaw==
X-Gm-Message-State: AOJu0YxsIGvFqRSRAMCQZxFnk9To/2A83eirdgJK4jZmK23LBkdSO1XC
 Ghlf35VrgnCNJyz4BtsvgsLLpGX4jb4tjpfycj0=
X-Google-Smtp-Source: AGHT+IESrnQBUvxp49OPchunaMvrv9mrFNgQAU9PT3H1pzb8PQAXLLVuaGQFqjUiFq8dEJE+7ve3qw==
X-Received: by 2002:a05:6358:881e:b0:132:ce1f:6793 with SMTP id
 hv30-20020a056358881e00b00132ce1f6793mr32813710rwb.21.1693245570251; 
 Mon, 28 Aug 2023 10:59:30 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a63505a000000b00570132a022csm1823143pgl.79.2023.08.28.10.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 10:59:29 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 28 Aug 2023 11:58:58 -0600
Message-ID: <20230828175858.309974-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828175858.309974-1-adam.duskett@amarulasolutions.com>
References: <20230828175858.309974-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693245570; x=1693850370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hn6KQ2O4ECx+Cri3Gmwv458vyKfTp8lJqT3vWdf/074=;
 b=TiMLZ537G6heFBdItTyYqZamM9CrpPKMdvDqiTKMWS9fKUkRJyfXELLcYySsZX0Wh4
 CWOnKE5Pa3gvs/wMYp9CT4t4hrrAyiHY9qXNdRThihHhoVxsYKSazMz+CogFQVAwIFKE
 UBxGwI5TMyPTMvHRTsf1WHS4nQmC09tkfcnEg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=TiMLZ537
Subject: [Buildroot] [PATCH v6 7/7]
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
index ff0e362496..ff9996f929 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -32,6 +32,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Duskett <aduskett@gmail.com>
 F:	package/firewalld/
diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
new file mode 100644
index 0000000000..05dd9de910
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
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_PACKAGE_FLUTTER_PI=y
+        BR2_PACKAGE_FLUTTER_PI_KEYBOARD_PLUGIN=y
+        BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN=y
+        BR2_PACKAGE_FLUTTER_GALLERY=y
+        BR2_PACKAGE_FLUTTER_ENGINE=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="328M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "bzImage")
+        self.emulator.boot(
+            arch="x86_64",
+            kernel=kern,
+            kernel_cmdline=["root=/dev/vda console=ttyS0"],
+            options=["-M", "pc",
+                     "-enable-kvm",
+                     "-cpu", "IvyBridge",
+                     "-m", "512M",
+                     "-vga", "virtio",
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
index 0000000000..6588817c9b
--- /dev/null
+++ b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=flutter-gallery daemon
+After=dbus.service systemd-udevd.service
+
+[Service]
+ExecStart=/usr/bin/flutter-pi --release /usr/share/flutter/gallery/3.10.6/release/
+Restart=always
+KillMode=process
+
+[Install]
+WantedBy=multi-user.target
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
