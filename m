Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84367CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 423F26F543;
	Sat, 30 May 2026 12:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNeWws_3JO9s; Sat, 30 May 2026 12:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 473A76F544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780145174;
	bh=VL+7+jW+SH8ty1Sts7Z+l1UKGxfrnPXcF/nx+HWPYU4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Maq18UVMlOdzQ65rvJigteIrs3MqrXFMnC4lXAMoJbDxBeeIkJUaUxFiPWIQr/54F
	 YO6YxmpO+38RyHQJ9aq+Lj3A5ovpxogFWJqtzdICmiwou+mWcjUd5qSeniu3IXd+su
	 RTwuZj0VPNY4BQ6uApiWlejLCkTI3oPTaxbIkoqfTGbc9QywehOU23CYiMPmgGYZe1
	 E7L+vF9lB8JWMmPYfATciLk//3N0EehYFjeJEwFST2e9WeLhe3MWsMVBJA2RCR8WPZ
	 abnQUutI6Bqw6fqNZk6MJa4JG8cVUkjyRi4mZo11VblZHM6DmgeBBh3cVWZFr0ttbG
	 tyueAsC3XamPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 473A76F544;
	Sat, 30 May 2026 12:46:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D9DE218
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F535407FD
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BrbhMO6XpXpK for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33C38407A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33C38407A3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33C38407A3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:46:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5F92EB97C70F; Sat, 30 May 2026 11:08:30 +0200 (CEST)
Message-ID: <12951dcc-30e0-4004-bab4-50190ed6cb17@rnout.be>
Date: Sat, 30 May 2026 11:08:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260529175156.572429-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260529175156.572429-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780132110; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=B+7r/4F/SBNuCuLf8R0ulLzGkplzUH/pdUpsos0IXJU=;
 b=YiXIViTbiR5PwLMZnRpygk/1cC4xzabJxG7O/g6AeQO/W5auJrvydJH/e0dNr7K/q6Vbg6
 LbmqJl/ulpXLEJWIEK8XKyhKWDk4pnnW09Yzh22TZUlhhcp4WGGzeUMakN7fwQTPAwFxL/
 bdOcBp6+A2XOCjjN8dZSNeCeJQu0fNoxgFikOvRUCY+EZiiTmyKOe1z75RyK2iA8us/XK7
 DiV/X8VBvH33Vpv/UCVL4KK2gXqwZQBBVMsG4hzSPyVJDoG6fVEb4jj+pvK8IRgXpTRZNK
 j/PrE6X9yc2ELCO4OvVTjmnDQWfTBKfj/jZ0a2Vosd+psFhTmv8YT415bv4hgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=YiXIViTb
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/05/2026 19:51, Thomas Perale via buildroot wrote:
> The maintainance and testing workflow sometimes requires to output a
> list of every existing packages on Buildroot:
> 
> - Generating an SBOM of the whole Buildroot tree for
>    security.buildroot.org
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

  Applied to master, thanks, with one change and some updates to the commit message.

> ---
> 
> v1 --> v2: removed TARGETS_ROOTFS and recursive dependencies. It
>    introduced "host-" package with no name that introduced an empty
>    entry when generating an sbom when `make show-info-all` is ran without
>    defconfig.
>    Checked the diff between the previous version and the new one and
>    except the empty entry nothing is changed by just iterating over
>    PACKAGES_ALL.
> 
> v2 --> v3:
>   - add documentation to make help and manual
>   - fix the error message from check-host-cmake.sh when cmake3 is present
>     in the path
> ---
>   Makefile                      | 24 ++++++++++++++++++++++--
>   docs/manual/common-usage.adoc | 12 ++++++++++++
>   2 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index cb52a1d668..b4ce363f5b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -126,7 +126,7 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
>   	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
>   	randpackageconfig allyespackageconfig allnopackageconfig \
>   	print-version olddefconfig distclean manual manual-% check-package \
> -	check-package-external
> +	check-package-external show-info-all
>   
>   # Some global targets do not trigger a build, but are used to collect
>   # metadata, or do various checks. When such targets are triggered,
> @@ -142,7 +142,7 @@ nobuild_targets := source %-source \
>   	clean distclean help show-targets graph-depends \
>   	%-graph-depends %-show-depends %-show-version \
>   	graph-build graph-size list-defconfigs \
> -	savedefconfig update-defconfig printvars show-vars
> +	savedefconfig update-defconfig printvars show-vars show-info-all
>   ifeq ($(MAKECMDGOALS),)
>   BR_BUILDING = y
>   else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
> @@ -236,6 +236,13 @@ BR2_CONFIG = $(CONFIG_DIR)/.config
>   ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
>   -include $(BR2_CONFIG)
>   endif
> +# show-info-all needs to access the PACKAGES_ALL variable. This variable
> +# contains a reference to every package present in Buildroot.
> +# Since the 'show-info-all' command might be used without actually having a
> +# dotconfig this condition is forced to be set true.
> +ifeq ($(MAKECMDGOALS),show-info-all)
> +BR2_HAVE_DOT_CONFIG = y
> +endif
>   
>   ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),)
>   # Disable top-level parallel build if per-package directories is not
> @@ -948,6 +955,17 @@ show-info:
>   		) \
>   	)
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

  This is the same structure as show-info, so I refactored the two with an 
additional show-info-inner goal.

  Regards,
  Arnout

> +
>   .PHONY: pkg-stats
>   pkg-stats:
>   	@cd "$(CONFIG_DIR)" ; \
> @@ -1213,6 +1231,8 @@ help:
>   	@echo '  external-deps          - list external packages used'
>   	@echo '  legal-info             - generate info about license compliance'
>   	@echo '  show-info              - generate info about packages, as a JSON blurb'
> +	@echo '  show-info-all          - generate info about all packages in Buildroot,'
> +	@echo '                           regardless of configuration or target architecture'
>   	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
>   	@echo '  printvars              - dump internal variables selected with VARS=...'
>   	@echo '  show-vars              - dump all internal variables as a JSON blurb; use VARS=...'
> diff --git a/docs/manual/common-usage.adoc b/docs/manual/common-usage.adoc
> index 7437a7c3c0..631c2f7788 100644
> --- a/docs/manual/common-usage.adoc
> +++ b/docs/manual/common-usage.adoc
> @@ -170,6 +170,18 @@ by using the +show-info+ make target:
>   make show-info
>   ----
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
>   Buildroot can also produce details about packages as HTML and JSON
>   output using the +pkg-stats+ make target. Amongst other things, these
>   details include whether known CVEs (security vulnerabilities) affect

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
