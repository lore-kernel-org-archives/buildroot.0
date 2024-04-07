Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5F5CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0E1B600C6;
	Sun,  7 Apr 2024 14:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQHLNhzwd0ph; Sun,  7 Apr 2024 14:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9A9F60788
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9A9F60788;
	Sun,  7 Apr 2024 14:45:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FE3B1BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4793F4053A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPFISpv-6xQV for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:45:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD43740536
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD43740536
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD43740536
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:45:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4162b8cb3e9so31760125e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 07:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712501105; x=1713105905;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lxAqcsyCU+y4iGfZ01jLOX8NdSF2hONZ2U8hcujpw5g=;
 b=gHo8sl31JYFOCknGM1kz72O3TRjlYdCUk2t+1Q7t44SbWlfjXyTetaTrzBAVE3h0CA
 Ikx8kUT/a9J9emrqBHmNz1/oSx3NOcjFja695ePW2959xknzyXd8NenJ+xpPb7hnPJ1X
 8knzQC2iGzuQwAwzKxbyjL0BhO3pHOcCXbsxK1jZlZFQ1dTu6fSM88HP1eB4jF0g5lhT
 FMNBSL5qcj4DWMxuWiBpvQPt+jkmtWAuGCSVFN/RkoS8/Xn4s9UeUYLk0rHC33fJNOJV
 +zR88lI6eclHEcAjiCmkUqYYlaNQUPfbF8BsSDSyqUZW4A0HTClyoJbdlvbk5gXksiO1
 qtEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8aV5pQoR8UQOwcVC6zbCNAV7qBd9t0brWdVSH5HIHRwVDlirY9cBfkTHjeZJqH1eZSmsYmF4RxcccZEBltLEHeUQHa+M8kw==
X-Gm-Message-State: AOJu0Yy7wiipR605lY51PirKto3KVI0lo3LWHqip08QYmmQRww4r706g
 iOUG1Zg3nAYWaNnk+oTmW2f5nDcGzaOhn8Oj1IpnsfZFK/PLHIW8K2cKsQpobuTbFaLYiCqQAmS
 R
X-Google-Smtp-Source: AGHT+IHqFg3j5LOGZYLFsTS0yhwrHN8E39UExwvOKBqH5SZ1eahKFf4CWPL9GsbjkAzFhry3xVEiOQ==
X-Received: by 2002:a05:600c:b99:b0:416:72a9:96bd with SMTP id
 fl25-20020a05600c0b9900b0041672a996bdmr110215wmb.20.1712501104637; 
 Sun, 07 Apr 2024 07:45:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c1c1600b004165315d885sm2960867wms.11.2024.04.07.07.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 07:45:04 -0700 (PDT)
Message-ID: <6b26a9c0-c148-49cf-86b3-0daf880122e6@mind.be>
Date: Sun, 7 Apr 2024 16:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20240304122602.1852-1-br015@umbiko.net>
Content-Language: en-GB
In-Reply-To: <20240304122602.1852-1-br015@umbiko.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712501105; x=1713105905; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lxAqcsyCU+y4iGfZ01jLOX8NdSF2hONZ2U8hcujpw5g=;
 b=cJ4Xcu+E+NZh2Vqr8R+kl35QAEqOJv2rotKDj/axASTscMDteng/bao/i/WspL/EYl
 4iWhM8MGXBc4MYu1ANFpnFUSHHq6ooQ3pw92xrid8GDJ/LWr4vHrAwUbpVDxymX4WoUs
 gPlXew5kv0v8f5IuouQHBa39WYTjo+8a34X5JTes01v+yB8HqrLm2IynDtkT2n1OKk/o
 4OgEMnhP7WwCAZZDoolVDt/xCxsEZIpDO5KL5YtAetyMKBit8FjPYof/StzUfc0wZq3n
 oqQv2VJNuIPE0XoTFlozDeHhY9FQfFUtnAKbitwhEGsW0iW77yM9OgDlYqtSxgyE4ezd
 LulA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cJ4Xcu+E
Subject: Re: [Buildroot] [PATCH] package/mpd: update to version 0.23.15
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/03/2024 13:26, Andreas Ziegler wrote:
> Version 0.23.15 change log:
> 
> * decoder
>    - ffmpeg: fix build failure with FFmpeg 6.1
> * output
>    - alsa: limit buffer time to 2 seconds
> 
> Tested on (w/ ffmpeg-6.1):
> 	i386 (build, run)
> 	x86_64 (build, run)
> 	Aarch64 (build, run)
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mpd/mpd.hash | 2 +-
>   package/mpd/mpd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
> index 4ee4967556..fe3d449cc5 100644
> --- a/package/mpd/mpd.hash
> +++ b/package/mpd/mpd.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated after checking pgp signature
> -sha256  85b9a67426d528ae9fb849eb3b10faf52d4b18d22b1fd71088e6d9a388b509d2  mpd-0.23.14.tar.xz
> +sha256  550132239ad1acf82ccf8905b56cc13dc2c81a4489b96fba7731b3049907661a  mpd-0.23.15.tar.xz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 4dbd7a6d1d..e320ad9dec 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   MPD_VERSION_MAJOR = 0.23
> -MPD_VERSION = $(MPD_VERSION_MAJOR).14
> +MPD_VERSION = $(MPD_VERSION_MAJOR).15
>   MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
>   MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
>   MPD_DEPENDENCIES = host-pkgconf boost fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
