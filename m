Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6929FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:55:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B689660F6F
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B689660F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9388E4046C;
	Mon, 25 Oct 2021 18:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCOsB-X6X0PZ; Mon, 25 Oct 2021 18:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21A7B40467;
	Mon, 25 Oct 2021 18:55:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70E751BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60D3D80D4C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pddqY_AKq-A6 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:55:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A10F380D45
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:55:52 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g8so2819612edb.2
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SKnKWvzqFh+024FwpPOvgMsbq07HScIWxtsqSITTwlc=;
 b=NDpPDKWgD6ED4DjCYC/4ohNLwbdXCPBXf/WIKzEh5hVAcQOgd/grUrkmGXQjPJJTbJ
 FUcpinFFt845ZSGaWQpCwFdhT363P/Swo17BSmVgT4EDStwIIt9JwznZzyeLNdfze0fK
 1HxGk/2B6V7yHhS6QdmKI/KfmD1J1gLrOwtbWm+EN3Jj1kUhDpijsWzkuc/yIBAtBehP
 Q53yvh0Le6ffBKdBx1MSKJN41Y6nA6hAhBLfzcGfQ+n3Z7ayj4DOVisKtSB6uDudhWUl
 h27NXHcRMKEjAMDPurkWTTrpW1dRJw9Q4ZK/rcUGxOP0obngV0oPys5TnbjFNTm8d3ur
 saWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SKnKWvzqFh+024FwpPOvgMsbq07HScIWxtsqSITTwlc=;
 b=L5W9Eg0TbP2fn4rB2BKKFvIVdTm461W5PprC4sEeO9FystdeG9iLOwXTui+YE68sH7
 uQ135PteAipLsp2VEmdP71qc0EP/oMNjVb/gMngQtzWiW3GSR9UHQiWilMiF7smgAnyQ
 vEQUDof1dLbFFnpVvQ7xHzTo4E8JSe5d98zTXhrQij1W+FizfJ9y8L35j90pvsjdyEfD
 dh5h/DA8LugZtjXeWoRunEsEv66Bmf6qDAFhOTBkJjnZJabfaIb1au81Ycu4Bw4dl7PO
 /gcjrGbPKuw1N375zb3ex8v3FL6y3zN3fe4SrOQ37gOw25ggcxdH4vEfAR7kSs3YqQh1
 jtkA==
X-Gm-Message-State: AOAM530t40eglZm8RzsE5JjJtPgSbkiobktDtd6ikaf5n0tm9JiCx4ti
 si5sXtI8a6jBMeFZrSzPhx4TVg==
X-Google-Smtp-Source: ABdhPJxT6Y5JtfuSFyDuBkQxZkp7+Ky/T85Ec/cchbgXbPeWkZyw6TPOj1nKtMJhlCpVObnvzXphMw==
X-Received: by 2002:a05:6402:4412:: with SMTP id
 y18mr5173547eda.275.1635188148676; 
 Mon, 25 Oct 2021 11:55:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j1sm9569156edk.53.2021.10.25.11.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 11:55:48 -0700 (PDT)
Message-ID: <8fb2490b-819d-cdf8-9d7e-b96ffdcabb13@mind.be>
Date: Mon, 25 Oct 2021 20:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20211014200652.25988-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211014200652.25988-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/qemu: disable doc generation for
 host build
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/10/2021 22:06, Peter Seiderer wrote:
> - disable doc generation (via sphinx) for host build
> 
> Reduces host-qemu build time from (on a system with sphinx installed):
> 
> 	real    2m5,522s
> 	user    9m41,292s
> 	sys     1m9,732s
> 
> to:
> 	real	1m9,183s
> 	user	8m40,131s
> 	sys	1m9,533s
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qemu/qemu.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 520618cd55..69949cfd7b 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -354,6 +354,7 @@ define HOST_QEMU_CONFIGURE_CMDS
>   		--disable-bzip2 \
>   		--disable-containers \
>   		--disable-curl \
> +		--disable-docs \
>   		--disable-libssh \
>   		--disable-linux-io-uring \
>   		--disable-sdl \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
