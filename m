Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CAAC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 19:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77DBF6072F;
	Mon,  3 Jun 2024 19:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_3quCtHD80v; Mon,  3 Jun 2024 19:59:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7467E6076B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7467E6076B;
	Mon,  3 Jun 2024 19:59:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E893A1BF228
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 19:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0A2740CA5
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 19:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56nmBGFC3XzK for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 19:59:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.41;
 helo=smtpcmd0641.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 700E0404DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 700E0404DA
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 700E0404DA
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 19:59:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id EDpjsigmqmFXqEDpjspxnT; Mon, 03 Jun 2024 21:59:08 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 21:59:07 +0200
Message-Id: <20240603195907.1245756-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGH3d30ZMojkNBCuk1yUk1cJal0z0jkZJxdZX3a/czs409XDSC0DzQV2/FjkRNkQ51lH+8TbhijLzv2Od6AvN70evyXR2+G0zVN1vsw2PUwB+mlMExtn
 L78+EsoQ1Gb9Ed88wHJG7+kYS+eJSfq3O3CG5TnesE/HwxuOQEpHCyFs4z98VSQGshUUUj61JBiSODZOqc3PA+tYeXoHyD7B54hqtM/A9CfCDBODbuUF9Jlf
 aQrWM6GCM66y2Ha+2U6SnxZBAvIiYjqG+fknErerjY8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1717444748; bh=5jx62HBcLJos1m1JZKQksAw55ejX4llUR+y3UOe61x0=;
 h=From:To:Subject:Date:MIME-Version;
 b=kFci2/grzBEn3N4P7Pn835xOTbHDSWNcyUSFmT0D7HxlK/yxFUQamz6fqg9bEBcWd
 nXsi3ZX59FjUxXSVlzfK35B4tlTDZA5H1tdqpcLFILSKePXQc/Ls/7H+QvZEBkmtt7
 VCYE73zrfiIwNNmAHmzLfEzhzjeBxs9NnNBHPfEOSX1hc0mRnC4h+C2WRhZBKpd5gp
 smApt5Re8+lWoxOZir4aqbKfUxVNzZjrI/VU4SDufMygw0f8gLXyRBrY2U52wfQi3D
 ZS1xRRFYDiT6welYKxIEhCTUUyG30HjtpaS9POf0Sp0+uWHWXH/7Gn+74jjvKuXf3D
 dVKzROgD3VkVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=kFci2/gr
Subject: [Buildroot] [PATCH] package/esp-hosted: fix build failure on Linux
 6.8.12+
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream to fix build failure due to old Linux
Bluetooth API.

Fixes:
http://autobuild.buildroot.net/results/d64fa083ec27c3684d4186d2b1b05e041ad330f5/
http://autobuild.buildroot.net/results/5c4fac191970444e63109a762023c0e60f9693e2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...x-Bluetooth-build-failure-on-Linux-6.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch

diff --git a/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch b/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch
new file mode 100644
index 0000000000..7020b3a947
--- /dev/null
+++ b/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch
@@ -0,0 +1,35 @@
+From f8903bc2be7ae5ac9fb9bbeed8512e974c6e60ec Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 3 Jun 2024 21:53:38 +0200
+Subject: [PATCH] esp_hosted_ng: Fix Bluetooth build failure on Linux 6.8.11+
+
+After Linux commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=84a4bb6548a29326564f0e659fb8064503ecc1c7
+BT_HS has been removed and consequently AMP controllers can't be created,
+so at this point only HCI_PRIMARY has been left as unique controller type
+to be created and this became implicit with no need to define if the
+controller if HCI_PRIMARY or HCI_AMP. So let's assign HCI_PRIMARY up to
+Linux 6.8.11 only preventing build failure.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ esp_hosted_ng/host/esp_bt.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/esp_hosted_ng/host/esp_bt.c b/esp_hosted_ng/host/esp_bt.c
+index 3b78c11698..4598ac0e0a 100644
+--- a/esp_hosted_ng/host/esp_bt.c
++++ b/esp_hosted_ng/host/esp_bt.c
+@@ -240,7 +240,9 @@ int esp_init_bt(struct esp_adapter *adapter)
+ 	hdev->set_bdaddr = esp_bt_set_bdaddr;
+ #endif
+ 
++#if (LINUX_VERSION_CODE <= KERNEL_VERSION(6, 8, 11))
+ 	hdev->dev_type = HCI_PRIMARY;
++#endif
+ 
+ 	SET_HCIDEV_DEV(hdev, adapter->dev);
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
