Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87640C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 07:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0400E417B0;
	Thu,  6 Oct 2022 07:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0400E417B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qWQx6iP1qXaw; Thu,  6 Oct 2022 07:13:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEC134030A;
	Thu,  6 Oct 2022 07:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEC134030A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97CF41BF308
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 07:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78F3B401B8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 07:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78F3B401B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mcig8pqvaBGN for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 07:13:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA31F418DF
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA31F418DF
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 07:13:06 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d24so946030pls.4
 for <buildroot@buildroot.org>; Thu, 06 Oct 2022 00:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=t3xXE9QnUKxV+LetfxtAfXcEZb6KenbMomwBW6VVv1A=;
 b=dQ8+p3uR3EogU5gafV2hptKRJdw7552OjJf+8szIe/HL7CyzCT93SKQbVP4a1rCE+j
 ZnrDFQd0Zy3NNzPdfnMiSf4VzwaGiIcoB6dkV8KKXwrRaq6Dm1ywy9zyvGHaCxICuxEx
 /DF/3yF3voiKRtvlMv/8Szbnwu3ImcrcTL9rK8JBwV/JdwypqYCTCwYSig4rT+Xuf1+8
 UfsrA6zsbdPYeI/yB+B+LXqyoLBx7fmgGKRCeCtI7ulyp7x/clbdOq3WPZPC5kqEmSyl
 3EunR+RWzy02DSw77lIqOomnQDMG5COTi8L2nn43QCcuLEXJ+Co7Vz8abFa7cZc8s4l9
 pgsQ==
X-Gm-Message-State: ACrzQf1Qep6f+Uboyob3l2aOm105mJDDCkNlKgzMZU7w55N9Q1E6k/aL
 9JSruSrJ4F8gFGF0fpT2q/QFIQ==
X-Google-Smtp-Source: AMsMyM4x5cgKP350+4s59OH3ZKrfyC9Ye/qKnsi+4n1pmklAqRtmGyxtuYsjUijl5Q1m1gypXU/0KA==
X-Received: by 2002:a17:90a:6503:b0:207:cd0e:bf1f with SMTP id
 i3-20020a17090a650300b00207cd0ebf1fmr3794687pjj.25.1665040386301; 
 Thu, 06 Oct 2022 00:13:06 -0700 (PDT)
Received: from p1g2 (2a01cb000f892400bac0522898b75ff0.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f89:2400:bac0:5228:98b7:5ff0])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a170902868a00b0016cf3f124e1sm11482799plo.234.2022.10.06.00.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 00:13:05 -0700 (PDT)
Date: Thu, 6 Oct 2022 09:13:01 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <Yz5//dAdsZQYniP9@p1g2>
References: <20220920230029.1680134-1-aperez@igalia.com>
 <20221004133057.2003750-1-aperez@igalia.com>
 <20221004133057.2003750-6-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221004133057.2003750-6-aperez@igalia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=t3xXE9QnUKxV+LetfxtAfXcEZb6KenbMomwBW6VVv1A=;
 b=bt3Oxuaj5bR4pqEMhGZwVQOMxLkSvZFJkAUt96xrXcanWy5NqwKjNKjcI6AU7KtHwB
 XjRRpnLISW0LUOPjzTcb1E0m6jTz4+y1eU0vDXfRQT2UZKtr6KHymJEIQin1y6TTqw1G
 8npO9WVDb76CUlXTou+g+ascwPHrA02Ytf6mo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=bt3Oxuaj
Subject: Re: [Buildroot] [PATCH 5/5] package/cog: bump to version 0.16.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Adrian,

On Tue, Oct 04, 2022 at 04:30:57PM +0300, Adrian Perez de Castro wrote:
> This new version includes support for setting proxy options and gamepad
> support. Release notes:
> 
>   https://wpewebkit.org/release/cog-0.16.0.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/cog/cog.hash |  8 ++++----
>  package/cog/cog.mk   | 37 ++++++++++++++++++++-----------------
>  2 files changed, 24 insertions(+), 21 deletions(-)
> 
> diff --git a/package/cog/cog.hash b/package/cog/cog.hash
> index aa128d73d8..a2c55c4b94 100644
> --- a/package/cog/cog.hash
> +++ b/package/cog/cog.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/cog-0.14.1.tar.xz.sums
> -md5  69d72ac046a0fc485ea7b61b96e7e7fc  cog-0.14.1.tar.xz
> -sha1  6236972b0ae0bce38a0a017610f161b349723862  cog-0.14.1.tar.xz
> -sha256  fb91104e25e1dde27189c91c70acc356e387f47acebaa8997e01ce5879c3a600  cog-0.14.1.tar.xz
> +# From https://wpewebkit.org/releases/cog-0.16.0.tar.xz.sums
> +md5  2705472ea4f333290973722c0862b21d  cog-0.16.0.tar.xz
> +sha1  ef16e5e3d91d0da056fe5e4f596c211af7453b4e  cog-0.16.0.tar.xz
> +sha256  2956f719d36c9a6368f63901a0d1ceaf4d27f529f7df441b3748c36d72906fc6  cog-0.16.0.tar.xz
>  
>  # Hashes for license files:
>  sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index 1f24bebee4..ac2ec2a30e 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -COG_VERSION = 0.14.1
> +COG_VERSION = 0.16.0
>  COG_SITE = https://wpewebkit.org/releases
>  COG_SOURCE = cog-$(COG_VERSION).tar.xz
>  COG_INSTALL_STAGING = YES
> @@ -12,37 +12,40 @@ COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo wayland
>  COG_LICENSE = MIT
>  COG_LICENSE_FILES = COPYING
>  COG_CONF_OPTS = \
> -	-DCOG_BUILD_PROGRAMS=ON \
> -	-DCOG_PLATFORM_HEADLESS=ON \
> -	-DINSTALL_MAN_PAGES=OFF \
> -	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
> -	-DUSE_SOUP2=ON
> +	-Ddocumentation=false \
> +	-Dmanpages=false \
> +	-Dprograms=true \
> +	-Dsoup2=true \

I'm testing your series and it seems like the above is not correct, it
should be '-Dsoup2=enabled' as soup2 isn't a boolean option. Currently
it is throwing the following error:
../output/build/cog-0.16.0/meson.build:1:0: ERROR: Value "true" (of type "string") for combo option "Build with libsoup2 instead of libsoup3" is not one of the choices. Possible choices are (as string): "enabled", "disabled", "auto".

By using enabled I got another failure due to the wayland platform not
finding drm_fourcc.h, I submitted a patch to Cog directly[1].

Regards,
Gary

[1] https://github.com/Igalia/cog/pull/501
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
