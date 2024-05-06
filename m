Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C76C10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 14:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F98C6087A;
	Mon,  6 May 2024 14:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8I7DBE9sNL_r; Mon,  6 May 2024 14:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FC0660883
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FC0660883;
	Mon,  6 May 2024 14:45:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1B351BF59D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C07C6087A
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54RVcKLmirVz for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 14:45:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF60060883
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF60060883
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF60060883
 for <buildroot@buildroot.org>; Mon,  6 May 2024 14:45:08 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 446Ej7tk079911;
 Mon, 6 May 2024 09:45:07 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 446Ej7oq065083
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 6 May 2024 09:45:07 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 May 2024 09:45:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 May 2024 09:45:07 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 446Ej7jx011588;
 Mon, 6 May 2024 09:45:07 -0500
Date: Mon, 6 May 2024 09:45:07 -0500
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <20240506144507.xdggkmpqc6koghki@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
 <20240430-optee-update-v2-2-5bdc2f940db1@ti.com>
 <20240506085315.lb4frefetaffps6i@dasso>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240506085315.lb4frefetaffps6i@dasso>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1715006707;
 bh=PbhMPk08ACxZXViG9GlTi45rbB8IksaRDqU0h8RaVjA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=FmKer1kFm7cc6Qo8AYX7G2HI5frMyNX/bud412+lDXgJYXUVpes3A15iNwhbLn2/Q
 9uxCVFg971BpIwouXl54TntJRUMldBcosROFan3XyDbqClZi7bmwdEjCcdBRlLO2sA
 VjQZUaDKZzcfERCsYhUeX0E8xKMBUe4fxE4N2otc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=FmKer1kF
Subject: Re: [Buildroot] [PATCH RESEND v2 02/11] boot/uboot: bump to version
 v2024.04
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Anand Gadiyar <gadiyar@ti.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On May  6, 2024 thus sayeth Andreas Dannenberg via buildroot:
> Hi Bryan,
> 
> On Thu, May 02, 2024 at 11:26:52AM -0500, Bryan Brattlof via buildroot wrote:
> > Update to the latest tagged release of U-Boot
> > 
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> >  boot/uboot/Config.in  | 6 +++---
> >  boot/uboot/uboot.hash | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> > index 8d2228dc7dd45..00d3f3bfbbfdd 100644
> > --- a/boot/uboot/Config.in
> > +++ b/boot/uboot/Config.in
> > @@ -41,7 +41,7 @@ choice
> >  	  Select the specific U-Boot version you want to use
> >  
> >  config BR2_TARGET_UBOOT_LATEST_VERSION
> > -	bool "2024.01"
> > +	bool "2024.04"
> 
> Similar to your other patch ("boot/optee-os: bump to release v4.2.0")
> changing the global default will affect other platforms so there's some
> risk for breakage I suppose. Why not keeping those specific changes to
> the AM62/AM64 platforms?
> 

Ha yeah I went back and forth with this. OP-TEE could use an update but 
there isn't a mechanism to cleanly select a version like we have with 
U-Boot or Linux (or I just wasn't smart enough to figure it out)

Though you are correct, having a way to specify which version a board 
wants to use would be more helpful the upgrading everyone. I'll see what 
I can come up with for OP-TEE so we can select versions for each board.

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
