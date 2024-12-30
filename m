Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7020EE7718F
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 10:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE957404B6;
	Mon, 30 Dec 2024 10:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbI4dXW-8SDW; Mon, 30 Dec 2024 10:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EA5F4057F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EA5F4057F;
	Mon, 30 Dec 2024 10:00:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D16EC8
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A5A960A5E
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01NM2RhU98_l for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 09:59:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29AA460A57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29AA460A57
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29AA460A57
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 09:59:58 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30229d5b229so96612141fa.0
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 01:59:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735552797; x=1736157597;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rp4qxjd8qH1tLxkHXbhA5zlLF2SmH8RGTzMC1vnNCmw=;
 b=BLDMyDSBTQN0WB4IYn8B0lYzS9MUuRL0EGmNKbRzb/ZLDaeMl8r6ni0a+lnWOCnXp7
 +OY6uG5mk+IZ6jZPnowffhIr7H2YtEIs7fMQ4z8fWcG4hHZD1QX+WF2ERKWvDYZu4teJ
 oepF2rqB3ZLQ1z7JiY6VabOzKjp8/ahohajujUfO2Qk5/l4hZjOoR5S1IVn2Z8DvHn9E
 6y1cu4pQcckgJAgohA5ar+xYMmPy0gXhz7riwfyg5PfySiETPVUAU7pXMrwE4e9sWoZb
 N1YTEhik0P4YWztqf+SlGZ7u3q1nhwgSOrbk/DckpSnG1boHVSurcwBSawLaiLKbG4Oo
 lE+Q==
X-Gm-Message-State: AOJu0YyomjayIfrltjaR5XsREGM36mIwRm+JD6rEIF9P7tiNbu9qmgO2
 oVS1HzT90bF5Z48N1YyMkywJM5BJXnlkTOjyzvCST8UnMdPcUSf4P2LnieF0i8/83HoK4Q/gZsd
 JXxOSkyomurgRJWgHg1q8kM7ZTUs=
X-Gm-Gg: ASbGncvBox8ZT1Pk7sZG/VKleQ4jiNiTUikepK0MGvxUzrH+1fhORrlor0eA4UGu9dU
 pPWMO+5MEJwvHJxo6TqB4N3pA/s3dlfKEwMvEJBWFRr6lzO9tUw7s3m+wQByk/PWaxb4dvBar
X-Google-Smtp-Source: AGHT+IFTgqtxQnR8L5qna3Gj1Z8rw42BbcNrbfyhfJkzrAYXAOfiL7xxSwSNzjdRr5wtZIDgORffw9QZcvyDFlnTUKA=
X-Received: by 2002:a2e:b887:0:b0:302:26ae:7bcd with SMTP id
 38308e7fff4ca-30468576f40mr126975991fa.23.1735552796415; Mon, 30 Dec 2024
 01:59:56 -0800 (PST)
MIME-Version: 1.0
References: <20241219152105.298310-1-heiko.thiery@gmail.com>
 <20241219152105.298310-2-heiko.thiery@gmail.com>
 <20241228234040.54baae9d@windsurf>
In-Reply-To: <20241228234040.54baae9d@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 30 Dec 2024 10:59:44 +0100
Message-ID: <CAEyMn7b9XyFjVgisGXMayQEGD8_nw6sC8t0aPcYcr4tp+gCpBw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>, 
 =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735552797; x=1736157597; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rp4qxjd8qH1tLxkHXbhA5zlLF2SmH8RGTzMC1vnNCmw=;
 b=jjkCqlvBhnmK4WafX8e7BLtTaRdeiR5lTUMgLRCSXfpUfEaHvxjzqSzGogAreTdaAx
 /+gM+5HkfklumEAXzo7F81faSszuXs2wyFQ6Xn2UooTXnid1HrMxUJSqGYaLZ2eiKFpG
 lfMbM7elb9dwhPs6r+mqnpq7KJ7ELl7BBcZHhEFNG7WY+F5/rRt8MR+3E/2/Z5AzqRGX
 9eptxhKAmMbFdyyFCZ05id6ANuiWPQOPhsxEx0/yTMqO+VPz7bQ4c/dyk1LQCkmZIAt4
 WUm8MLqa3XVDJqsmyFEjv9XDX6PZFMVplLpHBRELIInMxPnkp2UtON/9PGvSOiHVr2wX
 gsAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jjkCqlvB
Subject: Re: [Buildroot] [PATCH 2/6] package/libnetconf2: bump to version
 3.5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Am Sa., 28. Dez. 2024 um 23:40 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Heiko,
>
> On Thu, 19 Dec 2024 16:21:03 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > Since version 3.x the options for TLS and SSH are merged to SSH_TLS. Thus
> > we also require LIBCURL. The openssl package dependency is now mandatory
> > and only selected when libssh-server and libcurl is selected.
>
> This last sentence doesn't match what is done in your code I'm afraid,
> so I'm unclear what you're trying to achieve.

You're right. This is not really clear. This is a commit message that
is a combination I made during the package update. Unfortunately I did
not clearly read it before sending it out. I will cleanup the message.

> > diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
> > index 675c76a500..78fc5c8400 100644
> > --- a/package/libnetconf2/libnetconf2.hash
> > +++ b/package/libnetconf2/libnetconf2.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256  72e9a6461fadbd22f0cf0d23ba68d62b297c8f564f7f2bee069748fb67fc3a24  libnetconf2-2.1.28.tar.gz
> > +sha256  0d49e796798015e35a08bfbd53a3dd4004cb9a26d4b1dd1f90940a427d483bbb  libnetconf2-3.5.1.tar.gz
> >  sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
> > diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
> > index 88163926c0..40812cc0f0 100644
> > --- a/package/libnetconf2/libnetconf2.mk
> > +++ b/package/libnetconf2/libnetconf2.mk
> > @@ -4,41 +4,29 @@
> >  #
> >  ################################################################################
> >
> > -LIBNETCONF2_VERSION = 2.1.28
> > +LIBNETCONF2_VERSION = 3.5.1
> >  LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
> >  LIBNETCONF2_INSTALL_STAGING = YES
> >  LIBNETCONF2_LICENSE = BSD-3-Clause
> >  LIBNETCONF2_LICENSE_FILES = LICENSE
> > -LIBNETCONF2_DEPENDENCIES = libyang
> > +LIBNETCONF2_DEPENDENCIES = libyang libxcrypt openssl
>
> Here you add openssl in your mandatory dependencies, but you don't
> select it. This is going to fail badly, as you cannot depend on a
> package that isn't enabled in your configuration.

I will fix that.

> >  HOST_LIBNETCONF2_DEPENDENCIES = host-libyang
> >
> >  LIBNETCONF2_CONF_OPTS = \
> >       -DENABLE_TESTS=OFF \
> >       -DENABLE_VALGRIND_TESTS=OFF
> >
> > -ifeq ($(BR2_PACKAGE_LIBSSH_SERVER), y)
> > -LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=ON
> > -LIBNETCONF2_DEPENDENCIES += libssh
> > +ifeq ($(BR2_PACKAGE_LIBSSH_SERVER)$(BR2_PACKAGE_LIBOPENSSL)$(BR2_PACKAGE_LIBCURL),yyy)
>
> And here it is extremely weird to have a test for
> $(BR2_PACKAGE_LIBOPENSSL). Either it's mandatory for the package, and
> therefore there's no point in testing if it's enabled... or it's not
> mandatory and openssl shouldn't be unconditionally added to
> LIBNETCONF2_DEPENDENCIES above.

I will fix that as well.

Thanks


> Could you clarify this?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
