Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CFEC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:48:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 099A56102A
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 099A56102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2B576FEEE;
	Tue, 17 Aug 2021 19:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wlka7VkoJxFN; Tue, 17 Aug 2021 19:48:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 548F8607A8;
	Tue, 17 Aug 2021 19:48:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9A861BF86D
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 19:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9827B40215
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 19:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvR9sT7UTr2b for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 19:48:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBBDF40242
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 19:48:41 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id v2so22721661edq.10
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pwDiwj+tF9uehAqGhSAbrV821TLJMS2sCj+Hpxe6XDg=;
 b=I0Owm8xigiJzd7vAKui3CGAHcgep8o/TAfrrmVNBIoPwRECh/UQiF8ZJXUiuKXaYiQ
 VwKjF0jnYRS0PkCsvLdhGBUkoCgbILJsblBlFPibormw/i/lz0THK/p6q7EbsO6fZbFS
 3isXZ9yVAgjxn0PEk7laVHyFkqphdpFIkMDzfT5Gws5lh8l77iAguZ4kg2zE4ovD6kJW
 ogQ98gwwvtTbqOYj2U4KsgaCYf4CcBYIeAIrj9B0VonMAlfyFtOs8GaX91+SFCzUpS/i
 d1Bbsedo0cFYmDRmYTt0o2FsYBupkzFLUyvHFMYyFcepEnd4zj2jwR8Kp6pNkv8h0mMo
 +asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pwDiwj+tF9uehAqGhSAbrV821TLJMS2sCj+Hpxe6XDg=;
 b=B7VMspGKrswjeKuc13z0hLdt0Ul0hZdSB/scaBQewa8NuH8PnmGRchSdIqvMzTRW6Z
 +NBPOSI00WQtzZrAbf+E5wz/oHYSFFQoqROUWgsiWW7rQ/YCfgi2HcZGc7jVwWjQS/yU
 Sl8knUD05Rtiz51YClxyvsenND2aApWqG7g+MR1jH+3f/BBFbpagbPdj4Np4DZs7gZy3
 1BnbbqXPM+WAyxGt63fEBPGHOJaPNJNOzX42KkgKZDncskR89C1QD1vprFl8BbP2aK1K
 LiTo2DYg/U+TDEOFsrifZMvj3RNC7lSWDNVJgh+tr1+cunIvSagxez6U8u0IkiY+yC09
 gOoQ==
X-Gm-Message-State: AOAM532lPTVi4Miqt5AMbSh9i1pCt2yYgs26ODYAsiMmKaTR/bxcYP8b
 1vypwlf3MpiOc7oWmYjhmee+FFsbdAGbdw==
X-Google-Smtp-Source: ABdhPJyXTXcaDNRn5bX4B2c83xcktpEGuERBMJIQBWYBjcw5KNqSMG8oMyVSKjL06MbDsvXtWUMeZw==
X-Received: by 2002:a05:6402:51cb:: with SMTP id
 r11mr5948409edd.270.1629229719957; 
 Tue, 17 Aug 2021 12:48:39 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id eg21sm1501133edb.64.2021.08.17.12.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 12:48:39 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210813211648.3483726-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <fbca1ffe-443e-8684-2ad3-97a6198f857c@mind.be>
Date: Tue, 17 Aug 2021 21:48:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813211648.3483726-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/fontconfig: fix per-package
 build with NLS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 13/08/2021 23:16, Fabrice Fontaine wrote:
> Add TARGET_NLS_DEPENDENCIES and host-gettext dependency to avoid the
> following build failure with host-cairo raised because fontconfig
> installs its ITS files in the wrong directory (i.e. outside of
> gettext-tiny symlink):
> 
> mkdir -p /tmp/instance-0/output-1/per-package/host-cairo/host
> rsync -a --link-dest=/tmp/instance-0/output-1/per-package/host-fontconfig/host/ /tmp/instance-0/output-1/per-package/host-fontconfig/host/ /tmp/instance-0/output-1/per-package/host-cairo/host
> rsync -a --link-dest=/tmp/instance-0/output-1/per-package/host-freetype/host/ /tmp/instance-0/output-1/per-package/host-freetype/host/ /tmp/instance-0/output-1/per-package/host-cairo/host
> rsync -a --link-dest=/tmp/instance-0/output-1/per-package/host-libglib2/host/ /tmp/instance-0/output-1/per-package/host-libglib2/host/ /tmp/instance-0/output-1/per-package/host-cairo/host
> cannot delete non-empty directory: share/gettext
> could not make way for new symlink: share/gettext
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/00e29958cecfffa4e994ab549637117dd8f55c30
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 I've extended the commit message a bit to explain why it only happens with PPD.

 Regards,
 Arnout

> ---
>  package/fontconfig/fontconfig.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
> index d59e893d4d..e34acde534 100644
> --- a/package/fontconfig/fontconfig.mk
> +++ b/package/fontconfig/fontconfig.mk
> @@ -11,9 +11,11 @@ FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
>  FONTCONFIG_AUTORECONF = YES
>  FONTCONFIG_INSTALL_STAGING = YES
>  FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
> -	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux)
> +	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
> +	$(TARGET_NLS_DEPENDENCIES)
>  HOST_FONTCONFIG_DEPENDENCIES = \
> -	host-freetype host-expat host-pkgconf host-gperf host-util-linux
> +	host-freetype host-expat host-pkgconf host-gperf host-util-linux \
> +	host-gettext
>  FONTCONFIG_LICENSE = fontconfig license
>  FONTCONFIG_LICENSE_FILES = COPYING
>  FONTCONFIG_CPE_ID_VENDOR = fontconfig_project
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
