Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5957EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1629B40576;
	Mon, 25 Apr 2022 20:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07PG0yILiOAj; Mon, 25 Apr 2022 20:23:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A7FC40526;
	Mon, 25 Apr 2022 20:23:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2663C1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21246415C0
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8zJ1A5js7EZi for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:23:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3D7240425
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:23:29 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id i27so31842456ejd.9
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 13:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UIeX7b2vSmsUwfYRT8M/JHBxRHEB4pfrtY794/JwGtI=;
 b=WtJH8h7xqFxCCgN9ZJdBk3QmX6lkeYRXifccXpYDymz9pqDOlociNdu118UoUaJ7Uw
 8C0DLDbJQPgkwIFguwdlQ4zzjqZCgUZj2o4Behhjw/mPclA7FmJnjhbw+vhMok09kjcc
 YriZbiyuru1LgS+Yv3aCrH9wxve1YPOYXupc/b8xNLF/q7Wl73wup4h+eYf6NeXq/2sQ
 Jjn77GFfNJYS7djYT/ZsF32JFKGe/SjWh6w7K5AQraqNj4FR5Cb3Om/wWtbh76C2MXTb
 XbKPSdZ2KeStA9qs4h2Horjse+1gzoM3U/nOCSF07DjvkGiIuYamYy2bTL55fmXZy0BS
 r9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UIeX7b2vSmsUwfYRT8M/JHBxRHEB4pfrtY794/JwGtI=;
 b=fjOTgH1Qmeshzpw/r2Ja6vTvD+aVrg/KDgiMJ1RYWoMujcl+9fUwyva2zIXVg4Jc82
 zmmsLhSmBzpG/ll91JH8ir7KBzBBUWHIROrXOOq7UFbmRZP/t2U6+htQNVPB/L+MrvGX
 cAyZQSBYnEYmsTqViJQ7wZYht9nqDaj/wdHNe/JCqRlVvgu20Au3997MvmFMXargmZQj
 YiiSQpUpdr2xN3z5t0Vt3HgKMT/+PxfDPgpUiSASL0QqgFVhZYDBIWimydfKZaS3gPy6
 I6n6CmdqpM+PKsz4NZKu8HYoFSq4Mm7bTooWNaTInAtUM5yDE5mKRJhgc2qBRgTTiWyW
 oZTA==
X-Gm-Message-State: AOAM532a5IP9Ou5k+4dZNcgOCcyiW2QoBqklGw1zv7RG/hqrKyrNpah6
 OYhQEVrm0iUjyY8BowkO0dRS9iJnFVisrg==
X-Google-Smtp-Source: ABdhPJwxdVyNwY7OX62wzX09p6RHdB1quShCU/Jx1XEpQcNAaeQ+AGYvAS2NyFjD37/n9R9i901frA==
X-Received: by 2002:a17:906:99c5:b0:6df:8215:4ccd with SMTP id
 s5-20020a17090699c500b006df82154ccdmr18335217ejn.684.1650918208000; 
 Mon, 25 Apr 2022 13:23:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a508dc5000000b004241a4abbdfsm5106663edh.45.2022.04.25.13.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:23:27 -0700 (PDT)
Message-ID: <27a8a8ed-5422-77ac-3e56-e0a5c8be92ca@mind.be>
Date: Mon, 25 Apr 2022 22:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220423170624.991570-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220423170624.991570-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-zopfli: needs C++
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/04/2022 19:06, Fabrice Fontaine wrote:
> python-zopfli needs C++ since its addition in commit
> 53972c82964dd1337dff4ccbcdd484d243aef0ba:
> 
> nios2-buildroot-linux-gnu-gcc.br_real: error: zopfli/src/zopflipng/lodepng/lodepng.cpp: C++ compiler not installed on this system
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/442ae4a02e691b4039d1694620f6284906cdc97f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-weasyprint/Config.in | 2 +-
>   package/python-zopfli/Config.in     | 4 ++++
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-weasyprint/Config.in b/package/python-weasyprint/Config.in
> index 7fe99c3951..18d72d742e 100644
> --- a/package/python-weasyprint/Config.in
> +++ b/package/python-weasyprint/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_PYTHON_WEASYPRINT
>   	bool "python-weasyprint"
> -	depends on BR2_INSTALL_LIBSTDCPP # python-brotli
> +	depends on BR2_INSTALL_LIBSTDCPP # python-brotli, python-zopfli
>   	select BR2_PACKAGE_PYTHON_BROTLI # runtime
>   	select BR2_PACKAGE_PYTHON_CFFI # runtime
>   	select BR2_PACKAGE_PYTHON_CSSSELECT2 # runtime
> diff --git a/package/python-zopfli/Config.in b/package/python-zopfli/Config.in
> index 0b1ebca85c..dc68a2fef0 100644
> --- a/package/python-zopfli/Config.in
> +++ b/package/python-zopfli/Config.in
> @@ -1,6 +1,10 @@
>   config BR2_PACKAGE_PYTHON_ZOPFLI
>   	bool "python-zopfli"
> +	depends on BR2_INSTALL_LIBSTDCPP
>   	help
>   	  Zopfli module for python.
>   
>   	  https://github.com/fonttools/py-zopfli
> +
> +comment "python-zopfli needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
