Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02E9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 21:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55C8A847AE;
	Thu, 17 Mar 2022 21:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YgO9zySmn2fh; Thu, 17 Mar 2022 21:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56ECE8434F;
	Thu, 17 Mar 2022 21:27:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEEFE1BF315
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC88D40469
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nx6CsGCfqupq for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 21:27:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A194A40194
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 21:27:56 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id yy13so13411988ejb.2
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 14:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qGNpHqObDhJUSmWgBZLdDBlyRA/XlE6mnXtAlwRR0BI=;
 b=A2kp9qZnOcFeryEdbEs3RWhVUc0w7RQj7V9eDnaP+Whi3mLyNHMgearI5NnAXczpe+
 EDybSDi6FBhQZZwhKNzl8b41iH9ynOuuXU64Yl2EK6S8Nkeos5mtayR64ew6lDAzJyYD
 jKcGGXXRUjlrEHELdFOMeZduwWKggolA4ugkNmzuiTXkwN/xhGeVD7SlGXZZKxtT///x
 Ixz/ipb0dnqjXGKhSBAyn40wnqR2ATyGQSJQcD/TIwCSpb2DHuyS5kW1ZP9m76fQIgio
 dmUvgLl73Pbwrid/Sbluhw8ncmx361tRwlkQsSqsIeMlwKF/qLmckjRmC8qbWNqRR5ij
 zSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qGNpHqObDhJUSmWgBZLdDBlyRA/XlE6mnXtAlwRR0BI=;
 b=jP0AXd2M7+Nyy61Vr7PpNk3hZp4eB2AYmO0ERa5i38cixgFtWHXZqjKcyWc5XrUfzB
 lro9C8IHn9Dh/4FffDcfxy3HvquaWI6ZPRr6HGxd1ovLG+9Sxh4hjr2GzPIPoWBG3X+B
 rkTN+j/u2ooTZ5GBVLCjyrju2S7XaYXYIwDQOndUeew0bkY9A95otjlq5BSP8FXuYAKW
 wZ/69WHuz3gbAb44fOYSHPPDwq1hUqg0hTx1bRoHk0oR4njxNi+S2x1DwfoLtIbEI7+J
 pKQHGiyub4/0faq1N9+tEY7/OU+245I2QDGl7b8AEQ0xj/CEI+uiI3vND/OSICXBpHYU
 g6Wg==
X-Gm-Message-State: AOAM532Co9IWMPxehvGkzfUre24MrDR4ykvo1dGN4An4vB0hQEZCbMSJ
 3sCGEjYiGha1oF83qtYKWaO5ag==
X-Google-Smtp-Source: ABdhPJxHdkLwH+LrVLlsy3yrWKouYyckntsk96yYY07hWAOp6Ih5PcJPdnUOtYTd+0XgGw01kg4USw==
X-Received: by 2002:a17:907:da9:b0:6da:beb8:fdac with SMTP id
 go41-20020a1709070da900b006dabeb8fdacmr6379137ejc.364.1647552474308; 
 Thu, 17 Mar 2022 14:27:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a056402520b00b00416c0baee96sm3319720edd.6.2022.03.17.14.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 14:27:53 -0700 (PDT)
Message-ID: <9470ba2b-e40f-322d-b37a-f0daea8f5059@mind.be>
Date: Thu, 17 Mar 2022 22:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Anssi Hannula <anssi.hannula@bitwise.fi>, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220316101223.3704745-1-anssi.hannula@bitwise.fi>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220316101223.3704745-1-anssi.hannula@bitwise.fi>
Subject: Re: [Buildroot] [PATCH] pkg-generic: fix rdepends and phony targets
 of virtual packages
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



On 16/03/2022 11:12, Anssi Hannula wrote:
> Virtual packages are not added to the _RDEPENDENCIES list of packages
> that they depend on (i.e. their provider).
> 
> This causes <provider>-show-rdepends to not show the virtual package
> and <provider>-show-recursive-rdepends to miss all the packages that
> transitively depend on <provider> via the virtual package.
> 
> The virtual make targets (e.g. <pkg>-show-info) are also not marked as
> phony for virtual packages.
> 
> To fix those issues, remove most of the special handling of virtual
> packages in pkg-generic by making $($($(1)_KCONFIG_VAR))=y for them as
> well.
> 
> This also allows removal of some duplicated code in pkg-generic.mk and a
> now unneeded special condition in CHECK_ONE_DEPENDENCY.
> 
> Still keep the virtual package out of PACKAGES since there is e.g. no
> need to rsync per-package target dir to global target dir. I am not
> aware of any showstoppers preventing addition to PACKAGES as well,
> though, so it is probably just an optimization.
> 
> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
> ---
> 
> I encountered this while using <pkg>-show-recursive-rdepends to
> determine which packages to dirclean after modification of a
> (non-virtual) <pkg> in per-package mode.
> 
> The current virtual vs. real distinction didn't seem worth the risk of

  Well, I guess there *was* a reason that we introduced this distinction way 
back when, and that all the build targets are skipped for virtual packages. 
However, I can't remember the reason. Maybe Yann (the instigator of this 
feature) still remembers?

  Looking at the history, in particular e.g. commit c5d546450fc1 that converts 
libgles from generic infrastructure to virtual, it looks like it really *should* 
be OK to keep the full build targets. And in that case, this patch is a really 
nice simplification!

  So, unless Yann objects, I'd say: let's try it and let the autobuilders complain!

  Regards,
  Arnout

> unintentional differences so I dropped it, but I'm not too familiar with
> the code so I could have missed something.
> In case I did and this is not a good idea, one less intrusive option
> would be to split the common-to-virtual-and-real-packages code to be
> under a new separate conditional block.
> 
> 
>   Makefile               |  2 --
>   package/pkg-generic.mk | 24 +++++-------------------
>   2 files changed, 5 insertions(+), 21 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 4f693d40a9..9e875dd8d8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -565,14 +565,12 @@ ifeq ($(BR_FORCE_CHECK_DEPENDENCIES),YES)
>   
>   define CHECK_ONE_DEPENDENCY
>   ifeq ($$($(2)_TYPE),target)
> -ifeq ($$($(2)_IS_VIRTUAL),)
>   ifneq ($$($$($(2)_KCONFIG_VAR)),y)
>   $$(error $$($(2)_NAME) is in the dependency chain of $$($(1)_NAME) that \
>   has added it to its _DEPENDENCIES variable without selecting it or \
>   depending on it from Config.in)
>   endif
>   endif
> -endif
>   endef
>   
>   $(foreach pkg,$(call UPPERCASE,$(PACKAGES)),\
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index b3a7e1d60e..a0d6198edc 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -1064,15 +1064,15 @@ $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
>   $$($(2)_TARGET_DIRCLEAN):		NAME=$(1)
>   
>   # Compute the name of the Kconfig option that correspond to the
> -# package being enabled. We handle three cases: the special Linux
> -# kernel case, the bootloaders case, and the normal packages case.
> -# Virtual packages are handled separately (see below).
> +# package being enabled.
>   ifeq ($(1),linux)
>   $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
>   else ifneq ($$(filter boot/% $$(foreach dir,$$(BR2_EXTERNAL_DIRS),$$(dir)/boot/%),$(pkgdir)),)
>   $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
>   else ifneq ($$(filter toolchain/% $$(foreach dir,$$(BR2_EXTERNAL_DIRS),$$(dir)/toolchain/%),$(pkgdir)),)
>   $(2)_KCONFIG_VAR = BR2_$(2)
> +else ifeq ($$($(2)_IS_VIRTUAL),YES)
> +$(2)_KCONFIG_VAR = BR2_PACKAGE_HAS_$(2)
>   else
>   $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
>   endif
> @@ -1178,7 +1178,9 @@ $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
>   $(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
>   $(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
>   
> +ifneq ($$($(2)_IS_VIRTUAL),YES)
>   PACKAGES += $(1)
> +endif
>   
>   ifneq ($$($(2)_PERMISSIONS),)
>   PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
> @@ -1268,22 +1270,6 @@ ifneq ($$($(2)_HELP_CMDS),)
>   HELP_PACKAGES += $(2)
>   endif
>   
> -# Virtual packages are not built but it's useful to allow them to have
> -# permission/device/user tables and target-finalize/rootfs-pre-cmd hooks.
> -else ifeq ($$(BR2_PACKAGE_HAS_$(2)),y) # $(2)_KCONFIG_VAR
> -
> -ifneq ($$($(2)_PERMISSIONS),)
> -PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
> -endif
> -ifneq ($$($(2)_DEVICES),)
> -PACKAGES_DEVICES_TABLE += $$($(2)_DEVICES)$$(sep)
> -endif
> -ifneq ($$($(2)_USERS),)
> -PACKAGES_USERS += $$($(2)_USERS)$$(sep)
> -endif
> -TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
> -ROOTFS_PRE_CMD_HOOKS += $$($(2)_ROOTFS_PRE_CMD_HOOKS)
> -
>   endif # $(2)_KCONFIG_VAR
>   endef # inner-generic-package
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
