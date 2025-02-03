Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85910C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5142D6FC63;
	Fri, 28 Feb 2025 16:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVJqWQPMLtOz; Fri, 28 Feb 2025 16:35:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D506FC79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36D506FC79;
	Fri, 28 Feb 2025 16:35:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24190711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F02140413
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bs1SEQRCxKlh for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C82F840481
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C82F840481
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5B3585E25; Fri, 28 Feb 2025 16:30:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 15:51:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 51e6e87053c9b5192069bfe9d6ff18f5282d3b27
X-Git-Newrev: f5ba67264c402f9e8b8f0f61edb4067083c9927a
X-Patchwork-Hint: ignore
Message-Id: <20250228163025.B5B3585E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/raspberrypi*: remove
 dtparam krnbt=on
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6035769592655326864=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6035769592655326864==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f5ba67264c402f9e8b8f0f61edb4067083c9927a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The config.txt of the Rasperry Pi's supporting Wi-Fi and Bluetooth (i.e.
zero W, zero 2 W, 3, and 4) switch the Bluetooth function to use the
mini-UART (ttyS0) and restore UART0 (ttyAMA0) over the GPIOs 14 and 15
(as per miniuart-bt-overlay.dts[1]). All of them turn "on" the parameter
krnbt to autoprobe the bluetooth driver.

According to the README.md, the dtparam krnbt is now defaulting to "on"
since linux-raspberrypi 6.1.y[2]; it was defaulting to "off" before[3].

This removes the dtparam=krnbt=on from these config.txt files since the
value set is actually the default value.

[1]: https://github.com/raspberrypi/linux/blob/rpi-6.1.y/arch/arm/boot/dts/overlays/miniuart-bt-overlay.dts
[2]: https://github.com/raspberrypi/linux/blob/rpi-6.1.y/arch/arm/boot/dts/overlays/README#L294-L296
[3]: https://github.com/raspberrypi/linux/blob/rpi-5.10.y/arch/arm/boot/dts/overlays/README#L213-L215

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/raspberrypi/config_0w.txt      | 3 ---
 board/raspberrypi/config_3.txt       | 3 ---
 board/raspberrypi/config_3_64bit.txt | 3 ---
 board/raspberrypi/config_4.txt       | 3 ---
 board/raspberrypi/config_4_64bit.txt | 3 ---
 board/raspberrypi/config_zero2w.txt  | 3 ---
 6 files changed, 18 deletions(-)

diff --git a/board/raspberrypi/config_0w.txt b/board/raspberrypi/config_0w.txt
index 123e09cf56..0267210e2d 100644
--- a/board/raspberrypi/config_0w.txt
+++ b/board/raspberrypi/config_0w.txt
@@ -24,6 +24,3 @@ gpu_mem_1024=100
 
 # Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
-
-# enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtparam=krnbt=on
diff --git a/board/raspberrypi/config_3.txt b/board/raspberrypi/config_3.txt
index 123e09cf56..0267210e2d 100644
--- a/board/raspberrypi/config_3.txt
+++ b/board/raspberrypi/config_3.txt
@@ -24,6 +24,3 @@ gpu_mem_1024=100
 
 # Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
-
-# enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtparam=krnbt=on
diff --git a/board/raspberrypi/config_3_64bit.txt b/board/raspberrypi/config_3_64bit.txt
index 88206e9b14..bbd8b69363 100644
--- a/board/raspberrypi/config_3_64bit.txt
+++ b/board/raspberrypi/config_3_64bit.txt
@@ -25,8 +25,5 @@ gpu_mem_1024=100
 # Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
 
-# enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtparam=krnbt=on
-
 # enable 64bits support
 arm_64bit=1
diff --git a/board/raspberrypi/config_4.txt b/board/raspberrypi/config_4.txt
index 9b77d23d74..13a7238f6e 100644
--- a/board/raspberrypi/config_4.txt
+++ b/board/raspberrypi/config_4.txt
@@ -24,6 +24,3 @@ gpu_mem_1024=100
 
 # Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
-
-# enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtparam=krnbt=on
diff --git a/board/raspberrypi/config_4_64bit.txt b/board/raspberrypi/config_4_64bit.txt
index fcb1c5c30a..2eef6dd1a2 100644
--- a/board/raspberrypi/config_4_64bit.txt
+++ b/board/raspberrypi/config_4_64bit.txt
@@ -25,8 +25,5 @@ gpu_mem_1024=100
 # Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
 
-# enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtparam=krnbt=on
-
 # enable 64bits support
 arm_64bit=1
diff --git a/board/raspberrypi/config_zero2w.txt b/board/raspberrypi/config_zero2w.txt
index 123e09cf56..0267210e2d 100644
--- a/board/raspberrypi/config_zero2w.txt
+++ b/board/raspberrypi/config_zero2w.txt
@@ -24,6 +24,3 @@ gpu_mem_1024=100
 
 # Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
-
-# enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtparam=krnbt=on

--===============6035769592655326864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6035769592655326864==--
