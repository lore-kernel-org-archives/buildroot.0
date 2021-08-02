Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6020DC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 13:09:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D28F460F6D
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 13:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D28F460F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A107083112;
	Mon,  2 Aug 2021 13:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LtMxPUpYmiji; Mon,  2 Aug 2021 13:09:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE7668295A;
	Mon,  2 Aug 2021 13:09:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAF6C1BF59F
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 13:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C45F08295A
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 13:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kB8OfYARBedk for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 13:09:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E96782532
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 13:09:18 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id w6so24029282oiv.11
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 06:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OiHXGGFKDewI+doL7ZRQrD4SmKj9lNaz8QwZ0nmPwzA=;
 b=XPMUcS8ruRiPxM/5+DVfA6hc2umb1qDIhq4iHg5AEVoRMtqewRt+aMe2pMauPoMyNd
 0RX5ZqX8/wur7CSzDJgVZA2tK55QrJOEbCqvtXIv028xs9iU+VQPwARFBFR23ns95OHW
 VgWXbVWbubZ71Pt4XElGpcWGiq2boTk6fgfC566Jl787iFXXroBEo3tnac2qPUZ5Im0U
 LI9AC5HB9spS0Celvi87QLPHz+P4j6xS9BxbZOdNmJqIHcMbMVvme7aOxv3RvqrUt4kA
 9yA3pmyp/TFUtKUEPg8O9X3QCnaJMD0eETKeQDDbdqOEQqlUFdlkeFMVPaf9qw3H1O5X
 mAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OiHXGGFKDewI+doL7ZRQrD4SmKj9lNaz8QwZ0nmPwzA=;
 b=mxRXRudcfNMtlJFCiqqFwh1w4hcsAtnFF8r2y03cBvHMfEl0taKh7xXXgqRfs7K68p
 yZPwnaR8OBUnfQLFEdYXa6GmYkXUydpJxu3el9Sjf2U55NfBey0AwYqd9oMyiD0qipd4
 55BE5mUA+ezvEkvE1kGn6XHWTrLikL8dGK0O3Lf2TqtGzWnbL13m/gyCDW2VyTxTLxBv
 ZpgUo4P8QjZHt1+dLqUth0tESLKK62Me2+ecL6vuHnvcHcpbf/KBjti4cMasTwiZlYEr
 9MqliRH4WTP7iWWZ9uWXzm7NmoGTii+WijEIn0iNU/rQDfC+hiAdhpP3sJOOdFZedGen
 cRzw==
X-Gm-Message-State: AOAM530+g8tjRoU4Z/lE7wwnEMg1xoDD9AYSr9mx9/pr5uOssHwDLShv
 doM3v00BGKOJnb9tepCdlS40Nju+YyePJgoUgY1keHtEMLvpsA==
X-Google-Smtp-Source: ABdhPJz7oi2/IMM3XHcrhfM0+YQfDC296uWnVCHNeHDfFZJTjnOA2z4W47koGikMqboPIbxQroJojbLwVX1/YsNFToI=
X-Received: by 2002:aca:3144:: with SMTP id x65mr10404396oix.157.1627909757625; 
 Mon, 02 Aug 2021 06:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210802123300.564709-1-arnout@mind.be>
In-Reply-To: <20210802123300.564709-1-arnout@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 2 Aug 2021 15:09:06 +0200
Message-ID: <CADYdroNf7PmpdHsfO_Hxz9ynWsLEcFVL9oX=+2nCMykuV3fNmw@mail.gmail.com>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH for-next] package/gtest: remove partial host
 package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Am Mo., 2. Aug. 2021 um 14:33 Uhr schrieb Arnout Vandecappelle
(Essensium/Mind) <arnout@mind.be>:
>
> gmock (which is part of the gtest package) has a host variant that is
> not actually the full host package, but instead just installs a single
> python script.
>
> This script, however, is no longer maintained and is not needed for most
> practical uses of gmock. Even if it is used, its output is meant to be
> hand-edited, so it shouldn't be used as part of the build flow.
>
> Therefore, remove the host-gtest package. A proper, full host package
> may make sense (for building other host packages that use gtest), but
> this single script really doesn't.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Norbert Lange <nolange79@gmail.com>
> ---
> Since we're so close to the 2021.08 release, this should probably be
> delayed a little.
> ---
>  package/gtest/gtest.mk | 27 ---------------------------
>  1 file changed, 27 deletions(-)
>
> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
> index 6447954e36..a9ac49957b 100644
> --- a/package/gtest/gtest.mk
> +++ b/package/gtest/gtest.mk
> @@ -13,23 +13,6 @@ GTEST_LICENSE_FILES = LICENSE
>  GTEST_CPE_ID_VENDOR = google
>  GTEST_CPE_ID_PRODUCT = google_test
>
> -ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
> -GTEST_DEPENDENCIES += host-gtest
> -endif
> -
> -HOST_GTEST_LICENSE = Apache-2.0
> -HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
> -ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
> -HOST_GTEST_DEPENDENCIES += host-python3
> -else
> -HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
> -HOST_GTEST_DEPENDENCIES += host-python
> -endif
> -
> -HOST_GTEST_GMOCK_PYTHONPATH = \
> -       $(HOST_DIR)/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
> -
>  # While it is possible to build gtest as shared library, using this gtest shared
>  # library requires to set some special configure option in the project using
>  # gtest.
> @@ -52,14 +35,4 @@ else
>  GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
>  endif
>
> -define HOST_GTEST_INSTALL_CMDS
> -       $(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
> -               $(HOST_DIR)/bin/gmock_gen
> -       cp -rp $(@D)/googlemock/scripts/generator/cpp \
> -               $(HOST_GTEST_GMOCK_PYTHONPATH)
> -endef
> -
>  $(eval $(cmake-package))

add this here:
$(eval $(host-cmake-package))

It works, and I see no particular reason not to allow the host package.

> -# The host package does not build anything, just installs gmock_gen stuff, so
> -# it does not need to be a host-cmake-package.
> -$(eval $(host-generic-package))
> --
> 2.31.1
>

With this change the patch is identical to my local version, and thus
Reviewed-by: Norbert Lange <nolange79@gmail.com>

Norbert
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
