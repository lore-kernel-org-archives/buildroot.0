Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728C6C4332F
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 08:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00BA24028D;
	Mon,  5 Dec 2022 08:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00BA24028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZ8bnAyPt-Ko; Mon,  5 Dec 2022 08:53:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A74B540128;
	Mon,  5 Dec 2022 08:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A74B540128
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8CD01BF2EA
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 08:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B425F60B30
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 08:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B425F60B30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xi9RTxWI73Bu for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 08:53:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FA6C60888
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FA6C60888
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 08:53:12 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id x22so3667753ejs.11
 for <buildroot@buildroot.org>; Mon, 05 Dec 2022 00:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nwsTYDiFzeoP5F/1Gr8LVNRchbnndufPs0UcZtHEcQA=;
 b=X48Gh/+rbogMzcc7SOb7+VA+1ZeQkFW3oPYwtiPghJrnlX0JNmGxNU/lylTOqO3M3J
 IJnVsCSt0UHl1znEPe6hDVkw+qe1IH4m2ZgJywNYZhNfLfrIZUO1oWrWS4QNAN6lY1In
 24V72B2cKTT3q1ZCg3B33Zdqj1ZL6OV7iXiTY4aY7eO5P5fUMgkTRCMhpES4n+d1W8Zq
 PUZUoWoNZQXYDWlmMbGkF5x75EwcOhea3QXUVlxJXaa7ux3LPe/IkZ5FsaMWKUV8JJVF
 Y/PugsXgifuuXZKrosl+lmkyHHXq/TGO0QvZ5+MFKSwaA/4oElsuWYTiUIK/41oGf0ld
 +MXQ==
X-Gm-Message-State: ANoB5pmrWs/JORPfq2IQgnhyR1UtS6HM6eZeTRjEQslDA2iWXo2NxtX1
 Sq/mB3vEa+XKW9nlD/R/zN0W9y/6xgzptVpOCZj2Lu0R1FzSv76U
X-Google-Smtp-Source: AA0mqf58lcO5kkOmCmvkrq3u1U+M5TN6v6g+crxOrsex/rPc8UJdlKfDnYBKEuNtkj23CrZPf4iJUpLxUN+7ml+clv8=
X-Received: by 2002:a17:906:71c2:b0:7ab:2de1:2e45 with SMTP id
 i2-20020a17090671c200b007ab2de12e45mr61560019ejk.422.1670230390764; Mon, 05
 Dec 2022 00:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20221130075452.2507453-1-etienne.carriere@linaro.org>
 <20221130075452.2507453-6-etienne.carriere@linaro.org>
 <20221204111722.GK3302@scaer>
In-Reply-To: <20221204111722.GK3302@scaer>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 5 Dec 2022 09:52:59 +0100
Message-ID: <CAN5uoS_HMg6vCHRKWZGyFChQAsVwbLT_nh536fy+LLLxbg-frQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nwsTYDiFzeoP5F/1Gr8LVNRchbnndufPs0UcZtHEcQA=;
 b=JLrUaEP+UwOmUr4RNVYUJm2as8yX8IADEkAzRseNRs+CfivMfTzT4cHbRlzdPs7IQ0
 TTI0HmwbPMeHjPUHmBqmy+oJb1vr+AijJcbShySyadHb5bWTpjBIvOaWqZy3hj86S+Fn
 zLBinx93X4zQa72nozWoBdblFIcMa34Z1J4xh8mw+qHMB+o0lAjaQMBtRAs61yDNeWCn
 V7wxtgv1xXajJkc/+WpdU7YYPdNRdbk4UtwrD5xcTDK0FZRVbXQBk3aqxzbjsylxBI2I
 AOE4ilZWt/uL8mdzZQNIEZAzCEZaYlfaz6J0ikHj6Ud8ktOPcxce7IRE/QUEhg5otu1y
 foog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=JLrUaEP+
Subject: Re: [Buildroot] [PATCH 6/7] package: optee-client: select
 util-linux-libs, libuuid and pkgconf
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 4 Dec 2022 at 12:17, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Etienne, All,
>
> On 2022-11-30 08:54 +0100, Etienne Carriere spake thusly:
> > In order to use login methods `TEEC_LOGIN_USER` and `TEEC_LOGIN_GROUP`,
> > a user space application must initialize the tokens with the SHA1
> > hashed UUID of the user or group.
> >
> > Select host-pkgconf, util-linux and libuuid in order to use `libuuid`
> > and add supporting libraries to optee_client for this type of ACL based
> > login initialization.
>
> Looking at the upstream code for optee-client, it looks like this is a
> mandatory dependency, so that should be part of the patch that bumps the
> version. Otherwise, this means that just applying the version bumps
> introduces breakage.

There is a change under review in optee-client to remove this
dependencies that is not mandatory in optee.
https://github.com/OP-TEE/optee_client/pull/336
The change has been approved by maintaiters but is not in optee 3.19.0 tag.

Are you ok if I add the patch from pull/336 to optee-client BR patch
for this optee-client 3.19.0?
I'll remove it when BR will bump to optee 3.20.0.


Br,
Etienne


>
> Regards,
> Yann E. MORIN.
>
> > This change is based on commit [1] from Eero Aaltonen, merged in OP-TEE
> > test build environment.
> >
> > Link: [1] https://github.com/OP-TEE/build/commit/4a27543494278a5d93e2f44d58e413d90739b08a
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > ---
> >  package/optee-client/Config.in       | 3 +++
> >  package/optee-client/optee-client.mk | 1 +
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
> > index cc7f176c77..ed7da4edbc 100644
> > --- a/package/optee-client/Config.in
> > +++ b/package/optee-client/Config.in
> > @@ -2,6 +2,9 @@ config BR2_PACKAGE_OPTEE_CLIENT
> >       bool "optee-client"
> >       depends on BR2_TOOLCHAIN_HAS_THREADS
> >       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # MMC_IOC_MULTI_CMD
> > +     select BR2_PACKAGE_UTIL_LINUX
> > +     select BR2_PACKAGE_UTIL_LINUX_LIBS
> > +     select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> >       help
> >         Enable the OP-TEE client package that brings non-secure
> >         client application resources for OP-TEE support. OP-TEE
> > diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
> > index 54cc112c5c..a671b66662 100644
> > --- a/package/optee-client/optee-client.mk
> > +++ b/package/optee-client/optee-client.mk
> > @@ -9,6 +9,7 @@ OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
> >  OPTEE_CLIENT_LICENSE = BSD-2-Clause
> >  OPTEE_CLIENT_LICENSE_FILES = LICENSE
> >  OPTEE_CLIENT_INSTALL_STAGING = YES
> > +OPTEE_CLIENT_EXT_DEPENDENCIES = host-pkgconf util-linux-libs
> >
> >  OPTEE_CLIENT_CONF_OPTS = \
> >       -DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH) \
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
