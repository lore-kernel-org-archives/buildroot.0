Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DEDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 10:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00E8F84889;
	Mon, 25 Jul 2022 10:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00E8F84889
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rf0J9coHaZvF; Mon, 25 Jul 2022 10:47:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 299CD846A4;
	Mon, 25 Jul 2022 10:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 299CD846A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9B31BF371
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25E544182C
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25E544182C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wXKgEZ6fTFWs for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 10:47:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91B3D417D3
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91B3D417D3
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 10:47:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u5so15380217wrm.4
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 03:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UkReS5BJ9TY5twRl2IGArUCLbVQMCzGpNzHE8l+wZpM=;
 b=frM3+rQcg/L+dQUFhhtCKlT/CY24cQR76D/foF45Ag3qyp/UUYHiqydwlv84HfJb/Y
 5Sikh8TcwxQ7CadIO5+15R9SLCNo4gQF91HXQikSDtfSP3Jk2C5qXiIedwS+S4++aQUJ
 qotKx3L313T+NSC+2MnffQ6BFjEKIraATJ+EfM5XvWWm3CtzUOsLF79Q/gyzjzgv8If+
 eFUyha88/yQb3A6bMPFFNv3ySow8NekkXZAMfbX1XSu+LRk6pmFwHLKoUWi526G4Cke9
 y4phV0g8/CVyMtG3PYFVSC3Bn8eG2re4iZfeCMBnqaPru8fDOJD6yNKiTkev+kJPZn1k
 ZZsA==
X-Gm-Message-State: AJIora+dhMlTcC/9q52L+lYLjNjbiTf8SvbAyEd/l1Ckh2vIH/WD8YSl
 NSlVkrcFG+TYbj4j1MZKd2r64g==
X-Google-Smtp-Source: AGRyM1uZGLa9wdgYeiTrDugWt87UutbkjDuOtlyj0CS0CCaWH8Gt++8UXh207hh7Exmg5Hr/6ri9BA==
X-Received: by 2002:a5d:604a:0:b0:21e:6b84:a4d8 with SMTP id
 j10-20020a5d604a000000b0021e6b84a4d8mr7109674wrt.187.1658746044634; 
 Mon, 25 Jul 2022 03:47:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003a3442f1229sm10292682wmq.29.2022.07.25.03.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 03:47:24 -0700 (PDT)
Message-ID: <c637bd33-711d-f57c-9ba5-e995f6b0acd2@mind.be>
Date: Mon, 25 Jul 2022 12:47:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20220724235023.677747-1-christian@paral.in>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724235023.677747-1-christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UkReS5BJ9TY5twRl2IGArUCLbVQMCzGpNzHE8l+wZpM=;
 b=CXdPDa4VZdt8SvyqQ81WznuOXXfpTf6rHxGEfmDGhuYvD50geEZ69WKrx+L/f31tzi
 UQy7EVIn5pdDP1GOfVXgADqh5w8dZk/5ApqYDTtFFPPm3/VBT8SIBQ7s3L1oveJuFJg2
 HJBzawQdVkuZiijjpmTAwaFpRjwQE+6V1yffchmcX++t9p7/GSVcKoN2nn9iqj9yIxIP
 0GFqzDwH5m/VstIvJM2y9SN4ZRUThtRQG0jtNYwYTdzzfeQ6Y2lVox5L+B7t7V7U84S6
 laGP1J+et0vu8fzEr3facB3007x2bP9ge70c9c8ceIhkfE4GSj1gM3ldRBHv+fsV6Lra
 NjGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CXdPDa4V
Subject: Re: [Buildroot] [PATCH 1/1] package/brfmcmac_sdio-firmware-rpi:
 support riscv architecture
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/07/2022 01:50, Christian Stewart via buildroot wrote:
> These firmware files are also applicable to some Riscv hosts.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>   package/brcmfmac_sdio-firmware-rpi/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/brcmfmac_sdio-firmware-rpi/Config.in b/package/brcmfmac_sdio-firmware-rpi/Config.in
> index 73f400a2b7..a408c19601 100644
> --- a/package/brcmfmac_sdio-firmware-rpi/Config.in
> +++ b/package/brcmfmac_sdio-firmware-rpi/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI
>   	bool "brcmfmac-sdio-firmware-rpi"
> -	depends on BR2_arm || BR2_aarch64
> +	depends on BR2_arm || BR2_aarch64 || BR2_riscv

  The intention of the condition was to only show this option on RaspberryPi. 
Since that idea is anyway a bit half-baked, I removed the dependency entirely. 
There's nothing CPU arch specific in this.

  Applied to master, thanks.

  Regards,
  Arnout

>   	help
>   	  Raspberry Broadcom Bluetooth and Wifi firmware.
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
