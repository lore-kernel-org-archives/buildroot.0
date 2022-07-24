Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EABFC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8891C4163E;
	Sun, 24 Jul 2022 12:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8891C4163E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SfnXQdBkfgti; Sun, 24 Jul 2022 12:29:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28E604157E;
	Sun, 24 Jul 2022 12:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28E604157E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B80E1BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9FD6402E0
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9FD6402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9iBpu6Ks5qkF for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:29:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFBD440186
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFBD440186
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:29:31 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d13so4664732wrn.10
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GUj/NctCjoH6gsg30P86PiiDWIYzUPJmQfT8LvDswGg=;
 b=cr5+c1rbYhZexg2fJLPwzfLYwTsWfUKyPu4ZNGeNT26fYrewChA9zSxqWdE4JNTP8U
 JwlIIGQ1uni5xbA9kCMgcxJMlFaxoMYysLhTC1+yfXAHZY0y+Z/uUIOMvnZf2gChKaRx
 Q4Ptm6rOUMxY7H0ILXNPdaO0xcx0s7BRm6CLjurvxJnOO4UAzX/sqK+pKliUdAzN8Zch
 JxylamRHsJU5xrwYOzQ7FVKsM0I2RsICl+5sr5KO3Vf/IXdfqJJrZkWw6qtzWFGdJBB7
 f3qGm1FxiL19gGoQfqmGllnMIlRF8CY02ZkpkCMqCXlmiM5d8hBxJ5p1rTHZOSowyjSy
 kpJA==
X-Gm-Message-State: AJIora9LesJHcJPftkkvOZWfkPjL2EYqC4VdlzBMpgYB9+O3NDC9zhY4
 fq7RjbvZ5wwNNBJwShRQE48wEw==
X-Google-Smtp-Source: AGRyM1ubrNP63sFoOA1popK0lgBYgA3TlJMs5IU/Xbp+kwSWF8+xuyCOYrCjCi7QOvtTSQl2r+ziVg==
X-Received: by 2002:adf:e10a:0:b0:21e:47f4:6a51 with SMTP id
 t10-20020adfe10a000000b0021e47f46a51mr5441752wrz.276.1658665770201; 
 Sun, 24 Jul 2022 05:29:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 o17-20020adfead1000000b0021e4536a948sm9485371wrn.79.2022.07.24.05.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 05:29:29 -0700 (PDT)
Message-ID: <b225e5ce-5e38-aee0-eb32-130a0d9a9337@mind.be>
Date: Sun, 24 Jul 2022 14:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220724093739.93406-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724093739.93406-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GUj/NctCjoH6gsg30P86PiiDWIYzUPJmQfT8LvDswGg=;
 b=auA4SMTqzJe8fE7ANuK370O0jCzNoVBhh0kxXhKYKsrbBs/4jnOQZPGPM6xUT3LrXG
 2D8WRennwECGu7tNZCMpgOxPEAUa/x/fyBYih0vChox9kc+NmW+dw/o95bVfxKlj/8Xs
 OlFl/xdl0zE58Hdx4AEk9Ts5b762KLYNf4MxXj8XArIJMYiKErKMRyvRFukqkBwoYCMY
 yru8w44LOysiBPQDiWT+64Cf2tZoReJ1rl01gwd1HnT7NfLjKkUby9x8nlZYOUzl+b2s
 cLxkMilP53eWp5svfACskHXQ43JTy46NHQeFjGy8dSJ6gNUuYFSz5HJ2DCbMlxxO4Pi5
 mlxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=auA4SMTq
Subject: Re: [Buildroot] [PATCH 1/1] package/libvdpau: bump to version 1.5
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
Cc: Damien Lanson <damien@kal-host.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/07/2022 11:37, Fabrice Fontaine wrote:
> https://gitlab.freedesktop.org/vdpau/libvdpau/-/tags/1.5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libvdpau/libvdpau.hash | 2 +-
>   package/libvdpau/libvdpau.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libvdpau/libvdpau.hash b/package/libvdpau/libvdpau.hash
> index 653657322a..ac974902d0 100644
> --- a/package/libvdpau/libvdpau.hash
> +++ b/package/libvdpau/libvdpau.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256  4258824c5a4555ef31de0a7d82b3caf19e75a16a13949f1edafc5f6fb2d33f30  libvdpau-1.4.tar.bz2
> +sha256  a5d50a42b8c288febc07151ab643ac8de06a18446965c7241f89b4e810821913  libvdpau-1.5.tar.bz2
>   # Locally computed
>   sha256  ce4af7294872ff07f6e82ae5f1f5eba926215b1e2fb6d55d64759de082458d61  COPYING
> diff --git a/package/libvdpau/libvdpau.mk b/package/libvdpau/libvdpau.mk
> index ae2f388855..67ffdf17c1 100644
> --- a/package/libvdpau/libvdpau.mk
> +++ b/package/libvdpau/libvdpau.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBVDPAU_VERSION = 1.4
> +LIBVDPAU_VERSION = 1.5
>   LIBVDPAU_SOURCE = libvdpau-$(LIBVDPAU_VERSION).tar.bz2
>   LIBVDPAU_SITE = \
>   	https://gitlab.freedesktop.org/vdpau/libvdpau/-/archive/$(LIBVDPAU_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
