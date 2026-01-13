Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC59D0C859
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 11:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C0FB42A97;
	Tue, 13 Jan 2026 11:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUuzx-4wHmP0; Tue, 13 Jan 2026 11:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CA1E42A6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768303789;
	bh=PDdb4f7IFboxwF2VN3XVxQd8ibHNihwjTHU4s2w1mMY=;
	h=To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VSpDOf0KYlBmMh9thYzzcPBUs6xgPLydJzY49W+0zL5SQs32A7R/4uHQvNGrg8N7u
	 iCMXAptn6euMlIo9hVRfmF3S8llTrZwTxfkxDrfRomQAAZmlEgATBx0enjR/JmM6ru
	 rpgXd6gZvSIXHGcX8o3qyWXQLUkh6OXOr/HrhYUHRcBmiYQeYx1zo1jeEl6G6PpWO+
	 iufvN25nzTC3MfDfQpML4KKkUlHuO+NeJ7Y9IlWp+SKwylah3ccEwBQ7JXzttYvJjh
	 0OtGQkfFSH7KiGZVsjrOLFmr+oKH3KbfTg7AqtFDLOmL6H5lIvhDcAUl/n0EJQZikc
	 WXCo3HpJB7w9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA1E42A6D;
	Tue, 13 Jan 2026 11:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4562C1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CEBC42A6D
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bn3J7_JOsBwh for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 11:29:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=4667d680c=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F20942A62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F20942A62
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F20942A62
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:47 +0000 (UTC)
X-CSE-ConnectionGUID: idq6P8OaQ3ek6LPt8VSdAw==
X-CSE-MsgGUID: YPl7J4eHQ1iBTh3E6KsyAw==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; d="scan'208";a="58762287"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jan 2026 04:22:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Jan 2026 04:22:10 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Jan 2026 04:22:08 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>, Jamie Gibbons <jamie.gibbons@microchip.com>
Date: Tue, 13 Jan 2026 11:26:21 +0000
Message-ID: <20260113112621.347651-6-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113112621.347651-1-jamie.gibbons@microchip.com>
References: <20260113112621.347651-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1768303787; x=1799839787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nrhdw3ceh+kbcBlN2LAuSjeDw+IufG7j5xJhQgUMo5Q=;
 b=jvN3e6tkoHPzgUx41ybGuT5PIQN8htdSEKgKUXglLu8b9LMzsAriVO41
 ok9REobhk1FFwKS93Aue8GjbmpmJSUo0jqv787s1rjGZiqwyQaUlGcATk
 NTY65yo1cULGX5RE3VauzqNvpkyyEFDzsbBFp04WuAwX8lxrdtHI96KRg
 d5/cpuB6UuZ9bVEJHZQ5F4Dvbt6dgtN9YxTMLjjV2alaMBo3WLvCuiDpt
 251saJ5gI6NxkfXD/gkOjXA+2ypyUui+hk71Cd871Y0H2UoPolbRhe3Ce
 LZZjpTTiao8Mql/e9UTpAcs/WW8f78PR4B/lxRFuMFBlklLCQ0etPsIeK
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=jvN3e6tk
Subject: [Buildroot] [PATCH 5/5] beaglev_fire: remove fdt set from boot
 script
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the latest U-Boot update, U-Boot now handles this step in the
board setup removing the need to set this from a custom boot script.
Remove redundant fdt set command from boot script.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/beagleboard/beaglev_fire/boot.cmd | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/beagleboard/beaglev_fire/boot.cmd b/board/beagleboard/beaglev_fire/boot.cmd
index 1402458d8b..80b44592c7 100644
--- a/board/beagleboard/beaglev_fire/boot.cmd
+++ b/board/beagleboard/beaglev_fire/boot.cmd
@@ -11,6 +11,5 @@ bootm loados ${scriptaddr};
 # Try to load a ramdisk if available inside fitImage
 bootm ramdisk;
 bootm prep;
-fdt set /soc/ethernet@20110000 mac-address ${beaglevfire_mac_addr0};
 run design_overlays;
 bootm go;
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
