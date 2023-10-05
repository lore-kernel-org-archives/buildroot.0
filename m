Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA3BE7AD44
	for <buildroot@archiver.kernel.org>; Thu,  5 Oct 2023 16:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F2BF42849;
	Thu,  5 Oct 2023 16:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F2BF42849
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doerkI_YL45B; Thu,  5 Oct 2023 16:18:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65A2A4284F;
	Thu,  5 Oct 2023 16:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65A2A4284F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BEBA1BF40E
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 16:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33F7C4284F
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 16:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33F7C4284F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RM9nmlP6E-7n for <buildroot@lists.busybox.net>;
 Thu,  5 Oct 2023 16:17:45 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 062D3426EA
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 16:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 062D3426EA
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4060b623e64so7746395e9.0
 for <buildroot@buildroot.org>; Thu, 05 Oct 2023 09:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696522663; x=1697127463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KRAMcDe7eaEgXfogmEymXv//Uxa50jfHD/eZ7j/DKno=;
 b=CBPc5cgTgJV2IP9xishmSCDlt0F2fxSngD0UpwxBMVShlQw7SHIiLGB+LpV9trEoCJ
 OiW6kIkc6/3CvCqh0qSHLwrQiqO3Fiavq2NIriifoypg49C/T3w0jK/c6nAGMPXX4g1h
 1+Yl25ovT3IovW8GDsBwB98Wr7qe3aNPw8pa3Y5zONmFKnHTncS3OZhVYkrMDo2EQFP6
 12pQS+zvjlrASaBhcU31Lg2uqMnx0+dE2K5PFbWsnIjOnpyT7XlPl+X1p4TaPyr7OlhJ
 EPAJvIg9nieh9gEdWKvmVQ73Lyb3ZMvBvq1fZ3DttYMvUFH8bSfFPaDa0LN0OBF32IGk
 +3vw==
X-Gm-Message-State: AOJu0YwTu96VsJPW0gNNYFGB9NMlcEjjc8OnDx6myMqyV2LsJfSk95GK
 TJrQOgae9Jj35/tT81HcMcDjb5uTVP4=
X-Google-Smtp-Source: AGHT+IGVhNbKNh+zu8GlmRcrcEXAUZ9xVWISPpbirlrApM7voJ3XuVCCbVru8r0JrvC3I8H5QTHfkA==
X-Received: by 2002:a05:600c:21ca:b0:405:3924:3cad with SMTP id
 x10-20020a05600c21ca00b0040539243cadmr2687611wmj.15.1696522662618; 
 Thu, 05 Oct 2023 09:17:42 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:c5c9:a1ea:cbf9:9051])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a5d6052000000b003248a490e3asm2116429wrt.39.2023.10.05.09.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 09:17:42 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu,  5 Oct 2023 18:17:41 +0200
Message-Id: <33ee4b08c20f9c4566cfe82c648f01599cab70b5.1696522656.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1696522656.git.yann.morin.1998@free.fr>
References: <cover.1696522656.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696522663; x=1697127463; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRAMcDe7eaEgXfogmEymXv//Uxa50jfHD/eZ7j/DKno=;
 b=OkBULXIizdzvw2Lr7x3VxMYXJ9G5Yq26UmfJWJ9YzisqDk4GgrWKrYSyE2T+bOA+wZ
 zFe/ElNmFFIlfQf6mQTCYbHV2BLlXd1DIdHhttsjG4WN6pjzleOjEPw2qBCz0d+qr/hs
 bA4WJGUQGtFNaHWRWR2YRFf3Du6ENsQ/05zdC5wef/y4qOWxGzd9iexOYaYKHo9uK+1o
 majL6sv3of8bUQ1bYuC8KsUysXvTXXWY2BQioCanz/kc2DZWoBZWOd/WQVDjjlFTt5SF
 OjVqRQYLkfHQAHhgPtxFqzKtQKSv6tNH5kJ/S0BqUUqvpoOSijKlXxK90V8ua3cBUXMQ
 M4zw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OkBULXIi
Subject: [Buildroot] [PATCH 2/2 v2] suport/runtime-test: extend flutter test
 to check rendering is happening
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 7f0af11cee31 (support/testing/tests/package/test_flutter.py: new
runtime test) added a simple test that just checked that the systemd
unit launching the application, was active.

It is perfectly possible, from a systemd perspective, that the unit is
active, while the application actually crashes.

Instead, what we need to check, is that the application does actually
render "something"; we don't really care what, as long as we know it is
actually rendering, thus the graphical stack is working and the
aplication stack is running.

Extend the flutter runtime test to also check that the framebuffer is
modified by the application when it is running, similarly to what we do
in the weston test.

We drop the activation of the unit and start it manually, as we want to
check the state of the CRC before, while, and after the application
runs.

We also need to disable the blinking cursor on the console, or we would
not be able to detect whether a change in CRC is due to the application
starting rendering, or to the cursor blinking. We tell the kernel to
disable the cursor with the appropriate kernel command line parameter.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>

---
Changes v1 -> v2:
  - don't mistake blinking cursor for application start  (Adam)
  - properly terminate application  (Adam)
---
 support/testing/tests/package/test_flutter.py | 35 +++++++++++++++----
 .../flutter-gallery.service                   |  1 -
 2 files changed, 29 insertions(+), 7 deletions(-)
 delete mode 120000 support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service

diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
index a3e98a43e5..515c95409f 100644
--- a/support/testing/tests/package/test_flutter.py
+++ b/support/testing/tests/package/test_flutter.py
@@ -1,8 +1,11 @@
 import os
+import time
 import infra.basetest
 
+from ..graphics_base import GraphicsBase
 
-class TestFlutter(infra.basetest.BRTest):
+
+class TestFlutter(infra.basetest.BRTest, GraphicsBase):
     config = f"""
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
@@ -39,7 +42,7 @@ class TestFlutter(infra.basetest.BRTest):
         self.emulator.boot(
             arch="aarch64",
             kernel=kern,
-            kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+            kernel_cmdline=["root=/dev/vda console=ttyAMA0 vt.global_cursor_default=0"],
             options=["-M", "virt",
                      "-cpu", "cortex-a57",
                      "-m", "512M",
@@ -48,7 +51,27 @@ class TestFlutter(infra.basetest.BRTest):
                      "-vnc", "none",
                      "-drive", f"file={img},if=virtio,format=raw"])
         self.emulator.login()
-        cmd = "systemctl is-active flutter-gallery"
-        output, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(output[0], "active")
+
+        # Get the CRC from the current ramebuffer
+        empty_crc = self.get_n_fb_crc(count=1)[0]
+
+        # Start the gallery App. It can take a bit of time to start,
+        # so lets try a few times. 600 samples should cover about 10s
+        # @60Hz (although, the rendering could be much slower on slow
+        # machines)
+        self.assertRunOk("systemctl start flutter-gallery", timeout=10)
+        for i in range(600):
+            gallery_crc = self.get_n_fb_crc(count=1)[0]
+            if gallery_crc != empty_crc:
+                break
+            time.sleep(1)
+        self.assertNotEqual(gallery_crc, empty_crc, "gallery app did not render anything on screen")
+
+        # Stop the application, and check it restored the framebuffer content
+        self.assertRunOk("systemctl stop flutter-gallery", timeout=10)
+        for i in range(600):
+            gallery_crc = self.get_n_fb_crc(count=1)[0]
+            if gallery_crc == empty_crc:
+                break
+            time.sleep(1)
+        self.assertEqual(gallery_crc, empty_crc, "gallery app did not stop rendering")
diff --git a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
deleted file mode 120000
index 40993fb16c..0000000000
--- a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
+++ /dev/null
@@ -1 +0,0 @@
-../../../../usr/lib/systemd/system/flutter-gallery.service
\ No newline at end of file
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
