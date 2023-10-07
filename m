Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3195E95A65
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 19:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98A0183D24;
	Sat,  7 Oct 2023 19:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98A0183D24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0_z12wr2Lqg; Sat,  7 Oct 2023 19:39:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE46E83D1D;
	Sat,  7 Oct 2023 19:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE46E83D1D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 479E11BF400
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 19:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DB9360FCB
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 19:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DB9360FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyQ5fZhLUlfv for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 19:39:04 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D0B160F8F
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 19:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D0B160F8F
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3231d67aff2so3239184f8f.0
 for <buildroot@buildroot.org>; Sat, 07 Oct 2023 12:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696707541; x=1697312341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cGEXjgrASNlDllc1uNSfMU6UKyosPnXOd6wVC42FP6k=;
 b=ZT864FpZu7lfAJ5EgWslL2c0E0cGZQ5/PDVGvi4SRWwkm9uHN+bmKpWlq6ZAi7b0Ew
 iAMQ5KSv3wWyL0NgOD0iIr8fPY5IR5gjc9TOJYmeNBFt9SGGlmmHTQGT9qojfyE4lpjT
 VRyrK8OT9CkNRYeg4P6Ko4JSN0VDhuhLcwDDG4XmPr7GNypdbnD7yXaBi4pP6dHbHWPN
 RQLHPORyQAwaNUw4DXx6lhcL0Ar2/x4/M8An4pc58NWz46HCfqIH1094Re6aSskVV3Ff
 P9rLpTVkrsHDEiLlFtRdE0bCYSNXkEqN8WMLP4KOx7t7qZjccrL8QdAlsttF9yy9Am17
 ETXA==
X-Gm-Message-State: AOJu0YxPJysBVozfBxe80sS7ZAGNRqqGBwl7JPSZMkGkbhzKk90md7xH
 Ab1Orddt/3/MO03oLj9l+IDeUA==
X-Google-Smtp-Source: AGHT+IFHcQ5C300iPQ+Ha/IbStFmUR1AhrkDZMoD3NGGzB0gLXZ+2vPXDFhFl7o/KU+BFlWxssBNuA==
X-Received: by 2002:adf:e74b:0:b0:31f:f644:de09 with SMTP id
 c11-20020adfe74b000000b0031ff644de09mr9560744wrn.6.1696707541063; 
 Sat, 07 Oct 2023 12:39:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 v18-20020aa7d652000000b00533dad8a9c5sm4200849edr.38.2023.10.07.12.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Oct 2023 12:39:00 -0700 (PDT)
Message-ID: <75eb26ce-286d-5b1e-20e9-c2833ff90781@mind.be>
Date: Sat, 7 Oct 2023 21:38:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20230122094453.1381079-1-yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <20230122094453.1381079-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696707541; x=1697312341; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cGEXjgrASNlDllc1uNSfMU6UKyosPnXOd6wVC42FP6k=;
 b=Y0psXQqgwoRlCjg4rfTG20T8YM4EK104lhheXhDq4uCcNbEXFGUtwD13ryd6pGKBKH
 VPcVYIHFvHA+YBj+4vDYngU4lD7Ita4qEYO7lA4TdD9aLJlRItMZMXtn1eojlQQ2tXW9
 2Qb/68H5wSkHW8XWG5VPLcmh1do8iSvjgd+B8y2goAA0Fvn0ODrDF7fpglrIei609G4W
 adCrcDS5Dw5i57j/GWAH6LQfDcOoTfJwf1KhdGw4eIaRfclpXeM5nkS8Zdl558zdoDVm
 urDo0hPp0Hax8a13Dh6aYziQFfuvMFb/lHPTr84F7UedTwIrqFSsqpmt2h0tDNHJKVwR
 oc0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y0psXQqg
Subject: Re: [Buildroot] [PATCH] system: add option for packages to require
 /bin/sh
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
Cc: Norbert Lange <nolange79@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/01/2023 10:44, Yann E. MORIN wrote:
> Some packages will require that /bin/sh exists and is a valid shell.
> 
> For example, system needs a shell, but does not care much what it is. We
> could provide it with whatever the user configures as BR2_SYSTEM_BIN_SH,
> but that can be empty because of BR2_SYSTEM_BIN_SH_NONE.
> 
> So, we add an option to restrict the choice and forbid BR2_SYSTEM_BIN_SH_NONE
> from being a selectable option, this ensuring that there is a shell on
> the system. As a side effect, it also ensures that /bin/sh exists.

  In Buildroot, we assume that the user is smart enough to not remove the basic 
Unix tools from the system (sh, sed, grep, ...) unless they know very well what 
they're doing. BIN_SH_NONE is there for various situations where none of the 
other options are appropriate:

  - a system which doesn't have a shell (or maybe even init system) at all;
  - /bin/sh is already provided by a custom skeleton;
  - /bin/sh is provided in some other external fashion, e.g. this is not a full 
rootfs but just an overlay;
  - /bin/sh is provided by a package in BR2_EXTERNAL;
  - probably there are use cases that I can't even think of.

  Except for the first one, in all of these cases it should be possible for the 
user to still enable systemd (or any other init system).


> For systmd, we can then just tell it to unconditionally use /bin/sh as
> the default user shell, and that will also match whatever the user
> selected as the system-wide default shell.

  Well, if we go that way, this patch should always have been there, because the 
other init systems rely on /bin/sh even more (for executing /etc/init.d scripts).

> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Norbert Lange <nolange79@gmail.com>

  Norbert's feedback was also not in favour.

  Therefore, marked as Rejected.

  Regards,
  Arnout

> ---
> Note: this is a prerequisite for the bump to systemd 252.4:
>      http://patchwork.ozlabs.org/project/buildroot/patch/20230115114840.9027-1-nolange79@gmail.com/
> ---
>   system/Config.in | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 806a747315..963192cb3f 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -320,6 +320,17 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
>   	  the very least use a strong cryptographic hash for your
>   	  password!
>   
> +config BR2_SYSTEM_NEEDS_BIN_SH
> +	bool
> +	# Busybox has a shell that does not need an MMU, but all the
> +	# standalone shells need one. If BR2_PACKAGE_BUSYBOX is not
> +	# set, BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is set, so we just need
> +	# an MMU.
> +	depends on BR2_USE_MMU || BR2_PACKAGE_BUSYBOX
> +	help
> +	  Have your package select this (and proapgate the dependencies)
> +	  if it absolutely needs /bin/sh to exist and be a valid shell.
> +
>   choice
>   	bool "/bin/sh"
>   	default BR2_SYSTEM_BIN_SH_DASH if !BR2_PACKAGE_BUSYBOX
> @@ -360,6 +371,7 @@ comment "bash, dash, mksh, zsh need BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
>   
>   config BR2_SYSTEM_BIN_SH_NONE
>   	bool "none"
> +	depends on !BR2_SYSTEM_NEEDS_BIN_SH
>   
>   endchoice # /bin/sh
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
