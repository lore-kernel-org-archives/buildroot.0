Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE39ECE577
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 18:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E86C4090E;
	Mon,  9 Sep 2024 18:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWYWCXbMMHJA; Mon,  9 Sep 2024 18:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D926540918
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D926540918;
	Mon,  9 Sep 2024 18:21:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F2651BF33E
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 18:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69F9480523
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 18:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPMgzXBSRRtL for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 18:21:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=975aea9dd=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 598CC80527
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 598CC80527
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 598CC80527
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 18:21:15 +0000 (UTC)
X-CSE-ConnectionGUID: y0hsFQ3MTySf9BHhPbCNjg==
X-CSE-MsgGUID: 3WPZ4yDgRJKf2FZxce48UQ==
X-IronPort-AV: E=Sophos;i="6.10,214,1719849600"; d="scan'208";a="27081566"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2024 02:21:14 +0800
IronPort-SDR: 66df2fbd_vzTG1Ki/wLZ1pitHdK5D1nFGOWzDTJEcOt2GBxsNvsx7zu+
 VLHIcWCTGkBBlnyxAxS6CGEZBp3zp57PEstyaEw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Sep 2024 10:26:22 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.wdc.com) ([10.224.3.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Sep 2024 11:21:13 -0700
To: buildroot@buildroot.org
Date: Mon,  9 Sep 2024 20:21:02 +0200
Message-ID: <20240909182103.3667296-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909182103.3667296-1-niklas.cassel@wdc.com>
References: <20240909182103.3667296-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725906075; x=1757442075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jPt9q1zDvpDgrCfVLYeX/YLDwOMFnFB9LdtmFCX/w3Y=;
 b=pw4eSZAiisDxrQ+BtsGexr/RkFM1yFchP1HykZcZK/kP+NlBb/6p6QNr
 pTaMYBUc/8s7WjeKf06+AtTDoyCVGDqJM1zZ15qJL1W5VqmuknUMDnfPD
 tCBUQBERtYXjd7oB/is8LvXz8LmpmuCdzsNZSFhpCKsB8V/hRZQ85obhZ
 0MR+4kOMuXuWaLchA3rLsLlHw7wHo/BaXyrlLpdUehsxrYglmhXSYVbwQ
 ln5aQEnfuxb7ZxR3OFeIqGXSyFGqeOHIOjnezXU7emwGF0NA2xCkY5PLr
 K6JeA6UpjouA68FnpIhugvktLGhV3e9zZScnK9eAVYcvod25julGlMpQg
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=pw4eSZAi
Subject: [Buildroot] [PATCH 1/2] configs/rock5b: enable mdev to enable
 automatic module loading
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

Enable mdev so that coldplug will automatically load kernel modules that
were unavailable before rootfs was mounted.

mdev will also enable hotplug so that kernel modules will be automatically
loaded when a new device is inserted in e.g. USB or PCIe after boot.

Before this change:
$ lsmod | wc -l
0

After this change:
$ lsmod | wc -l
43

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 configs/rock5b_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index e3c4414948..b88d8c5da3 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -47,6 +47,7 @@ BR2_PACKAGE_HOST_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rock5b/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock5b/genimage.cfg"
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
