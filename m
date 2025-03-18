Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75FAC282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 21:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F19760BF8;
	Tue, 18 Mar 2025 21:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rE_wlD4_zCn9; Tue, 18 Mar 2025 21:52:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F64660669
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F64660669;
	Tue, 18 Mar 2025 21:52:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8E5B950
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 21:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BA026068F
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 21:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INNU4gH1I1BS for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 21:52:17 +0000 (UTC)
X-Greylist: delayed 4294 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 18 Mar 2025 21:52:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B830060666
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B830060666
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.235;
 helo=lelvem-ot02.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B830060666
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 21:52:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52IKeaC6131531
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Mar 2025 15:40:36 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52IKeaRs003670
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Mar 2025 15:40:36 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Mar 2025 15:40:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Mar 2025 15:40:36 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52IKeasi112482;
 Tue, 18 Mar 2025 15:40:36 -0500
Date: Tue, 18 Mar 2025 15:40:35 -0500
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: <buildroot@buildroot.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>, Alistair
 Francis <alistair@alistair23.me>,
 Anand Gadiyar <gadiyar@ti.com>, Dick Olsson <hi@senzilla.io>,
 Etienne Carriere <etienne.carriere@foss.st.com>, Lee Jones
 <lee.jones@linaro.org>, Sergey Matyukevich <geomatsi@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, Xuanhao Shi <X15000177@gmail.com>
Message-ID: <20250318204035.vptcsqz6vrzxblro@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250317-bootloaders-menuconfig-v1-0-8f893d3bcf5f@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317-bootloaders-menuconfig-v1-0-8f893d3bcf5f@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1742330436;
 bh=L8bm1OIFuvGmaxIVvua5jwhY+csVa9GaO2njDhzUmOA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=t8xWWAgSQsyDpI5pPlivi37ae90xy3nKhSyBaLlAxUDbvAErhW8zaxe2vF8MUXqFi
 2n7igOOfWi2hkiKJqslmEEp4fvhcYaTG86kL3Mc5L1fHecqbKJhd8n0+Yd7Usgzyqu
 dc63smgIrlFyoODL+NZNpsCjCOPoHNmoob61S2k8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=t8xWWAgS
Subject: Re: [Buildroot] [PATCH 0/2] boot: improve menuconfig visualization
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On March 17, 2025 thus sayeth Luca Ceresoli via buildroot:
> This small series makes the visualization of the "Bootloaders" menu in
> menuconfig more visually intuitive.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Luca Ceresoli (2):
>       boot/xilinx-embeddedsw: fix menuconfig visualization
>       boot: move package options to a submenu
> 

I like it! Thanks Luca

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
