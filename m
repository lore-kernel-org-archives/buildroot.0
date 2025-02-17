Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B63CC02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 07:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E9EB82116;
	Tue, 18 Feb 2025 07:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZT_AUym6qMh; Tue, 18 Feb 2025 07:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05E2682121
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05E2682121;
	Tue, 18 Feb 2025 07:54:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9343D968
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 708CF411B8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h439fc9vD1ab for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 07:54:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 277CB411AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 277CB411AD
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 277CB411AD
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:54:08 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38f3ac22948so1130775f8f.0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 23:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739865246; x=1740470046;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j0C793bgRrly2cKX2Vl2lWv+8xDWoY6Ka1D8wSHH/RM=;
 b=EALavILGjM3RGQVzHyRlS68kv+KPJwDbTO6BSDhcEcZGUE6AgCpWfsL/eIhKTXuAe7
 bPSd3FAwClhb68o1LNXjh9eaOtkNLBgAVbCFtnfgCwHto01arPXhohBUENsoBAfRjkhl
 JQQbs09S5JjYPG/5IYiqKzsnZ7mTF0Bjl9AC7jxvQqOnQ69jmGoVPJVun7o2L/R7hsJY
 L2a2PTpR6XrJbEqLQm0hNJfwXXm5bzwGwAKTw46XadvtXOZHuAMTwBExYdBn37tVAS+/
 2AvftVt1uqj9+OZ3BOeCfRcIV2rqNaXMAMlhE0Jd4Ab3AHOdp1VIiQnkCGYSjbQKIl8S
 KZ1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdzQ7ub/KHcb3UhmLPJuJt9HjgWqjsx4Byd/gT0W/3G6NRMWBkM2Gl/Rff6t08FPPHO6rfSRkhXVg=@buildroot.org
X-Gm-Message-State: AOJu0Yy3ILkzRMq8SdR4DA+HLOtRwCAdc9iXgpnZMY3lbZZZG0El6xjN
 INGN6bj2uSH6YGCgmIIunWCNmgHQb7yxuYP0gM8fmWcU7hnAly8jhsZE0oCD7IQ=
X-Gm-Gg: ASbGnctjpu05lkjYmnLU0wZFAA5dZ4cSRgNQHy8lRys0zzedhxEKXGElMcWhl9b7FwI
 /XFXeqtYSCnrXqtnPiUBZixy4YZtJl1nPUEKio9Safi57WzP8HyZFebi269duN+yQVCUw6u+ztb
 LLtqDOOwGrOD0RFit4N1jL+fuDa99UtEKJZfIyTsVeFwslRHz34t55B1RHXZyoQuyaLNjaFAJQx
 09E/ca0jYl7NMPMbISpbUcn6bbNiJSJTK1WiI5ACk4HNzVDID/D9Cslq6t0zuvMghb6u+a05N4P
 JX1g5T+Pux/wBGyvrn9OAFkPa0skxJJNAs8uGM1U94yhKykLYP4=
X-Google-Smtp-Source: AGHT+IFubFLGt7IUp+RfkG4PH5U/ywXnTL434+tYGkeZBKqrwyN3k2J0FXoYw0pxw7z59gxhifmo8Q==
X-Received: by 2002:a5d:59a3:0:b0:38f:3f65:2ea3 with SMTP id
 ffacd0b85a97d-38f3f652fedmr5978928f8f.17.1739865246320; 
 Mon, 17 Feb 2025 23:54:06 -0800 (PST)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ccd2csm14602145f8f.30.2025.02.17.23.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 23:54:05 -0800 (PST)
Message-ID: <99c9e481-632e-4adf-b686-659e3c16d35c@mind.be>
Date: Mon, 17 Feb 2025 23:24:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20250217124932.2653445-1-neal.frager@amd.com>
Content-Language: en-GB
In-Reply-To: <20250217124932.2653445-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739865246; x=1740470046; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j0C793bgRrly2cKX2Vl2lWv+8xDWoY6Ka1D8wSHH/RM=;
 b=AdBBg9q2V/7BqUsfXd8ugJzq4NoCLPyGI42GgLxCaYxWHqoYf4Tjs41ld82IkbwMV5
 0C84uJGpBZLkbKVqQt5kYEbTWDRXc1P0evvd7R55t/jb9g7Ufi+hQ12yrHAD9oMO3LC+
 6LnMhvUaGry7ZD1ICo4Rjo1WgXm6rqYX56rtQXN7acXkWRW9IJ0r1Bi4Rwoy5dRJ0fEv
 JEytcfq5CkhbKBfjebimjuUrgKlHSssEHGq2Q6r66rFLzLxFO4OH7Xemi80dQirWZWni
 6Oho+5Tmauk3EIVL3EODK3q3vEjm10KkuwxCcn3w20LaE3tWw66PDPBAdm6oVBUZV/8P
 TRQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AdBBg9q2
Subject: Re: [Buildroot] [PATCH v5 1/5] package/binutils-bare-metal: add
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/02/2025 13:49, Neal Frager wrote:
> Add support to binutils-bare-metal to support multiple architecture tuples
> with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.
> 
> To do this, custom configure, build and install commands are needed, so that
> each step goes through a loop of the architecture tuples in the list.
> 
> To keep consistency with autotools, all the relevant host configurations have
> been copied into the HOST_BINUTILS_BARE_METAL_CONF_OPTS while removing any
> configurations that do not apply to binutils and removing redundant configs.
> 
> autotools redundant configs covered by $(HOST_CONFIGURE_OPTS):
> 	CFLAGS="$$(HOST_CFLAGS)"
> 	LDFLAGS="$$(HOST_LDFLAGS)"
> 
> autotools configs not applicable to binutils:
> 	--disable-gtk-doc
> 	--disable-gtk-doc-html
> 	--disable-doc
> 	--disable-docs
> 	--disable-documentation
> 	--disable-debug
> 	--with-xmlto=no
> 	--with-fop=no
> 	--disable-nls
> 
> One of the configurations already in the binutils-bare-metal package was not
> needed.
> 
> --enable-static -> handled by --disable-shared
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

  Series applied to master with some changes as indicated in individual patches, 
thanks.

  Regards,
  Arnout

> ---
> V1->V2:
> - no changes
> V2->V3:
> - removed unnecessary symlinks
> - removed unnecessary semi-colons
> V3->V4:
> - added all relevant autotools configs
> - removed any configs not relevant to binutils
> - corrected some configs already included in binutils-bare-metal
> V4->V5:
> - --disable-gprof was actually working fine and did not need to be changed
> ---
>   .../binutils-bare-metal.mk                    | 36 +++++++++++++++++--
>   1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
> index 3525e9fdf2..709d072765 100644
> --- a/package/binutils-bare-metal/binutils-bare-metal.mk
> +++ b/package/binutils-bare-metal/binutils-bare-metal.mk
> @@ -22,13 +22,45 @@ HOST_BINUTILS_BARE_METAL_MAKE_OPTS += MAKEINFO=true
>   HOST_BINUTILS_BARE_METAL_INSTALL_OPTS += MAKEINFO=true install
>   
>   HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
> -	--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
> +	--prefix=$(HOST_DIR) \
> +	--sysconfdir=$(HOST_DIR)/etc \
> +	--localstatedir=$(HOST_DIR)/var \
> +	$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
> +	$(QUIET) \
>   	--disable-gprof \
>   	--disable-shared \
>   	--enable-lto \
> -	--enable-static \
>   	--disable-initfini-array \
>   	--disable-multilib \
>   	--disable-werror
>   
> +define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		mkdir -p $(@D)/build-$(arch_tuple) && \
> +		cd $(@D)/build-$(arch_tuple) && \
> +		$(HOST_CONFIGURE_OPTS) \
> +		$(HOST_BINUTILS_BARE_METAL_CONF_ENV) \
> +		CONFIG_SITE=/dev/null \
> +		$(@D)/configure \
> +			$(HOST_BINUTILS_BARE_METAL_CONF_OPTS) \
> +			--target=$(arch_tuple)
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
> +
>   $(eval $(host-autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
