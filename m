Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209C3C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 19:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7F144031D;
	Thu, 28 Jul 2022 19:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7F144031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7X65mkirESiN; Thu, 28 Jul 2022 19:14:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3545402BC;
	Thu, 28 Jul 2022 19:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3545402BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52F051BF21A
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C86541720
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C86541720
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4lfr6SD4MBaF for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 19:14:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1459141703
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1459141703
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 19:14:45 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id os14so4756412ejb.4
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 12:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7Y6dkevwxpPPLzf02JAyxA77O/HokABGNWsI8cVULuM=;
 b=UrCPwrwYNmsUvqdH/O6RGwoBOmbx0f4R6y01p3j43JjJu89ygr5T4BSBq8cmKrBwfF
 ZUHGuxp3fCskRWAWBTwQ4p+qkVeo5GnTq3BW37tRFT8RwERTYdU+CapvZ9q3hFnawd3B
 69PSDOZRf0PKmlAAhD/SvIbKnhS3COIECWn0/1QvHEdepRq+apO3E4n4sMwIZHJ0aCAl
 oFWHVqp1JQmVWEGjFtpuXC6dUe2186Tdh73HRbFFdvKQziXuXBiP6uIKDA2WRbvodYe9
 IUI61ho6x4z0muGqD0sG7q58FVZzcciP9JuXXBnlAYEw18vHbBlzNp6iVFMvvVgww2MF
 4zYQ==
X-Gm-Message-State: AJIora/Cq8VCzkpnlJazxYbQy+wvBVhDupFrrda0YLYsMY/sf50d/qw1
 3rDm+fQ7d8p+/xqYaRjqTrlbRfPm/fPYBsn+
X-Google-Smtp-Source: AGRyM1ssKLTtmHnz7F+xVlIe47cPowyCNMHbZ7WJcw7A59IQJbQGhT67dCTJ5GkdnO9p3dppUnsv7g==
X-Received: by 2002:a17:907:28d5:b0:72b:4d89:9c6d with SMTP id
 en21-20020a17090728d500b0072b4d899c6dmr295151ejc.128.1659035684313; 
 Thu, 28 Jul 2022 12:14:44 -0700 (PDT)
Received: from [10.101.1.216] (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32]) by smtp.gmail.com with ESMTPSA id
 d18-20020a17090694d200b00704fa2748ffsm727731ejy.99.2022.07.28.12.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 12:14:43 -0700 (PDT)
Message-ID: <a8bc1cc1-4ff7-43a7-6239-9d9da91fb570@mind.be>
Date: Thu, 28 Jul 2022 21:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20220222102211.74573-1-nolange79@gmail.com>
 <20220222102211.74573-7-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222102211.74573-7-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7Y6dkevwxpPPLzf02JAyxA77O/HokABGNWsI8cVULuM=;
 b=LhqvAUBaB4c8LB2Jueo7doxhFrwW308N9MTxuRPGtRZ2Y4pF+2VgDwAc68ONzbkh1V
 +1HY6RH44FUOsVE/vpGdNHWNe53Ba4IMuem1rLRxzjwLNaVmoWPVwkh42HrFrn5qip15
 WOxu3cIRorEI1EDdTA4F4Vc+fTEPhd64XzZ8B/NbjZhLe2gpEH4GTFEt6RjbGx2ImCKi
 1HdPmFPbrxzJt8dVIoQb7ID0A1H2gSg+v2nvNdhTs28pRi6VpMQcjO14R2ZRKZQ7qoIO
 yyMeLVHrD9wUrVOjS+dVx1CMkAXeat81iTDnyOliKehxVbFMghuSQmg0UV7YOw0ST0sQ
 AbqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LhqvAUBa
Subject: Re: [Buildroot] [PATCH v3 6/7] package/zsh: Enable dynamic modules
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
Cc: Phil Eichinger <phil.eichinger@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/02/2022 11:22, Norbert Lange wrote:
> The autoconf scripts seem to assume that no dynamic loader
> is available if crosscompiling.
> This results in only a small set of modules being enabled
> and linked statically.
> 
> For comparison, debian patches the fallback to enable
> dynamic modules (unconditionally).
> 
> This commit enables modules if shared libraries are enabled.

  While reviewing this, I noticed that there are many more things that zsh uses 
TRY_RUN for, so I'll send a patch with more cache variable overrides.

> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> 
> ---
> v1:
> -   so far only tested with glibc

  Perhaps we need a runtime test? I'm not actually worried about non-glibc 
libraries (though I would make the runtime test with uclibc). It would however 
be useful to have a runtime test that checks 32 and 64 bit targets - the patch 
that I'm sending is mainly about that. Currently it always assumes 32 bit (which 
I guess is mostly OK anyway).

  Regards,
  Arnout

> ---
>   package/zsh/zsh.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
> index c5ab7c2fae..c26a00c430 100644
> --- a/package/zsh/zsh.mk
> +++ b/package/zsh/zsh.mk
> @@ -36,6 +36,14 @@ else
>   ZSH_CONF_OPTS += --disable-pcre
>   endif
>   
> +ifneq ($(BR2_STATIC_LIBS),y)
> +# zsh assumes shared libs to be not available when crosscompiling
> +ZSH_CONF_OPTS += zsh_cv_shared_environ=yes zsh_cv_shared_tgetent=yes \
> +	zsh_cv_shared_tigetstr=yes zsh_cv_sys_dynamic_clash_ok=yes \
> +	zsh_cv_sys_dynamic_rtld_global=yes zsh_cv_sys_dynamic_execsyms=yes \
> +	zsh_cv_sys_dynamic_strip_exe=yes zsh_cv_sys_dynamic_strip_lib=yes
> +endif
> +
>   # Add /bin/zsh to /etc/shells otherwise some login tools like dropbear
>   # can reject the user connection. See man shells.
>   define ZSH_ADD_ZSH_TO_SHELLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
