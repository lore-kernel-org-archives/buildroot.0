Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682F0CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 10:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29C2960818;
	Mon,  2 Sep 2024 10:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hR0ZbFyUA8r3; Mon,  2 Sep 2024 10:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8D4B6081D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8D4B6081D;
	Mon,  2 Sep 2024 10:45:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14BDC1BF279
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4503607DD
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8k13eEsNzlZf for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 10:44:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=968e9b7b9=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60D46607E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60D46607E4
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60D46607E4
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 10:44:53 +0000 (UTC)
X-CSE-ConnectionGUID: pVOuGmk5TZ+G4elLMhl1eQ==
X-CSE-MsgGUID: qWWp2xuXSzawcKtBna3Bvw==
X-IronPort-AV: E=Sophos;i="6.10,195,1719849600"; d="scan'208";a="26096237"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2024 18:44:52 +0800
IronPort-SDR: 66d5890a_LrQkzgA+5zhuYpXJpEC7RjZQdliy5ibXZKgzo+jd4c9iil2
 y2Rx4LOnRXZLsA6K2JIqUjJeONIG9T/jUSTw6fQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Sep 2024 02:44:43 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.wdc.com) ([10.224.3.224])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Sep 2024 03:44:52 -0700
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 12:44:32 +0200
Message-ID: <20240902104433.2561797-5-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902104433.2561797-1-niklas.cassel@wdc.com>
References: <20240902104433.2561797-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725273893; x=1756809893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mzz2gsfgpInHIt57tTgrEZkIj1CchNGpKshhtyoBN9w=;
 b=j3HruTNbjeS0SHsLwgaVlzJFXJmApAhfIsuN7na78tPcCffH23D+e5aC
 FXfzjEXV1cri6HBEQI4J7/z8XJ69M79rZRb7ubsuVWwEJCFpmxk4tGo2A
 KbyNeynWFqEY+Ps64WU2UVp4138/ueIGhrp3Kh8F3SD7XtpshQ6MHQ8lq
 cItX7NN5RP2ddxxMgXKpa8/lu3x7PkznOW/6an5uLpVgT3EknzZvVtwlY
 l14WQrQouNW9rwWJbwBoNKg4ROWw2LOFFiVCnp/l/3LqojC3eXlDzv7QE
 rxhEPw5HAb9bInGffD5mvGkeJbSNmrbPe7CVaxX7z4kwIy1SQQyoN2HE7
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=j3HruTNb
Subject: [Buildroot] [PATCH 4/5] board/radxa/rock5b: do not use udev
 predictable NIC names
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Niklas Cassel <cassel@kernel.org>

While udev is great it "unfortunately" enables predictable NIC names by
default.

Predictable NIC names are not bad by itself, but it does not work well
with the networking scripts in buildroot, thus disable udev predictable
NIC names by supplying net.ifnames=0 on the kernel command line.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/extlinux.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/radxa/rock5b/extlinux.conf b/board/radxa/rock5b/extlinux.conf
index c4198deaa0..c34b51c936 100644
--- a/board/radxa/rock5b/extlinux.conf
+++ b/board/radxa/rock5b/extlinux.conf
@@ -1,4 +1,4 @@
 label Radxa Rock 5b Linux
   kernel /boot/Image
   devicetree /boot/rk3588-rock-5b.dtb
-  append root=PARTLABEL=rootfs earlycon rootwait
+  append root=PARTLABEL=rootfs earlycon rootwait net.ifnames=0
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
