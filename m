Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34562CD128A
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 21:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0513C81426;
	Tue,  9 Apr 2024 21:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGGEQFZm0vpS; Tue,  9 Apr 2024 21:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09A278142F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09A278142F;
	Tue,  9 Apr 2024 21:30:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D046F1BF299
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD0CE41692
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWvJHghzvPT6 for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 21:30:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A020416A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A020416A6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A020416A6
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 21:30:17 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 439LUEnT088112;
 Tue, 9 Apr 2024 16:30:14 -0500
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 439LUEsr105840
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Apr 2024 16:30:14 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Apr 2024 16:30:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Apr 2024 16:30:13 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 439LUDON047738;
 Tue, 9 Apr 2024 16:30:13 -0500
Date: Tue, 9 Apr 2024 16:30:13 -0500
To: Bryan Brattlof <bb@ti.com>
Message-ID: <20240409213013.2bloukkzi6mzg3qb@dasso>
References: <20240402153328.1859642-1-bb@ti.com>
 <20240403213617.4d006e69@windsurf>
 <20240404162901.ulcdeuzan2nr7e77@bryanbrattlof.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240404162901.ulcdeuzan2nr7e77@bryanbrattlof.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1712698214;
 bh=jtoO1Ac0iZ1xg8IvrpygC0eVqfpK0g5I42OeIflRpEw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=R6x7fhJaQRf10vny7f7rY8oEf8V+Cp+kKDbS01ksBdKf4chlT/GRlwwyy08H6QMhF
 OdKWziPSU3N34v0sXyJgxFS27LFSvTlnC2iTY/yHVq4NK4I2i/lWL0vqjOkEIXuZG2
 h8wfwhejGxmiPYmJttrNzNAAmfecBz9OIWxVzhzI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=R6x7fhJa
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-boot-firmware: bump to latest
 version
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Bryan Brattlof via buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bryan,

On Thu, Apr 04, 2024 at 11:29:01AM -0500, Bryan Brattlof via buildroot wrote:
> Hi Thomas,
> 
> On April  3, 2024 thus sayeth Thomas Petazzoni:
> > Hello Bryan,
> > 
> > On Tue, 2 Apr 2024 10:33:28 -0500
> > Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:
> > 
> > > The 09.02.00.009 release of ti-linux-firmware has the latest updates to
> > > TI's TIFS, DM and DMSC firmware needed for the K3 generation of
> > > processors. Update to pull in these latest updates.
> > > 
> > > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > 
> > Thanks for this update! Maybe this question has been asked before, but
> > how much version dependency there is between these firmware files, and
> > the U-Boot/TF-A/Linux code? Do they need to be exactly in sync to work
> > altogether, or do newer firmware versions provide proper backward
> > compatibility and therefore continue to work even if the rest of the
> > software stack (U-Boot, TF-A, Linux) is older?
> > 
> 
> We try hard to ensure backward compatibility goes back to when the 
> device was first sent upstream.

How about compatibility with different iterations of the "boardconfig"?
As you know it's a binary blob that gets consumed/used by SYSFW/TIFS
during the boot. Is this also considered "stable ABI"?


--
Andreas Dannenberg
Texas Instruments Inc



> Though some of these features will bring 
> in some differences with the traditional way things are handled by the 
> firmware. One example I can think of is DM will now warn (NAK) invalid 
> clock requests which only really pollutes the logs:
> 
>   [    0.956700] ti-sci-clk 44043000.system-controller:clock-controller: recalc-rate failed for dev=13, clk=7, ret=-19
>   [    0.968958] ti-sci-clk 44043000.system-controller:clock-controller: recalc-rate failed for dev=36, clk=9, ret=-19
>   [    0.980134] ti-sci-clk 44043000.system-controller:clock-controller: recalc-rate failed for dev=36, clk=15, ret=-19
> 
> Other features will update how PLLs are configured but they are 
> completely transparent and solely in firmware control.
> 
> If you see any issue or regressions in the wild let me know and I'll try 
> to get them addressed.
> 
> ~Bryan
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
