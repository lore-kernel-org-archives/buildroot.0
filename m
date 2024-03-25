Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B55C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9EFB60A50;
	Mon, 25 Mar 2024 22:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rI02BTsN7nMJ; Mon, 25 Mar 2024 22:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 312F060A55
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 312F060A55;
	Mon, 25 Mar 2024 22:35:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 465931BF954
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4140C40192
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZPqnbjR9Rzi for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:34:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C333400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C333400CE
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C333400CE
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:34:43 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1e0878b76f3so24371745ad.0
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406082; x=1712010882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0B5ZQdd2zqgELfxlhif+Chie38pVBLUZthDqj64vH0=;
 b=Dhl17DbnTtCutrwNwm7tquOCrBGppBtLP/5K4u+FWyJp6tlNObr6o8bg5P13NElfI8
 KHITkFjie1YwW6X4O0kGiIBUSe54YlaSFJVl/zbEtdKWGF572TVjOc6NmOjDg3rKqFs4
 bSY98jLTQZ9I1MhvGZAwICqD15OLxmtJV9qG3pvq74vuAUq4KuAe5xxBnfil8mneejFO
 Z8NCzZ4BxyR2IsowuGB4se7/EDtdkcB2I1UuW/MT3NGaCPjqnpFYl2rVCaB0CawzRxez
 n0dcA/314kqB9K6kabOCilz7olXIAWWdQv0E0jeVE5dtgdrEtjkSK+32We6Q0DR8+iKo
 lRKA==
X-Gm-Message-State: AOJu0Yx58nW0B3rrbS3TQV1X+JWW4uE//Z3fbUno9yp57UZ4b20yMdzy
 vMmPSdBtCw2tmZ/ygz8M5pl36NXg+Hg2pEBhu17d0yzTEU87qg4fg/pEd570jEuuQ4H+rfZt4Uf
 2
X-Google-Smtp-Source: AGHT+IF9cwD/3fEZYeqdB78p8woY4y+1vnVXZlAQ+oRuBjzxjTVYfQaQ7QuE31fXrlMosKfWtOO4PQ==
X-Received: by 2002:a17:903:18a:b0:1e0:e011:e3cb with SMTP id
 z10-20020a170903018a00b001e0e011e3cbmr2054202plg.15.1711406082449; 
 Mon, 25 Mar 2024 15:34:42 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902f54a00b001dd7a97a266sm5245323plf.282.2024.03.25.15.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 15:34:41 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 16:34:19 -0600
Message-ID: <20240325223424.108702-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
References: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711406082; x=1712010882;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0B5ZQdd2zqgELfxlhif+Chie38pVBLUZthDqj64vH0=;
 b=cgoB0hfyBwz2tW8ae7Xf9UbPjQzwj3zk/vuGp0pdBrwnGEW0eT92Y8lzNqB1d9h/5r
 JeP7k1Y2vyJB+O6cg2YZhoIoJoFDZntg07r9Z/Z5C3M3YxQ9xmzl1xFnuuoiSsEQJDV9
 1ljY+c7aTlDUa+GRWA0TM9CYpjGIHN+prvL/w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cgoB0hfy
Subject: [Buildroot] [PATCH v2 08/13]
 support/testing/tests/package/test_flutter.py: use flutter-markdown-example
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The maintainers of the flutter-gallery package archived the project as of
February 16, 2024. In addition, the flutter-gallery package is incompatible
with Flutter 3.19.x. Because of these problems, using the flutter-gallery
package as the testing application for Flutter is no longer reasonable nor
maintainable.

However, it is reasonable to use the flutter-markdown-example package from
flutter-packages, as it is a first-party application updated regularly and
often automatically, ensuring compatibility with the latest versions of
Flutter.

  - Switch the package used for Flutter testing from flutter-gallery to
    flutter-markdown-example

  - Rename flutter-gallery.service to flutter-markdown-example.service

  - Change /usr/share/flutter/gallery/release/ to
    /usr/share/flutter/flutter_markdown_example/release/

  - Run `systemctl is-active flutter-markdown-example` instead of
   `systemctl is-active flutter-gallery`

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 support/testing/tests/package/test_flutter.py         |  5 +++--
 .../multi-user.target.wants/flutter-gallery.service   |  1 -
 .../flutter-markdown-example.service                  |  1 +
 .../usr/lib/systemd/system/flutter-gallery.service    | 11 -----------
 .../systemd/system/flutter-markdown-example.service   | 11 +++++++++++
 5 files changed, 15 insertions(+), 14 deletions(-)
 delete mode 120000 support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
 create mode 120000 support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-markdown-example.service
 delete mode 100644 support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
 create mode 100644 support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service

diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
index a3e98a43e5..3a150a69e1 100644
--- a/support/testing/tests/package/test_flutter.py
+++ b/support/testing/tests/package/test_flutter.py
@@ -25,7 +25,8 @@ class TestFlutter(infra.basetest.BRTest):
         BR2_PACKAGE_FLUTTER_PI=y
         BR2_PACKAGE_FLUTTER_PI_RAW_KEYBOARD_PLUGIN=y
         BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN=y
-        BR2_PACKAGE_FLUTTER_GALLERY=y
+        BR2_PACKAGE_FLUTTER_PACKAGES=y
+        BR2_PACKAGE_FLUTTER_MARKDOWN_EXAMPLE=y
         BR2_PACKAGE_FLUTTER_ENGINE=y
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_4=y
@@ -48,7 +49,7 @@ class TestFlutter(infra.basetest.BRTest):
                      "-vnc", "none",
                      "-drive", f"file={img},if=virtio,format=raw"])
         self.emulator.login()
-        cmd = "systemctl is-active flutter-gallery"
+        cmd = "systemctl is-active flutter-markdown-example"
         output, exit_code = self.emulator.run(cmd, 10)
         self.assertEqual(exit_code, 0)
         self.assertEqual(output[0], "active")
diff --git a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
deleted file mode 120000
index 40993fb16c..0000000000
--- a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
+++ /dev/null
@@ -1 +0,0 @@
-../../../../usr/lib/systemd/system/flutter-gallery.service
\ No newline at end of file
diff --git a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-markdown-example.service b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-markdown-example.service
new file mode 120000
index 0000000000..83e731ba2d
--- /dev/null
+++ b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-markdown-example.service
@@ -0,0 +1 @@
+../../../../usr/lib/systemd/system/flutter-markdown-example.service
\ No newline at end of file
diff --git a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
deleted file mode 100644
index 88a2bcbf0b..0000000000
--- a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=flutter-gallery daemon
-After=dbus.service systemd-udevd.service
-
-[Service]
-ExecStart=/usr/bin/flutter-pi --release /usr/share/flutter/gallery/release/
-Restart=always
-KillMode=process
-
-[Install]
-WantedBy=multi-user.target
diff --git a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service
new file mode 100644
index 0000000000..2a64b88c2d
--- /dev/null
+++ b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=flutter-markdown-example daemon
+After=dbus.service systemd-udevd.service
+
+[Service]
+ExecStart=/usr/bin/flutter-pi --release /usr/share/flutter/flutter_markdown_example/release/
+Restart=always
+KillMode=process
+
+[Install]
+WantedBy=multi-user.target
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
