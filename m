Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEE9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:56:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EFD260FDC
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EFD260FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 377C782E4C;
	Sat, 11 Sep 2021 20:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gx_prH3NhAYS; Sat, 11 Sep 2021 20:56:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1C6682CFA;
	Sat, 11 Sep 2021 20:56:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09B771BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED195608D1
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QL_gTjuB6DnY for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:56:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BA0B608CF
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:56:04 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t6so6456422edi.9
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nbs+RfkGhArQnxZQxQC/tU0Jd0UJJZnE2OlMZPNoDlk=;
 b=ht922BE5TfU3gf5fFGFxIQ48U7m3qcW+3XSvhiT8cEkZfM0Hv06qudluF8I30LSVOW
 WcT/1sGccHeZ8bPpzWutBVbRHmVur4Ed25dwp7JiKrnt3DfGwtYeCOYFxv+2Sv4McFUb
 yMJ9biPfuWSht8qNNLFJ0wQULy4Vv2sGtLO/cw6r2jPuyDhURllvb2wIxaaQCPLqv9/b
 yC4W23a4R7jo4yDR0wUhR2cklAJ9b8NXQsd48V3cd9OTOnx/pmq59DFX8ZTADu+AVlWz
 YdfLTxocug2aVbmIs8DmdOtpCj5Hs3fnrnkAZSrIqaHMMIp8E3N87nwljfvl2UkLIR1O
 uEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Nbs+RfkGhArQnxZQxQC/tU0Jd0UJJZnE2OlMZPNoDlk=;
 b=u95jkNkno5iX7kNxYugVYJWxosmNGEcYfQagb5OgpoNVOIvRUTyYTXf+mvpb+lBL6G
 tOKfdA2itC9u24Pxyty4rTgjzV8J6KGmwJMvkvhkY8ApOaxuRdpZPjY+sFVivZoCoMQ3
 +RsSKg6d1NMkba3366uabUfc5D17jvCMHjTv+gWbqZEGQn1Pz86oz/E9iIIL4FvDZ3mj
 yQd4rXPw76HBAHLhgWSbqKAvkof+2MSXojV4sny7SRzTy3M8RRLWlqd4dLTNmfpgLiNt
 ShuoT/Jl9n5W5UaPDwfHPQEeEHwlgrVtqHDCfp0YfRGrdFb06p1v5ZwhV1fysDsIlxHw
 Sx4w==
X-Gm-Message-State: AOAM531uC16Vp+eF5Tm7Beeold3c9rXER3uTH8dqVJREQvzUhxugHlWU
 hLBhUCq4YL+2JT3y5wXCCUuAMQ==
X-Google-Smtp-Source: ABdhPJxpSJJlY0Ejv2r6lcfDXU7oJixJcrTYCFODp0gxhW588j/9L72e5fBTcdNfhxLLHAe/aLXfUA==
X-Received: by 2002:aa7:c6c2:: with SMTP id b2mr4910243eds.353.1631393762223; 
 Sat, 11 Sep 2021 13:56:02 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m15sm1192256ejx.73.2021.09.11.13.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 13:56:01 -0700 (PDT)
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20210910140925.28138-1-heiko.thiery@gmail.com>
 <20210910140925.28138-2-heiko.thiery@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <00122080-5ab3-02cb-79e9-dc52386a5c75@mind.be>
Date: Sat, 11 Sep 2021 22:56:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910140925.28138-2-heiko.thiery@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 1/3] package/freescale-imx/firmware-imx:
 copy all (lp)ddr files unconditionaly
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>, Xavier Roumegue <xroumegue@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Gary Bisson <gary.bisson@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 10/09/2021 16:09, Heiko Thiery wrote:
> In mainline u-boot more and more imx8 boards are switched to binman
> to create the imx specific image (flash.bin). To support this the
> (lp)ddr firmware training files are needed. For this to work all files
> should be made available to the U-Boot build.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> 
> v2:
>  - add reviewed-by (thanks Gary)
> 
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 1076cf85f1..29241342be 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -51,6 +51,11 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
>  		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_2d_fw.bin > \
>  		$(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
>  	ln -sf $(BINARIES_DIR)/lpddr4_pmu_train_fw.bin $(BINARIES_DIR)/ddr_fw.bin
> +
> +	# U-Boot supports creation of the combined flash.bin image. To make
> +	# sure that U-Boot can access all available files copy them to
> +	# the binary dir.
> +	cp $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4*.bin $(BINARIES_DIR)/
>  endef
>  endif
>  
> @@ -69,6 +74,11 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
>  		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_2d_201810_fw.bin > \
>  		$(BINARIES_DIR)/ddr4_201810_fw.bin
>  	ln -sf $(BINARIES_DIR)/ddr4_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
> +
> +	# U-Boot supports creation of the combined flash.bin image. To make
> +	# sure that U-Boot can access all available files copy them to
> +	# the binary dir.
> +	cp $(FIRMWARE_IMX_DDRFW_DIR)/ddr4*.bin $(BINARIES_DIR)/
>  endef
>  endif
>  
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
