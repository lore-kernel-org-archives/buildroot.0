Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96259C43219
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 11:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 228B94189F;
	Thu, 24 Nov 2022 11:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 228B94189F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JMG5q4C4WXaA; Thu, 24 Nov 2022 11:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3FC2418AE;
	Thu, 24 Nov 2022 11:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3FC2418AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFA291BF48C
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 11:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C84A782116
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 11:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C84A782116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nhZwOY694aOL for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 11:26:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1F248211C
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1F248211C
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 11:26:16 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id n21so3463360ejb.9
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 03:26:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3P+V/h3MWubRsr7XuaelymLCbFrDr8SOFsDwFDyTifo=;
 b=q+r+meChb2eRcPxs7MFrOCu66wtUMXrd02MrTwKh2J1ulEk9sRNKMpP0ByJE7XMk3Q
 WH837Tgs+MhT/BLmtKIYibTjoYxpBqrgQmP6MmJTz0zpoCJGRFET183BdJHsW80iDKyD
 jcRMnE6jB3nNGMmfjBbtgtc7C4u21fNSq4RX32yhGbG3D+kJqQEUJSLn0K7VsZAY0kDJ
 ygJALvCiqROzCgWw0aQia35LCOw9GhU+LpLhbBS1pYxEGxoeJfj6AzHlbr0BzaBazWUZ
 rWer73+JUIeUXKbBeQ7ZNus5Y97iMU76JZHhF4jX/EHPiJR0MMAyr7ZX5OoVmA93Xm1j
 XIBA==
X-Gm-Message-State: ANoB5plNDtCzP6C1XCuy95Jc0nx8CSjp69qfkmODNnAB/C4T+4fY9Ats
 gnzZ5RgyGu394rS6X1jemZozIxa+oBEtew==
X-Google-Smtp-Source: AA0mqf5vNePf6IGQEwlYcGzFESFPiNejymBQ8bUGqRRNjDMCNGYiP04l7XL7JO2JasjF0Pp2wfgqhA==
X-Received: by 2002:a17:906:c18c:b0:7b2:8a6e:c569 with SMTP id
 g12-20020a170906c18c00b007b28a6ec569mr27546926ejz.582.1669289174861; 
 Thu, 24 Nov 2022 03:26:14 -0800 (PST)
Received: from [10.1.0.116] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 kz6-20020a17090777c600b007ad2da5668csm318663ejc.112.2022.11.24.03.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 03:26:14 -0800 (PST)
Message-ID: <c91a89d0-094a-bbb7-c406-7c1d72cb5469@mind.be>
Date: Thu, 24 Nov 2022 12:26:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20221123173149.17188-1-brandon.maier@collins.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20221123173149.17188-1-brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3P+V/h3MWubRsr7XuaelymLCbFrDr8SOFsDwFDyTifo=;
 b=Wj8SL/pNg8sZHDRI47swHQbjkZ96W+hR6L+9WuoDyTo8CcDR/pGbX86YjkxKQliS3C
 fw0w3Ht1ZIAgUuFZ5WyIRL1/RN+fNDqnw/7ajpxtKuSePTAwa1iqDq9OH+/dY8ELmAIh
 Y5YM5UwLPBD1k4MZbGvCzyuDxEy68VFU5sW6geAAdCdqSzAnUEzU8dGoDhNnbXXNOzYX
 AeAsFnNYJTAH9FdRs5txC/lSzZTogJMTlLMWQDwhXiP1r/dDqwg+ipH6yq0yRLpqCTRo
 1gxTo1gu0snJSVeibgDDBZnC9+vQzRIPCkz82fttzPb3NcyNhuXXBjn6Eo4Ygq9qxZYG
 PXaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Wj8SL/pN
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-kconfig: fix bad config
 with per-package-dirs
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/11/2022 18:31, Brandon Maier via buildroot wrote:
> If BR2_PER_PACKAGE_DIRECTORIES is enabled and Buildroot is using
> HOST_MAKE for a Kconfig package. The $(1)_KCONFIG_RULES does not work
> correctly, and kconfig-package-regen-dot-config will always run the
> 'oldconfig' target.
> 
> This is because $(1)_KCONFIG_RULES expands before the first recipe line
> of .stamp_dotconfig. $(1)_KCONFIG_RULES attempts to call $(HOST_MAKE),
> which requires that the per-package/<pkg>/host directory has been setup.
> But that directory is not setup until a later recipe line. This results
> in $(1)_KCONFIG_RULES silently failing, and so always configuring with
> 'oldconfig'.
> 
> Fix the issue by calling the command as part of the recipe, so
> $(HOST_MAKE) will be ready in time. As the comment on $(1)_KCONFIG_RULES
> describes, we should not use backticks. Use an intermediary file to
> store the output of the command, so that backticks are not needed.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

  Although this is a fix (normally for master), it's not a regression and the 
issue has been there for years already. In addition, it's not something that is 
very well tested, so it's a risky change. Therefore, I applied to next, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-kconfig.mk | 28 ++++++++++------------------
>   1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 32dcfea0bc..f4f35bf96a 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -45,11 +45,16 @@ endef
>   # only, as this can fail in complex cases.
>   # $(1): the name of the package in upper-case letters
>   define kconfig-package-regen-dot-config
> -	$(if $(filter olddefconfig,$($(1)_KCONFIG_RULES)),
> -		$(Q)$($(1)_KCONFIG_MAKE) olddefconfig,
> -		$(if $(filter oldnoconfig,$($(1)_KCONFIG_RULES)),
> -			$(Q)$($(1)_KCONFIG_MAKE) oldnoconfig,
> -			$(Q)(yes "" | $($(1)_KCONFIG_MAKE) oldconfig)))
> +	$(Q)[ -e $($(1)_DIR)/.br_regen_dot_config ] || \
> +		$($(1)_KCONFIG_MAKE) -pn config 2>/dev/null \
> +		| sed 's/^\([_0-9a-zA-Z]*config\):.*/\1/ p; d' >$($(1)_DIR)/.br_regen_dot_config
> +	$(Q)if grep -q '\bolddefconfig\b' $($(1)_DIR)/.br_regen_dot_config; then \
> +		$($(1)_KCONFIG_MAKE) olddefconfig; \
> +	elif grep -q '\boldnoconfig\b' $($(1)_DIR)/.br_regen_dot_config; then \
> +		$($(1)_KCONFIG_MAKE) oldnoconfig; \
> +	else \
> +		yes "" | $($(1)_KCONFIG_MAKE) oldconfig; \
> +	fi
>   endef
>   
>   # Macro to create a .config file where all given fragments are merged into.
> @@ -147,19 +152,6 @@ $(2)_KCONFIG_MAKE = \
>   	$$($(2)_MAKE_ENV) $$($(2)_MAKE) -C $$($(2)_DIR) \
>   		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS)
>   
> -# $(2)_KCONFIG_MAKE may already rely on shell expansion. As the $() syntax
> -# of the shell conflicts with Make's own syntax, this means that backticks
> -# are used with those shell constructs. Unfortunately, the backtick syntax
> -# does not nest, and we need to use Make instead of the shell to handle
> -# conditions.
> -
> -# A recursively expanded variable is necessary, to be sure that the shell
> -# command is called when the rule is processed during the build and not
> -# when the rule is created when parsing all packages.
> -$(2)_KCONFIG_RULES = \
> -	$$(shell $$($(2)_KCONFIG_MAKE) -pn config 2>/dev/null | \
> -		sed 's/^\([_0-9a-zA-Z]*config\):.*/\1/ p; d')
> -
>   # The specified source configuration file and any additional configuration file
>   # fragments are merged together to .config, after the package has been patched.
>   # Since the file could be a defconfig file it needs to be expanded to a
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
