Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49167C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 13:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF07F40543;
	Sun,  7 May 2023 13:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF07F40543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQ2Xtq4hzZ9N; Sun,  7 May 2023 13:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAC1640B5B;
	Sun,  7 May 2023 13:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAC1640B5B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7ED151BF391
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 602D84187D
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 602D84187D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQnupGaHe5OH for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 13:03:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE9B54187F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE9B54187F
 for <buildroot@buildroot.org>; Sun,  7 May 2023 13:03:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id CEDAB19F57B;
 Sun,  7 May 2023 15:03:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 15:03:47 +0200
Date: Sun, 7 May 2023 15:03:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230507130347.GS252090@scaer>
References: <20230502220451.3087471-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230502220451.3087471-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683464630;
 bh=4rDSKP50s9Lea9s2UcJ/pOMoR7Dc9jcpc9huqfz4qwI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rQU0eKQFVgGKLc4CeErH9k5TLY0psMloLoNymtXF1TM6PHMhKVf1ezODC9ob3Lk7M
 2l4/+kNJZcmw23qk31OmOJX4Nr2uU1Il2Fg6nL2hvQ7bcyF8zjPXZ6+4feLO7/YOy8
 A9HlbKqCrq+sDaB/7u8bE59oo8FjtwoZVxRAwVNypYq8cBt00L/eaqEx2HQ5JLoGz9
 /XtGF6kzo8QxSXWwHv1kmqvI3Eusasrluj7zl1IHd8YJsQqSIHkNWOgYhSnzey2eRy
 bEtr3zStXO4XvhkjB6Wfz6DJU95PALdQuew8iqS95nJqs70XDTMEe6S7qw9OS7Gcby
 /xeuFwM458V4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rQU0eKQF
Subject: Re: [Buildroot] [PATCH] package/busybox: disable sha1/sha256
 hwaccel with x86 musl toolchains
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2023-05-03 00:04 +0200, Romain Naour spake thusly:
> Buxybox's init segfault when built with x86 musl toolchain due to
> recent changes about sha1 and sha156 hwaccel support in Busybox 1.36.0.
> 
> From Alpinelinux [1]:
> "main/busybox: disable sha hwaccel
>  the flag check for this seems incorrect- it triggers sha_ni use when
>  the instructions aren't available, but avx512vl/bw is - Elly on irc
> 
>  causes failures in github actions, which have avx512 but no sha_no"
> 
> The flag check should be fixed upstream by commit [2].
> 
> But init still crash with the latest 1_36_stable (with backported patch)
> and master branch...
> 
> Disable sha hwaccel with x86 musl toolchains until the issue is fixed.

But why is it special to musl, if the issue if about hardware
instructions not being available?

And indeed, the OE patch you referenced also states "we see same on
glibc systems too".

The referenced thread in the busybox ML seem to hint at a musl dynamic
linker issue, because ebx is clobbered. So there is no reason the issue
can't happen with the other C libraries...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Checked that qemu_x86_64_defconfig with musl for x86_64 for core2 boot
> as expected with sha hwaccel enabled.
> 
> The same workaround has been applied to openembedded-core [3].
> 
> [1] https://git.alpinelinux.org/aports/commit/main/busybox?id=ae2cfdf6f6da3dc46ee09d8ceafa26921f6e058e
> [2] https://git.busybox.net/busybox/commit/?id=bd76b75f72f717150b909e8c64edfda725cabe11
> [3] https://github.com/openembedded/openembedded-core/commit/22f639d61127f4b82a79008c5305e44e090a3680
> 
> Fixes:
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276721
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/busybox/busybox.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 1633ca525d..eb70f12f86 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -276,6 +276,15 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
>  endef
>  endif
>  
> +# Disable SHA1 and SHA256 HWACCEL with x86 musl toolchains
> +# to avoid segfault with init.
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL):$(BR2_i386),y:y)
> +define BUSYBOX_MUSL_DISABLE_SHA_HWACCEL
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_SHA1_HWACCEL)
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_SHA256_HWACCEL)
> +endef
> +endif
> +
>  # Only install our logging scripts if no other package does it.
>  ifeq ($(BR2_PACKAGE_SYSKLOGD)$(BR2_PACKAGE_RSYSLOG)$(BR2_PACKAGE_SYSLOG_NG),)
>  define BUSYBOX_INSTALL_LOGGING_SCRIPT
> @@ -364,6 +373,7 @@ endef
>  BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_INSTALL_ADD_TO_SHELLS
>  
>  define BUSYBOX_KCONFIG_FIXUP_CMDS
> +	$(BUSYBOX_MUSL_DISABLE_SHA_HWACCEL)
>  	$(BUSYBOX_SET_MMU)
>  	$(BUSYBOX_PREFER_STATIC)
>  	$(BUSYBOX_SET_MDEV)
> -- 
> 2.34.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
