Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B3DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 991EC81836;
	Sun, 13 Feb 2022 15:21:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75_ouh60a-7H; Sun, 13 Feb 2022 15:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB68E814B4;
	Sun, 13 Feb 2022 15:21:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B506B1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2840402F3
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HF_Nk0HbPnkc for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:21:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6067E402E7
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:21:29 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id p14so8370717ejf.11
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xyP03epS6YXeZJiGoquhPRnF3di1Irv/wSkTa1W4f1M=;
 b=fbt6oy3JCUrIqEyS7qyun15aqFT2h5SwZvDBZ4p3SGA3zUy415ZdIJUbRHRQY/o1OD
 YvITPJsSpyOR7U3oBPVRV8QigfuUytcehT2HjlEh6iorZWGuvzDtA9dsI/zQoWHlPUxW
 vqnXLM5ojimcznuJ5Dmw7JtpRBoq/FtlAhTk4+Kk+O3bgZQhmTJQK0/36L6VkwmVLOBH
 k0E/YS9nO37qmurtfomH1MVAxVYOo0iBTUzLYDTFrBCb3ssLy+HutrYgE8yXu7Q7pH9A
 wgonwEACumNWixtNTWzQBRbLfwq6bRZpjnBXmXYMbOYyqm+sKyPy8/sEAcjpHAxIquKU
 9YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xyP03epS6YXeZJiGoquhPRnF3di1Irv/wSkTa1W4f1M=;
 b=JG6jS8bH/brxyVfdtA6utxZXp2daQ5j2evz5sp7nVcmIDGnK9ANUodfbzRRdUIrkd+
 S0BuYiyJ87l8qpQckJ1SSIc+J/KC6/2Bv0rZAhO6TqrMVlYb7Ve5oEg/WRtmdVvHFry3
 T6LopudojSPOOa+vwp4kelR8j8jDu5LQQAVDo8+kLkvn4BkrxxoOGN1g4CH3q/Dr9L4R
 DnKpEjt5q8zSojQaud9wB66E0uw58FMCLJd5Z7LszryZ3XxFYf5mYVQcHfeBXzWiwNC+
 2R5mSDHgbAo6vQSUOpt6e1gWOEG3GBRS5OHBcuq4cBeM3s58pRw1rCGvSvZw6keD/MjX
 OogQ==
X-Gm-Message-State: AOAM530je/xTmUHlbN3ZJiSFc9YP3XohWxBaRLnv5EBgSS5debfnDCGT
 s4/OgJ1cIedPYICurx/yKxqy/Z0mR7ssOQ==
X-Google-Smtp-Source: ABdhPJxxCigvbgCTL2uKR8b3a+A4E8vyAuVnYFWadSNYJrnUaWXCIROeoxCBlyoaq5P3+Yl31IE5/Q==
X-Received: by 2002:a17:907:720b:: with SMTP id
 dr11mr8150871ejc.70.1644765687609; 
 Sun, 13 Feb 2022 07:21:27 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m12sm1010706edd.9.2022.02.13.07.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:21:27 -0800 (PST)
Message-ID: <48283b3f-b38a-051c-40cc-e8473d11e9c1@mind.be>
Date: Sun, 13 Feb 2022 16:21:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20220203094746.22715-1-br015@umbiko.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220203094746.22715-1-br015@umbiko.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: ignore CVE-2020-746[56]
 intended for FreeBSD PPP daemon
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



On 03/02/2022 10:47, Andreas Ziegler wrote:
> cpe:2.3:a:mpd_project:mpd:*:*:*:*:*:*:*:* is not a valid CPE
> identifier for mpd (musicpd.org); this string refers to
> MPD /FreeBSD PPP daemon (sourceforge.net/projects/mpd)
> 
> Since mpd does not have entries in the CVE database, put these
> two CVE identifiers on the mpd ignore list:
> 
>    https://nvd.nist.gov/vuln/detail/CVE-2020-7465
>    https://nvd.nist.gov/vuln/detail/CVE-2020-7466
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mpd/mpd.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 6f01b29c6d..a55e4adde2 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -11,6 +11,8 @@ MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
>   MPD_DEPENDENCIES = host-pkgconf boost fmt
>   MPD_LICENSE = GPL-2.0+
>   MPD_LICENSE_FILES = COPYING
> +# these refer to the FreeBSD PPP daemon
> +MPD_IGNORE_CVES = CVE-2020-7465 CVE-2020-7466
>   MPD_SELINUX_MODULES = mpd
>   MPD_CONF_OPTS = \
>   	-Daudiofile=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
