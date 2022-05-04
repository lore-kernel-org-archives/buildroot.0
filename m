Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73329C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 20:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F053E40320;
	Wed,  4 May 2022 20:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mDn_utSd6-VT; Wed,  4 May 2022 20:36:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D442A400E2;
	Wed,  4 May 2022 20:35:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E35871BF3D2
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 20:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D147C40323
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 20:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zn0odR6WwNsK for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 20:35:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9124C40308
 for <buildroot@buildroot.org>; Wed,  4 May 2022 20:35:51 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id g6so5106172ejw.1
 for <buildroot@buildroot.org>; Wed, 04 May 2022 13:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KzWWyXXdqYUpF9kcmbWQLZQoN1wqwUne46u7x9j44ew=;
 b=B7M42w/RxNbC55oSP1cY9J154LC8feTspoV5UV3h/ebmsluRIj4BGBiJ5EoHaRgTQz
 kzkN4DQoScOwV0s+N2tuueGyo/ksJt3drp1nHaAHqI1xz0adltfte3PUzB/Kp03CAR+m
 MqK+urMxTBrat8PLPb+ueJSsT6kdmYLva3UiTlBHNcauFBEAox8TpUfCTouGCs96XZQH
 nu2F+CP3pmbbwCr64q+dWQzGVpev2LMbS4FFaIJDkz4jAuxRoBks+Y5Zhz0memK8oQxY
 TRcG1QPIbH2PEf54dppx/zMIDsxcwyE5F38y2Kw3tb2KmZL7AouLLIxW/W8lgQJ668vL
 lFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KzWWyXXdqYUpF9kcmbWQLZQoN1wqwUne46u7x9j44ew=;
 b=mWExxwYFxuiQsWfOtyNzEk2/LQDAifkJA2F+FGH0Zc1PYike/k8Hbf8W3xZrMz4tJS
 ryviiKvYBgt0GNc/wUMcAWjPYOdZJESAV2tJe8Jb9oXQny0/Glq3OT/zkMI6MXqUhkSD
 zA1/V1UForsZFLIiCyeAJHbIPqJHQq5QmObhyWkU1kVSxO75TMbMf6gK6mQVjOwaq7t2
 w7VhpjyqQ2U5UkkneI+19fJWWm6Nt3wW1IQoqEC7giT0vHDMc7Y5ZNn7BwxSMw7Nobc5
 6W6xBHnLkVwClUtYsby1WlnTbNG5mT5oStcF1g8qigZw++G8Qvbl/Yu0nxIvrV8dUU0Q
 WziQ==
X-Gm-Message-State: AOAM531lHwO+HIFvc3UGol0wfu7JLTzeuWryLxRHrZ6G52lxxr3igdPK
 74GKjGrZtoa3QT5lfidMiq9DZSvUvaXNsA==
X-Google-Smtp-Source: ABdhPJy1Fi2NWnyAltk403sJtth91/MTF65nXJGvExssv/LX5ePF/On1Mf9jjv/bh6bXZCXpGprbNQ==
X-Received: by 2002:a17:906:1e94:b0:6b9:6fcc:53fd with SMTP id
 e20-20020a1709061e9400b006b96fcc53fdmr22337815ejj.450.1651696549575; 
 Wed, 04 May 2022 13:35:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 eb22-20020a170907281600b006f3ef214e66sm6067052ejc.204.2022.05.04.13.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 13:35:48 -0700 (PDT)
Message-ID: <3992fd8a-e4b9-251d-f6c9-18bb352f1a08@mind.be>
Date: Wed, 4 May 2022 22:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Matt Flax <flatmax@flatmax.com>, buildroot@buildroot.org
References: <20220504013309.2949046-1-flatmax@flatmax.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220504013309.2949046-1-flatmax@flatmax.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gtkiostream: new package
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

  Hi Matt,

On 04/05/2022 03:33, Matt Flax wrote:
> This package provides many useful software engineering and signal
> processing includes and linkable library.
> 
> Signed-off-by: Matt Flax <flatmax@flatmax.com>
> ---
>   package/Config.in                  |  1 +
>   package/gtkiostream/Config.in      | 36 ++++++++++++++++++++++++++++++
>   package/gtkiostream/gtkiostream.mk | 21 +++++++++++++++++


  Please add yourself to the DEVELOPERS file [1] for this package. This way, 
you'll get an e-mail if the package fails in the autobuilders, or when a new 
version is released if the package is registered on release-monitoring.org.

  Also, you are missing a gtkiostream.hash with the tarball and license file
hashes [2].

  When re-posting, please add a patch changelog below the --- line, and also add 
the version in the subject using the -v3 option to git format-patch. See [3].


>   3 files changed, 58 insertions(+)
>   create mode 100644 package/gtkiostream/Config.in
>   create mode 100644 package/gtkiostream/gtkiostream.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index befeadc27b..8e3dd0c08d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1328,6 +1328,7 @@ menu "Audio/Sound"
>   	source "package/bcg729/Config.in"
>   	source "package/caps/Config.in"
>   	source "package/fdk-aac/Config.in"
> +	source "package/gtkiostream/Config.in"
>   	source "package/libao/Config.in"
>   	source "package/libasplib/Config.in"
>   	source "package/libbroadvoice/Config.in"
> diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
> new file mode 100644
> index 0000000000..9951e9d465
> --- /dev/null
> +++ b/package/gtkiostream/Config.in
> @@ -0,0 +1,36 @@
> +config BR2_PACKAGE_GTKIOSTREAM
> +        bool "gtkiostream"
> +  depends on BR2_TOOLCHAIN_HAS_OPENMP

  Indention is with a tab. Please use utils/check-package to verify the coding 
style.

  Also, does this package really require OpenMP?

> +  depends on BR2_USE_WCHAR # required by Flac

  Use lowercase flac, and no "required by":

	depends on BR2_USE_WCHAR # flac

> +  depends on BR2_INSTALL_LIBSTDCPP # required by Eigen
> +	select BR2_PACKAGE_EIGEN
> +  select BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES > +	select BR2_PACKAGE_FFTW

  Please keep the selects alphabetical.

> +  select BR2_PACKAGE_FFTW_DOUBLE
> +  select BR2_PACKAGE_FFTW_SINGLE
> +	select BR2_PACKAGE_ALSA_LIB
> +	select BR2_PACKAGE_LIBSAMPLERATE
> +  select BR2_PACKAGE_ALSA_UTILS
> +  select BR2_PACKAGE_ALSA_UTILS_AMIXER
> +  select BR2_PACKAGE_ALSA_UTILS_APLAY
> +  # The following are for sox

  So, all of those are optional sox features. Does gtkiostream really need all 
of them to function? If not, please don't select them.

> +  select BR2_PACKAGE_FILE
> +  select BR2_PACKAGE_FLAC
> +  select BR2_PACKAGE_LAME
> +  select BR2_PACKAGE_LIBMAD
> +  select BR2_PACKAGE_LIBPNG
> +  select BR2_PACKAGE_LIBSNDFILE
> +  select BR2_PACKAGE_LIBVORBIS
> +  select BR2_PACKAGE_OPENCORE_AMR
> +  select BR2_PACKAGE_OPUSFILE
> +  select BR2_PACKAGE_LIBID3TAG
> +  select BR2_PACKAGE_LIBGSM
> +  select BR2_PACKAGE_LIBAO
> +  select BR2_PACKAGE_SOX

  I've taken a quick look at configure.ac, and it looks like sox is optional.

> +        help
> +          gtkiostream package

  Please provide an actual help text. What you put in the commit log is actually 
pretty good.

> +
> +          https://github.com/flatmax/gtkiostream
> +
> +comment "gtkiostream needs OpenMP"

  You also need to add a comment for all the other depends (wchar, C++). Look at 
other Config.in for examples.

> +	depends on !BR2_TOOLCHAIN_HAS_OPENMP
> diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
> new file mode 100644
> index 0000000000..36a84e86c7
> --- /dev/null
> +++ b/package/gtkiostream/gtkiostream.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# GTKIOSTREAM
> +#
> +################################################################################
> +GTKIOSTREAM_VERSION = HEAD

  You must provide an actual version. This can be tag, or if there are no 
releases, a commit hash (all 40 characters). In the latter case, please explain 
in the commit log what this hash corresponds to (e.g. "latest commit as of ...").

> +GTKIOSTREAM_SITE = $(call github,flatmax,gtkiostream,$(GTKIOSTREAM_VERSION))
> +GTKIOSTREAM_LICENSE = GPLv2

  We use SPDX abbreviations, so GPL-2.0. Also, AFAICS all files have the "or 
later" clause, so it would be GPL-2.0+.

  Please also add a license file (and hash).

> +GTKIOSTREAM_INSTALL_STAGING = YES
> +GTKIOSTREAM_INSTALL_TARGET = YES

  This is the default so not needed.

> +GTKIOSTREAM_CONF_OPTS = --disable-octave
> +GTKIOSTREAM_DEPENDENCIES = host-pkgconf libsamplerate eigen fftw-double fftw-single alsa-utils sox

  Also alphabetical please.

  You select alsa-lib in Config.in but don't depend on it. Why do you select it?

  Since this line is getting a bit long, it's nicer to split it:

GTKIOSTREAM_DEPENDENCIES = \
	host-pkgconf \
	alsa-utils \
	...

  I saw in configure.ac that in addition to sox, there are a lot of other 
optional packages. Since they can't be explicitly enabled/disabled, it chooses 
purely based on the presence of the pkg-config file if the optional package is 
enabled or not. That makes things non-reproducible, since depending on the order 
of the build, the feature will be included or not. Therefore, you need to track 
these dependencies:

	$(if $(BR2_PACKAGE_LIBGTK2),libgtk2) \
	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3) \
	...

> +
> +GTKIOSTREAM_AUTORECONF = YES

  Please add a comment above to explain why this is needed:

# Fetched from git, no configure script

> +
> +define GTKIOSTREAM_M4
> +  pushd $(@D); ./tools/autotoolsClean.sh;	mkdir -p m4; popd
> +endef

  Please indent with a tab inside the define.

  pushd/popd is not needed; just:

	cd $(@D); \
		./tools/autotoolsClean.sh; \
		mkdir -p m4

  However, looking at the source, I doubt this pre-configure hook is needed at all:
- the m4 directory already exists (it contains emscripten.m4);
- autotoolsClean.sh doesn't do anything unless a build was already done (but in 
Buildroot, you'd do 'make gtkiostream-dirclean' to clean that up).


  I have marked your patch as Changes Requested in patchwork, so unless you 
resend it (with the fixes mentioned above), we will forget about it.

  Thank you!

  Regards,
  Arnout


[1] https://nightly.buildroot.org/#DEVELOPERS
[2] https://nightly.buildroot.org/#adding-packages-hash
[3] https://nightly.buildroot.org/#_patch_revision_changelog



> +GTKIOSTREAM_PRE_CONFIGURE_HOOKS += GTKIOSTREAM_M4
> +
> +$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
