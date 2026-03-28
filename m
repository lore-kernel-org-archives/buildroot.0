Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759E610D1482
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 20:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 208D183E11;
	Sat, 28 Mar 2026 20:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXUFEQdnBnBv; Sat, 28 Mar 2026 20:52:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3026C83E14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774731127;
	bh=sJAK/j4wQbkXy5ukHoCVl/PoeiNvaxX/kXqns7FVi84=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QkLuT3Z96PzH5dJ7FnY96HgKdyKrrjnXqVMujRMdaMbmi/fvN71j3LVc3sjRC09Di
	 zLTaHrzPIBR+I/VVWNWZ7siuyq9OsVlDXvg3zfPLbSaIm2SJY11U56uYUWJ7yyoMa6
	 gBCybIzNxsXsfJLy7y7yGyJylxaCHUo/k6s/KH/zWEjEUdckLfCRIvr+Gut/FuzgM+
	 j5PyjahMEwp8PX4f2sG6mspOQkYaYUoKlD+dS1awjBw4MDuPArCFOiqRlYZdxOGkUH
	 6mnT00jINMDM/WMzumXVpVLcBsKXbSMYR0V9d7yHb5r914r9DQH4F6iUmFRPNoLE1n
	 z7klk/M1N0RtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3026C83E14;
	Sat, 28 Mar 2026 20:52:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B471D10F
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 20:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A1B760B1C
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 20:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6mLJYHXW7ar for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 20:52:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1182E60A85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1182E60A85
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1182E60A85
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 20:52:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5DB2A19F57B;
 Sat, 28 Mar 2026 21:51:59 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Mar 2026 21:51:59 +0100
MIME-Version: 1.0
Date: Sat, 28 Mar 2026 21:51:59 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260311131529.120513-1-thomas.perale@mind.be>
References: <20260311131529.120513-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <e4307dd2c0354b5ca69b1403a3ebe98a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774731120;
 bh=dUcWlHree7mdYLG0sOeH3ym0JPS/dfASP8m95Wraqco=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BuWIKvuOa8BHpyJ2ManOnt880qxJvz/gQ7Ig49CrCOOCB/SQHhpOsAG8T3BGu6o4n
 NfA92C+uprEfMBwIyLO+hNF9uIbowC8b4s87Hmyduac263HUaTHa2AJRQYS3fo3mkM
 RVg2n3DZqB5KrgvWX3mFM8DGkGoXoBw6LJJ6kGx0EIjrK6ykx9pzHyeIKGDnkA1DPg
 YlMK/LHAHLXUcs33x+JWcB9HcjAh+RVgeIrSRzHSFTL3YcINj0VeGucQlmLi0CRvqa
 FTSMb5xg2y0XHF0QmvehRp0QavGNmU9lB5DWy2orzYbWd8iFL0DKwuoMXt4MmUjFnl
 Fh3hTBsgQqBOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BuWIKvuO
Subject: Re: [Buildroot] [v2, PATCH] Makefile: add 'show-info-all'
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Thanks for the patch.

This new "show-info-all" should be documented in the
"make help" target, in the misc section:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/Makefile?ref_type=tags#L1204
saying it will show all packages available in Buildroot (not only
the selected ones). And possibly also in the manual:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/docs/manual/common-usage.adoc
in which you can say it is intended for Buildroot maintenance (sbom, 
cve, ...).

On 11/03/2026 14:15, Thomas Perale via buildroot wrote:
> The maintainance and testing workflow sometimes requires to output a
> list of every existing packages on Buildroot:
> 
> - Generating an SBOM of the whole Buildroot tree for
>   security.buildroot.org
> - List every sources for every packages for source.buildroot.org
> 
> The previous solution relied on `make allyesconfig` but always ran into
> conflicts that needed manual resolution. Also some packages would not 
> be
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
> ---
> 
> v1 --> v2: removed TARGETS_ROOTFS and recursive dependencies. It
>   introduced "host-" package with no name that introduced an empty
>   entry when generating an sbom when `make show-info-all` is ran 
> without
>   defconfig.
>   Checked the diff between the previous version and the new one and
>   except the empty entry nothing is changed by just iterating over
>   PACKAGES_ALL.
> 
>  Makefile | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index f51155b0ed..bd037cc834 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -126,7 +126,7 @@ noconfig_targets := menuconfig nconfig gconfig 
> xconfig config oldconfig randconf
>  	defconfig %_defconfig allyesconfig allnoconfig alldefconfig 
> syncconfig release \
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
> +# show-info-all needs to access the PACKAGES_ALL variable. This 
> variable
> +# contains a reference to every packages present in Buildroot.
> +# Since the 'show-info-all' command might be used without actually 
> having a
> +# dotconfig this condition is forced to be set true.
> +ifeq ($(MAKECMDGOALS),show-info-all)
> +BR2_HAVE_DOT_CONFIG = y
> +endif
> 
>  ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),)
>  # Disable top-level parallel build if per-package directories is not
> @@ -941,6 +948,17 @@ show-info:
>  		) \
>  	)
> 
> +.PHONY: show-info-all
> +show-info-all:

On my Fedora 43 system, running "make show-info-all" with this patch
shows the errors:

support/dependencies/check-host-cmake.sh: line 35: [: cmake: integer 
expected
support/dependencies/check-host-cmake.sh: line 38: [: cmake: integer 
expected

but the expected output is generated after.

When running in the reference docker image, it works as expected:
utils/docker-run make show-info-all

For some reasons, on Fedora 43, the script is called with:

support/dependencies/check-host-cmake.sh cmake cmake3

It should be called with $(BR2_CMAKE_VERSION_MIN).
See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/support/dependencies/check-host-cmake.mk#L11

for example:
support/dependencies/check-host-cmake.sh 3.18 cmake cmake

I believe in your case of show-info-all, those dependencies checks
should not be called at all.

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
> --
> 2.53.0

Could you add the small documentation description and improve
the srcipt to avoid the errors, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
