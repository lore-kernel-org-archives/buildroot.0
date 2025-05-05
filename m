Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA40C3ABB9
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 20:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C71E081EF3;
	Mon,  5 May 2025 20:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHvNZm_Vg1EV; Mon,  5 May 2025 20:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D781181EB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D781181EB4;
	Mon,  5 May 2025 20:54:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2A5220F8
 for <buildroot@buildroot.org>; Mon,  5 May 2025 20:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4BEC403F8
 for <buildroot@buildroot.org>; Mon,  5 May 2025 20:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3k6oI7QO9A34 for <buildroot@buildroot.org>;
 Mon,  5 May 2025 20:54:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 919F0400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 919F0400F9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 919F0400F9
 for <buildroot@buildroot.org>; Mon,  5 May 2025 20:54:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3D82A13F86A;
 Mon,  5 May 2025 22:54:25 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:54978])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 May 2025 22:54:25 +0200
MIME-Version: 1.0
Date: Mon, 05 May 2025 22:54:25 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, fabio.caccamo@amd.com, romain.naour@smile.fr,
 michal.simek@amd.com, arnout@mind.be
In-Reply-To: <20250502073112.376985-1-neal.frager@amd.com>
References: <20250502073112.376985-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <6b69bcf8e569338ff6ac206fb1c86c58@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746478475;
 bh=fQ1u36/NRaT6kvJ8Dxz16166MjrJaKSzpe2Bhzu4o48=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WnCIfdErBSoby3o0wtpUywhRiSKK7s/FT4Kou3tzdhvNuvfHsPRX0fRdRL31AJrcz
 k+PyPuFt9tIAm23QVB41ZZr6g1oG/eMcCOizzoBcAc9ZS78p3m/NsPklG1oeARWIly
 b4n1MJbaKeVspdz3SB/6PVjRoJggBmjN+DO4sAx29XtVgig2YaGxPMozi3cKn2YCel
 D8JxTLYhlSbV8MCZpBpIZNemOY0810A5B2+sq3xntV/R1f2jpaCMdxOeZ+zo02IQzp
 6O2ooKqDUOdp7ui8AIlYka/tCcxuXKnq8HbmCjPFVfxH+Wl1avaLb5F8fNytj3+BZU
 hn9vIco++annw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WnCIfdEr
Subject: Re: [Buildroot] [PATCH v3 1/2] package/xilinx-fpgautil: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/05/2025 09:31, Neal Frager via buildroot wrote:
> Add a new package to Buildroot called xilinx-fpgautil which builds the 
> Xilinx
> fpgautil script which can be used for loading FPGA bitstreams on zynq, 
> zynqmp
> and versal products at run-time.  This is a handy application for 
> loading
> FPGA bitstreams and their corresponding device tree overlays.
> 
> An explanation of how this script can be used for each type of product 
> can be
> found on the wiki pages below.
> 
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841645/Solution+Zynq+PL+Programming+With+FPGA+Manager
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841847/Solution+ZynqMP+PL+Programming
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1188397412/Solution+Versal+PL+Programming
> 
> In addition, the source code for xilinx-fpgautil can be found here:
> https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c
> 
> The Xilinx fpgautil script can be used hand in hand with the Versal 
> Segmented
> Configuration with the following example command for programming the 
> pld.pdi
> file to the Versal FPGA:
> 
> fpgautil -b /lib/firmware/xilinx/<design-name>_pld.pdi -o 
> /lib/firmware/xilinx/<dtbo-name>.dtbo
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to master, thanks.

> [build-tested only]
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
