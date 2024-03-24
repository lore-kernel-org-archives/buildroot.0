Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5826C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 22:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 529C481E07;
	Sun, 24 Mar 2024 22:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nf1SMALYY_0x; Sun, 24 Mar 2024 22:51:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FE6681D5A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FE6681D5A;
	Sun, 24 Mar 2024 22:51:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 601EE1BF4E4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C975409B3
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzqQE3qBcSNs for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 22:51:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4766C40004
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4766C40004
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4766C40004
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 22:51:14 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-222c0572eedso2085803fac.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711320673; x=1711925473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0B5ZQdd2zqgELfxlhif+Chie38pVBLUZthDqj64vH0=;
 b=r/BGY2x+yX098kLRuqVzqDjfpdbvcGuyym6t3x2s26ciijOsQtxW7BLoHh6Quyobp7
 rwbLqXY0ZIyS+hbphRsJTnS0tY0+rBfQMEI/zsVolzUxynocsUuKrh99FrWAmxO2v0xV
 SHKd/H/c2dtYtixiXQ5E0rH5xxo1eVnFtjGiyexbwTPvRsNOck/ovxtkyWaFLdfzzrS4
 IF2yRgDlOODRCsQjzsyMCF6cL+Xf88mXGsBERB8ek+Xlw+gOzeGWUzrHag+ND7VeUeAW
 KS8ncDsA30n1UTKBZk4v6+jKYSlVl08q49heMI/+CD6yJ8z8/xUAb2cwPRjb2HXfS8oz
 JsuA==
X-Gm-Message-State: AOJu0YxwejjyK8ir2ZXOXlRhR+1hi/Sj9aVWMFA6xRLGn3pBWClFzy1v
 0KFM4j0makR5+1vuW02HlfOBPq9GkHeHJ9aJQjWx9HtPGZqpwpW5Odt8FlO5BZDdaF5c1Con7u5
 P
X-Google-Smtp-Source: AGHT+IH6zAA71yzNjQui7PU/AYz/K9wWrWKAWu2Nf92sfm48njLvkNHHZd4zegBQeljUSHXqE3zk1Q==
X-Received: by 2002:a05:6871:8e97:b0:22a:ecd:9314 with SMTP id
 zq23-20020a0568718e9700b0022a0ecd9314mr3855637oab.9.1711320673188; 
 Sun, 24 Mar 2024 15:51:13 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a33-20020a056a0011e100b006e580678dfbsm214031pfu.193.2024.03.24.15.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 15:51:12 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:50:47 -0600
Message-ID: <20240324225052.629874-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
References: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711320673; x=1711925473;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0B5ZQdd2zqgELfxlhif+Chie38pVBLUZthDqj64vH0=;
 b=ds7pzh4Tgb9CjjSBjxVdoVrexzAVbJ/JCuKly0USKK5jpsuEMszO94hkmi77csaIyj
 kQJ52iLYLuuj2J07/SSqz9dXHqYHMJ86GciJinZXO9C+SytGv2eyTc1PXPClRl24Btk0
 KU4LHm0Tdx4c0XAy7HGoPhgWSG/l9acKqzHMk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ds7pzh4T
Subject: [Buildroot] [PATCH 08/13]
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
