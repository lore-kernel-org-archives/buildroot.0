Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB03C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 17:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FC0781B7B;
	Tue,  5 Apr 2022 17:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXWnMPIxr4NL; Tue,  5 Apr 2022 17:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B86F81865;
	Tue,  5 Apr 2022 17:19:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 535841BF2BE
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 17:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 500E6408A9
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 17:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMHFPdaoWn3R for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 17:19:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE378401F4
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 17:19:14 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id d10so10929252edj.0
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 10:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zRMhT/d5G2sI4A1I7GlvZGkB/RBVwmCv9rkja5zBPHY=;
 b=GTtqJ9J87cTMzXkoGTekG+NgkHoQLgzbSFqQv92Jz8oNEhvWutYQjMmxt+KvGnR1ed
 iJb0C971IEVqs2R+7ZMje8kPx/FgWxosXBjxFzUfeZ5ViBc8fUiHfC/tp+M5xa0g/slK
 hqEe14E26JgrAT2CmL1f3eDrNIUqQqAcjLsyvx9iqKNb50MpDDz9DdnFSouyisHerX4c
 wNN9+yCNijonKwmG+vlsY9ekvPtBc2wwhDOtcikzq4Vu3Tb83tkta1WFWG0rh8nD1v7p
 sllh0G9tsu9Qux0R4++3vCV1pr4QUIkhe+BmD2QqhP3+7xNCuBKI2jad++tOpdS8IQ4t
 5bBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zRMhT/d5G2sI4A1I7GlvZGkB/RBVwmCv9rkja5zBPHY=;
 b=mAHzNhFSwtGgVxt8NE0z8zmwt45/QLnxcFzwVRi8wU3xLXhIYnzCP9OxB3Mtq8IJtU
 usFBkns6lA4z5SHJRTeBzx0koGR6uQ8/aUi+Fu3lcDNYhiguqYuExIK5F/JRwS1Loush
 v770DvfkEvEpe0WB03IpkpKodePYkDKQJs3lnb+2nVM1r2TmPdNzKg7dDTeRHaNQ/Jf1
 in2ZmGlftK5JzAX9UOjCc67zgCR36zh/uKK09eDXJUVpk71RrzuC9WD+MdE5++qMFH/u
 js56J67LvHZ0VmYJ6KZ+ph4hsmolOauCl+vvvj6kfaAizyaTo3dw1oEpOGAcrsZQukdS
 r/2Q==
X-Gm-Message-State: AOAM531gJjg2hagFBM1DRDMuhJKOdDhGWgqQs7AQ9KTpzTbEcHXjhdSH
 v0e2EbhpeJ8dU5zlOd9kT4MpPQ==
X-Google-Smtp-Source: ABdhPJwx6vqjF4CTDNUTITNmbYj2mVfn2pzrDCenPKPz9YOvwyQKPNk5Fo2fq7cbsesteroCJkMtFA==
X-Received: by 2002:a50:cc0b:0:b0:41c:dfb8:aa5f with SMTP id
 m11-20020a50cc0b000000b0041cdfb8aa5fmr4725501edi.325.1649179153171; 
 Tue, 05 Apr 2022 10:19:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a056402238c00b0041ce094cf47sm1273036eda.60.2022.04.05.10.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 10:19:12 -0700 (PDT)
Message-ID: <0a44404b-c3f5-677f-cfbe-09a08f41adad@mind.be>
Date: Tue, 5 Apr 2022 19:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220405025054.966064-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405025054.966064-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/aufs: don't set invalid
 AUFS_SITE if version is unset
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2022 04:50, James Hilliard wrote:
> Fixes:
> package/aufs/aufs.mk:24: *** AUFS_SITE (https://github.com/sfjro/aufs4-standalone/archive/) cannot have a trailing slash.  Stop.
> make: *** [Makefile:84: _all] Error 2

  How do you get this? I've tried a number of configurations, but I always get

package/aufs/aufs.mk:21: *** No aufs version specified.  Stop.
make: *** [Makefile:84: _all] Error 2

  I could only reproduce with `make source`, but that's a bit a special case.

  Regards,
  Arnout

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/aufs/aufs.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
> index 4e95a350a0..b2dda771d9 100644
> --- a/package/aufs/aufs.mk
> +++ b/package/aufs/aufs.mk
> @@ -8,6 +8,7 @@ AUFS_VERSION = $(call qstrip,$(BR2_PACKAGE_AUFS_VERSION))
>   AUFS_LICENSE = GPL-2.0
>   AUFS_LICENSE_FILES = COPYING
>   
> +ifneq ($(AUFS_VERSION),)
>   ifeq ($(BR2_PACKAGE_AUFS_SERIES),3)
>   AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone
>   AUFS_SITE_METHOD = git
> @@ -16,6 +17,7 @@ AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
>   else ifeq ($(BR2_PACKAGE_AUFS_SERIES),5)
>   AUFS_SITE = $(call github,sfjro,aufs5-standalone,$(AUFS_VERSION))
>   endif
> +endif
>   
>   ifeq ($(BR_BUILDING):$(BR2_PACKAGE_AUFS):$(AUFS_VERSION),y:y:)
>   $(error No aufs version specified)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
