Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96461C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 18:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0111581815;
	Mon, 27 Nov 2023 18:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0111581815
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yN0ylNB85ixa; Mon, 27 Nov 2023 18:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 004C8817FD;
	Mon, 27 Nov 2023 18:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 004C8817FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2EC41BF348
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7E874064E
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7E874064E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yogf_A5ojr6K for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 18:40:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A715240568
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 18:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A715240568
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91CD9874E7; Mon, 27 Nov 2023 18:40:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Nov 2023 19:39:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3da62675d730eec9b402f8edd1de5e046e94d71d
X-Git-Newrev: 5be42d8da3370e74b32190b97c4399749b4fa761
X-Patchwork-Hint: ignore
Message-Id: <20231127184002.91CD9874E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypi: fix autoprobing of
 bluetooth driver
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8964158852452223873=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8964158852452223873==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5be42d8da3370e74b32190b97c4399749b4fa761
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit 689b9ac439 (package/rpi-firmware: rework boot/config file
handling) has split in two the property:

	dtoverlay=miniuart-bt,krnbt=on

Into:

	dtoverlay=miniuart-bt
	dtoverlay=krnbt=on

The initial property contained the dtbo file miniuart-bt[1] and its
parameter krnbt=on[2][3].

The first syntax is correct while the second is not. The krnbt=on is not
a dtoverlay[4] but a dtparam[5]. Therefore the property dtparam must be
used instead.

This fixes:

	# cat /sys/firmware/devicetree/base/chosen/user-warnings
	Failed to load overlay 'krnbt=on'

[1]: https://github.com/raspberrypi/linux/blob/rpi-5.10.y/arch/arm/boot/dts/overlays/miniuart-bt-overlay.dts
[2]: https://github.com/raspberrypi/linux/blob/rpi-5.10.y/arch/arm/boot/dts/overlays/miniuart-bt-overlay.dts#L91
[3]: https://github.com/raspberrypi/linux/blob/rpi-5.10.y/arch/arm/boot/dts/overlays/README#L213-L215
[4]: https://www.raspberrypi.com/documentation/computers/config_txt.html#dtoverlay
[5]: https://www.raspberrypi.com/documentation/computers/config_txt.html#dtparam

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/raspberrypi/config_0w.txt      | 2 +-
 board/raspberrypi/config_3.txt       | 2 +-
 board/raspberrypi/config_3_64bit.txt | 2 +-
 board/raspberrypi/config_4.txt       | 2 +-
 board/raspberrypi/config_4_64bit.txt | 2 +-
 board/raspberrypi/config_zero2w.txt  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/raspberrypi/config_0w.txt b/board/raspberrypi/config_0w.txt
index 195bad449e..bc59d5fad2 100644
--- a/board/raspberrypi/config_0w.txt
+++ b/board/raspberrypi/config_0w.txt
@@ -26,4 +26,4 @@ gpu_mem_1024=100
 dtoverlay=miniuart-bt
 
 # enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtoverlay=krnbt=on
+dtparam=krnbt=on
diff --git a/board/raspberrypi/config_3.txt b/board/raspberrypi/config_3.txt
index 195bad449e..bc59d5fad2 100644
--- a/board/raspberrypi/config_3.txt
+++ b/board/raspberrypi/config_3.txt
@@ -26,4 +26,4 @@ gpu_mem_1024=100
 dtoverlay=miniuart-bt
 
 # enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtoverlay=krnbt=on
+dtparam=krnbt=on
diff --git a/board/raspberrypi/config_3_64bit.txt b/board/raspberrypi/config_3_64bit.txt
index 34412fa9e8..6672871125 100644
--- a/board/raspberrypi/config_3_64bit.txt
+++ b/board/raspberrypi/config_3_64bit.txt
@@ -26,7 +26,7 @@ gpu_mem_1024=100
 dtoverlay=miniuart-bt
 
 # enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtoverlay=krnbt=on
+dtparam=krnbt=on
 
 # enable 64bits support
 arm_64bit=1
diff --git a/board/raspberrypi/config_4.txt b/board/raspberrypi/config_4.txt
index ea02d3f071..74a7b270cd 100644
--- a/board/raspberrypi/config_4.txt
+++ b/board/raspberrypi/config_4.txt
@@ -26,4 +26,4 @@ gpu_mem_1024=100
 dtoverlay=miniuart-bt
 
 # enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtoverlay=krnbt=on
+dtparam=krnbt=on
diff --git a/board/raspberrypi/config_4_64bit.txt b/board/raspberrypi/config_4_64bit.txt
index 41c7e97e99..2a9814274f 100644
--- a/board/raspberrypi/config_4_64bit.txt
+++ b/board/raspberrypi/config_4_64bit.txt
@@ -26,7 +26,7 @@ gpu_mem_1024=100
 dtoverlay=miniuart-bt
 
 # enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtoverlay=krnbt=on
+dtparam=krnbt=on
 
 dtoverlay=vc4-kms-v3d-pi4
 dtoverlay=imx219
diff --git a/board/raspberrypi/config_zero2w.txt b/board/raspberrypi/config_zero2w.txt
index 9e6b7f5ccf..55095f64a7 100644
--- a/board/raspberrypi/config_zero2w.txt
+++ b/board/raspberrypi/config_zero2w.txt
@@ -26,4 +26,4 @@ gpu_mem_1024=100
 dtoverlay=miniuart-bt
 
 # enable autoprobing of Bluetooth driver without need of hciattach/btattach
-dtoverlay=krnbt=on
+dtparam=krnbt=on

--===============8964158852452223873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8964158852452223873==--
