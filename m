Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6399CCA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 10:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D96A60804;
	Mon,  2 Sep 2024 10:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIUyPw10QlzZ; Mon,  2 Sep 2024 10:45:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC1B56061B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC1B56061B;
	Mon,  2 Sep 2024 10:45:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34C451BF279
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DB24607E5
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VU2a7ppoanj2 for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 10:44:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=968e9b7b9=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 01904607C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01904607C0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01904607C0
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 10:44:54 +0000 (UTC)
X-CSE-ConnectionGUID: 9jzJl6niSgKBE6rwFLSfRg==
X-CSE-MsgGUID: 9lkdIxQ9SZm8jkBkWw/JSA==
X-IronPort-AV: E=Sophos;i="6.10,195,1719849600"; d="scan'208";a="26096241"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2024 18:44:54 +0800
IronPort-SDR: 66d5890c_PbmDLEVz70iuPOG4rhHGsswXSRZkbZJFPhIu9eDlytKu/3L
 Q/Eyt2oXMOvtIRRMJbuMS0VUFBtMNbHoqVFH6Ow==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Sep 2024 02:44:45 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.wdc.com) ([10.224.3.224])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Sep 2024 03:44:53 -0700
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 12:44:33 +0200
Message-ID: <20240902104433.2561797-6-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902104433.2561797-1-niklas.cassel@wdc.com>
References: <20240902104433.2561797-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725273894; x=1756809894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yb4Nlz6R95VHD26JNSn/FCXJC059RHlu6mpjJNt/Va0=;
 b=fE2Z8k7iAv0TZ6TbB2EpKmHxiNuVcSXsxPbpJM/rXJ91leGm4QGHuDGX
 uscWMpFA+Rmzn60YW8ov2Biy9LUjBjL4pCAZK2C5YXEahpCItrOvj/v6z
 +vuwj94RfEDvAxtSGLBh/2Gg0TSJ8vcAtqh2F25TH41obEnwvAKES+Uho
 Av4/VlQM1qLq+HM0ircdvbnIzPf9jjTomW6udlP8bIuhNc2S6s9ZRvHk7
 RMF0kdTHjTS+EAnjbXGkmnNhinxMcF41hBLtRTiPTz3RvzPSpotB6rQGK
 W7VqCykeuT1Ved3QDcO8cl60zLu+vJq6owBtarwXsamTCvOrtks1bsWKz
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=fE2Z8k7i
Subject: [Buildroot] [PATCH 5/5] configs/rock5b: enable DHCP for eth0
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

Enable DHCP for eth0.
This is perfectly fine even for users that are not using the Ethernet
on the rock5b, as in that case, udhcpc will simply fork to background
without delaying the boot.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 configs/rock5b_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index bcc2b68f6c..b720c8989a 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -46,6 +46,7 @@ BR2_PACKAGE_HOST_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rock5b/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock5b/genimage.cfg"
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
