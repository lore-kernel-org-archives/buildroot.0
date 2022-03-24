Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B3AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0E5284486;
	Thu, 24 Mar 2022 21:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OxhKuF38tC6E; Thu, 24 Mar 2022 21:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D754A84468;
	Thu, 24 Mar 2022 21:12:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 192C41BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14A82405AD
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RIpkEKbekfrk for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:12:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E5C4401B3
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:12:19 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id u26so7040557eda.12
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5ihAaRHvcw6Xa0+k7Qped1Q908wzv+83cgXDVVZLOXg=;
 b=D1b7+EWDfSDJt0g9orqsNIqXzFh0W4tAP+WbJKM/h2W4mEcWZU6aFIZec0OFTdwXjX
 NkP8MQOX39fXtx75+6p+lo134ooFdIkvZvz6on5eVzD8fIwEsLEmaJewwLU3nrd4e6ar
 sCamqmMVoY6nQGGsPmb0E+P0Ybwy6TFfDUd20pRD2o5Ou6eYMNsPwrVQgmkxDiwJtooC
 1KwzyRlgH1PnMEYAooOgtMDu/Vo7IAXsu60tm90VTLl9+8jJR0lNGyjlZD1au9GUfEJC
 UIqWJK4fvoWXW0kp2Bsr39Fo/DRyPeyk+tUAWJPuHfAWhUkyzX6KSlhT9m/Rv4w+HkyW
 XINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5ihAaRHvcw6Xa0+k7Qped1Q908wzv+83cgXDVVZLOXg=;
 b=EDpWl5mQ1y0vQERUa132Es7jRaCdv5puEqDmf5uMiA7obFH+7EIJBHYho16WOYTJvQ
 63DsFXDl5S9fH3sTHSXtIDul2W/Re5F6S7cZvR67ajDIUhLuG8mb3nSx1Q9mRPJvq50l
 bx41X1bxw4orexwAWI/Ra4ll5nK6H6WZxmhg4R/I2nos0ov8vMy/2ZGjWl3QoYaxFK+9
 +p0jTvLaHTdCUwE4iES1SJYT0OaprgRCKf0nkWtTC+Ge9yYvBLmXgLcX0Rl+YAY2gci2
 +mXfm+Bce07G4AkHFeNuG81hW546Q2T6HJKKVrmk0MIRMEwX7MbbGjvY//pyYwHyNLN3
 eFJw==
X-Gm-Message-State: AOAM531DJPjHaoQgdIuAoiQjkLvnnXN3qN6//RSTVz/QsLuXSy9zr21S
 AWCC3hZf0Q3hRYbkKEvYd/16SrBpi9rePw==
X-Google-Smtp-Source: ABdhPJzQPL2ByqlNbjgFZ+R0FgQ3EgnROC/ulZe3xYl1xxkv5jzePgCbq7gouMafjvAnpUezN5lMjQ==
X-Received: by 2002:a05:6402:4388:b0:419:443d:b4e9 with SMTP id
 o8-20020a056402438800b00419443db4e9mr9149224edc.149.1648156337534; 
 Thu, 24 Mar 2022 14:12:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a17090608c700b006cef23cf158sm1588176eje.175.2022.03.24.14.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 14:12:17 -0700 (PDT)
Message-ID: <117dc4de-5528-0f46-f77a-f3923ea9b6fa@mind.be>
Date: Thu, 24 Mar 2022 22:12:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>, buildroot@buildroot.org
References: <20220315142640.2268645-1-mirza.kapetanovic@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220315142640.2268645-1-mirza.kapetanovic@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rpi-gpio: enable package
 on aarch64
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Ian Haylock <haylocki@yahoo.co.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/03/2022 15:26, Mirza Kapetanovic wrote:
> Enable the python-rpi-gpio package on 64-bit ARM architectures. I've tested
> this with a Raspberry Pi 4 64-bit and Python 3 build and it works as expected.
> 
> Signed-off-by: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-rpi-gpio/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-rpi-gpio/Config.in b/package/python-rpi-gpio/Config.in
> index 4f59ebdb06..f3c0928c62 100644
> --- a/package/python-rpi-gpio/Config.in
> +++ b/package/python-rpi-gpio/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_PYTHON_RPI_GPIO
>   	bool "python-rpi-gpio"
> -	depends on BR2_arm
> +	depends on BR2_arm || BR2_aarch64
>   	help
>   	  A Python module to control the GPIO on a Raspberry Pi.
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
