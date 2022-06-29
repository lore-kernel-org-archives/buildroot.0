Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8288AC43334
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 09:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC7AB41765;
	Wed, 29 Jun 2022 09:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC7AB41765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SfrRAUNVFWOK; Wed, 29 Jun 2022 09:37:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E67D410A8;
	Wed, 29 Jun 2022 09:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E67D410A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 545B01BF349
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 09:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C5B960E38
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 09:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C5B960E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9E9GiZSUK3FI for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 09:37:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F127760E03
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F127760E03
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 09:37:33 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id y77so20887904oia.3
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 02:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZKCyMqyuR0VcLKMMSUzbvFI3qDKEhI0m6Wob/u4o5XM=;
 b=xqPCyIdPewfGhlO1Q95zKYD8Io4r88oqIUNK6WZLqyeCixo4AftmRCwbLfNrNLtsS4
 qrYec8TY3IfaIs0hUx2n1JEqxZqw+9udxIbaAVcFv1v8WJ7e5UpHdFc0IGuryoY0u/rb
 HMKhmZhlB+Kc2uVzJl89aqt6gx8rIdOMuwA7PlYL959zN5okQab4yOiVIReKiv26LNVc
 cBStPtLBYS7LXoDwZM7sHTNE3xaOjQJ7Cs1pzERDwy3ZDlnwr3DLwk+obdxZCeyd6Hsw
 xM338N58/oZag5l7UeoUcYbM+CldzaT4Ellp7sQ8gzdJy+F/2NAl7jgf2hz5YCRN/SwJ
 wRjQ==
X-Gm-Message-State: AJIora87pNRIjaW0OABEYSf3VINX5Az4PmwXmRD/5EHl7BuNsWsLmn4o
 +OQkSUf5MB1YCQpZPnfZlmb6JahxfwX98TaNIUDeCP6LCqEMKGIg
X-Google-Smtp-Source: AGRyM1tmAl5VCXuYhQfb0zlYIM068U3s5pa9/t97Jc3Xlmm8kulea9A8LuI1WElH9x2WAWrTIQkttZ18JCL+1tOVVOY=
X-Received: by 2002:a05:6808:ed0:b0:331:4811:737f with SMTP id
 q16-20020a0568080ed000b003314811737fmr1389211oiv.104.1656495452910; Wed, 29
 Jun 2022 02:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220622083433.1201789-1-kory.maincent@bootlin.com>
 <d8374185-3338-0b14-2263-069bb4c562f3@mind.be>
In-Reply-To: <d8374185-3338-0b14-2263-069bb4c562f3@mind.be>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 29 Jun 2022 11:37:22 +0200
Message-ID: <CAN5uoS9dNq0_57BcmkAdAWRH6WJxmLkY58qscXYpJrQKwZ4rhg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ZKCyMqyuR0VcLKMMSUzbvFI3qDKEhI0m6Wob/u4o5XM=;
 b=mSZiQDfgYrdmm3XS0+YLgZMsXbAi7cSN6dI7heDxeuFzmkm98sOtWOvpnc6+9H4Map
 9OzuBZlI7y3SEmL+uPY5CvMpG4DU5ZGCX4x6aaMbWtpvV03fmWRVpjY9cvXZPdaVuLgW
 +mtmxSEhLY0+YyblFINjHAF3Pp6x4WToVKF9BADU0O9k/7O1CNEgefBIsQQkIJkJsUs8
 fBe3N4eShZM3/tbCJmKdY7La1A0sBCp/6sqpVy8rSxGF4/GYmMnvO5km+aLN9AymDn8E
 lPcyrNs0BkrW/XUU4TjdMxOmu7zp7bSMRERszWq4OR9NzZ0z3g1vxrJM9np5Y3uQ3DEI
 GDdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=mSZiQDfg
Subject: Re: [Buildroot] [PATCH v2] boot/optee-os: add support for custom
 tarball URL
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
Cc: kory.maincent@bootlin.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout,

On Mon, 27 Jun 2022 at 23:24, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 22/06/2022 10:34, Kory Maincent via buildroot wrote:
> > From: Kory Maincent <kory.maincent@bootlin.com>
> >
> > For now only latest release and custom git repository was supported.
> > This patch adds support for custom tarball URL.
> >
> > It also adds configuration verification for custom git repository and
> > tarball URL.
> >
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
>
>   Applied to master, thanks.
>
>
> > ---
> >
> > Change since v1:
> > - Update the test condition on custom tarball selection.
> > - Remeved extra ending parentheses.
> >
> >   boot/optee-os/Config.in   | 11 +++++++++++
> >   boot/optee-os/optee-os.mk | 25 +++++++++++++++++++++++--
> >   2 files changed, 34 insertions(+), 2 deletions(-)
> >
> > diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> > index 0be6e68b0c..d56cf53c8a 100644
> > --- a/boot/optee-os/Config.in
> > +++ b/boot/optee-os/Config.in
> > @@ -25,6 +25,9 @@ config BR2_TARGET_OPTEE_OS_LATEST
> >         Use the latest release tag from the OP-TEE OS official Git
> >         repository.
> >
> > +config BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
> > +     bool "Custom tarball"
>
>   I've added the help text from the kernel here.
>
> > +
> >   config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
> >       bool "Custom Git repository"
> >       help
> > @@ -32,6 +35,13 @@ config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
> >
> >   endchoice
> >
> > +if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
> > +
> > +config BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION
> > +     string "URL of custom OP-TEE OS tarball"
> > +
> > +endif
> > +
> >   if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
> >
> >   config BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL
> > @@ -53,6 +63,7 @@ endif
> >   config BR2_TARGET_OPTEE_OS_VERSION
> >       string
> >       default "3.17.0"        if BR2_TARGET_OPTEE_OS_LATEST
> > +     default "custom"        if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
> >       default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
> >                               if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
> >
> > diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
> > index 88f14b48e4..cddc1f2448 100644
> > --- a/boot/optee-os/optee-os.mk
> > +++ b/boot/optee-os/optee-os.mk
> > @@ -13,14 +13,22 @@ endif
> >   OPTEE_OS_INSTALL_STAGING = YES
> >   OPTEE_OS_INSTALL_IMAGES = YES
> >
> > -ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
> > +ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL),y)
> > +# Handle custom U-Boot tarballs as specified by the configuration
>
>   U-Boot? Copy paste error I guess :-)
>
>   However, this comment is pretty useless, so I just removed it.
>
> > +OPTEE_OS_TARBALL = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION))
> > +OPTEE_OS_SITE = $(patsubst %/,%,$(dir $(OPTEE_OS_TARBALL)))
> > +OPTEE_OS_SOURCE = $(notdir $(OPTEE_OS_TARBALL))
> > +else ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
> >   OPTEE_OS_SITE = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL))
> >   OPTEE_OS_SITE_METHOD = git
> > -BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
> >   else
> >   OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
> >   endif
> >
> > +ifeq ($(BR2_TARGET_OPTEE_OS)$(BR2_TARGET_OPTEE_OS_LATEST_VERSION),y)
>
>   It's not immediately obvious that the first should be y and the second empty,
> so I changed this into
>
> ifeq ($(BR2_TARGET_OPTEE_OS):$(BR2_TARGET_OPTEE_OS_LATEST_VERSION),y:)
>
> > +BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
> > +endif
> > +
> >   OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pyelftools
> >
> >   ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY),y)
> > @@ -130,6 +138,19 @@ ifeq ($(BR2_TARGET_OPTEE_OS)$(BR_BUILDING),yy)
> >   ifeq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_PLATFORM)),)
> >   $(error No OP-TEE OS platform set. Check your BR2_TARGET_OPTEE_OS_PLATFORM setting)
> >   endif
> > +
> > +ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL),y)
> > +ifeq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION)),)
> > +$(error No tarball location specified. Please check BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION)
>
>   Normally there should also be a handler in utils/genrandconfig to make sure
> that a fully random config with empty tarball location doesn't fail. However,
> that never happens at the moment because BR2_TARGET_OPTEE_OS_PLATFORM is already
> empty and that already triggers the removal of BR2_TARGET_OPTEE_OS. Still, it
> would be nice to handle this case as well, reverting to
> BR2_TARGET_OPTEE_OS_LATEST if the tarball location is empty.

Do you mean optee_os.mk would force BR2_TARGET_OPTEE_OS_LATEST=y
configuration when the one provided to build is inconsistent?

Or is there a specific file where BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
+ empty BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION can be defined as
invalid random config?

Br,
etienne

>
>   Regards,
>   Arnout
>
>
> > +endif
> > +endif
> > +
> > +ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
> > +ifeq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL)),)
> > +$(error No repository specified. Please check BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL)
> > +endif
> > +endif
> > +
> >   endif # BR2_TARGET_OPTEE_OS && BR2_BUILDING
> >
> >   $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
