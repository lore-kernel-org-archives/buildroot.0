Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FA2C54E64
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 13:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEF834176C;
	Thu, 28 Mar 2024 13:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wF-iIJwVaLW; Thu, 28 Mar 2024 13:14:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 390A841722
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 390A841722;
	Thu, 28 Mar 2024 13:14:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7ADB71BF405
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 13:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 643C560D66
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 13:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VpaJiex00mjd for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 13:14:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D05160D5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D05160D5E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D05160D5E
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 13:14:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 858FF13F8B9;
 Thu, 28 Mar 2024 14:14:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Mar 2024 14:14:15 +0100
Date: Thu, 28 Mar 2024 14:14:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <ZgVtJzC7VLCxua0H@landeda>
References: <20240328122818.139194-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328122818.139194-1-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711631660;
 bh=rDdf4r8bBZQEvaI8C9guQJw9GECDjr4/xGMz6xNc8mE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A4ANxwLg9L0Cn/h4dlyb4Jt/6jD+KGTYLvbP+JTliYRZbmjEXM/iRTwlL93erT+MH
 4YeWQuJ/+bAlSmPp8C8PFwYROMV0O5iY67Ohc5k+1zaioNRlSMJqFkSw59nRAx8jIk
 e0beEgIJVA5IKPjOJNfxA7I4F10t1a9a1qLxCl4l4wT8J9lacvg8WBp9/6Yn9wuiu8
 bzsc9TguMB09RqvqAVCecIGUrQWFU97XsDcbF71YVk8H8TBCDEobMPSdsx5LrIRWLF
 6x4ttqI+vuDbAOhPPjxuTZ4LksckMJ/qQIOMYA/Gm5JseS/uTL+iKifhDUG/o51l7q
 8A7aNXW+qzUNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=A4ANxwLg
Subject: Re: [Buildroot] [PATCH] Add
 BR2_ROOTFS_POST_{PRE_BUILD|POST_BUILD|FAKEROOT|IMAGE}_SCRIPT_ARGS
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
Cc: Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Heiko, All,

On 2024-03-28 13:28 +0100, Heiko Thiery spake thusly:
> You only can specify one list of arguments that are passed to several
> scripts (BR2_ROOTFS_PRE_BUILD_SCRIPT, BR2_ROOTFS_POST_BUILD_SCRIPT,
> BR2_ROOTFS_POST_FAKEROOT_SCRIPT and BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS).
> 
> So you have to be careful that the arguments for these scripts do not collide.
> 
> To allow specifiying dedicated arguments to each of the script the new
> config options are introduced. For backward compatibility the value of
> BR2_ROOTFS_POST_SCRIPT_ARGS is passed to the scripts in case the
> specific argument values are not present.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  Makefile                              |  9 ++--
>  docs/manual/customize-post-image.adoc |  5 +++
>  docs/manual/customize-rootfs.adoc     |  6 +++
>  fs/common.mk                          |  2 +-
>  system/Config.in                      | 64 ++++++++++++++++++++++++---
>  5 files changed, 76 insertions(+), 10 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 91973cca60..b2fd3e881b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -584,7 +584,8 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
>  prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT)), \
>  		$(call MESSAGE,"Executing pre-build script $(s)"); \
> -		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> +		$(EXTRA_ENV) $(s) $(TARGET_DIR) \
> +		$(if $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS)),$(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS)),$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)))$(sep))

I think I would just have gone with a much simpler solution:

    $(EXTRA_ENV) $(s) $(TARGET_DIR) \
        $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS) \
        -- \
        $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS))

I.e. always pass the generic arguments as they are passed today, add a
separating marker (the usual --), and then the new arguments.

The advantge is that it still allows to easily pass common arguments to
all scripts, adds the possibility to pass custom args to the different
types of scripts (post build, fakeroot, and post image).

The drawback is that it could break existing scripts that do iterate
over their arguments, in they are not prepared to cope with --. I have
no idea how prevalent that usage is; I would think that scripts mostly
expects a fixed number of arguments, and refer to them with explicit
positional args (${1}, ${2}...), or that they are expecting standard
getopt args, like our generic support/scripts/genimage.sh, which would
then stop processing stuff when encountering '--'.

Or even simpler yet, just pass both:

    $(EXTRA_ENV) $(s) \
        $(TARGET_DIR) \
        $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS) \
        $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS))

The reasoning here is even simpler:

 1. if people provide scripts that have a scommon set of args, and each
    type of scripts have special args, that just works:
    - if args are only positional, scripts have to hardcode that
      knowledge, so they know how to interpret the positionl args,
    - if scripts use option parsing, like with getopt, then that also
      automagically works
    In both cases, they can decide to pass the common args with the
    existing BR2_ROOTFS_POST_SCRIPT_ARGS, and the specific args with the
    new BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS, or they can decide to ignore
    he former  and ionly use the latter;

 2. if people provide scripts that have no common args, then they're
    back to the situation above, where the set of common args is just
    empty.

So, I think this last, simpler option is the best soltuion.

Thoughts?

Regards,
Yann E. MORIN.

>  .PHONY: world
>  world: target-post-image
> @@ -801,7 +802,8 @@ endif # merged /usr
>  
>  	$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
>  		@$(call MESSAGE,"Executing post-build script $(s)")$(sep) \
> -		$(Q)$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> +		$(Q)$(EXTRA_ENV) $(s) $(TARGET_DIR) \
> +		$(if $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS)),$(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS)),$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)))$(sep))
>  
>  	touch $(TARGET_DIR)/usr
>  
> @@ -819,7 +821,8 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
>  	$(Q)mkdir -p $(BINARIES_DIR)
>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
>  		$(call MESSAGE,"Executing post-image script $(s)"); \
> -		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> +		$(EXTRA_ENV) $(s) $(BINARIES_DIR) \
> +		$(if $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS)),$(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS)),$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)))$(sep))
>  
>  .PHONY: source
>  source: $(foreach p,$(PACKAGES),$(p)-all-source)
> diff --git a/docs/manual/customize-post-image.adoc b/docs/manual/customize-post-image.adoc
> index 5308093d06..1f11cf915f 100644
> --- a/docs/manual/customize-post-image.adoc
> +++ b/docs/manual/customize-post-image.adoc
> @@ -26,6 +26,11 @@ arguments will be passed to the script too. All the scripts will be
>  passed the exact same set of arguments, it is not possible to pass
>  different sets of arguments to each script.
>  
> +Note that the arguments from +BR2_ROOTFS_POST_SCRIPT_ARGS+ will also be
> +passed to post-build and post-fakeroot scripts. If you want to use
> +arguments that are only used for the post-image scripts you can use
> ++BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS+.
> +
>  Again just like for the post-build scripts, the scripts have access to
>  the environment variables +BR2_CONFIG+, +HOST_DIR+, +STAGING_DIR+,
>  +TARGET_DIR+, +BUILD_DIR+, +BINARIES_DIR+, +CONFIG_DIR+ and
> diff --git a/docs/manual/customize-rootfs.adoc b/docs/manual/customize-rootfs.adoc
> index d5d8b9288f..1384c1d2d3 100644
> --- a/docs/manual/customize-rootfs.adoc
> +++ b/docs/manual/customize-rootfs.adoc
> @@ -56,6 +56,12 @@ The post-build scripts are run with the main Buildroot tree as current
>    passed to the script too. All the scripts will be passed the exact
>    same set of arguments, it is not possible to pass different sets of
>    arguments to each script.
> +
> +  Note that the arguments from +BR2_ROOTFS_POST_SCRIPT_ARGS+ will also be
> +  passed to post-image and post-fakeroot scripts. If you want to use
> +  arguments that are only used for the post-build scripts you can use
> +  +BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS+.
> +
>  +
>  In addition, you may also use these environment variables:
>  
> diff --git a/fs/common.mk b/fs/common.mk
> index 37eafac4f7..b3fdc28f1d 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -182,7 +182,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
>  		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
>  	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
>  		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
> -		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
> +		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(if $$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT_ARGS)),$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT_ARGS),$$(BR2_ROOTFS_POST_SCRIPT_ARGS)) >> $$(FAKEROOT_SCRIPT)$$(sep))
>  
>  	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
>  		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
> diff --git a/system/Config.in b/system/Config.in
> index 33ca69b933..1a0b904a4b 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -695,20 +695,72 @@ config BR2_ROOTFS_POST_IMAGE_SCRIPT
>  
>  config BR2_ROOTFS_POST_SCRIPT_ARGS
>  	string "Extra arguments passed to custom scripts"
> -	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != "" \
> +	depends on BR2_ROOTFS_PRE_BUILD_SCRIPT != "" \
> +	        || BR2_ROOTFS_POST_BUILD_SCRIPT != "" \
>  		|| BR2_ROOTFS_POST_FAKEROOT_SCRIPT != "" \
>  		|| BR2_ROOTFS_POST_IMAGE_SCRIPT != ""
>  	help
> -	  Pass these additional arguments to each post-build or
> -	  post-image scripts.
> +	  Pass these additional arguments to each pre-build, post-build,
> +	  post-fakeroot and post-image scripts.
>  
>  	  Note that all the post-build and post-image scripts will be
>  	  passed the same set of arguments, you can not pass different
>  	  arguments to each script.
>  
>  	  Note also, as stated in their respective help text, that the
> -	  first argument to each post-build or post-image script is the
> -	  target directory / images directory. The arguments in this
> -	  option will be passed *after* those.
> +	  first argument to each script is the target directory / images
> +	  directory. The arguments in this option will be passed *after* those.
> +
> +config BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS
> +	string "Extra arguments passed to BR2_ROOTFS_PRE_BUILD_SCRIPT"
> +	depends on BR2_ROOTFS_PRE_BUILD_SCRIPT != ""
> +	help
> +	  Pass these additional arguments to the pre-build script.
> +
> +	  Note that BR2_ROOTFS_POST_SCRIPT_ARGS is ignored for pre-build
> +	  scripts if this option is set.
> +
> +	  Note also, as stated in the respective help text, that the
> +	  first argument to each script is the target directory.
> +	  The arguments in this option will be passed *after* those.
> +
> +config BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS
> +	string "Extra arguments passed to BR2_ROOTFS_POST_BUILD_SCRIPT"
> +	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != ""
> +	help
> +	  Pass these additional arguments to the post-build script.
> +
> +	  Note that BR2_ROOTFS_POST_SCRIPT_ARGS is ignored for post-build
> +	  scripts if this option is set.
> +
> +	  Note also, as stated in the respective help text, that the
> +	  first argument to each script is the target directory.
> +	  The arguments in this option will be passed *after* those.
> +
> +config BR2_ROOTFS_POST_FAKEROOT_SCRIPT_ARGS
> +	string "Extra arguments passed to BR2_ROOTFS_POST_FAKEROOT_SCRIPT"
> +	depends on BR2_ROOTFS_POST_FAKEROOT_SCRIPT != ""
> +	help
> +	  Pass these additional arguments to the post-fakeroot script.
> +
> +	  Note that BR2_ROOTFS_POST_SCRIPT_ARGS is ignored for post-fakeroot
> +	  scripts if this option is set.
> +
> +	  Note also, as stated in the respective help text, that the
> +	  first argument to each script is the target directory.
> +	  The arguments in this option will be passed *after* those.
> +
> +config BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS
> +	string "Extra arguments passed to POST_IMAGE_SCRIPT"
> +	depends on BR2_ROOTFS_POST_IMAGE_SCRIPT != ""
> +	help
> +	  Pass these additional arguments to the post-image script.
> +
> +	  Note that BR2_ROOTFS_POST_SCRIPT_ARGS is ignored for post-image
> +	  scripts if this option is set.
> +
> +	  Note also, as stated in the respective help text, that the
> +	  first argument to each script is the images directory.
> +	  The arguments in this option will be passed *after* those.
>  
>  endmenu
> -- 
> 2.39.2
> 

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
