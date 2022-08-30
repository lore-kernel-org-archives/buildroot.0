Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B9EECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 20:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15E8C61015;
	Tue, 30 Aug 2022 20:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15E8C61015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FioKYJJO4PFL; Tue, 30 Aug 2022 20:38:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 435C560E92;
	Tue, 30 Aug 2022 20:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 435C560E92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 446011BF4E6
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 20:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C9F081BD6
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 20:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C9F081BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SnKu6_xEM21P for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 20:38:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 042F581A73
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 042F581A73
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 20:38:17 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bj12so24505839ejb.13
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 13:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=YbFgxsJPVYy5myM4NrUp55ixvbiuZvWfI+DBioXaNJI=;
 b=6Yk2dKjkUoUCcCdbmTP5Scoj6UzkPi1qYfG+1TplPtFvycaci2QWMvQy5syOs0dAox
 rTAiazjC1WaM2PCgsmqN+u5dYT46kOwD2g9pUPvP0x1z5J1D8kxCTx57/x3IYHHovnYx
 jyXlz+9uJ+NrZuGX1lbO507bcmncQGl9iNJrlH3XVmmKiNDp79HZ5b1UVSha5h/1BAJ3
 +RU7iFv7emZbmwFmYDM2DyBLQa9SjROdem1GCbc1pbLktj2v57XCedpTXEazS95qADwh
 PuCJ8TeGxH+YqQngpIp4ltHZVhogZi9HONrjUriFsGs/PTkNVaHjUm4wXWmM1Bh3Mz8+
 1fhg==
X-Gm-Message-State: ACgBeo1rRY54tuXXv1jRSw4wzM3hdERiJNxvn+fZH9yzdN0Ax8wML0pH
 14J2WDoOe4l75sA2KCjZCh1KiA==
X-Google-Smtp-Source: AA6agR4jk1qRfUiSbQc5jc6nnJfIVFTtAIORaIkuaZZ/d1Kkv6dtsEMIBPDvYWCK2W4Dv3nh5nAQdQ==
X-Received: by 2002:a17:907:6095:b0:731:87a0:b9e8 with SMTP id
 ht21-20020a170907609500b0073187a0b9e8mr18592095ejc.124.1661891896256; 
 Tue, 30 Aug 2022 13:38:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a056402125600b0044602e3dcd7sm7834734edw.95.2022.08.30.13.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 13:38:15 -0700 (PDT)
Message-ID: <992fcfa7-3c49-bf78-1389-72bf618d9715@mind.be>
Date: Tue, 30 Aug 2022 22:38:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220827204233.274008-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220827204233.274008-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=YbFgxsJPVYy5myM4NrUp55ixvbiuZvWfI+DBioXaNJI=;
 b=cyIFES8PyMUqE1MJ1mHcz9FQ2o8qww6lqYMsSo45ZbxMz9fGpLZfI+2VebzB8ToXQR
 oDwdDTHktOxbj4IdcKyPiA7Zrt+8/p2D/H2v94vTsJ4UY9grDk1wfkDbG7+G85uj1/Qo
 n9HrB3Fr8TznwZvXazpZn94IThRAjU8ZS+2mcQIYN9wNl9KMYQuTU57ed8x4acnm/jmp
 ch+3vBpYrMAdhtHS3GI46uWbuisaLWrvUQ+lhymCt1Qat6r3QUQ3ZjVopQXY6CiVhxpC
 kFZ+9VNDSUh8VWlX+iNb/Not1KA5Vk0dFw22lA0n+gEL7asrVMg4E+jxHmkx8wlxV19P
 2wCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cyIFES8P
Subject: Re: [Buildroot] [PATCH 1/1] arch/Config.in.powerpc: VSX implies
 altivec
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
Cc: Cyril Bur <cyrilbur@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/08/2022 22:42, Fabrice Fontaine wrote:
> As spotted by Yann E. Morin in
> https://patchwork.ozlabs.org/project/buildroot/patch/20220823212219.5066-1-fontaine.fabrice@gmail.com,
> VSX is an extension to AltiVec:
> https://en.wikipedia.org/wiki/AltiVec#VSX_(Vector_Scalar_Extension)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   arch/Config.in.powerpc | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index c48edd3bb4..9fa0be0d73 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -3,6 +3,7 @@ config BR2_POWERPC_CPU_HAS_ALTIVEC
>   
>   config BR2_POWERPC_CPU_HAS_VSX
>   	bool
> +	select BR2_POWERPC_CPU_HAS_ALTIVEC
>   
>   config BR2_POWERPC_CPU_HAS_SPE
>   	bool
> @@ -135,11 +136,9 @@ config BR2_powerpc_power6
>   	select BR2_POWERPC_CPU_HAS_ALTIVEC
>   config BR2_powerpc_power7
>   	bool "power7"
> -	select BR2_POWERPC_CPU_HAS_ALTIVEC
>   	select BR2_POWERPC_CPU_HAS_VSX
>   config BR2_powerpc_power8
>   	bool "power8"
> -	select BR2_POWERPC_CPU_HAS_ALTIVEC
>   	select BR2_POWERPC_CPU_HAS_VSX
>   endchoice
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
