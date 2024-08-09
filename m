Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CF7C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 08:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C3C180EE7;
	Fri,  9 Aug 2024 08:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQoZKmpqzKxJ; Fri,  9 Aug 2024 08:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 409B080F0F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 409B080F0F;
	Fri,  9 Aug 2024 08:51:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9F7D1BF281
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 08:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6DE240354
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 08:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nitf6PA89O07 for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 08:51:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=944a06301=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A71BE4034F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A71BE4034F
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A71BE4034F
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 08:51:39 +0000 (UTC)
X-CSE-ConnectionGUID: ddAIkNGCTRqkU6wyWmJ3hQ==
X-CSE-MsgGUID: iYUwpxjgQYaLBAHH4i3ZpA==
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="30299790"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Aug 2024 01:51:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Aug 2024 01:51:32 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 9 Aug 2024 01:51:32 -0700
To: <buildroot@buildroot.org>
Date: Fri, 9 Aug 2024 09:53:32 +0100
Message-ID: <20240809085334.3530176-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1723193499; x=1754729499;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oS2HblMAl2x/TBe2Bnm56pdXFUhvPg4f2LaTKHtcA3s=;
 b=oC6++SYyQCNeUCJr+BNebReQ+myt87YVNZORZXp+h5Em9zvxfzZuU8C8
 SWxGb9exrG/oeekO7My3jMhC/u0CrPsPWwnidcWEFJZk/Kbf8CPgFrBR7
 J7q1Xu+Ml5kxFauduFUZH2WLiIMfG5OFEaWoLC1xXFyow6NR2K84EhstN
 A6UfA4PNYwQgbrIIvUW/u79PQW5sqNQOIJvjLUanJzvpA3Y9MHQq+ke/l
 iARiVU48UZVAef1TpGGHnf9AamEbU5TqGUqe0u+Lxi9qbUg4nd++xSbz/
 1g9OtqUdr/9ywRUDiS/S0cQjooQFZ6hfcjSgMPFcSJxj0IWYEZiX8PVKp
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=oC6++SYy
Subject: [Buildroot] [PATCH v3 0/2] fix mpfs custom tarballs
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Cc: Jamie Gibbons <jamie.gibbons@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

The following patchset updates the Linux kernel and U-Boot custom tarballs as
they were updated incorrectly in previous commits. Previously, they were
retrieving from a branch, and storing it into a tarball. This is not the
desired functionality. Now, the custom tarballs retrieve specific release tags
instead, as intended.
This has also means an additional update to the U-Boot and Linux hashes are
required to match changes as the content has been updated.

Thanks Thomas for your feedback on v1 and v2, greatly appreciated - always
learning.

Thanks,
Jamie

v1 -> v2:
- change custom tarballs from using branches to tags
- update Linux hashes as well as U-Boot hashes

v2 - v3:
- add "linux-" and "uboot-" to tarball names to avoid confusion
- update commit titles and messages as per feedback

Jamie Gibbons (2):
  configs/beaglev_fire: update custom tarballs
  configs/microchip_mpfs_icicle: update custom tarballs

 board/beagleboard/beaglev_fire/patches/linux/linux.hash | 2 +-
 board/beagleboard/beaglev_fire/patches/uboot/uboot.hash | 2 +-
 board/microchip/mpfs_icicle/patches/linux/linux.hash    | 2 +-
 board/microchip/mpfs_icicle/patches/uboot/uboot.hash    | 2 +-
 configs/beaglev_fire_defconfig                          | 4 ++--
 configs/microchip_mpfs_icicle_defconfig                 | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
