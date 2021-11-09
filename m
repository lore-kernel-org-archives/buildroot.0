Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2EEC433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:18:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F04561A07
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F04561A07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C97781819;
	Tue,  9 Nov 2021 22:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bbCN4nWGNadH; Tue,  9 Nov 2021 22:18:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C03881815;
	Tue,  9 Nov 2021 22:18:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58B4F1BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 470E440450
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YO9YksPvtFho for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:18:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 453BE40454
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:18:45 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c8so2253648ede.13
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 14:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1WwY3yZRsvk3E2E6blOE3aen4LcGsVTW7z1jGIG1BfM=;
 b=Kx1TTInmpPqCOy9mSpIesEooL4CeP4xcMyZigaMfMnxLtzBhJ76lKBZZn25iEO/3Xc
 rGbEx+HSbspiPV40Fo+4pzfIbIbmuz8wGbryK4/RaMA+99Zd7U3zZTHIXoXlxVvLVRJ6
 WvmGS8Zlp0hew1edIoowEhBvRRa8mzuUkChT9MhnHpf7hq/SjpnTZ7jMWWJgCL0OiTF8
 V+n8T1mTOKhjXeafbvQjzv5Keg4TMhfrHCHL2IMqCDIpFDXMHwaT9hpSzol70RNUzokm
 PU0p7FGj/nFlc52rNNMHGdS6t0wo7scZEhCPkD6dauuy0UTecq/6UfUQ8bb6uFWcXXzi
 QlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1WwY3yZRsvk3E2E6blOE3aen4LcGsVTW7z1jGIG1BfM=;
 b=j9pnZuPjcEcKPvGebVR7VDRp3XwUgYcfIxyQE2oMIwImdmNzPqgjrKUCiLSetKqiTB
 Ma5P+PPPmo1jlLvSI+hAbdtO7Y81ZqNdDVtyeraxyErnxnojHzBty3gHfM4Wam188nHT
 T7dyY222z9v3mrWZBdpAfwrIy1mBygsGZ95PEII0yAnNriowV+aqrj8FyiNWXBfyW5ud
 KtpJpXoNB6Wi6MAl2ryHkX7IBEyPpaCm9KoKVsLIQzReh8hYJv2loseUP/sd/gHplGHX
 u2WqH10vqx2gX7Tm2Lf/k24uSZHqPtKbKmtI8C0SBM/RfDkWkjD4cysMiSKofVZKXru2
 oldA==
X-Gm-Message-State: AOAM531DdPmnt3cHmB3tp1zuO6PiwwBVvNo1nc4BC3bdPRtjnM6BqcMl
 OkS+7D1eGbdoodQR7c++3YMa2Q==
X-Google-Smtp-Source: ABdhPJxlPpgTW9Q6HGCQg5EoizvD+f1I4ZqPa0dh+pDnKZ+fFCyntassb8d/0w05X7mA/Wn6EvLaDg==
X-Received: by 2002:a17:906:2a06:: with SMTP id
 j6mr14243077eje.401.1636496323484; 
 Tue, 09 Nov 2021 14:18:43 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d13sm1346321edv.29.2021.11.09.14.18.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 14:18:43 -0800 (PST)
Message-ID: <c74d146c-cbb4-5f42-812f-98fb01667d2f@mind.be>
Date: Tue, 9 Nov 2021 23:18:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211105130515.2275926-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211105130515.2275926-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: drop tidal option
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
Cc: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/11/2021 14:05, Fabrice Fontaine wrote:
> tidal option has been removed from mpd since version 0.22.10 and
> https://github.com/MusicPlayerDaemon/MPD/commit/97c43954e8df3f772899cda951ad5a7dd4a24f25
> resulting in the following build failure since bump of meson to version
> 0.60.1 in commit 78d3f2ea03dfba07a73fe0405c2aa4778f063ce3:
> 
> ../output-1/build/mpd-0.22.11/meson.build:1:0: ERROR: Unknown options: "tidal"
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/b8c5879a02078f4962088dff5ae2ede1f0e6b805
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   Config.in.legacy      | 6 ++++++
>   package/mpd/Config.in | 7 -------
>   package/mpd/mpd.mk    | 7 -------
>   3 files changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 24d0dc1d51..3551dd9982 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>   
>   comment "Legacy options removed in 2021.11"
>   
> +config BR2_PACKAGE_MPD_TIDAL
> +	bool "mpd tidal option removed"
> +	select BR2_LEGACY
> +	help
> +	  tidal has been removed from mpd since version 0.22.10.
> +
>   config BR2_PACKAGE_MROUTED_RSRR
>   	bool "RSRR for RSVP removed in mrouted v4.4"
>   	select BR2_LEGACY
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index b075df0d03..e5de77f1bd 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -58,13 +58,6 @@ config BR2_PACKAGE_MPD_SOUNDCLOUD
>   	help
>   	  Enable soundcloud.com playlist support.
>   
> -config BR2_PACKAGE_MPD_TIDAL
> -	bool "tidal"
> -	select BR2_PACKAGE_MPD_CURL
> -	select BR2_PACKAGE_YAJL
> -	help
> -	  Play songs from the commercial streaming service TIDAL.
> -
>   comment "Converter plugins"
>   
>   config BR2_PACKAGE_MPD_LIBSAMPLERATE
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 7a18783386..14390fd0f4 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -284,13 +284,6 @@ ifneq ($(BR2_PACKAGE_MPD_TCP),y)
>   MPD_CONF_OPTS += -Dtcp=true
>   endif
>   
> -ifeq ($(BR2_PACKAGE_MPD_TIDAL),y)
> -MPD_DEPENDENCIES += yajl
> -MPD_CONF_OPTS += -Dtidal=enabled
> -else
> -MPD_CONF_OPTS += -Dtidal=disabled
> -endif
> -
>   ifeq ($(BR2_PACKAGE_MPD_TREMOR),y)
>   MPD_DEPENDENCIES += tremor
>   MPD_CONF_OPTS += -Dtremor=enabled
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
