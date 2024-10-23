Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7AFCF5395
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 14:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4291B812DA;
	Wed, 23 Oct 2024 14:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsv6VLAnP1x8; Wed, 23 Oct 2024 14:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 529A4812D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 529A4812D3;
	Wed, 23 Oct 2024 14:33:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BEE4559B4
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 14:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F5DC405F9
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 14:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-74inxhvcuD for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 14:33:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C9D04054D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C9D04054D
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C9D04054D
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 14:33:05 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49NEX1Jn054236;
 Wed, 23 Oct 2024 09:33:01 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49NEX1Re016841
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Oct 2024 09:33:01 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 09:33:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 09:33:01 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NEX1f1028479;
 Wed, 23 Oct 2024 09:33:01 -0500
Date: Wed, 23 Oct 2024 09:33:01 -0500
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Bryan Brattlof via buildroot <buildroot@buildroot.org>, Xuanhao Shi
 <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Message-ID: <20241023143301.3drgsivyp75xetm7@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20241010-uboot-bump-v1-0-287ffa07e49e@ti.com>
 <20241010-uboot-bump-v1-2-287ffa07e49e@ti.com>
 <20241022225528.1e4f17e7@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241022225528.1e4f17e7@windsurf>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1729693981;
 bh=BKG0mf438NiH1zrP/64wybNzAH2OOIX5OZrmC0Kehhc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Wgxa24ZwM8LHRyQiJZD4us1q6Lo9v+RGOrZRbBhtqPNj4POG8r1SrsGi7yHEPB5RY
 jOM+15fsVUNZ9BVBQmzr/tRV/I/LhosrrUv3sS64qzUcrlTqUhjaHe3LtGXWyH7iGw
 E25STSIX5x9hbNBNnsh9XjL4r43v2Mg1BbvR4VHs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Wgxa24Zw
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

Hi Thomas!

On October 22, 2024 thus sayeth Thomas Petazzoni:
> Hello Bryan,
> 
> On Thu, 10 Oct 2024 18:39:23 -0500
> Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:
> 
> > Newer versions of U-Boot may require the GnuTLS library to be installed
> > on the host machine before building. Add in an option to select GnuTLS
> > as a dependency to the ti-k3-r5-loader package
> 
> Do you really expect to enable CONFIG_TOOLS_MKEFICAPSULE in the
> Cortex-R5 U-Boot stage? I'm just trying to understand if this commit is
> "let's do exactly like U-Boot does" or "there is really a use-case for
> this".
>

Yeah I probably should have given more detail in the commit message :)

I don't expect many boards to need this option in buildroot especially 
if they target build systems which builds U-Boot themselves.

It's only really our reference boards and boards who are targeting the 
SystemReady IR spec that need to encapsulate all the boot binaries to 
take advantage of updating the binaries via the UEFI firmware management 
protocol. 

I know the Linaro people require this for testing boards in their lab. 
My hope is the industry coalesces towards some type of standard to boot 
a distribution and update firmware binaries but time will tell :)

~Bryan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
