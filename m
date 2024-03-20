Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6BEC54E67
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 09:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19DF040743;
	Wed, 20 Mar 2024 09:20:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qDc2IpFt-rUK; Wed, 20 Mar 2024 09:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA8E140778
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA8E140778;
	Wed, 20 Mar 2024 09:20:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D5991BF59F
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 09:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8617940778
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 09:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8t5ugu3B8fCI for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 09:20:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72BE740743
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72BE740743
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72BE740743
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 09:20:10 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42K9K6WM087874;
 Wed, 20 Mar 2024 04:20:06 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42K9K6ZP084038
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 Mar 2024 04:20:06 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Mar 2024 04:20:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Mar 2024 04:20:06 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42K9K6PI084017;
 Wed, 20 Mar 2024 04:20:06 -0500
Date: Wed, 20 Mar 2024 04:20:06 -0500
To: Bryan Brattlof <bb@ti.com>
Message-ID: <20240320092006.ofnkyiodz5nf3eiq@dasso>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-16-dario.binacchi@amarulasolutions.com>
 <20240319151124.4e2rgv5kbxpsb6du@bryanbrattlof.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240319151124.4e2rgv5kbxpsb6du@bryanbrattlof.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1710926406;
 bh=D20rLvBLzZFZtvY+pZRDjToi5pFd7uB2QDfJ37cLaVE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=SAC0ONnlCfVjnabsFaJ+UgR0tF6iqJjfLrP/6XKSSNZXWVBNvxMhGLQbLkskB8Ild
 iPebxTAHyft55LCXzMc65QY2yJH2cu7o56EvRusJqyXCNGzMnPi241bFbxom5bUbVt
 kmQT6ai9/JlqCaJvlHqCRR72BCl9k+1nha9rR21I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=SAC0ONnl
Subject: Re: [Buildroot] [PATCH v9 15/22] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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
Cc: michael@amarulasolutions.com,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bryan,

On Tue, Mar 19, 2024 at 10:11:24AM -0500, Bryan Brattlof wrote:
> On March  4, 2024 thus sayeth Dario Binacchi:
> > Recent versions of U-Boot are capable of building tiboot3.bin using
> > Binman. In this case, let's copy it to the binaries directory.
> > 
> > The use of `find' command is justified by the need to use a regex
> > expression to select the correct file. This is not possible with a
> > simple `cp' command.
> > 
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > 
> > ---
> > 
> > Changes in v8:
> > - Use the `find' command in pipe with the `cp' command.
> > 
> > Changes in v6:
> > - Replace `find' command with `cp' one.
> > 
> > Changes in v5:
> > - Replace tiboot3-*-$(TI_K3_R5_LOADER_SECTYPE)-*.bin with
> >   tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-*.bin
> > 
> > Added in v4
> > 
> >  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> > index fdb058f3b72a..9a05d005067a 100644
> > --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> > +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> > @@ -70,8 +70,12 @@ define TI_K3_R5_LOADER_BUILD_CMDS
> >  	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
> >  endef
> >  
> > +TI_K3_R5_LOADER_SECTYPE = $(call qstrip,$(BR2_PACKAGE_TI_K3_SECTYPE))
> > +TI_K3_R5_LOADER_SOC = $(call qstrip,$(BR2_PACKAGE_TI_K3_SOC))
> > +
> >  define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
> >  	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
> > +	cd $(@D); find ./ -type f -regex "\.\/tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-[^-]*..bin" -exec cp {} $(BINARIES_DIR)/tiboot3.bin \;
> >  endef
> 
> Some devices like the j721e and am65x family will need the sysfw-*.itb 
> copied over to boot. Thankfully binman will generate these automatically 
> depending on the defconfig we gave to U-Boot.

This was discussed before, actually I signed myself up to add AM65x
support once we have base support in with this series fully merged. At
that time I'd take care of the copy step. Dario doesn't have a way to
test on hardware, and at some point we need to limit the scope if this
series here.

--
Andreas Dannenberg
Texas Instruments Inc






> 
> ~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
