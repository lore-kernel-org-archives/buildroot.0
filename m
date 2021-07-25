Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BCFC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:20:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF5AE60E09
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF5AE60E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 831A182B34;
	Sun, 25 Jul 2021 13:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8YqCIWS7xc5; Sun, 25 Jul 2021 13:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B80498321B;
	Sun, 25 Jul 2021 13:19:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6839E1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 501E68321B
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ti8U86-FBIKY for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 13:19:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 438E082B34
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:19:55 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id he41so11506172ejc.6
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HG/kxKARqEBt74lZxYUmPm8gT4Er9QxXffM9c3k6SD4=;
 b=UseocaYT/QbAQM6Bh+EpXMYFv3c8vgibmbwwUphOAbW/2z9MtNs+7Nrutj2l03iYTW
 OughDsifQZs12uxBq+Rl8yPs3yeU+jYyCA/0q5s4zESThhorxs+TvXX8+q5yriIlm5Vl
 1PI/uM9nA/CrCnTa9nun+dd/l1skf5TqEsBaQfyszg8QPAv0wuxL48haLhTB3Gu5a7W0
 CDVORwJft7vUX7K39+OdyM7h19FaWI42Rx22/eOfosXcJ2xt2Er4I/ZIvmAiFHW0hNiS
 P9KzcWcvfTDhrKoAfnfD37CSDg6BHBSlCZndtyqUEG6cs9qx82ZHERiggeMSKd7RaFYC
 3M9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=HG/kxKARqEBt74lZxYUmPm8gT4Er9QxXffM9c3k6SD4=;
 b=fBplZkItabVidthM3bE1WNHhkVzWjFlRDkUd7PnZaLUL6BIPQbSTRHtG2uvLmdNHk8
 VfuqHIKw5cuzIhp9AljcZtkxapEpNyo8hujAbxLgjGsls4EWW/XhQsTeRhKN9mfQGwzE
 T2RKHn6JfnFj9ZecRJuPH8YLWKeLFqlFDQ7qqbkACiH6rekEt7TYJPxfQ+Nw25ru6lgr
 aYwyPuO0cM6VplF7PGMKb4nXwEAQQYKRYNObkchd0TOSz9KpkbhguwGxbV51tLnDt6Wm
 0qXcLp1zwXI6rACeCOhOxmscUAk1JL0Jw+AKc0SlmfpHGdiortwo6aWxJ3cym6KoGE2k
 rNnA==
X-Gm-Message-State: AOAM530QTpZdFltmXXqC5Tj96vOp/sSY5CkmbfzD21V0SojJXBQYNVno
 zDpxJbIISvsaT6Z/GPPfOKFbiA==
X-Google-Smtp-Source: ABdhPJwM7R0/JQdd7P0M9DxkiMCJeJuskqVRsNL1xQqr3gSUdrcHlpuBFoz5+7oRrKMbAmQfSJiGuw==
X-Received: by 2002:a17:907:5096:: with SMTP id
 fv22mr12487722ejc.525.1627219193474; 
 Sun, 25 Jul 2021 06:19:53 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u2sm3637881edd.82.2021.07.25.06.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 06:19:53 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1627161553.git.yann.morin.1998@free.fr>
 <44391e27e560d7d2de2a444577d867920d4c35a5.1627161553.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <b9986991-db3a-1292-ee1a-073bdb3d04bc@mind.be>
Date: Sun, 25 Jul 2021 15:19:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <44391e27e560d7d2de2a444577d867920d4c35a5.1627161553.git.yann.morin.1998@free.fr>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 2/4] package/pkg-kconfig: generate generic
 help
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 24/07/2021 23:19, Yann E. MORIN wrote:
> Currently, as Thomas pointed out [0], the help for kconfig packages is
> not consistently used and handled by the different packages.
> 
> This commit introduces a generic help text for kconfig packages, that is
> based on what the package declares:
> 
>   - the list of kconfig editors it supports;
> 
>   - whether it is possible to save back the configuration (impossible if
>     the package uses an in-tree defconfig file);
> 
>   - whether the package actually supports (loading and saving) defconfig
>     files, by introducing a new variable a package can set if it does
>     not (only busybox is known to be in that case).
> 
> That new help helper is only used if the package does not already define
> its own help, to be consistent with what we do for other _CMDS.
> 
> [0] http://lists.busybox.net/pipermail/buildroot/2021-July/313570.html
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  docs/manual/adding-packages-kconfig.txt |  3 +++
>  package/pkg-kconfig.mk                  | 24 ++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
> index 8f40ea6099..a35681775f 100644
> --- a/docs/manual/adding-packages-kconfig.txt
> +++ b/docs/manual/adding-packages-kconfig.txt
> @@ -91,3 +91,6 @@ be set to suit the needs of the package under consideration:
>  * +FOO_KCONFIG_DEPENDENCIES+: the list of packages (most probably, host
>    packages) that need to be built before this package's kconfig is
>    interpreted. Seldom used. By default, empty.
> +
> +* +FOO_KCONFIG_SUPPORTS_DEFCONFIG+: whether the package's kconfig system
> +  supports using defconfig files; few packages do not. By default, 'YES'.
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 49074f9220..715c3e04ec 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -85,11 +85,35 @@ $(2)_KCONFIG_OPTS ?=
>  $(2)_KCONFIG_FIXUP_CMDS ?=
>  $(2)_KCONFIG_FRAGMENT_FILES ?=
>  $(2)_KCONFIG_DOTCONFIG ?= .config
> +$(2)_KCONFIG_SUPPORTS_DEFCONFIG ?= YES
>  
>  # Register the kconfig dependencies as regular dependencies, so that
>  # they are also accounted for in the generated graphs.
>  $(2)_DEPENDENCIES += $$($(2)_KCONFIG_DEPENDENCIES)
>  
> +# Generate the kconfig-related help: one entry for each editor.
> +# Additionally, if the package is *not* using an in-tree defconfig
> +# name, an entry for updating the package configuration file.
> +ifndef $(2)_HELP_CMDS
> +define $(2)_HELP_CMDS
> +	$$(foreach editor, $$($(2)_KCONFIG_EDITORS), \
> +		@printf '  %-22s - Run %s %s\n' $(1)-$$(editor) $(1) $$(editor)
> +	)
> +	$$(if $$($(2)_KCONFIG_DEFCONFIG),,\

 We should probably also simply remove the -update-config and -update-defconfig
rules when _KCONFIG_DEFCONFIG is set. There's currently a condition for that in
kconfig-package-update-config, but it's better to just not have the option at
all. I may cook a patch for that.

> +		$$(if $$(filter YES,$$($(2)_KCONFIG_SUPPORTS_DEFCONFIG)),\


 Now we have this variable, it would make sense to also make $(1)-savedefconfig
and $(1)-update-defconfig depend on it. I may cook a patch to do exactly that.



 Regards,
 Arnout


> +			@printf '  %-22s - Save the %s configuration as a defconfig file\n' \
> +				$(1)-update-defconfig $(1)
> +			@printf '  %-22s     to %s\n' '' $$($(2)_KCONFIG_FILE)
> +			@printf '  %-22s     (or override with %s_KCONFIG_FILE)\n' '' $(2)
> +		)
> +		@printf '  %-22s - Save the %s configuration as a full .config file\n' \
> +			$(1)-update-config $(1)
> +		@printf '  %-22s     to %s\n' '' $$($(2)_KCONFIG_FILE)
> +		@printf '  %-22s     (or override with %s_KCONFIG_FILE)\n' '' $(2)
> +	)
> +endef
> +endif
> +
>  # Call the generic package infrastructure to generate the necessary
>  # make targets.
>  # Note: this must be done _before_ attempting to use $$($(2)_DIR) in a
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
