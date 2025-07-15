Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDF8C83F17
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 16:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E75CA610E8;
	Tue, 15 Jul 2025 16:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1uqIHZzTkRW; Tue, 15 Jul 2025 16:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 249E260E48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 249E260E48;
	Tue, 15 Jul 2025 16:00:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D80D11AA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 16:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43F79404E1
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 16:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4WDNWjX-85FX for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 16:00:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.235;
 helo=lelvem-ot02.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3F1440284
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3F1440284
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3F1440284
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 16:00:35 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56FDrjwB023815;
 Tue, 15 Jul 2025 08:53:45 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56FDrjJ7113293
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 15 Jul 2025 08:53:45 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 08:53:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 08:53:45 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56FDrjMX2685612;
 Tue, 15 Jul 2025 08:53:45 -0500
Date: Tue, 15 Jul 2025 08:53:45 -0500
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20250715135345.7zcg6xjl6hodxi2g@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250715081938.108853-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250715081938.108853-1-heiko.thiery@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1752587625;
 bh=AsIaWxEf71kPrdTmn6KWdCtxlOoWnyxKkMG4IdEOYVY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=poYWGN+7RGfF8Oxpk2n4U3meaiSv3QG+UG59Xg0K5Ar79DoboVquf41UWYl+HLcRr
 5LjMgq2MGQT//jhPbsp3rOE2baBLEzDfhpDHDDgz0F67LZesgS4Vm4Wr9MUnHn4F7p
 HfRCUUVBjakoJ3tbfRqZCxoSi78hf3szenrwzVqU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=poYWGN+7
Subject: Re: [Buildroot] [PATCH v2] package/linux-firmware: add option for
 Chips&Media Wave 521C
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, Michael Walle <michael@walle.cc>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On July 15, 2025 thus sayeth Heiko Thiery:
> Add an option to install the firmware files for Chips&Media Wave 521C
> video processor used in the TI K3 architecture.
> 
> This "cnm/wave521c_k3_codec_fw.bin" file has been present in linux-firmware
> since version 20221109.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> v2:
>     - fixed value for LINUX_FIRMWARE_ALL_LICENSE_FILES,
>       use LICENCE.cnm instead of LICENSE.cnm (Julien)
>     - add entry to the hash file for LICENCE.cnm (Julien)
> 
>  package/linux-firmware/Config.in           | 6 ++++++
>  package/linux-firmware/linux-firmware.hash | 1 +
>  package/linux-firmware/linux-firmware.mk   | 5 +++++
>  3 files changed, 12 insertions(+)
> 

Nice!

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
