Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE645C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 06:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 747BE810D6;
	Wed,  5 Feb 2025 06:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ak9od1swDToW; Wed,  5 Feb 2025 06:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70BFD810E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70BFD810E8;
	Wed,  5 Feb 2025 06:50:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DDBC12F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 06:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E46081097
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 06:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4IWTwfMKW4w for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 06:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF07381036
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF07381036
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF07381036
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 06:50:04 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-30229d5b229so63802471fa.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 22:50:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738738202; x=1739343002;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jtDOFIqB+gHD8vFnBxAXmt+fbN77bQcTzkXXe643uyU=;
 b=HD0kObd5u5SahnJnAVptHyPQtW4TFj4QUCPkXkXvt/FexiniBvybmzT5OHdqUEuXa3
 aViRmZ3cuKDhDbgkChv5DXMyprCvg+fwVf9xVsB+H/z4DWipq8vWubrYiPITz8aNkvuM
 sinnRkVb09uhdhN5LlaK5lX1G8knDCF4XxEONFD+nEiqu/aqqNuS2m9+KljKc1Fhu8c9
 1VSpNHA9Kq3CQWsTMA7pt/0h8kbMKr/BzIItNspesoa+gP/nV/DsG0kfi4tdXNMT9OHL
 AfWQjrAZdJV/TfgfsjUjo8DIN90+StYKEQSgv2fFeo0cCgX2wjG1TDaaF9o1/U58K6U1
 X5CQ==
X-Gm-Message-State: AOJu0YxudG7RormaR/UaunEL+yBYrFzHwNwg1fm3/+KKYm5HODe3C6uN
 Lf0e7ejYN/FllYfm7MZBZf+0k+GKiSAawx1CFalbZ5/tTOkOeN3+tBO/Td0uDNjpO7ah5tnN6P1
 oMFOE03DMoqHiF3GIzIB2tvSW9TqzgXsZ
X-Gm-Gg: ASbGncvGdfyjpoRymNzTlJU3fwu/dy5sV/B9zLL9T35xQunB2JbvA5ZLN1dav5nv5qW
 TVxj3TgX8ppdLn6Ea717LbaEld1+yr2V9Dgq6gPRh3xnndUZEjBaL2sVp6BbQ7ZkV9rWH2CcF
X-Google-Smtp-Source: AGHT+IHW8EIZ5fHRO7NFG31qPkVMCGQ0uyMnVcZvtQwbhm6MKRmvHjwhDx3AgQa7Wrb1KBcw8/eJZy/Jkgqa4LSU0vI=
X-Received: by 2002:a2e:be9a:0:b0:2fe:e44d:6162 with SMTP id
 38308e7fff4ca-307cf370a16mr5699401fa.26.1738738202174; Tue, 04 Feb 2025
 22:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20250114072947.284965-1-heiko.thiery@gmail.com>
 <20250114072947.284965-3-heiko.thiery@gmail.com>
 <20250203234100.6c0a6835@windsurf>
In-Reply-To: <20250203234100.6c0a6835@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 5 Feb 2025 07:49:50 +0100
X-Gm-Features: AWEUYZnSYlBa28uVYMO6So_1yvJdXooTv0vYgp132J6iax9M4Cq_ckzEQWwGkeQ
Message-ID: <CAEyMn7anXmCe7QAWnJDVsoYpMinb-=RxQMAQtHUuKjgGMQyr0Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>, 
 =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738738202; x=1739343002; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jtDOFIqB+gHD8vFnBxAXmt+fbN77bQcTzkXXe643uyU=;
 b=TRHP3fh1WP5GMf0rdtzQKbt/Ccz0/qENc1HOf8W1IDgCxWLp9DltWg+YSB9tE2TJ2i
 p9tAc2jpDk+NXdfWQnZfQs+tfanX/TU1ddqq99c7pUDMQ7lOg8ZUETt79SOcigo4YGep
 gornA1Kl4VEEQLH+oyMhfT9sm49KhRLQbJDzaksU9isnqEDp7N4aNQvA1ZF3XhZZYS6L
 Z22ADBXtHEbpwzrBBc3ez4TDVflY6HZGyjo/8fmEbXMVYYK3navmUUmSOOm7DyFOlozG
 h4fpO/CXmKqdgMik6gNWot3XtEA/r8E3iGCA9x6bjUutlAw0q3UL3zQDxjqYFmwM+6vy
 xX3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TRHP3fh1
Subject: Re: [Buildroot] [PATCH v5 2/9] package/libnetconf2: bump version to
 3.5.5
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

Am Mo., 3. Feb. 2025 um 23:41 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Heiko,
>
> On Tue, 14 Jan 2025 08:29:44 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> I wanted to finally apply this, but unfortunately it's still not good :/
>
> First of all, your commit log is entirely empty, with zero explanations
> about the changes, even though there are non-trivial changes. Previous
> iterations had some explanations, but this iteration has none.

Something must have gone wrong when editing the iteration. I will take
care to have the correct/full explanation next time.

> > -LIBNETCONF2_VERSION = 2.1.28
> > +LIBNETCONF2_VERSION = 3.5.5
> >  LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
> >  LIBNETCONF2_INSTALL_STAGING = YES
> >  LIBNETCONF2_LICENSE = BSD-3-Clause
> >  LIBNETCONF2_LICENSE_FILES = LICENSE
> > -LIBNETCONF2_DEPENDENCIES = libyang
> > +LIBNETCONF2_DEPENDENCIES = libyang openssl
>
> In fact openssl is NOT a mandatory dependency of libnetconf2. If you
> look at the CMakeLists.txt, OpenSSL is only needed when
> ENABLE_SSH_TLS=ON (and still, when mbedtls is not available).
>
> Yes, it fails to build without OpenSSL when ENABLE_SSH_TLS=OFF, but
> that's a libnetconf2 that should be reported/fixed.

I reported that to upstream libnetconf2. It is already fixed and I
will add the patch to the iteration. When updating next time it should
already be included.

see: https://github.com/CESNET/libnetconf2/commit/1ca2f07fe4f638af4cd30e7b18ee17a8e13919bd

>
> >  HOST_LIBNETCONF2_DEPENDENCIES = host-libyang
> >
> >  LIBNETCONF2_CONF_OPTS = \
> >       -DENABLE_TESTS=OFF \
> >       -DENABLE_VALGRIND_TESTS=OFF
> >
> > -ifeq ($(BR2_PACKAGE_LIBSSH_SERVER), y)
> > -LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=ON
> > -LIBNETCONF2_DEPENDENCIES += libssh
> > +ifeq ($(BR2_PACKAGE_LIBSSH_SERVER)$(BR2_PACKAGE_LIBCURL),yy)
> > +LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=ON
> > +LIBNETCONF2_DEPENDENCIES += libssh libcurl
> >  else
> > -LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=OFF
> > -endif
> > -
> > -ifeq ($(BR2_PACKAGE_LIBOPENSSL), y)
> > -LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=ON
> > -LIBNETCONF2_DEPENDENCIES += openssl
> > -else
> > -LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=OFF
> > +LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=OFF
> >  endif
>
> The proper logic that matches what's in the CMakeLists.txt is more like this:
>
> ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_PACKAGE_MBEDTLS):$(BR2_PACKAGE_LIBSSH)$(BR2_PACKAGE_LIBCURL),y:yy)
> LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=ON
> LIBNETCONF2_DEPENDENCIES += libssh libcurl
> ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> LIBNETCONF2_DEPENDENCIES += mbedtls
> else
> LIBNETCONF2_DEPENDENCIES += openssl
> endif
> else
> LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=OFF
> endif

Yes, that makes sense to me.

> However, as that's tricky, I think we could also accept a sub-option in
> libnetconf2/Config.in:
>
> config BR2_PACKAGE_LIBNETCONF2_SSH_TLS
>         bool "SSH/TLS support"
>         select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
>         select BR2_PACKAGE_LIBCURL
>         select BR2_PACKAGE_LIBSSH

When using the sub-option then we can use
"ifeq ($(BR2_PACKAGE_LIBNETCONF2_SSH_TLS),y)"
instead of
"ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_PACKAGE_MBEDTLS):$(BR2_PACKAGE_LIBSSH)$(BR2_PACKAGE_LIBCURL),y:yy)"
for the check in libnetconf2.mk..

>
> >  ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> > @@ -37,8 +30,7 @@ endif
> >  HOST_LIBNETCONF2_CONF_OPTS = \
> >       -DENABLE_TESTS=OFF \
> >       -DENABLE_VALGRIND_TESTS=OFF \
> > -     -DENABLE_SSH=OFF \
> > -     -DENABLE_TLS=OFF
> > +     -DENABLE_TLS_SSH=OFF
>
> This option doesn't exist, did you mean ENABLE_SSH_TLS=OFF ?

You are right.

> Thanks!

Thanks for the review.

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
