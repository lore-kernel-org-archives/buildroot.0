Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D99C433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 19:00:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B071B60240
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 19:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B071B60240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82DE6607A9;
	Wed, 10 Nov 2021 19:00:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jXfl6b-JeHfC; Wed, 10 Nov 2021 19:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF49160AF6;
	Wed, 10 Nov 2021 19:00:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B800F1BF5A4
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 19:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A66E1404AB
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 19:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5sKvteHTmBHF for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 19:00:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A176404A0
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 19:00:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90c4:eaed:10a6:22de])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C3B075FFAE;
 Wed, 10 Nov 2021 20:00:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636570816;
 bh=oObXR3wEIgttZauQHiO4m79rv21xLvqYoL1J07Ik1UY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YLmJJpzC5QTAAv6B6d+TjXBMQKVdAEYJ6AeiQqEHN4B93D3KCFwGWfuAn8Z5AbJe3
 9PYaM1HbqEImMWNKFSvGW/qpq7KEDgy0vQQNpq9wRC2eCrkBr89nWeFuAFeDk0hmL9
 6IWyy52g3Vvz9udJ21xVMS/oZfMfvcDHI5tl3yX8ApyybY8jX0pE8YWm0/tG5c+8Gm
 uhs0MLN/XR+MhQNYyiMqq0KL7Vrd4unHnaGDIG+AGEzBPxQgLr4jc0DQHXoBXqcedD
 sV6nDUUMZsQAEEuXa0V9jS5t2MNKKAkLHONwCtqgAYU/2GgKxxBodQ2E1WbgrXS8R1
 5heZJugrSIQpQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 20:00:05 +0100
Date: Wed, 10 Nov 2021 20:00:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Tan Xiaofan <xfan1024@live.com>
Message-ID: <20211110190005.GN2084998@scaer>
References: <AM6PR03MB56227C126CCA7748EAB48382B5939@AM6PR03MB5622.eurprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM6PR03MB56227C126CCA7748EAB48382B5939@AM6PR03MB5622.eurprd03.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] fs: allow strip binaries when create rootfs
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Xiaofan, All,

+Peter, +Arnout, +Thomas

On 2021-11-10 16:10 +0000, Tan Xiaofan spake thusly:
> From 2f74b5bedffdf32e71a3786ca740c82257982f80 Mon Sep 17 00:00:00 2001
> From: xiaofan <xfan1024@live.com>
> Date: Wed, 10 Nov 2021 23:13:25 +0800
> Subject: [PATCH] fs: allow strip binaries when create rootfs
> 
> Add BR2_STRIP_ROOTFS option, it is useful when using gdbserver on
> target board. Host need unstriped binares for debug info and target
> need only striped binares for rootfs size.
> 
> Signed-off-by: xiaofan <xfan1024@live.com>

This is a simple approach to the problem, indeed. However, I think the
choice is not needed: just keep the boolean option, and move the whole
stripping out of target-finalize and into the fs creation step.

Thoughts?

Regards,
Yann E. MORIN.

> ---
>  Config.in           | 21 +++++++++++++++++----
>  fs/common.mk        |  4 ++++
>  package/Makefile.in |  5 +++--
>  3 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index 3db2c8d..60a15ae 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -425,10 +425,10 @@ config BR2_ENABLE_RUNTIME_DEBUG
>  	  Note: disabling this option is not a guarantee that all
>  	  packages effectively removed these runtime debugging elements.
>  
> -config BR2_STRIP_strip
> -	bool "strip target binaries"
> -	default y
> -	depends on !BR2_PACKAGE_HOST_ELF2FLT
> +choice
> +	prompt "strip target binaries"
> +	default BR2_STRIP_strip if !BR2_PACKAGE_HOST_ELF2FLT
> +	default BR2_STRIP_DISABLE if BR2_PACKAGE_HOST_ELF2FLT
>  	help
>  	  Binaries and libraries in the target filesystem will be
>  	  stripped using the normal 'strip' command. This allows to save
> @@ -436,6 +436,19 @@ config BR2_STRIP_strip
>  	  on the target are needed for native debugging, but not when
>  	  remote debugging is used.
>  
> +config BR2_STRIP_strip
> +	bool "enable"
> +	depends on !BR2_PACKAGE_HOST_ELF2FLT
> +
> +config BR2_STRIP_ROOTFS
> +	bool "enable: only affects on rootfs image"
> +	depends on !BR2_PACKAGE_HOST_ELF2FLT
> +
> +config BR2_STRIP_DISABLE
> +	bool "disable"
> +
> +endchoice
> +
>  config BR2_STRIP_EXCLUDE_FILES
>  	string "executables that should not be stripped"
>  	default ""
> diff --git a/fs/common.mk b/fs/common.mk
> index afab7b5..ac261ba 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -171,6 +171,10 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
>  		--exclude=/$$(notdir $$(TARGET_DIR_WARNING_FILE)) \
>  		$$(BASE_TARGET_DIR)/ \
>  		$$(TARGET_DIR)
> +ifeq ($$(BR2_STRIP_ROOTFS),y)
> +	$$(STRIP_FIND_CMD) | xargs -0 $$(STRIPCMD_ALWAYS) 2>/dev/null || true
> +	$$(STRIP_FIND_SPECIAL_LIBS_CMD) | xargs -0 -r $$(STRIPCMD_ALWAYS) $$(STRIP_STRIP_DEBUG) 2>/dev/null || true
> +endif
>  
>  	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
>  	echo "set -e" >> $$(FAKEROOT_SCRIPT)
> diff --git a/package/Makefile.in b/package/Makefile.in
> index dae7a85..d623837 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -224,10 +224,11 @@ TARGET_READELF  = $(TARGET_CROSS)readelf
>  TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
>  TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
>  
> -ifeq ($(BR2_STRIP_strip),y)
>  STRIP_STRIP_DEBUG := --strip-debug
> +STRIPCMD_ALWAYS = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
> +ifeq ($(BR2_STRIP_strip),y)
>  TARGET_STRIP = $(TARGET_CROSS)strip
> -STRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
> +STRIPCMD = $(STRIPCMD_ALWAYS)
>  else
>  TARGET_STRIP = /bin/true
>  STRIPCMD = $(TARGET_STRIP)
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
