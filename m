Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F289D5E39F
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 05:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4326E848BF;
	Thu, 28 Nov 2024 05:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKVN4kOOeSx1; Thu, 28 Nov 2024 05:15:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7391848B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7391848B7;
	Thu, 28 Nov 2024 05:15:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BDD761DA8
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 05:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 903ED40452
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 05:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rmuj-pnnw6Iy for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 05:15:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6128B400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6128B400BD
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6128B400BD
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 05:15:48 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 509FF440F8B;
 Thu, 28 Nov 2024 07:11:56 +0200 (IST)
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20241128050116.879176-1-fido_max@inbox.ru> (Maxim Kochetkov via
 buildroot's message of "Thu, 28 Nov 2024 08:01:16 +0300")
References: <20241128050116.879176-1-fido_max@inbox.ru>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 28 Nov 2024 07:15:44 +0200
Message-ID: <87iks87xbz.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1732770716;
 bh=4BlCDBmUkEr2B/o4XEfOXRV27fWRpGAQA57O6MYSwis=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fuwlLnJfN2uYtHNo0zV9AEVhRzkGKm3/L1HXPs0emB3/dY9ZAR2PV9JnC288+aXGT
 OW9NrF1e1/jOjWpjVg1RbF56gOkLrNWGU3ct6qytqt9uzMvr8WWzNGVJTkbJh8eOMZ
 Vl5G07j7/Hb0RFZPglGOGbl6kpkjiMfUF1FwIkCVDhwXvGsyAbi4tZjOL1C3tvMz1H
 dmokvrMSZ6KnSw89LR/exS0jgqo+hLfcvHog6RdF0GCy6APcEtiANqz8gSgoKMag9s
 +uwgLfGe678tOZC8ZCMlOfAZTaHAPm0Ie3rLoQSP/8yYj/6w+Adj6e2td+YtBotMwe
 U0M+w0bkocTUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=fuwlLnJf
Subject: Re: [Buildroot] [PATCH 1/1] dmaengine: dw-axi-dmac: fix snps,
 axi-max-burst-len settings
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxim,

On Thu, Nov 28 2024, Maxim Kochetkov via buildroot wrote:
> axi_rw_burst_len allowed values range is 1..256. Then this value
> goes to ARLEN/AWLEN 8-bit fields of lli->ctl_hi. So writing 256
> leads to overflow and overwrites another fields in LLI. More over
> ARLEN/AWLEN are zero based (0 - 1, 256 - 255).
>
> Fixes: c454d16a7d5a ("dmaengine: dw-axi-dmac: Burst length settings")
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

This is the wrong list for this patch, I believe.

baruch

> ---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index b23536645ff7..9aa79e9b49ca 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1437,7 +1437,7 @@ static int parse_device_properties(struct axi_dma_chip *chip)
>  			return -EINVAL;
>  
>  		chip->dw->hdata->restrict_axi_burst_len = true;
> -		chip->dw->hdata->axi_rw_burst_len = tmp;
> +		chip->dw->hdata->axi_rw_burst_len = tmp - 1;
>  	}
>  
>  	return 0;
> @@ -1550,7 +1550,7 @@ static int dw_probe(struct platform_device *pdev)
>  	dma_cap_set(DMA_CYCLIC, dw->dma.cap_mask);
>  
>  	/* DMA capabilities */
> -	dw->dma.max_burst = hdata->axi_rw_burst_len;
> +	dw->dma.max_burst = hdata->axi_rw_burst_len + 1;
>  	dw->dma.src_addr_widths = AXI_DMA_BUSWIDTHS;
>  	dw->dma.dst_addr_widths = AXI_DMA_BUSWIDTHS;
>  	dw->dma.directions = BIT(DMA_MEM_TO_MEM);

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
