Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7E2C48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 22:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A7C9605C6;
	Tue, 20 Feb 2024 22:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KyascG_QF3I3; Tue, 20 Feb 2024 22:34:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E166060A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E166060A;
	Tue, 20 Feb 2024 22:34:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 395001BF29D
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 22:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33E0880BF3
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 22:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4N6ffJ3umXss for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 22:34:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F48980BBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F48980BBB
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F48980BBB
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 22:34:27 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41KMYO3Y026981;
 Tue, 20 Feb 2024 16:34:24 -0600
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41KMYO6l003755
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 20 Feb 2024 16:34:24 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Feb 2024 16:34:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Feb 2024 16:34:23 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41KMYNU5080361;
 Tue, 20 Feb 2024 16:34:23 -0600
Date: Tue, 20 Feb 2024 16:34:23 -0600
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240220223423.bnrqouwcuuxhw43f@dasso>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-20-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240217160244.1320482-20-dario.binacchi@amarulasolutions.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1708468464;
 bh=WGbYZ9kA8R1KPhxoFzg7nL8Qdu3VnedV0PaQLNFlvP0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=P73pMCi5Lf04BDf2NFrxgZjP6cJHHbge8/Dg8EW7K0tZ8wpUqHMTs8WAumqV/KE/D
 aktV4dwKlNiLns4t0VNrwlkC6rAAUbWo3ldZI6KnN1xC9ykMPxvIevC9mfh1D1pFTi
 u/JGugc8cVWvwq50VpzU4nSRuy3YhZbw5UlPLe0U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=P73pMCi5
Subject: Re: [Buildroot] [PATCH v4 19/20] boot/ti-k3/ti-k3-r5-loader:
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
Cc: linux-amarula@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On Sat, Feb 17, 2024 at 05:02:43PM +0100, Dario Binacchi wrote:
> Recent versions of U-Boot are capable of building tiboot3.bin using
> Binman. In this case, let's copy it to the binaries directory.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Added in v4
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.mk
> index 2a10024aedaa..643298a1e70a 100644
> --- a/boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.mk
> +++ b/boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.mk
> @@ -75,8 +75,11 @@ define TI_K3_R5_LOADER_BUILD_CMDS
>  	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
>  endef
>  
> +TI_K3_R5_LOADER_SECTYPE = $(call qstrip,$(BR2_TARGET_TI_K3_SECTYPE))
> +
>  define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
>  	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
> +	find $(@D) -name "tiboot3-*-$(TI_K3_R5_LOADER_SECTYPE)-*.bin" -type f -exec cp {} $(BINARIES_DIR)/tiboot3.bin \;
>  endef

I like how this picks/renames the tiboot3.bin corresponding to the
device security type, this way allowing to generate a tailored and
readily bootable image depending on GP, HS-FS, HS device type.

However the find/copy approach may not always work as intended. Consider
the build output of R5 U-Boot SPL for AM64x for example:

$ ll tiboot3-*.bin
-rw-rw-r-- 1 a0797059 a0797059 304431 Feb 20 15:34 tiboot3-am64x-gp-evm.bin
-rw-rw-r-- 1 a0797059 a0797059 532270 Feb 20 15:34 tiboot3-am64x_sr2-hs-evm.bin
-rw-rw-r-- 1 a0797059 a0797059 532270 Feb 20 15:34 tiboot3-am64x_sr2-hs-fs-evm.bin

Note how there's a '_sr2' (Silicon Revision 2.0) in the filename of some
of the boot binaries. I did look at the different K3 devices supported
in U-Boot at the moment, and it looks like currently this will not be an
issue that will manifest itself as the device security type happens to
be unique enough to also pick the right silicon revision. But of course
this doesn't mean it'll always stay like this....

So it might be better to leverage BR2_TARGET_TI_K3_SOC to be more
specific in that find/copy operation and use this to replace the
asterisk in "tiboot3-*". So then somebody can use "am64x" or "am64x_sr2"
for example as BR2_TARGET_TI_K3_SOC, and you would guarantee the right
file gets used to populate the final tiboot3.bin.


--
Andreas Dannenberg
Texas Instruments Inc






>  
>  $(eval $(kconfig-package))
> -- 
> 2.43.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
