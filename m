Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7526C433FE
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B0EE84BC5;
	Mon,  6 Dec 2021 21:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwKngqcavkPP; Mon,  6 Dec 2021 21:17:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2DBE827E0;
	Mon,  6 Dec 2021 21:17:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D51B1BF334
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CD3441C10
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:17:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id La6VFNTHMEZm for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:17:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91E0B41BF9
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:17:25 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id e3so48590381edu.4
 for <buildroot@buildroot.org>; Mon, 06 Dec 2021 13:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=cKja5w3kDoQhqhkVX4oryBTNa1mhHODnFNoNqwwG6zk=;
 b=Na26Gt64xMtQSV+hYrpOm10LrUFnok4L6kPfh0Y+/l4CxUROlxq1k4lwe+aquE7KEz
 GXyix7i+WCLKWw3Z9E3gl2pDbYJ+9eAJeJkODpbVhbsjSWYRY44I0fYbDSEvm1haOols
 nGrYDA+YKrBEu5uceeks+poT+sP11AbhjG+cMzbpTV0oWj11wBTBVx0MtMIomh8WN6df
 PrpYvylPz+IcuXFkoSNKQg7Q5NpA8+vylHTTRUO4wTxkj9lkKkbhksRxqSkbz9mn8Y2w
 nnvZ/IvHBDVtmymalEZJ/bJI9c17gJjl75IUPkvAxEhbsfvA8yGisLng9VXzMiQuI0rP
 xH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cKja5w3kDoQhqhkVX4oryBTNa1mhHODnFNoNqwwG6zk=;
 b=nyAuNfxvHdqhZhXYFdgs7PhG6pG3KNLx04MsOGBHlEokGXvLFPGEvb6CIVNN82IJzX
 E7uWUm0e9oXZzutiQ9TorzeHBegE7wGw4J5Ouse41fq3lkzAJURTGsEB2CYkSqW93FD7
 x1fToZktmOSbSCkVZq7vt+Kf5kh4x6NHM8qdE5KsCPl7zwicja+TVHy5bYaUEZucsfGv
 WFPdfOV5GoJH27UOZ7cAPoDMg1br2Q4Pk7YUPMc1KuJheSx+q0Etup3e44idmLSOAU3Q
 GhALFhPlBhiyI/PJu/6/nDQq+hXGNNBRFh3O4d/1/TSKJPRlCdvlvH84ZXrNqOQ++qHm
 rwPg==
X-Gm-Message-State: AOAM5327xyVXpjoq/k6qAOE5WeKvYMKaKvdj8gJ0F8r+pQzMf9/KQOAa
 NWxjKEMh9K31xpSENJI0ozOWvoUVTavA+g==
X-Google-Smtp-Source: ABdhPJwbvqELN0MspQYo3D/nOIA0STjr7rQubudKBI+IIrOmH13wDx+jglEb+q55D05n3m8ftNxIbw==
X-Received: by 2002:a05:6402:405:: with SMTP id
 q5mr2485171edv.62.1638825443821; 
 Mon, 06 Dec 2021 13:17:23 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m15sm8772845edl.22.2021.12.06.13.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 13:17:23 -0800 (PST)
Message-ID: <593f64b6-cbd0-4777-595f-f24541d27867@mind.be>
Date: Mon, 6 Dec 2021 22:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211125213707.2050547-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211125213707.2050547-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: fix buildutils check in
 python3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/11/2021 22:37, James Hilliard wrote:
> The message attribute does not exist in python3, see PEP-0352:
> https://www.python.org/dev/peps/pep-0352/
> 
> Fixes:
> Traceback (most recent call last):
>    File "utils/scanpypi", line 743, in <module>
>      main()
>    File "utils/scanpypi", line 693, in main
>      if 'buildutils' in err.message:
> AttributeError: 'ImportError' object has no attribute 'message'
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   utils/scanpypi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 1f3326cf4d..17d8a0017a 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -690,7 +690,7 @@ def main():
>               try:
>                   package.load_setup()
>               except ImportError as err:
> -                if 'buildutils' in err.message:
> +                if 'buildutils' in str(err):
>                       print('This package needs buildutils')
>                   else:
>                       raise
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
