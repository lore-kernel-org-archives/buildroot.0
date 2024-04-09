Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28199C67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 21:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E43008174C;
	Tue,  9 Apr 2024 21:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2dDEkIEF8rq; Tue,  9 Apr 2024 21:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF1EB81754
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF1EB81754;
	Tue,  9 Apr 2024 21:35:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9C461BF299
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D697781754
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9olaKo5WvRz for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 21:35:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C3D718174C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3D718174C
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3D718174C
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 21:35:18 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 439LZGLT071054;
 Tue, 9 Apr 2024 16:35:16 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 439LZGCF103726
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Apr 2024 16:35:16 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Apr 2024 16:35:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Apr 2024 16:35:16 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 439LZGPw046388;
 Tue, 9 Apr 2024 16:35:16 -0500
Date: Tue, 9 Apr 2024 16:35:16 -0500
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240409213516.tzyak5oomhgtmqz2@dasso>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-17-romain.naour@smile.fr>
 <854d8028-aee4-40d4-8303-a49c3cd50481@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <854d8028-aee4-40d4-8303-a49c3cd50481@mind.be>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1712698516;
 bh=9Knr6Joj4VDB1IMd0Vb3PJHNTGAE3Yrtx1b+Hehgqgo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=tq8FJD2apNdIVCzI9gdM+4cJGnpC2UQXdQeSy4YSY8f4nvvI1983NoxMKKI/t124I
 4IWVbnaykX69t9yJsyM9xfxH4DIjSZZ8GOBDbq/fZm+VyiGErTVJunU+hiafRTE31a
 RYP4BrmnKW2hUFm5Agw4eB7lB2VaSZBUIc71Eqxc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=tq8FJD2a
Subject: Re: [Buildroot] [PATCH v12 16/16] package/ti-k3: switch ti_am6{2,
 4}x_sk_defconfig to HS-FS by default
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout, All,

On Mon, Apr 08, 2024 at 03:46:54PM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 07/04/2024 12:35, Romain Naour wrote:
> >  From Andreas Dannenberg (TI K3 architect) [1]:
> > 
> >    "HS-FS should be the default for all TI AM6x devices. This is our
> >    "production silicon" and what's used for (almost) all projects,
> >    especially new projects. This being said having support for GP device
> >    variants still is desirable for existing boards/projects, such as the
> >    current BeaglePlay boards (amongst earlier version of TI starter kit
> >    EVMs for AM6x)."
> 
>  Andreas, BeaglePlay would anyway be a separate defconfig (it has another
> device tree), no? I think it's more relevant to have a BeaglePlay defconfig
> than to have a ti_am62x_sk GP defconfig.

Yes BeaglePlay should have its own defconfig, and I think is actually a
really REALLY great target in the context and "spirit" of Buildroot. And
it _should_ really be the only board out there that uses AM62x GP.

Now that we have AM6x base support merged (thanks everybody!!) I can't
wait to see this support growing. I do have working AM6x graphics
patches that I'll spend some time cleaning up and posting soon.

--
Andreas Dannenberg
Texas Instruments Inc



> > 
> > See further details on e2e Forum [2]:
> > 
> >    "Unfortunately with this transition any existing GP device based AM62x
> >    (and AM64x) boards will no longer boot with MMC/SD card images generated"
> > 
> > For such existing GP device based AM62x (and AM64x) boards, users have
> > to provide the tiboot3.bin name using BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN.
> 
>  Please add this information to board/ti/am6{2,4}x-sk/readme.txt
> 
> 
> > [1] https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1210443/faq-am625-generating-sitara-am62x-am62ax-am64x-gp-device-bootable-mmc-sd-card-images-using-sdk-v8-6-and-yocto
> > [2] http://lists.busybox.net/pipermail/buildroot/2024-February/685821.html
> 
>  You swapped those two references (the first quote above comes from [2]).
> 
> 
>  Regards,
>  Arnout
> 
> > 
> > Signed-off-by: Romain Naour <romain.naour@smile.fr>
> > ---
> >   configs/ti_am62x_sk_defconfig | 1 -
> >   configs/ti_am64x_sk_defconfig | 1 -
> >   2 files changed, 2 deletions(-)
> > 
> > diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> > index fa2c008d4c..5c7b97b3b0 100644
> > --- a/configs/ti_am62x_sk_defconfig
> > +++ b/configs/ti_am62x_sk_defconfig
> > @@ -29,7 +29,6 @@ BR2_TARGET_TI_K3_R5_LOADER=y
> >   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
> >   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
> >   BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
> > -BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am62x-gp-evm.bin"
> >   BR2_TARGET_UBOOT=y
> >   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> >   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> > diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
> > index f7c6d16b35..28e97f94e2 100644
> > --- a/configs/ti_am64x_sk_defconfig
> > +++ b/configs/ti_am64x_sk_defconfig
> > @@ -29,7 +29,6 @@ BR2_TARGET_TI_K3_R5_LOADER=y
> >   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
> >   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
> >   BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
> > -BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am64x-gp-evm.bin"
> >   BR2_TARGET_UBOOT=y
> >   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> >   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
