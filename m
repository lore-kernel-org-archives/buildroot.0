Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42795D1038E
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 22:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48F83608D9;
	Thu, 24 Oct 2024 22:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6t_WScn3g0X2; Thu, 24 Oct 2024 22:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F481607E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F481607E4;
	Thu, 24 Oct 2024 22:38:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 209CA2318
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 22:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DD4E607E4
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 22:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ifeM9a7VDUS for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 22:38:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA020607DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA020607DD
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA020607DD
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 22:38:47 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49OMciRa030752;
 Thu, 24 Oct 2024 17:38:44 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49OMci9Y017673
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Oct 2024 17:38:44 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 17:38:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 17:38:43 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49OMchsZ015970;
 Thu, 24 Oct 2024 17:38:43 -0500
Date: Thu, 24 Oct 2024 17:38:43 -0500
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Bryan Brattlof via buildroot <buildroot@buildroot.org>, Xuanhao Shi
 <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Message-ID: <20241024223843.d2hvpqx6zkazukfi@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20241010-uboot-bump-v1-0-287ffa07e49e@ti.com>
 <20241010-uboot-bump-v1-2-287ffa07e49e@ti.com>
 <20241022225528.1e4f17e7@windsurf>
 <20241023143301.3drgsivyp75xetm7@bryanbrattlof.com>
 <20241023164130.5782d496@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241023164130.5782d496@windsurf>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1729809524;
 bh=dRU+spA1udMl+7x7lTEULNKIECeUSi2Mi+FnJjSpG6Q=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=FpgZCEEqvv4jvU4aw5Vlc8lhtbv48hrQ5adMpWK1ohnZbwePWRYPSPNZOrrEp5dqG
 1fAJWbu50obCpgKsrH2kA1ACg7RBOwOftvUrfONmJ0LZeQNjwxPT/xx1a3Uiya0WdE
 C16iJEzL7uZkn4v0udnF6+PNhTf8nxdYxPrHl5dg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=FpgZCEEq
Subject: Re: [Buildroot] [PATCH 2/3] boot/ti-k3-r5-loader: add option to
 include GnuTLS
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

On October 23, 2024 thus sayeth Thomas Petazzoni:
> Hello Bryan,
> 
> On Wed, 23 Oct 2024 09:33:01 -0500
> Bryan Brattlof <bb@ti.com> wrote:
> 
> > Yeah I probably should have given more detail in the commit message :)
> > 
> > I don't expect many boards to need this option in buildroot especially 
> > if they target build systems which builds U-Boot themselves.
> > 
> > It's only really our reference boards and boards who are targeting the 
> > SystemReady IR spec that need to encapsulate all the boot binaries to 
> > take advantage of updating the binaries via the UEFI firmware management 
> > protocol. 
> 
> But even in this case, you need mkeficapsule support in the Cortex-R5
> firmware? That the main U-Boot needs EFI support, I can understand, but
> the Cortex-R5 firmware?
> 

Ah I miss understood. I went a double checked as I wasn't too sure 
myself but yeah from my understanding we'll need the mkeficapsule tool 
to be built for the 'binman' packaging phase to generate the final 
capsule for all the boot images including the tiboot3.bin images.

  https://source.denx.de/u-boot/u-boot/-/blob/v2024.10/arch/arm/dts/k3-binman-capsule-r5.dtsi
  https://source.denx.de/u-boot/u-boot/-/blob/v2024.10/arch/arm/dts/k3-binman-capsule.dtsi

  https://source.denx.de/u-boot/u-boot/-/blob/v2024.10/tools/binman/etype/efi_capsule.py

~Bryan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
