Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64270C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 19:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA40F412CA;
	Fri, 10 Dec 2021 19:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMn1m20pOM6D; Fri, 10 Dec 2021 19:07:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0926412CB;
	Fri, 10 Dec 2021 19:07:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97B6A1BF3D4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94C43854A7
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMci75Pv5lZ7 for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 19:07:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45435854A4
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 19:07:54 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id r25so32459459edq.7
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 11:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kKWehndau+rq5HSvp380CHb+L4xzCW1eXNnSJgH5Ozw=;
 b=KD86DogvuyNm0SWbNavWxiWSg5yzx89FGDar4jeAJgG5Yy1xnvlABgOK9YyUslLBeU
 Dil1Uj+3TGdls8UmbdoPSMNdXXNUHz1jrxDVDie47ftqrEbVsWcjk+4iS53WGKk8SlsQ
 xvx41KIRhrentxCG8xDGWOkgFSDEkwqckJ+EBRH7ds6i39OnrypZClYIxV6BKgdSOFNK
 qhZagVJKHjjsKyAOj0CQNYXtUzVkEFZdrdPPImmOd7AN6cQdo463XRzUh3xm5vwhakXn
 wwZr93jWHzquVUC93sbndHa0d7+a3RbUDpWxvG1AQvwyLchNM6TuwjrRZRkr/l6R93GG
 qxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kKWehndau+rq5HSvp380CHb+L4xzCW1eXNnSJgH5Ozw=;
 b=uGdW++HZTb5t+Asq6fvoqCvugrdYN0mqyUHZfAxvuHPAxSUiNLOZgqjrpnS1264O/r
 HN+er96pGBOJg/n5ppNloA56tB8xZUTzQng7WEsOrwcL1OKpTo+4WkEdfImfGH/At1nH
 ax6YBCtmXVMczoZrQXytLZLuyo3/jWuG5XnzabIbi7BNHe9WLRpybNH5z4Q8GRc+tJye
 jF9Jj6UjDtOWX7kzw1AKyGveDe/1qkM8hEf5iK9BhenBJjSFXkEtfLBQ1pU8AumqtcTi
 E1PwXIJXGq4d0f0PSjAMK5QBdQnlbFIXO5i+00kxZxfXoeqHofXsjZIpaaZqZWeMYkDb
 2fnA==
X-Gm-Message-State: AOAM533K2ZVtmKs8+fe6QdvnbXxT8VLeMqoD6mP31IRaBHGFiLxVz+SP
 cNkY6sigNn28qksxZgbR+aM6NLjifO5XeQ==
X-Google-Smtp-Source: ABdhPJz4DPFkubyO6MUImQq8dDZpToq9/kDSszXmrIqijjavDfgjHhnW6fakr/T7Uq3R5J0UTjNmmw==
X-Received: by 2002:a05:6402:2930:: with SMTP id
 ee48mr40216862edb.295.1639163272448; 
 Fri, 10 Dec 2021 11:07:52 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gb18sm1893869ejc.95.2021.12.10.11.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:07:52 -0800 (PST)
Message-ID: <c4805ac2-9607-0395-dac7-d4183cac22ac@mind.be>
Date: Fri, 10 Dec 2021 20:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20211114160803.5ce09ba5@windsurf>
 <20211115123212.11841-3-br015@umbiko.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211115123212.11841-3-br015@umbiko.net>
Subject: Re: [Buildroot] [PATCH v2 2/2] package/mpd: update to version 0.23.y
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
Cc: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/11/2021 13:32, Andreas Ziegler wrote:
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

  Applied to master, with a bunch of fixes.

  First of all, since this is a rather complicated commit, the commit message 
should be a bit more extensive, mentioning what changed and why.

> ---
> Changes v1 -> v2 (after review by Thomas Petazzoni):
>   - Config.in.legacy: add entry for legacy MPD UPnP configuration
>   - Config.in: rewrite UPnP help messages
>   - mpd.mk: add fmt to MPD_DEPENDENCIES
>   - mpd.mk: disable openmpt, pipewire, snapcast
>   - mpd.mk: update to version 0.23.3
> 
>   Config.in.legacy                              |  8 ++++
>   ...build-add-atomic-dependency-for-spar.patch |  4 +-
>   package/mpd/Config.in                         | 41 +++++++++++++++++--
>   package/mpd/mpd.hash                          |  2 +-
>   package/mpd/mpd.mk                            | 23 +++++++----
>   5 files changed, 64 insertions(+), 14 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 5b48566f68..09b7e5983e 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,14 @@ endif
>   
>   comment "Legacy options removed in 2021.11"
>   
> +config BR2_PACKAGE_MPD_UPNP
> +	bool "MPD UPnP configuration changed"
> +	select BR2_LEGACY
> +	help
> +	  From version 0.23, MPD supports npupnp in addition to pupnp to
> +	  provide database access to a UPnP media server. To preserve the
> +	  existing functionality, select pupnp in the MPD UPnP configuration.

  Legacy handling for choices is peculiar. See the documentation at the top of 
the file. Basically, you want to make sure that BR2_PACKAGE_MPD_UPNP_PUPNP is 
selected automatically. I fixed all that.

  Also, the line length was too high. Please use check-package to verify your 
contributions before sending.


[snip]
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index e105352b80..382c003e28 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -4,17 +4,20 @@
>   #
>   ################################################################################
>   
> -MPD_VERSION_MAJOR = 0.22
> -MPD_VERSION = $(MPD_VERSION_MAJOR).11
> +MPD_VERSION_MAJOR = 0.23
> +MPD_VERSION = $(MPD_VERSION_MAJOR).3
>   MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
>   MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
> -MPD_DEPENDENCIES = host-pkgconf boost
> +MPD_DEPENDENCIES = host-pkgconf boost fmt
>   MPD_LICENSE = GPL-2.0+
>   MPD_LICENSE_FILES = COPYING
>   MPD_SELINUX_MODULES = mpd
>   MPD_CONF_OPTS = \
>   	-Daudiofile=disabled \
> -	-Ddocumentation=disabled
> +	-Ddocumentation=disabled \
> +	-Dopenmpt=disabled \
> +	-Dpipewire=disabled \
> +	-Dsnapcast=disabled

  meson complains about 'disabled', it has to be 'false' (it's a boolean, not a 
feature, apparently). Have you tested this?

  There's likely going to be some more fallout from this version bump, so please 
monitor the autobuilders. Or better yet, add yourself to DEVELOPERS for mpd.


  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
