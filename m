Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8D9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:37:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E67B61AF7
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E67B61AF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF99180F1C;
	Wed, 17 Nov 2021 21:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SoagHOphdcMy; Wed, 17 Nov 2021 21:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B88A80F58;
	Wed, 17 Nov 2021 21:37:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C77E1BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B20840912
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gb25t0_-bQDi for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:37:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45AEC405E1
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:36:59 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id t5so17564764edd.0
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 13:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XX1EM2r1GiZJ37KJrZIvR2PpXaHhAarcE+g+8YX+JG0=;
 b=V5uKJeazNs3P14iuh3UuirSDhmFtDK/YG8vXE2RamZdmIUSqM0GoaC6CPPw5RMOsZN
 yrMkp1eCRo+1OfQSCezsHirMvbrgc+kTjC0bEll4hg/dqrIJssktGWTG5FIZfvLjiE8B
 8TmkiDuxFhSPhvrM5RI35ID1BUEmznumC2Vi4Emliq2p0YEMKK7tEhWPb6Myxo3PT4Pq
 i+PjoMn5GC5A7hA2xCgbGntsYZe7W+ZtLDwwarQsN6gs7tZTT+aDf6Y7bSNQRwf1QAMq
 vO1VsHLaV0XGzirG980opivmlZfU61uf98vlskTeBQIZ96Y6FV0ICKl/bzcs/USwZzhz
 Fu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XX1EM2r1GiZJ37KJrZIvR2PpXaHhAarcE+g+8YX+JG0=;
 b=If4fcE1B1hXkSMgTDjcOIwyLn2cTRErbGQLkZZycRfgQGITvjsNqhk7hwEVI7V1tta
 36LBa11yFMRyPIBQ6nPyPoPHIFWozW8m4zKOuaFUcD1Tq1rIW4xo7zfwCg3ZAN4nTOyN
 fiCJHxRmj74k3/uhD1B4eNOVbVtBcqj5e6gOLnF7pX7/vrHRzXGFJANh9u2zXPpAECBY
 nc2ShXjUV8kDjB482kVZ6uhZyNNahm0wZbyz5zFdmH8dwDj83paOQYTICbyg38YoBiAh
 HZLa+FbEG6bavOJm7NC/75h5j5RWwwkH0uPR4TwleBQietgYFdSSQw7P80ovCvjM5ge0
 AQEA==
X-Gm-Message-State: AOAM532zn/7BQowltLrxDgVBZBMZoZLaBOhFwZWvFM+ghFaQjRbgSCuv
 m692DqjYwb/c0RyaPCTk7q7zmA==
X-Google-Smtp-Source: ABdhPJxLYMCg/9UjBjKbWaNuwi0+n0qF8LH/WP7b9G51Jml6lmGflL44cCfWUJarUSvizXn+9O8qXw==
X-Received: by 2002:a05:6402:524b:: with SMTP id
 t11mr3214584edd.98.1637185018009; 
 Wed, 17 Nov 2021 13:36:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id he14sm484580ejc.55.2021.11.17.13.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 13:36:57 -0800 (PST)
Message-ID: <2184a148-78ff-2261-508c-88dd30f0cbc6@mind.be>
Date: Wed, 17 Nov 2021 22:36:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211026214704.4103588-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211026214704.4103588-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v3 1/2] package/python-markupsafe: bump to
 version 2.0.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Carlo Caione <carlo.caione@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Lionel Flandrin <lionel@svkt.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/10/2021 23:47, James Hilliard wrote:
> Drop python2 support.
> 
> Remove python3-markupsafe host build as python2 host builds for
> markupsafe are not supported, python3 host builds are moved to
> python-markupsafe.
> 
> Remove python3-jinja2 host build as python2 host builds for
> jinja2 are not supported, python3 host builds are moved to
> python-jinja2.
> 
> Remove python3-mako host build as python2 host builds for
> mako are not supported, python3 host builds are moved to
> python-mako.
> 
> Propagate reverse python3 dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Both applied to next, thanks. Let's see if things break down now :-)

[snip]
> diff --git a/package/python-jinja2/Config.in b/package/python-jinja2/Config.in
> index 5b99df75b8..36a68083e6 100644
> --- a/package/python-jinja2/Config.in
> +++ b/package/python-jinja2/Config.in
> @@ -1,8 +1,7 @@
>   config BR2_PACKAGE_PYTHON_JINJA2
>   	bool "python-jinja2"
> +	depends on BR2_PACKAGE_PYTHON3
>   	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
> -	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
> -	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3

  I don't think there was a reason to remove the unicodedata dependency, right? 
So I re-added that.

  Regards,
  Arnout

>   	help
>   	  Jinja2 is a template engine written in pure Python. It
>   	  provides a Django inspired non-XML syntax but supports
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
