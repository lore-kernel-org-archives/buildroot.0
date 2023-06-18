Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADE1EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0027607F1;
	Sun, 18 Jun 2023 13:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0027607F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VG_7VSvNmOsx; Sun, 18 Jun 2023 13:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D01D60773;
	Sun, 18 Jun 2023 13:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D01D60773
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 007211BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEFAD403AE
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEFAD403AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UM5GYMwtg9th for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:31:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C374E400FB
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C374E400FB
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:31:17 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-987f7045f9aso167510066b.1
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687095076; x=1689687076;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eXbWbX6teu3o/t9woEqG3BAP1QTOG+YuBplv1ZTN+jU=;
 b=iGCp5SySg/UvNczNFLPIJ8gSoJv6oxa4gHNxAxndZA94jybgcscSgHPtN70yFh5Jym
 dn8e20jNcHabz0hhv13d5relhVShMnJQc16BjQNAJStkUlzijfV59bWk8jixc+Tofegb
 6i5BrgXsXHqiLJtzTjBAH0qqKQpwadtsuaYoQWeyPSmQwWmvtDVSEh0OjyJfgWcQeKGr
 x+n1/f4+chNpP+z1WrdRQeSjdja1rjBKTLePUSkbtApS4lYfnFZP8UVo0rVc8p5qSAbB
 i3Dca0rBzgoSj/bQOM69FXfHI82y2ocnrPPyL1vdLNLliIPFnN4kreKW7rz4pBDvA6tw
 xswA==
X-Gm-Message-State: AC+VfDxXtgmKDaHRQGdPGKYL7ft7MpPQzV5EFk7asEfGeA6kXQiR4szB
 ECdoTuv64y5Vu7DYthRVU1U6Kg==
X-Google-Smtp-Source: ACHHUZ7yqlVqKKD0MHWzXpHyqBis5KM+EvUYo5QVu4SU8rk4+wXcsXKCifjlbjheV76UgzdKxa0XMg==
X-Received: by 2002:a17:906:af65:b0:974:1eeb:1ab7 with SMTP id
 os5-20020a170906af6500b009741eeb1ab7mr5184774ejb.24.1687095075977; 
 Sun, 18 Jun 2023 06:31:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a17090646ca00b009827b97c89csm5797342ejs.102.2023.06.18.06.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:31:15 -0700 (PDT)
Message-ID: <b8bb5c03-bf44-3a79-16c4-405b49c5c8ef@mind.be>
Date: Sun, 18 Jun 2023 15:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20230606070126.165827-1-troglobit@gmail.com>
 <20230606070126.165827-3-troglobit@gmail.com>
In-Reply-To: <20230606070126.165827-3-troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687095076; x=1689687076;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eXbWbX6teu3o/t9woEqG3BAP1QTOG+YuBplv1ZTN+jU=;
 b=gyhhnqgVodqaAOC+cfPeB8MeNPL18usNcNxPxkMbv4STbQqms1L46Mpj7B2QMp3rp2
 Bzm1tMgNAt8HTUqBoFJDkBBnl4ZByBVB+i5v7Vy4QseRqtPUmQnW+4KfY1dxwyMjOCFk
 mm1SOKTprpJ8zzyqd4FoOUSXR65B57OJRwDtvYsoPFgACtV2y+L2JZLOxJQuZ79BvSHp
 YuQSoMXHUfwFSjcjs3/9YP/kXkN2sse+fWFS2VEtQQ9HwNUU80t8ne1+8XUbO+DVXKeC
 8aNCGi4weyN2LAM9A+ykSjpdehoK6aBoSpsub0rYNbfjQNAmbqd0F39mT81JT/c/CQ6h
 v78w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gyhhnqgV
Subject: Re: [Buildroot] [PATCH 2/2] package/inadyn: update description,
 how to enable HTTPS support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/06/2023 09:01, Joachim Wiberg wrote:
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>   package/inadyn/Config.in | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
> index 3589823da4..1476e9cf84 100644
> --- a/package/inadyn/Config.in
> +++ b/package/inadyn/Config.in
> @@ -4,9 +4,13 @@ config BR2_PACKAGE_INADYN
>   	depends on !BR2_STATIC_LIBS # dlopen()
>   	select BR2_PACKAGE_LIBCONFUSE
>   	help
> -	  INADYN is a free DynDNS client. It gives the possibility
> -	  to have your own fixed hostname registered on the internet,
> -	  although your IP might be changing.
> +	  In-a-Dyn is Dynamic DNS (DDNS) client with HTTPS support used
> +	  to automate the task of keeping your Internet name in sync with

  This line is too long, as reported by check-package.

  Both applied to master with that fixed, thanks.

  Regards,
  Arnout

> +	  your public (DHCP/PPPoE) IP address.  It can also be used when
> +	  you have backup connections to the Internet.
> +
> +	  For HTTPS support you need to select one of the libraries:
> +	  OpenSSL, GnuTLS, or mbed TLS (PolarSSL).
>   
>   	  https://github.com/troglobit/inadyn
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
