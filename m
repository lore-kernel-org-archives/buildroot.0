Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D79C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 22:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02C9F40A82;
	Thu, 13 Jan 2022 22:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlaVTAKeVQZQ; Thu, 13 Jan 2022 22:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4F2640A7E;
	Thu, 13 Jan 2022 22:12:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B25371C1135
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 22:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A15BE415B9
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 22:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l6po8rBsAoic for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 22:12:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6D3141561
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 22:12:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 774B681392; Thu, 13 Jan 2022 22:06:00 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 23:12:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31ed653166a45eda2403e311a3996b5df59d6775
X-Git-Newrev: d7cf67fc940264e2ad6e60eaa914a214df9b81d8
X-Patchwork-Hint: ignore
Message-Id: <20220113220600.774B681392@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypicm4io-64: enable RTC and
 USB overlays
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d7cf67fc940264e2ad6e60eaa914a214df9b81d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CM4 IO Board is equipped with an on-board RTC connected over I2C,
and has USB 2.0 host ports.

This commit loads the appropriate overlays to enable both. The USB 2.0
interface is by default disabled on CM4 to reduce the power
consumption so it needs to be explicitly enabled on the CM4 IO Board
to use the USB ports.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/config_cm4io_64bit.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/board/raspberrypi/config_cm4io_64bit.txt b/board/raspberrypi/config_cm4io_64bit.txt
index 6cd8a729cd..813f6eba7b 100644
--- a/board/raspberrypi/config_cm4io_64bit.txt
+++ b/board/raspberrypi/config_cm4io_64bit.txt
@@ -25,6 +25,13 @@ gpu_mem_1024=100
 # fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
 dtoverlay=miniuart-bt
 
+# enable RTC
+dtparam=i2c_vc=on
+dtoverlay=i2c-rtc,pcf85063a,i2c_csi_dsi
+
+# enable dwc2 USB controller (USB 2.0)
+dtoverlay=dwc2,dr_mode=host
+
 # enable 64bits support
 arm_64bit=1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
