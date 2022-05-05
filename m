Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EE2C433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 19:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40EC360BAC;
	Thu,  5 May 2022 19:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VgmiUrj4lJns; Thu,  5 May 2022 19:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DDE660B8B;
	Thu,  5 May 2022 19:45:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E591C1BF376
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 19:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E158D419E5
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 19:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FCtvEpQYleh8 for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 19:45:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68FDE419AB
 for <buildroot@buildroot.org>; Thu,  5 May 2022 19:45:50 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id p4so6415813edx.0
 for <buildroot@buildroot.org>; Thu, 05 May 2022 12:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gQTITR6npcy8IhvaQq+cMzecqTGjoWCQ//N+yPvuRbU=;
 b=giAsjnLzQSBfNPTNZLqh5uK3UQTj70EsLJbu01kIWif7E11m8sh67oKzKyn2P2EczZ
 Yh3ikxrveIhjyI/gQ/IVhMtXDczvVQhHEP3JR25L/YkJ47wbMTo/VQZs0nXA0YIG7e3k
 74/WIeyRWDNlzy/QzJIRfyGktyTpNZT80dImkomCfaKBzKkNujygjQ9QXJ5hKrCX39S7
 Bl08p4ATh/scg+f3iuNtphXnvwESlha/v0AazsKBczK/GpjVw5T2Juo0T63ThJEsPrjd
 aZPgHohiADIHjMa6kUGAR0y3ec5AZFCsy8QB8ywUGYNuYmO4xPGejOQnAsvTQN3eza5a
 Jj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gQTITR6npcy8IhvaQq+cMzecqTGjoWCQ//N+yPvuRbU=;
 b=TZt3YSVB/buEjbm3zVbzWsyxWXVGfeYKVZEKpR3z3utlBaCQU95m9nryxxR7znF3ke
 78/ykbiyEKWdOuii5i/7gTRiNRJohks7UwXSScVDMLZ7OFgs8KsBcrBGX0PnLMedrTWd
 RYKgDLY1XKMl0r0TF3OMxCL2NVCG1QF3UtRn4LMfUYBsm1Qf5ofM/sf+w5TCE6alFBaW
 L0BQeGRsjDQf3mK1nKuz+UoX+0udZLkL509p/rs2pyVXyc8am+LeLlPgfcY8weAw2KfJ
 yE8180bynbiEk1liHHNGf3YMWGYUvfxgR14i6z8+9MU/DMOpQINMlNFWVSDCj2SWWUAU
 A3xw==
X-Gm-Message-State: AOAM53081Wa2F7qjQ3uWjhYPM4nDRIPb3/Jx3SBvDERRoMKJLitxMOoY
 9r10tw4YJ9DWTlDd0xh/8elwXQ==
X-Google-Smtp-Source: ABdhPJyddlehJ+WkdN0Ry3XWp9robpJ0/gpsr7bMzswcW3hFyGLtsZdgQgmRGWV5xKXLtHniYwXH8g==
X-Received: by 2002:a05:6402:2204:b0:426:34f1:1d2d with SMTP id
 cq4-20020a056402220400b0042634f11d2dmr31862417edb.335.1651779948523; 
 Thu, 05 May 2022 12:45:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b006f3ef214dc8sm1090780ejc.46.2022.05.05.12.45.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 12:45:47 -0700 (PDT)
Message-ID: <c33b9edf-679c-e311-8e54-7955fd334515@mind.be>
Date: Thu, 5 May 2022 21:45:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
References: <20220505100956.155737-1-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220505100956.155737-1-joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH] package/gcc: Disable uclibc for powerpc64
 and powerpc64le
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/05/2022 12:09, Joel Stanley wrote:
> uClibc-ng does not (and has never) supported the 64 bit powerpc
> architecture.

  Exactly, that's why we have

config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
	bool "uClibc-ng"
	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
		   BR2_arm     || BR2_armeb    || \
		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
		   BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || \
		   BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
		   BR2_x86_64

  Can you give a concrete defconfig where it is possible to select uClibc for 
powerpc64?

  Assuming this is a mistake, I've marked as Rejected.

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> I'm a bit confused as to why uclibc was ever an option. Perhaps I missed
> something! I did a search of the mailing list archive and the best I
> found was this post from Thomas:
> 
>   https://lore.kernel.org/buildroot/20160817193721.0cc1466d@free-electrons.com/
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   package/gcc/Config.in.host | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index a1fe192d3a24..3364860ec7a4 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -31,6 +31,8 @@ config BR2_GCC_VERSION_9_X
>   	# upstream gcc. C-SKY gcc upstream support not tested
>   	# with upstream binutils and glibc.
>   	depends on !BR2_csky
> +	# 64 bit powerpc is not supported by uclibc
> +	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_powerpc64 || BR2_powerpc64le))

  This isn't the way to do that - the result would be that if you have uClibc 
selected, there is no choice option available for GCC. You have to do it in the 
uClibc config (like it is now).

  Regards,
  Arnout

>   	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
>   
>   config BR2_GCC_VERSION_10_X
> @@ -43,6 +45,8 @@ config BR2_GCC_VERSION_10_X
>   	# upstream gcc. C-SKY gcc upstream support not tested
>   	# with upstream binutils and glibc.
>   	depends on !BR2_csky
> +	# 64 bit powerpc is not supported by uclibc
> +	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_powerpc64 || BR2_powerpc64le))
>   	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>   
>   config BR2_GCC_VERSION_11_X
> @@ -54,6 +58,8 @@ config BR2_GCC_VERSION_11_X
>   	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
>   	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
>   	depends on !BR2_sparc
> +	# 64 bit powerpc is not supported by uclibc
> +	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_powerpc64 || BR2_powerpc64le))
>   	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>   
>   endchoice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
