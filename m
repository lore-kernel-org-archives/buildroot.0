Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E56FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 19:09:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 816C560FD8
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 19:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 816C560FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41FDB40593;
	Thu, 21 Oct 2021 19:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6I-XJ8CWkUD; Thu, 21 Oct 2021 19:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D7FC4050F;
	Thu, 21 Oct 2021 19:09:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D93FA1BF360
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 19:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C907681765
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 19:09:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21zmTPxsGpqA for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 19:09:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1018380FC6
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 19:09:15 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y12so2622254eda.4
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 12:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=JT+ittRbDvPUQwwIiGO9iBJYm15c/NKVvYyY2BmUCpM=;
 b=NqNHOi/4TKerRsMC/8GB0jD16b94avdoxzh5/b8/G6Zwgc5DjSl7jGkQ8+x0tJhN+T
 vylZcPTjYyx1PbBVY238wtmOrlWfUQm767PERDksXuAU5+XPsVnDWFFfs8JNLsHBOHG+
 GS647WAZb7BpRsRltrDdEhoC/JSm+20yxLrEkYfRlg606Z5+FSqABiY94EIP9SfHva8A
 DMUI4lK1XpsdLfuxvGgn/8TES5hegnSRZq+kds9sfUAiyk8hQzqmQYrh/pEv2ZoTrxQk
 4ngqlgHIC9gSoC/IaFIcc0RewvlJfBTVDPzPuoCCcwbk8bQFNt5uybApxoz3V+FCXR76
 7iWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JT+ittRbDvPUQwwIiGO9iBJYm15c/NKVvYyY2BmUCpM=;
 b=JnSMTnHeM1meYRNZNPClbjg0lEv8YC2okCG9yYAw4MHTPffaH8Echrlrgb/N0gZECX
 iKOO+Uxa96BAvgbHq3WW5UnjvVN4fn8XLD8SE3xInC9I1eoDhf9sYXYzjFsrmG0hxflW
 LwPG2gWbtAtZXAIPyw/1NJJGVt4iUMDKzs311sh5pvnqqeTC+Pq3XGWBIUZBOwz3WJf3
 Wy6v/NQZpcAy7H0IjgT7IClkWvdBNhVW2soz+JYx5j9OyWI8BtzvUg9eyeX+4MVWUmUU
 sf+y+9hQ4IzfEQWa0qnCDVS9pqFcgpHkhVBd5yah5NlFgNipB66Ig2M3I36TQSAcl5EQ
 3yZA==
X-Gm-Message-State: AOAM533duXLcCU6mWyv5Xwc5s8iA2ZKZCmmm7QZDiOUr48wfOmgnwz0D
 /bJw0XIQzZqXlKcXHkKHcLBJZA==
X-Google-Smtp-Source: ABdhPJwMUpySKD2T/AyTe+bLHpQGBR7me7m19g9FPsu+lLMd9nUCja73q994SZgkghApC3s6OlO8Qg==
X-Received: by 2002:a05:6402:5189:: with SMTP id
 q9mr10070432edd.94.1634843354321; 
 Thu, 21 Oct 2021 12:09:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i6sm2854887ejd.57.2021.10.21.12.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 12:09:13 -0700 (PDT)
Message-ID: <844d3692-0b57-c697-a6a6-84d4fba137cd@mind.be>
Date: Thu, 21 Oct 2021 21:09:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org, 
 Peter Korsgaard <peter@korsgaard.com>
References: <20211008212136.721533-1-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211008212136.721533-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/2] support/scripts/pkg-stats: fix the
 status for packages found by guess
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



On 08/10/2021 23:21, Thomas Petazzoni wrote:
> The pkg-stats scripts tries to match packages against
> release-monitoring.org in two days:
> 
> - First by using the "Buildroot" distribution registered on
>    release-monitoring.org, in which we have added a lot of mappings
>    between Buildroot package names and release-monitoring.org package
>    names. If there is a match using this distribution, the package
>    status is RM_API_STATUS_FOUND_BY_DISTRO, which means that the
>    resulting HTML has a "found by distro" statement.
> 
> - Then, if the first solution didn't work, by using the pattern
>    matching, as done in the check_package_get_latest_version_by_guess()
>    function.
> 
> However, there is a bug in this later case: it sets the package status
> to RM_API_STATUS_FOUND_BY_DISTRO as well, while it should have been
> RM_API_STATUS_FOUND_BY_PATTERN. Due to this bug, in the resulting HTML
> file from a pkg-stats run, all packages are marked as "found by
> distro" even the ones that are "found by guess".
> 
> This commit fixes that by setting the correct package status.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> This should be backported to stable branches of Buildroot.
> ---
>   support/scripts/pkg-stats | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index cc91d13167..0f1521873f 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -512,7 +512,7 @@ async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
>   
>               if len(projects) > 0:
>                   check_package_latest_version_set_status(pkg,
> -                                                        RM_API_STATUS_FOUND_BY_DISTRO,
> +                                                        RM_API_STATUS_FOUND_BY_PATTERN,
>                                                           projects[0]['version'],
>                                                           projects[0]['id'])
>                   return True
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
