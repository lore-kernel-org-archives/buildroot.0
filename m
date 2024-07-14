Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3E3C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 16:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A12C14042A;
	Sun, 14 Jul 2024 16:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-YxlV_RZY1K; Sun, 14 Jul 2024 16:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3780840242
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3780840242;
	Sun, 14 Jul 2024 16:47:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 539F01BF32B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 410896059F
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BZYUkiVLgEe for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 16:47:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4154660595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4154660595
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4154660595
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 16:47:18 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-426526d30aaso24683115e9.0
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720975637; x=1721580437;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L9X2G9yDZfiB8J7azNP0C1CW4/RkZG/Vxxh0vhMM/U0=;
 b=bKmX98SfdyPsxGy3hdLp49WGWU7flq4RMJaJJCAO+44blEIda/aDGiNIXpaNIKcYZx
 VcmEcFt4q95M+bCoQsdwvm1H/4bUVZHpqoh9V5NDSOCacfSFMEx74rl2jSs+PItiiyrc
 WCzxBGGpTOnr/oHSREQDdosshBTeGTLs0wIwE7SSXLHUjaTE7PfgV24yjbecPsJ7dx4v
 oOPiOWaPxQCI+YiawDI4bmPpkFWK+cRJy/MO4tjisINEtJ2cw0cX8lY+LkLcD0yPWNhW
 fHOCtYC5cmxWeh88BLNiDCpB4LsMfcnugwCJjE62BVl8lWuewv+kSeu5bmzYUzrHcpDT
 4gNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlvqvbAm4v9Z6vP24UV+MP4TUZKalKw3zZ5Huppd7h6yTzjO75zI6lPWkdXnYGNA/ts6w+bB/NiYHfLXZjFpChkM0ho7nB0w==
X-Gm-Message-State: AOJu0YyRyRkBPRh8jXoC/rKCz552jsaUiRp+csoXNkBdUEVZ5ncc4Ob/
 V08AogOsrXbFs/+Ysg1+bYfbBSM7seK/cpE4CSYZBX1bKpK7+SUGsataVljwzfU=
X-Google-Smtp-Source: AGHT+IEraMyUJJ/ehN7QYR85zrddNkfh0z8mrV6rZKMGmYhk8jNnI+g4Je80VPse6RyHpSxXnCDArQ==
X-Received: by 2002:a05:600c:54ec:b0:423:791:f446 with SMTP id
 5b1f17b1804b1-426707cf5f7mr109071485e9.7.1720975636975; 
 Sun, 14 Jul 2024 09:47:16 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2cc2efsm92686765e9.36.2024.07.14.09.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 09:47:16 -0700 (PDT)
Message-ID: <0bb252e4-80d5-46ea-bc32-fbe31fbaef71@mind.be>
Date: Sun, 14 Jul 2024 18:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charles Hardin <ckhardin@gmail.com>, buildroot@buildroot.org
References: <20230209231518.9458-1-ckhardin@gmail.com>
 <cover.1677104777.git.ckhardin@gmail.com>
 <70c8c0b4e34438c96257697086ff8b62fb6f2cd7.1677104777.git.ckhardin@gmail.com>
Content-Language: en-GB
In-Reply-To: <70c8c0b4e34438c96257697086ff8b62fb6f2cd7.1677104777.git.ckhardin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720975637; x=1721580437; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L9X2G9yDZfiB8J7azNP0C1CW4/RkZG/Vxxh0vhMM/U0=;
 b=Q/hWKsMzdJK99fpLaUKFDM7dMHeRKIArdxyWutWYGWI8nnGCXEe6XiSmuSlVpr5I1E
 4yfluowyeAzvmsQD1ZSNRzYGJmM3t3tJGZ/5SnBMTYpFHBuOLuwHsZqtacS8dsqCYA0U
 KEjTsFx6m4SvnJRUjqFlJk2r7Tv60oAllyRjsTpuTS3bowaofeY8KLe9f3yllNis8/yL
 5abwongPhDmme+K6FbU7tgRuB6vp0Xp17j5wPuWvBFjhEV51xinBf9aHnwS1JHgpVlGO
 8DzwkTOKeA2uH9tZNS/YMwFc8xbt/VzVNFdxIhmHRLt9afvV5VuC+f+H5IyB0iiMmlPL
 Hx8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Q/hWKsMz
Subject: Re: [Buildroot] [PATCH v2 2/3] boot/uboot: add a scmversion rsync
 hook when overriding srcdir
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/02/2023 23:30, Charles Hardin wrote:
> During development the override srcdir is often used with a local
> git repo and branch. To help track the builds used in those flows
> it is useful to have the scm version available as part of the info.
> With this hook, the auto generated version include will include the
> example.
> 
>      #define PLAIN_VERSION "2018.03-01358-gbda75d6a8b"
>      #define U_BOOT_VERSION "U-Boot " PLAIN_VERSION
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
> ---
>   boot/uboot/uboot.mk | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 4eae8e95c3..edb6c646c7 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -28,18 +28,30 @@ UBOOT_SOURCE = $(notdir $(UBOOT_TARBALL))
>   else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
>   UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
>   UBOOT_SITE_METHOD = git
> +UBOOT_SCMVERSION = YES
>   else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_HG),y)
>   UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
>   UBOOT_SITE_METHOD = hg
> +UBOOT_SCMVERSION = YES
>   else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_SVN),y)
>   UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
>   UBOOT_SITE_METHOD = svn
> +UBOOT_SCMVERSION = YES
>   else
>   # Handle stable official U-Boot versions
>   UBOOT_SITE = https://ftp.denx.de/pub/u-boot
>   UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
>   endif
>   
> +ifneq ($(UBOOT_OVERRIDE_SRCDIR),)
> +define UBOOT_SCMVERSION_HOOK
> +	$(TOPDIR)/support/download/scmversion \
> +		$(abspath $(UBOOT_OVERRIDE_SRCDIR)) $(@D)/.scmversion
> +endef
> +
> +UBOOT_POST_RSYNC_HOOKS += UBOOT_SCMVERSION_HOOK

  I think this override srcdir handling can actually be done directly in the 
generic infrastructure. Maybe even directly in the rsync target:

$(BUILD_DIR)/%/.stamp_rsynced:
	...
	rsync ...
         $(if $($(PKG)_SET_SCMVERSION),\
		@cd $(SRCIDR); $($(PKG)_SET_SCMVERSION))
	...

  The only problem is that here, the output has to go to the output directory 
while in the git case it has to go the current directory...

  Regards,
  Arnout

> +endif
> +
>   ifeq ($(BR2_TARGET_UBOOT)$(BR2_TARGET_UBOOT_LATEST_VERSION),y)
>   BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
