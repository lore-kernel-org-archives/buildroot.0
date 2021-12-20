Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23BCC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54218409B0;
	Mon, 20 Dec 2021 22:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yF-IVuYMpS6V; Mon, 20 Dec 2021 22:37:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 656B5409A8;
	Mon, 20 Dec 2021 22:37:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 596091BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56F0940469
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id emb6mw2jn9UG for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:37:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A317640442
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:37:22 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b13so15754357edd.8
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DVdm+L70dcq3QvRtqLt7gw3C/nL3AIulczx9Nrt0itI=;
 b=fkPo33iY1DscEisljef0U4eNNLi9jlnYtW+YyixPUGZMskkrLp9ebg9F/lIYZoN+BV
 M7888Y8LKwpzAGZFno7T4ngcREi8ZwfK5LZ0QJCdunSfm5FyuyDp3AXKyBa2OnVh0rab
 TFeIacizpAbyE5xc3V6dVYq+zNboS3omsZFlh/ohpgpoA7UbOE2x1aI66fe3RBJiiaUD
 HDTIpR03y1G5H3uhXQDjg7twfokiuKl06olrYrwRxBaPQ/+8jO/3RretIwPUg4g1unkI
 PRGZJPXh50/9PB9QeDsn0vgPPk3xukHYKQSNVnIUW87ub6tK4W3XFkWIphAG88/yiDr/
 4Pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DVdm+L70dcq3QvRtqLt7gw3C/nL3AIulczx9Nrt0itI=;
 b=dcpu8rKdhqbhioFEqZn16RKg9jjkWcJI1fcEFP9A5Urs54I9K13craVqjP1m4xMQUN
 IpCe1eIjY1zG9p5JC0v4yMs/Em766aeXYRFLaPkoi6VH7OlYbqZzUlEXYAz/BINhU2eT
 slNyyIPB8WKP59f25HqjxOfZdoJh99EKqSgMjmEeFXaeEzVWI/Xw00+uVYK/YnbpERhg
 Wbs4cnE4V2NpU3DHrQhZbSAFuCplZlZMcsCq1Fs3k4yDIKd4GBT4l8ek9VrBolUBA00c
 KDT00gLDFnh50KfiL6nOQTkJzdOZWwNogU44aZ/zJMBSpo6IigltlYy5BiyZXn4F2l7Y
 EMHQ==
X-Gm-Message-State: AOAM531GqyL/hXyBB+jJBjvH+2VhZLUtWX3EGqwzzFgHdIe35IQ4ZRne
 LdlvV51K/zGTaTyHD0C4GDb1rg==
X-Google-Smtp-Source: ABdhPJwa2PNoSc+I2KX2lmKTTz6FFC46H62GrrPnMya4dVkVp6w93o4p5MF8y7b9GU+fbVceFRlFTQ==
X-Received: by 2002:a17:906:974c:: with SMTP id
 o12mr229007ejy.229.1640039840939; 
 Mon, 20 Dec 2021 14:37:20 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t10sm5770135edt.83.2021.12.20.14.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:37:20 -0800 (PST)
Message-ID: <7576e24a-1d14-db1d-e4c7-31390e1a0a32@mind.be>
Date: Mon, 20 Dec 2021 23:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
References: <20211219132438.5841-1-dariobin@libero.it>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211219132438.5841-1-dariobin@libero.it>
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: add the
 stm32f469_disco_xip_defconfig entry
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
Cc: Yauheni Saldatsenka <eugentoo@gmail.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/12/2021 14:24, Dario Binacchi via buildroot wrote:
> Commit a3e3d9c19829 ("configs/stm32f469_disco_xip_defconfig: alternative
> defconfig for XIP configurations") forgot to add the corresponding entry
> in the DEVELOPERS file.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
> Cc: Yauheni Saldatsenka <eugentoo@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 35f3be81b8..e6f0b67ae9 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -531,6 +531,7 @@ F:	board/stmicroelectronics/stm32f429-disco/
>   F:	board/stmicroelectronics/stm32f469-disco/
>   F:	configs/stm32f429_disco_xip_defconfig
>   F:	configs/stm32f469_disco_sd_defconfig
> +F:	configs/stm32f469_disco_xip_defconfig
>   
>   N:	Christophe Vu-Brugier <cvubrugier@fastmail.fm>
>   F:	package/drbd-utils/
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
