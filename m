Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02A4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 19:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F42360E63;
	Sat, 12 Mar 2022 19:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3z5CWtayVc1; Sat, 12 Mar 2022 19:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF6460E56;
	Sat, 12 Mar 2022 19:42:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3C0B1BF3E8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE86F40486
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKm7ylQ8ifSk for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 19:42:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A30304000B
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 19:42:19 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g3so14880835edu.1
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 11:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2IX/oa/HXMm4Fy8g0gaoxAyqHMuPDNif4Pt87gAnuCU=;
 b=brBiq3t+37XPi8+VAbyhWQiV4busxKYbSuXHodzF3TopCrQ7EvM7PQ6eT9XaEEiV/I
 QCB9keeOwRBZ5jriQmgFO0vvPuDrjstS19GXtB0pCgLVx9EZZq14NAnJeyGaYosVD4f2
 hXCEnaY4RHsfs+Ha10EI7KNNOqd1j3OFB402/CO7wdcckWDUqS2W75SHeOLphaRQJSW/
 MaYcRoXNGURc+8xYtdUsZ1+MGAXYqXPJqBho14VvThqbZYxev4fxEiPOx7SL0y3qlfcP
 IdC8O/12Z7W90oTDWCyXwZDarnsVOzTw50sg70llb8yDS/akZn086mbZioPtqHs7WTCj
 s4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2IX/oa/HXMm4Fy8g0gaoxAyqHMuPDNif4Pt87gAnuCU=;
 b=zmP7FWSWtCEgJyQgp2RWg6PrwTsG6c+nxii3AFDBoU5hTCudhgE5Qo4fwbqvoCx6oK
 YTWVL1feLYBKpHWHWGwLur0qyN+PUKEyiCBsxItayQG/3q/XO5oPaPRqfN2Bxl8d7Qid
 8e2xcEUc4E6PB+DgahoFke07vaFcvJ0C4OMeonu+5H9E2wHw2hEE02HPm4zkYJZhNXwq
 nomZCvs4szuyo3B3R8h5bz9DdgywwHFqeOOhKCkixQ0T0RrHJ6UT5VQIg3TpdsA28LHB
 uKAKEob3SuP2/Prg0gtoX7gU2dB12/DLyBVKQerDp+vLQK57A/HH4WUs11nVN0r5O5Cp
 iPGw==
X-Gm-Message-State: AOAM530CL26cuZ+7jL/frkCf3kCG3yC26+PlTb9UF/QwvHv/pIlWfdL+
 PqeuUaRJh0Cuar2dQpsYsV1QT1J3OpD2KQ==
X-Google-Smtp-Source: ABdhPJw30IIyv7SRGBBqPPT/8sNSJoeGtiP5/VLcaXijXxz166IDogcQ+6tVdl3d1dBVil72juwiQQ==
X-Received: by 2002:a05:6402:11c6:b0:416:3751:d700 with SMTP id
 j6-20020a05640211c600b004163751d700mr14376124edw.97.1647114137582; 
 Sat, 12 Mar 2022 11:42:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r23-20020aa7da17000000b00415a1431488sm5264106eds.4.2022.03.12.11.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 11:42:16 -0800 (PST)
Message-ID: <d358224c-ec31-1a9a-5f04-30e183178a40@mind.be>
Date: Sat, 12 Mar 2022 20:42:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220223075322.3044754-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220223075322.3044754-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH] package/mono: bump to version 6.12.0.122
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



On 23/02/2022 08:53, Angelo Compagnucci wrote:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  Applied to master, thanks.

  I also updated the hash file with 2 spaces.

  Regards,
  Arnout

> ---
>   package/mono/mono.hash | 2 +-
>   package/mono/mono.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mono/mono.hash b/package/mono/mono.hash
> index 2477e9231c..ad070bf102 100644
> --- a/package/mono/mono.hash
> +++ b/package/mono/mono.hash
> @@ -1,5 +1,5 @@
>   # sha256 locally computed
> -sha256 51de5c02ad511333f93ff585bca54c8784de35af4ff27b759d16b46c4402cdac  mono-6.12.0.90.tar.xz
> +sha256 29c277660fc5e7513107aee1cbf8c5057c9370a4cdfeda2fc781be6986d89d23  mono-6.12.0.122.tar.xz
>   sha256 923c7053ad0d430cd9b0b69a0ccf3abb7170a1ce50ecbf01915b565a35823d10  LICENSE
>   sha256 fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
>   sha256 2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
> diff --git a/package/mono/mono.mk b/package/mono/mono.mk
> index 27f7886224..219effc5d3 100644
> --- a/package/mono/mono.mk
> +++ b/package/mono/mono.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MONO_VERSION = 6.12.0.90
> +MONO_VERSION = 6.12.0.122
>   MONO_SITE = http://download.mono-project.com/sources/mono
>   MONO_SOURCE = mono-$(MONO_VERSION).tar.xz
>   MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
