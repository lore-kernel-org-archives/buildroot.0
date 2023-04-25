Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9D4C77B61
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 08:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9669C4048B;
	Tue, 25 Apr 2023 08:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9669C4048B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eOUf6XzFpRZa; Tue, 25 Apr 2023 08:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABE2E4026A;
	Tue, 25 Apr 2023 08:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABE2E4026A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8ECEA1BF32C
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 08:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B198409A1
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 08:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B198409A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wYfCuQre8Xlr for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 08:15:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 976AB409A0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 976AB409A0
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 08:15:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.99,225,1677567600"; d="scan'208";a="210561660"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Apr 2023 01:15:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 25 Apr 2023 01:15:13 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 25 Apr 2023 01:15:11 -0700
To: <buildroot@buildroot.org>
Date: Tue, 25 Apr 2023 09:14:42 +0100
Message-ID: <20230425081444.1441521-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1682410520; x=1713946520;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AxadJ8zrXYBP/GFFQsSKY/lwm89umUfY3IKOBBjDtyI=;
 b=n2qHR4FnVsqKOSdtLvKGgx1ax4pg4ajKjGyusmsmkad4WWOXcaw2JKdv
 uW+DwcBd44934jSmTYsvwrkV98X73LKzE9OR73QRuiXsrI6WSGFNmhJyj
 sxpKuiw+G374DL2tbhv5Pi9ALjL2YNPkh/YDK9Am9rmKk6sySMTFGPq18
 gcTHH8aD31C5t5sqnk8FifPS6/RFmdL+2GDZygFYkrEZ0yorBpBGIpDOj
 xq1y0cslVYDcWsx1T2hck5TnLmPq/pj7LM8f3pT09DWeSq1y2LU3jqkKe
 0+pILi0K/17tqvemJPElpmgipw9xQ0b6s9Xi49LmUWMi8kI4LdmZ1mx50
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=n2qHR4Fn
Subject: [Buildroot] [PATCH 0/2] *** Add Microchip PolarFire SoC Icicle Kit
 ***
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
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, Jamie
 Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

The following patch series is to add support for Microchip's PolarFire SoC
development board, the icicle kit. We are adding all the necessary supporting
files, including a new defconfig and one required host package, the
hss-payload-generator. I look forward to recieving your feedback on the series.

Regards,
Jamie

Jamie Gibbons (2):
  package/microchip-hss-payload-generator: add host package
  configs/microchip_mpfs_icicle: add support for Microchip's Icicle Kit

 board/microchip/mpfs_icicle/README.txt        | 62 +++++++++++++++++++
 board/microchip/mpfs_icicle/config.yaml       | 28 +++++++++
 board/microchip/mpfs_icicle/genimage.cfg      | 36 +++++++++++
 board/microchip/mpfs_icicle/linux.fragment    |  1 +
 board/microchip/mpfs_icicle/mpfs_icicle.its   | 53 ++++++++++++++++
 board/microchip/mpfs_icicle/post-image.sh     | 13 ++++
 board/microchip/mpfs_icicle/uboot-env.txt     | 16 +++++
 .../mpfs_icicle/uboot-fragment-rootfs.config  |  2 +
 configs/microchip_mpfs_icicle_defconfig       | 33 ++++++++++
 package/Config.in.host                        |  1 +
 .../Config.in.host                            |  8 +++
 .../microchip-hss-payload-generator.mk        | 22 +++++++
 12 files changed, 275 insertions(+)
 create mode 100644 board/microchip/mpfs_icicle/README.txt
 create mode 100644 board/microchip/mpfs_icicle/config.yaml
 create mode 100644 board/microchip/mpfs_icicle/genimage.cfg
 create mode 100644 board/microchip/mpfs_icicle/linux.fragment
 create mode 100644 board/microchip/mpfs_icicle/mpfs_icicle.its
 create mode 100755 board/microchip/mpfs_icicle/post-image.sh
 create mode 100644 board/microchip/mpfs_icicle/uboot-env.txt
 create mode 100644 board/microchip/mpfs_icicle/uboot-fragment-rootfs.config
 create mode 100644 configs/microchip_mpfs_icicle_defconfig
 create mode 100644 package/microchip-hss-payload-generator/Config.in.host
 create mode 100644 package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
