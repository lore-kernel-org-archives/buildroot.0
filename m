Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F3EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 17:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE278400CE;
	Fri, 17 Dec 2021 17:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EA5YKmkYb1lm; Fri, 17 Dec 2021 17:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1526C40C09;
	Fri, 17 Dec 2021 17:39:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C2D51BF2AF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BE1761138
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2LInVoGNZSCJ for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 17:39:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 856C261119
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 17:39:34 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b7so10644295edd.6
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 09:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=H/DrI+Gd7f5zZ7UZjUosRb/m5GERVCDPZqq2FfRpqpU=;
 b=eNUtCoO++0f8JT/ln8iSFlVBbzJCtQLFCrA2BohqgDmF7xkICYwTJp33rrJqul8qN5
 pIRW26+MW0Oz+kPqcYAiZ6vq08Q/vx2GL2bcPBLrwZIIIFxHl3E4vmEzZFybcI9hs3BV
 7E1RefNfPrbi7eOnFxu3r2FL8SVAZ0A6fTXXTeur3F4P79ABqdjB2oLZ2kJjCHwxZayZ
 OZVE6NTtX4BucXUVr3+Nr/Rzdp33dHYQ5LBixjZVegxmlSWMNDg2NHqWQcTOHNTCxVqr
 0D/ycsOqKrQZMrcDAXa5Kzoa6tkCAZOIH4U+dHtejfNWnVUDdoK1BWhqoqx4uUZE93yx
 LHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H/DrI+Gd7f5zZ7UZjUosRb/m5GERVCDPZqq2FfRpqpU=;
 b=rxgVU7cUHvTXhTCqF7dJgj5ZSB1oOEILWfg7BDnC2RL+jsls6caMSNwO87wHAY27RE
 ejwX9h6fOhREKapda2q/X4qFJGEfXKdoEkIXfTdFhuH1ST94fOCt2O5fI7sVuf4Lm5t0
 0LUwSTvs6SHJjlYiJdJKhK5L4gqUukbf6h2YSWAiNoXl9pc2fxZ0XzFPatcJNI/+JAl/
 RhmcmHvmtLFI6KvohcEplzdhR/n64B+sZ+lRhHx3rs4N3Bw+b1WRGQyMz8TUl7HyK1RU
 MLHOwZfUwhF6kV1ZoucHOoiKMp3Au/kQkAOakYW9VxtoP+74HcRgsmjGoWCEGTOdfVbu
 bc/g==
X-Gm-Message-State: AOAM532cNg2FKz0IPMJagJ/46ASfWfeKyDbsedrwFjVwdLoYFnXrPngo
 c3aGVNCJkmKVgboQuGhckJw2bg==
X-Google-Smtp-Source: ABdhPJyOsA2Py+2q4IzVgWRAuF2ze07MvJtdTZJAVePPOCxIn+uFjPiyiHvfxvP7gA9l5P5xiQVaEw==
X-Received: by 2002:a05:6402:27d3:: with SMTP id
 c19mr3903803ede.390.1639762772834; 
 Fri, 17 Dec 2021 09:39:32 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i22sm324317ejw.75.2021.12.17.09.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 09:39:32 -0800 (PST)
Message-ID: <868dde51-d7e2-5c8c-6f4d-069d01fb9484@mind.be>
Date: Fri, 17 Dec 2021 18:39:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211216220840.948363-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211216220840.948363-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] Config.in.legacy: improve iputils
 options
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



On 16/12/2021 23:08, Fabrice Fontaine wrote:
> Improve iputils options added by commit
> db0c2a287970a8832b59f3cf9d81aa18aced2cec
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   Config.in.legacy | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index a314f2ceba..eb977c2685 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -147,16 +147,17 @@ endif
>   comment "Legacy options removed in 2022.02"
>   
>   config BR2_PACKAGE_IPUTILS_TFTPD
> -	bool "tftpd"
> +	bool "iputils tftpd option removed"
>   	select BR2_LEGACY
>   	help
> -	  tftpd has been removed from upstream.
> +	  tftpd has been removed from iputils since version 20211215.
>   
>   config BR2_PACKAGE_IPUTILS_TRACEROUTE6
> -	bool "traceroute6"
> +	bool "iputils traceroute6 option removed"
>   	select BR2_LEGACY
>   	help
> -	  traceroute6 has been removed from upstream.
> +	  traceroute6 has been removed from iputils since version
> +	  20211215.

  Oops, thanks for fixing my messy commit!

  Applied to master, thanks.

  Regards,
  Arnout

>   
>   config BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
>   	bool "libmediaart 'none' backend removed"
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
