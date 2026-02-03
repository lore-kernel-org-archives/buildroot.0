Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D342E6E7EE
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 10:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A2EC81357;
	Tue,  3 Feb 2026 10:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vc73XhiN47-p; Tue,  3 Feb 2026 10:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28C4181371
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770115209;
	bh=H/2JIi+K6AUNnvQHrVYhFRuSqv9UU/b0IN8U3MWnjPw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=h2vPV3ss9pNTJgxPuRX9ESa4fAVnAPKc/qmt36Zfc5UrCaz0OiQ98fAOQL79+KYp+
	 xLaI0zNlFawmSO3hGtv31x37hK0fYtzaKzWWzbpbLyW0z1dl9EsRkJYw/e+5MM17nw
	 u+tRKOUHISd6uTdU/1KsdbU5evE1oTj31yNCIgvrdD1TmJrcr8NHiYV6ZvVHZENLU4
	 TS5xIKyT67pWyShBlw2hKYVm08oSZ1YOteorfLzeoasM0RTWV22UJAukA+kWo5doIN
	 4sDNrsBfnzPvbZJb/1igmbmNR6bsOJq1rcX9Ct3ERONB4mLd89GwUbrLMOWY57VN7h
	 8KQRykScJPFWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28C4181371;
	Tue,  3 Feb 2026 10:40:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87C04F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7336781371
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2XAA4hSUMeM for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 10:40:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 652CC81357
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 652CC81357
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 652CC81357
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:40:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB3D5B97AD2D; Tue,  3 Feb 2026 11:40:04 +0100 (CET)
Message-ID: <266cb52e-8a3b-4e69-be7e-e9683de17fca@rnout.be>
Date: Tue, 3 Feb 2026 11:40:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20250929092431.8974-1-fiona.klute@gmx.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250929092431.8974-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1770115205; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=DCFUK6jnb2gvEoGFW/09B8yGf8i9wCodyg+Bz/RVr0c=;
 b=CsbRWjHnwHbnLnOrujhits+8a8BK8WuSDI8dtOqdCvcUXQpPswwWJNfLgg06Y0Q5k/Opi6
 BrWNs0PWgD6Hp0krxulV0O0hGWi1k6qtj61pwkbKeMytEQnoBeKd63tJf/JplRF3CHvqi3
 /68x5zfz4CR733AKAnx4/8qurVz3IZIZomQ7SLeSXBgUqZPLZMmlCz0swHJp2V5c6oARxl
 xC7dYO+TO7NQDnUxd9wcTBRRjiVNAVUUFnC/IGmXjSOdvKeiGOYYUhuZIaI62pU/j1H4T2
 hJrruumRQrsEvBOqFY9p+D/GtKA7swuaelU5SdZ30LJeR7QbBE4gU7nrc85Sng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=CsbRWjHn
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: add check-package-external
 target
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Fiona,

On 29/09/2025 11:24, Fiona Klute via buildroot wrote:
> The new target provides a convenient way to run utils/check-package on
> any external trees, using .checkpackageignore files from the
> respective trees if present.
> 
> While .checkpackageignore should be used as little as possible, in a
> few cases adding overrides for false-positives to the affected files
> is not feasible, a practical example of this is a Markdown file
> misidentified as Python by libmagic (likely due to code blocks).
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

  Applied to master, thanks.

  We discussed it at the BR meeting, looked at the other options (like always 
checking externals as well), but ended up with the conclusion that your proposal 
actually covers the likely use cases best.

  We also didn't find a better name so it stays check-package-external.

  There are two things still missing:

- Mentioning it in the manual (I'm not even sure if check-package is already 
mentioned...)

- Adding a runtime test of the feature (including with and without the ignore file).

  Also one small modification, see below.

> ---
> I've considered wrapping this into the existing check-package target,
> but there are a few reasons not to:
> 
> 1. Some people might not want to subject their external trees to
> check-package at all, and would be annoyed by the warnings.
> 
> 2. BR2_EXTERNAL support for utils/docker-run is still pending (see [1]).
> 
> 3. The older shellcheck and flake8 versions in the Buildroot base
> container image used by utils/docker-run produce some false positives
> for my external trees, so I want to keep using the (newer) local
> versions for checking those, but use the container for upstream
> patches. That is more convenient with separate targets.
> 
> If anyone's wondering about the "Markdown misidentified as Python"
> example: It looks like "__init__(self):" appearing in a code block
> makes libmagic consider the file Python.
> 
>   Makefile | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index b8678ea15b..cdc7ac0e4e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -125,7 +125,8 @@ endif
>   noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
>   	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
>   	randpackageconfig allyespackageconfig allnopackageconfig \
> -	print-version olddefconfig distclean manual manual-% check-package
> +	print-version olddefconfig distclean manual manual-% check-package \
> +	check-package-external
>   
>   # Some global targets do not trigger a build, but are used to collect
>   # metadata, or do various checks. When such targets are triggered,
> @@ -1262,10 +1263,27 @@ release:
>   print-version:
>   	@echo $(BR2_VERSION_FULL)
>   
> +# $(1): br2-external path
> +# $(2): br2-external description
> +define check-package-external
> +	@$(call MESSAGE,"Checking packages in $(2)")
> +	$(Q)if [ -r "$(1)/.checkpackageignore" ]; then \
> +		ignore="--ignore-list=$(1)/.checkpackageignore" ; \
> +	fi ; \
> +	$(TOPDIR)/utils/check-package \
> +		--br2-external $${ignore} \

  If "ignore" is set in the environment and there is no ignore file, this could 
create problems. So I've added an else branch to the condition above and set to 
to "".

  Regards,
  Arnout


> +		`git -C $(1) ls-tree -r --format='$(1)/%(path)' HEAD`
> +endef
> +
>   check-package:
>   	$(Q)./utils/check-package `git ls-tree -r --name-only HEAD` \
>   		--ignore-list=$(TOPDIR)/.checkpackageignore
>   
> +check-package-external:
> +	$(foreach name,$(BR2_EXTERNAL_NAMES),\
> +		$(call check-package-external,$(BR2_EXTERNAL_$(name)_PATH),\
> +			$(BR2_EXTERNAL_$(name)_DESC))$(sep))
> +
>   .PHONY: .checkpackageignore
>   .checkpackageignore:
>   	$(Q)./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
