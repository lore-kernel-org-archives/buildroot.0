Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7E2CD11DF
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 20:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD951417ED;
	Thu, 28 Mar 2024 20:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZQnmBpBfJdI; Thu, 28 Mar 2024 20:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4F11417EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4F11417EE;
	Thu, 28 Mar 2024 20:51:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0955E1BF2F6
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 20:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA399417ED
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 20:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHyfcO3R-uKN for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 20:51:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE2D2400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE2D2400B5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE2D2400B5
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 20:51:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 03FC413F846;
 Thu, 28 Mar 2024 21:50:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Mar 2024 21:50:54 +0100
Date: Thu, 28 Mar 2024 21:50:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <ZgXYLsp66NNKB6Aq@landeda>
References: <20240328140919.157664-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328140919.157664-1-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711659060;
 bh=+jYuk12tcf52BSTI5jIT3Lag/d5cw7uOFdU1/glduok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bUrk/NVMSGme5mSUcvVlZa8haGhHtrrbxekMvl9cb5qqJcU0iD17BBy9JRRNOhNKU
 UNxzC3LFrATSmHCWg9y9sRV+irn7c+sJtHTUD8yVWbF3J9qlCBxn0Er2k/5nsDYs2+
 fDULvzHUwu6NMwgHDC/OB59MZHAPsptVyYYVNZuC05ZVb5lFgHtFdcEHTOp9q2nEXb
 0mCLf+Szu2ei2RXYaGospO6Bbs0AiR+oWFE+NObxFTGdlPtY0kH9DyCaG2FHM1zyLw
 X+YEBptBAUbZbOq0jUlRXYXjB3mwInx+sm78RAqE3uR9+dn0RhoAEE2j5xV4yPDGpV
 bFpOPAjA9PK7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bUrk/NVM
Subject: Re: [Buildroot] [PATCH v2] Add
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Heiko, All,

On 2024-03-28 15:09 +0100, Heiko Thiery spake thusly:
> You only can specify one list of arguments that are passed to several
> scripts (BR2_ROOTFS_PRE_BUILD_SCRIPT, BR2_ROOTFS_POST_BUILD_SCRIPT,
> BR2_ROOTFS_POST_FAKEROOT_SCRIPT and BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS).
> 
> So you have to be careful that the arguments for these scripts do not collide.
> 
> To allow specifiying dedicated arguments to each of the script the new
> config options are introduced. For backward compatibility the value of
> BR2_ROOTFS_POST_SCRIPT_ARGS is still passed to the scripts. But now you
> can add specfic arguments from the new config option.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
[--SNIP--]
> diff --git a/Makefile b/Makefile
> index 91973cca60..a7d9f9149c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -584,7 +584,9 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
>  prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT)), \
>  		$(call MESSAGE,"Executing pre-build script $(s)"); \
> -		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> +		$(EXTRA_ENV) $(s) $(TARGET_DIR) \
> +		$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)) \
> +		$(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS))$(sep))

I've rewrapped this in a more common way:

    $(EXTRA_ENV) $(s) \
        $(TARGET_DIR) \
        $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)) \
        $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS))

>  .PHONY: world
>  world: target-post-image
> @@ -801,7 +803,9 @@ endif # merged /usr
> 
>  	$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
>  		@$(call MESSAGE,"Executing post-build script $(s)")$(sep) \
> -		$(Q)$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> +		$(Q)$(EXTRA_ENV) $(s) $(TARGET_DIR) \
> +		$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)) \
> +		$(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS))$(sep))

Ditto.

>  	touch $(TARGET_DIR)/usr
> 
> @@ -819,7 +823,9 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
>  	$(Q)mkdir -p $(BINARIES_DIR)
>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
>  		$(call MESSAGE,"Executing post-image script $(s)"); \
> -		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> +		$(EXTRA_ENV) $(s) $(BINARIES_DIR) \
> +		$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)) \
> +		$(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS))$(sep))

Ditto.

[--SNIP--]
> diff --git a/fs/common.mk b/fs/common.mk
> index 37eafac4f7..2f3f8bcc7e 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -182,7 +182,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
>  		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
>  	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
>  		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
> -		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
> +		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) $$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))

But not here.

[--SNIP--]
> +config BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS
> +	string "Extra arguments passed to BR2_ROOTFS_PRE_BUILD_SCRIPT"
> +	depends on BR2_ROOTFS_PRE_BUILD_SCRIPT != ""
> +	help
> +	  Pass these additional arguments to the pre-build script.
> +
> +	  Note also, as stated in the respective help text, that the
> +	  first argument to each script is the target directory.
> +	  The arguments in this option will be passed *after* those.

I fixed those help texts to also mention that common args are passed,
and thus the specific args are passed after.

Applied to master, thanks.

Regards,
Yann E. MORIN.

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
