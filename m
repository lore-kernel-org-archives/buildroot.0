Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5F8C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33ED460BC1;
	Mon,  1 Aug 2022 17:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33ED460BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id peul0FXeFRJ0; Mon,  1 Aug 2022 17:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49EEC60803;
	Mon,  1 Aug 2022 17:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49EEC60803
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD3481BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EFCA410D5
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EFCA410D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9_umlK4X5lpw for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:46:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5AFC408A2
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5AFC408A2
 for <buildroot@uclibc.org>; Mon,  1 Aug 2022 17:46:22 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id a89so14726147edf.5
 for <buildroot@uclibc.org>; Mon, 01 Aug 2022 10:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3QX+IULZCdd2enAY8tYfmNaVKJZefxO+/zB0cVEDJJ8=;
 b=aLJR95BXEOt75v6euFKCmcYrpx5RrldtzJSw1dqqPP5saBlcgnq8A6rDUl6DF0Lj6t
 agoFPrHsSApPu69w3kLETocFFKbypHsGDxW5P9XMfPwUQAW9V7N+uhjrITep0SOC0Nmf
 WAOd5FYM8Q2R3eC1NyawBgInI+LON6nV43yZHUfsmKf2m/vygauliWonCQMxiSoXufeV
 UbtuRUeHC84q1H0wR0w9jMmBLfvpQpz3t95/TUP4vUXbGdIHJQkwh7gurhdfOU0oSp3F
 cf5HZU4k+73P+zADLvGoUGKUDT5NHxlkuRXh6zIpq0Z9TVLi9AN5elNalURisG5M6YU4
 wF0w==
X-Gm-Message-State: AJIora9F1AOJtb38u9gRmiLfT3iOkUMWPlW+MFpFGg0yev3JiTQpBNNV
 ypkRdpYBM9eeSwtouFi0NGyqag==
X-Google-Smtp-Source: AGRyM1scHTANH1aoTwteItph9pz9LJ5UFsFDVSNIwOvWIhq6XlPBfJ1SF7X9EtfuPY9/W2swmZZ2jw==
X-Received: by 2002:a05:6402:450d:b0:43b:d99:6d4f with SMTP id
 ez13-20020a056402450d00b0043b0d996d4fmr17202073edb.39.1659375980802; 
 Mon, 01 Aug 2022 10:46:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b006fee98045cdsm4408311ejo.10.2022.08.01.10.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 10:46:20 -0700 (PDT)
Message-ID: <7bf9f809-a7cd-653c-4948-b3c9ea5f7488@mind.be>
Date: Mon, 1 Aug 2022 19:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@uclibc.org
References: <20210810120134.3972324-1-fontaine.fabrice@gmail.com>
 <20210812234247.3618da82__12747.8516822279$1628804602$gmane$org@windsurf>
 <pan$781e4$7f830434$f8b8178c$4f096736@ID-313208.user.individual.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <pan$781e4$7f830434$f8b8178c$4f096736@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3QX+IULZCdd2enAY8tYfmNaVKJZefxO+/zB0cVEDJJ8=;
 b=LQRkA9uQiQ+2RYDpgrRRlOg8CjQtAno3Pilkp2rNSKRy1AOY6CQqclxe/mkBumvjD/
 dJTYN5a9R3hGnW5uhPXvSOi/k0Z43Qdjbc7PFCu1Q9XdhgC8wz0QwF8Zu4rL9hNI3GOB
 Owa7ZfiDmX38CyHZO4JyWUFGJMWnMWJvSAVhkC9LkB29tidDqsgHF9+0Drfx6Hf/cQ0a
 gRb/9AjogUOjdPGPfWhaVIF2+Xf2HmXPfOg54Id+kxaXr38qeQM6gLys90CZrjWy3hvn
 0pLJrM8W77JnmkCBGAha43yiiqvmmwpW30rtz899VCYIn4SWWK8Xip2t5NhWiqr/Wn2v
 CIpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LQRkA9uQ
Subject: Re: [Buildroot] [PATCH 1/1] package/flatbuffers: fix locale
 independent on musl
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



On 30/07/2022 18:23, Bernd Kuhls wrote:
> Am Thu, 12 Aug 2021 23:42:47 +0200 schrieb Thomas Petazzoni:
> 
>> I have seen the feedback from upstream that this workaround potentially
>> breaks bionic and BSD systems, but as we don't care about these in
>> Buildroot, I applied your patch to master as a work-around. Hopefully
>> upstream will implement a better/long-term solution.
> 
> Hi Thomas,
> 
> unfortunately upstream rejected the patch without an alternative
> solution. Now I stumbled across the bug while building kodi with a non-
> local uClibc toolchain and being unable to fix the flatbuffers headers.
> 
> This is the defconfig:
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON3_PY_ONLY=y
> 
> Would it be acceptable to include this fix in the kodi package
> https://github.com/bkuhls/buildroot/commit/
> fa6d0d742d970836ef81b8ecbf5c1885d4be94dc
> 
> although the problem really exists in the flatbuffer package which does
> not store the result of its configure checks for strtoll_l and strtoull_l?

  I don't understand... We have the patch in Buildroot, so the corrected header 
should be installed to staging, right?

  Or does your build somehow use the bundled flatbuffers instead of the 
staging-installed one?


  Regards,
  Arnout

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
