Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01337C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 13:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88F2C408D2;
	Sun, 16 Feb 2025 13:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoxLfsDvJsbd; Sun, 16 Feb 2025 13:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EDDD408C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EDDD408C2;
	Sun, 16 Feb 2025 13:02:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1F0EC8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4C5340FA8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzjOcgeJOdC0 for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 13:02:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 53F4840F9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53F4840F9C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53F4840F9C
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:02:14 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-439685e14f1so13769285e9.3
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 05:02:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739710933; x=1740315733;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ZJfqY5UMPSEDUt2gYnE5drOFLOvTWiAmFed8E+0uGg=;
 b=alz3cbt70kENEbDW8fy0nPe5phuHWo9xD80cz61P7jBOEdO/fRdurHom4/4moNFBj9
 gTwMQwLs7kQpRauvFs3K88/vg+6ttkE7Oop4q6TpcHyh8dskvne0PdMV9bLNaLNKPKtg
 95+1Ry1O9bJE3rwcx4KlJYa0R5FtFjzm3s+yZaN9WZ9ys3NN/kcU42Sbz++03IP7S82w
 AHp1iMTSYphT3CQpQScP6AjzQWGJl8/gevKj9gyuRJz6kpMlHX6ri/L5ZgXytITAN0sa
 T+IVgHRiPAmuqkNFZahc/KwYxyz3A0QLiCye1bO1s+vbIfk+I15xz9Cvxf+ctxGugzOt
 mkRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN2L8XnuNWlxw5pBEFjj9L1FEd3okR9FXa6gNz2yYcLoe/Pn4mc53+nYuRRhPeT8gVXYfUw4eLRZo=@buildroot.org
X-Gm-Message-State: AOJu0Yy5ttTxfQ9O/5KyDOTQcFAzqJDihcXhc6diOLtilRm4Akmo93kn
 jCc2CVvNeNOolE20hncx5ITc8KOdENT5Th9+bKHR/d7BRqJxGY9MjkRRIuJGf+E=
X-Gm-Gg: ASbGncsVSRzPn34otQN6BWvW5M8rYVDaZsMD22Y6sp6pSFf7j8Bv9l9wr3c3j2KnxI/
 PMXKjpeDf2ztVig/9npTjwT8D9/Syo2K/isjv/jT7sJNVNFd+gF6v6tmmXukt99rtbgmQ/nrR7m
 XmCaZ4UwrUbhDae+9oh7L4QXoKgfbW05ZIQ1HxARCrc+nQJQsiNNGWwb7SBiqKMyYYjlwQ2Z3cr
 iNEIxfnDg81S3FFl+tIk2SF1mvUA9QYoL6XDEdvPH1kjjhS7DrNhT6uKwkmed9cGSLcXWPcKfa6
 KUraNbKxmuZKRKj/s8fKE/CG21hBQ7ZIA2zU76GuwqOOqYFwLAFSuZipZ49ah9OatEesURkFxBs
 /l5x2xg0jfFvfYu1b2NP9qtybel2nh6i/nh/EMWZfipYX8w==
X-Google-Smtp-Source: AGHT+IGvEqonthBqUPd8/bHEFc3m+Jt22Emo/DI90ylb9diMEbFulX1Sypz/8bAx2x2g3+Tl1Xwocg==
X-Received: by 2002:adf:e8d2:0:b0:38d:d603:ff46 with SMTP id
 ffacd0b85a97d-38f33f1c86fmr5122730f8f.14.1739710932774; 
 Sun, 16 Feb 2025 05:02:12 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258cccdesm9601030f8f.26.2025.02.16.05.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 05:02:11 -0800 (PST)
Message-ID: <bcc4d526-57dc-4a95-9dc5-29c1c94f0ffa@mind.be>
Date: Sun, 16 Feb 2025 14:02:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com
References: <20250215125732.2965257-1-neal.frager@amd.com>
Content-Language: en-GB
In-Reply-To: <20250215125732.2965257-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739710933; x=1740315733; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4ZJfqY5UMPSEDUt2gYnE5drOFLOvTWiAmFed8E+0uGg=;
 b=eR4Omv3sxBn3rjnOZqXzXEv/avkjDt235UL6lrJfpglsXlGYn55Zj88hOK5BGsgtc5
 dUP6MgmrNb8R+Z4ZPbD7e1XIOfRc9mwbYWVHn+WHsK+ZLuvdqOxxAiAHY+RXZcUK3duo
 V9lhqwTQ8wR6rmW8qndr6GkdsYlf0RrqBqw/TJZW47ZD8lblnAh29wOHQ/vgsKCuqYzD
 Q9tUqmvHBtIJND0xEklvlz1l+ffvVW0s/5oE0kZ1jizHy42my+6yTZRLPH38z1V4R9LX
 WJiur7O4Ff3z9kFClK9BqHSzEQ4dYDoWFcCGUhN+ImS90TniLQ4PgdxwaiodrMeNVPyb
 opjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eR4Omv3s
Subject: Re: [Buildroot] [PATCH v3 1/5] package/binutils-bare-metal: add
 multiple tuple support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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



On 15/02/2025 13:57, Neal Frager via buildroot wrote:
> Add support to binutils-bare-metal to support multiple architecture tuples
> with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - no changes
> V2->V3:
> - removed unnecessary symlinks
> - removed unnecessary semi-colons
> ---
>   .../binutils-bare-metal.mk                    | 54 +++++++++++++++----
>   1 file changed, 45 insertions(+), 9 deletions(-)
> 
> diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
> index 3525e9fdf2..7a3017a12c 100644
> --- a/package/binutils-bare-metal/binutils-bare-metal.mk
> +++ b/package/binutils-bare-metal/binutils-bare-metal.mk
> @@ -21,14 +21,50 @@ HOST_BINUTILS_BARE_METAL_CONF_ENV += MAKEINFO=true
>   HOST_BINUTILS_BARE_METAL_MAKE_OPTS += MAKEINFO=true
>   HOST_BINUTILS_BARE_METAL_INSTALL_OPTS += MAKEINFO=true install
>   
> -HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
> -	--target=$(TOOLCHAIN_BARE_METAL_BUILDR OOT_ARCH_TUPLE) \
> -	--disable-gprof \
> -	--disable-shared \
> -	--enable-lto \
> -	--enable-static \
> -	--disable-initfini-array \
> -	--disable-multilib \
> -	--disable-werror
> +define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		mkdir -p $(@D)/build-$(arch_tuple) && \
> +		cd $(@D)/build-$(arch_tuple) && \
> +		$(HOST_CONFIGURE_OPTS) \
> +		$(HOST_BINUTILS_BARE_METAL_CONF_ENV) \
> +		$(@D)/configure \
> +			--prefix=$(HOST_DIR) \
> +			--sysconfdir=$(HOST_DIR)/etc \
> +			--localstatedir=$(HOST_DIR)/var \
> +			--disable-shared --enable-static \
> +			--disable-gtk-doc \
> +			--disable-gtk-doc-html \
> +			--disable-doc \
> +			--disable-docs \
> +			--disable-documentation \
> +			--disable-debug \
> +			--with-xmlto=no \
> +			--with-fop=no \
> +			--disable-nls \
> +			--disable-dependency-tracking \

  It's a bit confusing to me... All of the above are copied from 
host-autotools-package, except:

- --enable-shared --disable-static is reverted (because that's what binutils.mk 
does);
- $(if $($(PKG)_OVERRIDE_SRCDIR),,...) is dropped
- $(QUIET) is dropped
- CFLAGS and LDFLAGS environment variables are dropped
- CONFIG_SITE is dropped.

  For the latter four, I don't see why they should be dropped.

  In addition, there are a lot of configure options that don't exist. We add 
them to the generic autotools infra because unknown options are ignored (with a 
warning) and it saves a lot of repetition in autotools package, but here we 
could include just the options that actually exist.


  I think we have two possibilities here: either we use the stuff from 
autotools-package _exactly_ and just add to it (perhaps even keeping 
HOST_BINUTILS_BARE_METAL_CONF_OPTS as a variable) or we adapt the entire thing 
to precisely what is needed and useful for host-binutils-baremetal (so dropping 
all the useless options). Either option works for me.

  In the first case, we could even rewrite the autotools infra so all the common 
stuff gets put in variables HOST_CONF_ENV and HOST_CONF_OPTS.

  Regards,
  Arnout

> +			--target=$(arch_tuple) \
> +			--disable-gprof \
> +			--enable-lto \
> +			--disable-initfini-array \
> +			--disable-multilib \
> +			--disable-werror; \
> +	)
> +endef
> +
> +define HOST_BINUTILS_BARE_METAL_BUILD_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		$(HOST_MAKE_ENV) $(MAKE) \
> +			$(HOST_BINUTILS_BARE_METAL_MAKE_OPTS) \
> +			-C $(@D)/build-$(arch_tuple)
> +	)
> +endef
> +
> +define HOST_BINUTILS_BARE_METAL_INSTALL_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		$(HOST_MAKE_ENV) $(MAKE) \
> +			$(HOST_BINUTILS_BARE_METAL_INSTALL_OPTS) \
> +			-C $(@D)/build-$(arch_tuple)
> +	)
> +endef
>   
>   $(eval $(host-autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
