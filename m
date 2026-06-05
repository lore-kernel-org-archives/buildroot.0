Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEFDCD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22C1B406D7;
	Fri,  5 Jun 2026 12:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVfEFbSbyQqP; Fri,  5 Jun 2026 12:51:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13AE140543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663862;
	bh=M8OUnATVUJJG64Rl6YeAkQptyBVh3/KxS5uP6WJSrSk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BuSDDg/q/5A95vS2wtKLIT1BMHpPqLynZqhoYpYkvvq89lv4RmUYIbC9uHNEeh7Ff
	 FVM8jycCzoRWKOXGkswybBwKEtHCttsZGiSqzWMm06fgdUVxzNlgDTfunCQw3uInBh
	 karRlkIfRMtDceKWbrIiaxfCzsO1SOFcuYfVCY0BwR+cOwvvl+1rv60yr3i0yE5W/D
	 RGSh18UHFe3riArCkjiOuLhsyjW1v8VEzvcIKV1tHztFjwZQt7cFsnGY805IAwCvHN
	 6GsG6ksBBpcG/jTaK1wmaVmWJ58zqZGU5KuHW1aERIQVBQcFSRY7I9uWyIWafG9/TX
	 iiVeBCr/88DTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13AE140543;
	Fri,  5 Jun 2026 12:51:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 673B4F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5848280C87
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMvFtnpyIIwl for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F68C80B52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F68C80B52
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F68C80B52
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:57 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490b09e4cccso14175485e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663855; x=1781268655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jTNMDXXhYxF9cIWtkiYjx5Qm4VImdpVdClAeFiw6ywI=;
 b=s6hplmqns2nwhlYI6s3ZueNdOpAnAMS4ui0rqyP0F8KlkAdxiGXTNnJJWsrrSPL/1R
 qqtBnQXDsZrJrE7Kw5c6C+yX4csUd4dSMW/VVAusPnEVpCpEgGayjAU8IszS89QkAiVc
 ZoRHNhrlOkJTT0nIvm5JiKDKyfbfZTwzBloarsdo3nUshugMUyTBvNaH3tdrEKilJGNh
 uzWXdO8+QQvoKoUAWtJMJHV5G9s11mWtjzrkJhKL9EvJZdDpztVNoZ5kyYG2zh3iPcNa
 KrUUnP39URkcgSn2myvERVB4iIyv6ffwTSU2GrkFSqM61n9cCFqeZ090Hgghyd9iQKdC
 xQfA==
X-Gm-Message-State: AOJu0Yz+O5x+mdSRV2/nPZht5BtsMY3rVjSmO1zsDe94PVyiwpnvdWpu
 tAzcXjIZRQKXwhbLmngzziuuZTI5WvAA4YUqiZ+hYjZKDdaOKZIhVoCFs26q4keqUAY=
X-Gm-Gg: Acq92OEq1S65TfAHN3KwS4G65vKBEPs7gtVTUFvOzjXxySEg0FM5gla6E18hCTrGub+
 1jo5T63DvMKoFnM6rIw4HEeF4BNL0O78n1gQk3oT/fa+ZfwyOqdaPFjtLQAr88fvRsKM6yBzaLx
 /VeJu/ptqxTiRqG9EFvzCfwdEzLPBAVmkCmUCJx3g3PplqodcmwKz4IuvQttw9JGm03ejnW4rov
 V2C/MfvzhlA4xn2RtdG5EI2/Ur9cAeaaaKz7vFtfXJPvl/abzSWoHj1p+6rB8PEXFUW1hO6Hqiy
 sO94W2iGKpO2nlXBhMExlFXl7Z9lNDQcxFSxOApEh0ZE2MVqqcUblUR5RF9yZCaAon25xLCqh/f
 lKr1ei2xOycdmu2owvMZvaFAiENJmlLDEmZHTHzD+0YPKjQvQdpmdFC3HG4s4soFRwS2r4BwXY1
 I8Dt5mv+kCOK3nfx9j9rD3UqedGoWQQ9iLCSCj
X-Received: by 2002:a05:600c:8208:b0:490:bb37:9d49 with SMTP id
 5b1f17b1804b1-490c25b136amr58507465e9.11.1780663855218; 
 Fri, 05 Jun 2026 05:50:55 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35fd33sm27508428f8f.35.2026.06.05.05.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:54 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:54 +0200
Message-ID: <20260605125054.274733-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529175156.572429-1-thomas.perale@mind.be>
References: <20260529175156.572429-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663855; x=1781268655; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTNMDXXhYxF9cIWtkiYjx5Qm4VImdpVdClAeFiw6ywI=;
 b=JoZcet5iDkMxgtmsdE/foHhfBhIwwcb5aMJBhj7XYFgvq9jrjXmtr5KDbNjsj/nL4G
 P9M6DjhU4o6bf9f7Jb92XZwZUW0jeIpQY9Ef+2aiJn4eDcUtLkguT+Sda8LSD+7HpwEb
 82plsSwdZrsP1NipvgGdrmNtD+kV7RaOaSy8YScW7rCXNQTF5XYA27fzznmJI0r/Ali2
 j/2DpGhvwtw27G3cuBoiJNMVIM+B2dyK/tlbbiLYEsiYljSPmbPr22tCuaz9U/zKzEdn
 cN+UVLrY067kQRwpErAYFaQhIK3JhuXgL+v08ej8fCW4JCSzzn3qmhoLKJVugnnwcIxM
 fSbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JoZcet5i
Subject: Re: [Buildroot] [PATCH v3 1/2] Makefile: add 'show-info-all'
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The maintainance and testing workflow sometimes requires to output a
> list of every existing packages on Buildroot:
> 
> - Generating an SBOM of the whole Buildroot tree for
>   security.buildroot.org
> - List every sources for every packages for source.buildroot.org
> 
> The previous solution relied on `make allyesconfig` but always ran into
> conflicts that needed manual resolution. Also some packages would not be
> present because they are archicture dependant.
> 
> To avoid having to manually modify the 'show-info' command this commit
> adds the 'show-info-all' command. It accesses the PACKAGES_ALL variable
> with all the packages present on Buildroot independently of the
> archicture or any config entries.
> 
> It forces the `BR2_HAVE_DOT_CONFIG` variable to be set to force the
> reading of the packages mk files.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> 
> v1 --> v2: removed TARGETS_ROOTFS and recursive dependencies. It
>   introduced "host-" package with no name that introduced an empty
>   entry when generating an sbom when `make show-info-all` is ran without
>   defconfig.
>   Checked the diff between the previous version and the new one and
>   except the empty entry nothing is changed by just iterating over
>   PACKAGES_ALL.
> 
> v2 --> v3: 
>  - add documentation to make help and manual
>  - fix the error message from check-host-cmake.sh when cmake3 is present
>    in the path
> ---
>  Makefile                      | 24 ++++++++++++++++++++++--
>  docs/manual/common-usage.adoc | 12 ++++++++++++
>  2 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index cb52a1d668..b4ce363f5b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -126,7 +126,7 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
>  	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
>  	randpackageconfig allyespackageconfig allnopackageconfig \
>  	print-version olddefconfig distclean manual manual-% check-package \
> -	check-package-external
> +	check-package-external show-info-all
>  
>  # Some global targets do not trigger a build, but are used to collect
>  # metadata, or do various checks. When such targets are triggered,
> @@ -142,7 +142,7 @@ nobuild_targets := source %-source \
>  	clean distclean help show-targets graph-depends \
>  	%-graph-depends %-show-depends %-show-version \
>  	graph-build graph-size list-defconfigs \
> -	savedefconfig update-defconfig printvars show-vars
> +	savedefconfig update-defconfig printvars show-vars show-info-all
>  ifeq ($(MAKECMDGOALS),)
>  BR_BUILDING = y
>  else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
> @@ -236,6 +236,13 @@ BR2_CONFIG = $(CONFIG_DIR)/.config
>  ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
>  -include $(BR2_CONFIG)
>  endif
> +# show-info-all needs to access the PACKAGES_ALL variable. This variable
> +# contains a reference to every package present in Buildroot.
> +# Since the 'show-info-all' command might be used without actually having a
> +# dotconfig this condition is forced to be set true.
> +ifeq ($(MAKECMDGOALS),show-info-all)
> +BR2_HAVE_DOT_CONFIG = y
> +endif
>  
>  ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),)
>  # Disable top-level parallel build if per-package directories is not
> @@ -948,6 +955,17 @@ show-info:
>  		) \
>  	)
>  
> +.PHONY: show-info-all
> +show-info-all:
> +	@:
> +	$(info $(call clean-json, \
> +			{ $(foreach p, \
> +				$(sort $(PACKAGES_ALL)), \
> +				$(call json-info,$(call UPPERCASE,$(p)))$(comma) \
> +			) } \
> +		) \
> +	)
> +
>  .PHONY: pkg-stats
>  pkg-stats:
>  	@cd "$(CONFIG_DIR)" ; \
> @@ -1213,6 +1231,8 @@ help:
>  	@echo '  external-deps          - list external packages used'
>  	@echo '  legal-info             - generate info about license compliance'
>  	@echo '  show-info              - generate info about packages, as a JSON blurb'
> +	@echo '  show-info-all          - generate info about all packages in Buildroot,'
> +	@echo '                           regardless of configuration or target architecture'
>  	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
>  	@echo '  printvars              - dump internal variables selected with VARS=...'
>  	@echo '  show-vars              - dump all internal variables as a JSON blurb; use VARS=...'
> diff --git a/docs/manual/common-usage.adoc b/docs/manual/common-usage.adoc
> index 7437a7c3c0..631c2f7788 100644
> --- a/docs/manual/common-usage.adoc
> +++ b/docs/manual/common-usage.adoc
> @@ -170,6 +170,18 @@ by using the +show-info+ make target:
>  make show-info
>  ----
>  
> +Buildroot can also produce information in the +show-info+ format about all
> +packages regardless of the configuration or architecture by using
> ++show-info-all+.
> +This is used for maintenance tasks that require information about every
> +package in the tree, such as generating a full-tree SBOM for
> +https://security.buildroot.org[].
> +It does not require a +.config+ file:
> +
> +----
> +make show-info-all
> +----
> +
>  Buildroot can also produce details about packages as HTML and JSON
>  output using the +pkg-stats+ make target. Amongst other things, these
>  details include whether known CVEs (security vulnerabilities) affect
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
