Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DE8C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 18:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F211281E9B;
	Tue,  7 Feb 2023 18:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F211281E9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQMYwdOFqYl5; Tue,  7 Feb 2023 18:42:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4141181BB4;
	Tue,  7 Feb 2023 18:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4141181BB4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A59611BF4DA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 18:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8040440A9F
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 18:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8040440A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGf1832B_cRG for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 18:42:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87AF9408A3
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87AF9408A3
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 18:42:33 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id z6so5768185qvp.11
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 10:42:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CZWeKuUWuMagkFRViITBlDF3q+CFgdZnuKhlEH/MQtU=;
 b=Cu4MfCourZxyAElef1GEerePKt02HMNoAFMqoxv4/w3TtbYf9xqN3fdLHGMcPXDRA0
 k5H9IM8/W0YBDyIF2PVUvWI9VN8t6yRUSEum8ZXZJMR5fZn0G9/CeHukmbn8MxcDhZEL
 MR1huJcpQUIbMOk+F7rgUcZp1zr2Ijtryyw0tzavU/ileLq9CEM3/7f8WZFGE3wUFcku
 VUa7v7FYGNli3h4zT+2qTla/e3GpdD/4FN3qJ3OkNwzJ7hLJOuYTpGUSSs3N11XWCZOj
 uckVGW0wx5EQ/rhyz3xdX11bbmrkee72QI83Jj/99m7FzCXzNcMU3HGBEwRYjS3YWydi
 04JQ==
X-Gm-Message-State: AO0yUKWk1dCKpSHbMifELPFI02Fb+xyqFFKVf/nPho6Ij+Swr036E4sd
 Tj543QPHpNDgZjAL9VwAq8MWhJHo5zmhdHJZGO4=
X-Google-Smtp-Source: AK7set8g8sCfwo5lpPJJSejn6khWTtTjlrg6f3sUJfvUowhkyOsx2L0decvJNLu8NnCwY5yXNOOYdrBCC+QynvBNuHg=
X-Received: by 2002:a0c:8c42:0:b0:54a:841c:4722 with SMTP id
 o2-20020a0c8c42000000b0054a841c4722mr262667qvb.47.1675795352413; Tue, 07 Feb
 2023 10:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20230115114840.9027-1-nolange79@gmail.com>
 <20230115114840.9027-2-nolange79@gmail.com>
 <65c21c58-0a25-50b0-0e35-f8b4da7abac3@mind.be>
In-Reply-To: <65c21c58-0a25-50b0-0e35-f8b4da7abac3@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 7 Feb 2023 19:42:23 +0100
Message-ID: <CADYdroMSHmEgmY=eNw2OrOZLbcMys7E0weafke3PUbmoHm5OuQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CZWeKuUWuMagkFRViITBlDF3q+CFgdZnuKhlEH/MQtU=;
 b=V7CmEgy5WdqjShw+zdKOLvpnD7fh1eLCR/lZLuR2et1vFZudefp8ID4Yyr5SK2mVIX
 BAUvSwA6120Duznckmc3iYRVLw6YhrWFDailkfXqtb6Wn2/O/suNvVChEZfiOOvJQbRn
 bWFOh0e1eBC6cWu47mSebkxipULx21u9JrMh77cyhS0+ZnwZM0WbGDEMusHaaMAfuPs+
 yyIehdjDEf2ELoNdP1tqay+D3m54pqgG8AD2zkiADveoQtK4zBhNZD9oNmArG9Aedb2z
 iFi2zGvX3s5dbGARaS/fl2WwXdPbiQPCQCcSyLLoFVJbNtMDZOx3zkCh6Nrso+picLmP
 4eqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V7CmEgy5
Subject: Re: [Buildroot] [PATCH v8 2/4] package/systemd: Add config option
 for sysupdate feature
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Di., 7. Feb. 2023 um 18:16 Uhr schrieb Arnout Vandecappelle <arnout@mind.be>:
>
>
>
> On 15/01/2023 12:48, Norbert Lange wrote:
> > Support the new feature added with v251,
> > requires openssl.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   package/systemd/Config.in  | 12 ++++++++++++
> >   package/systemd/systemd.mk |  7 ++++++-
> >   2 files changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> > index f35305c0be..9278772951 100644
> > --- a/package/systemd/Config.in
> > +++ b/package/systemd/Config.in
> > @@ -481,6 +481,18 @@ config BR2_PACKAGE_SYSTEMD_SYSEXT
> >
> >         https://www.freedesktop.org/software/systemd/man/systemd-sysext.html
> >
> > +config BR2_PACKAGE_SYSTEMD_SYSUPDATE
> > +     bool "enable sysupdate support"
> > +     select BR2_PACKAGE_OPENSSL
> > +     select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> > +     select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
>
>   AFAIU, sysupdate uses its own particular way of doing A/B updates (by updating
> the GPT partition table) which is only supported by systemd-boot. Although I
> suppose it's possible to write a U-Boot script that does the same thing... So I
> added a note here to that effect. I don't suppose you actually used this option?

I dont think thats the case, there is only some way of measuring
successfull boots,
sysupdate is just a part of the puzzle, you will have to do some
additional work for sure.

No, I havent used it.

>
>
>   Applied to master, thanks.
>
>   Regards,
>   Arnout

Regards, Norbert

>
>
> > +     help
> > +       systemd-sysupdate atomically updates the host OS, container
> > +       images, portable service images or other sources, based on
> > +       the transfer configuration files described in sysupdate.d.
> > +
> > +       https://www.freedesktop.org/software/systemd/man/systemd-sysupdate.html
> > +
> >   config BR2_PACKAGE_SYSTEMD_SYSUSERS
> >       bool "enable sysusers support"
> >       help
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index b0597f9bb4..f49d34d32f 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -91,7 +91,6 @@ SYSTEMD_CONF_OPTS += \
> >       -Dsulogin-path=/usr/sbin/sulogin \
> >       -Dsystem-gid-max=999 \
> >       -Dsystem-uid-max=999 \
> > -     -Dsysupdate=false \
> >       -Dsysvinit-path= \
> >       -Dsysvrcnd-path= \
> >       -Dtelinit-path= \
> > @@ -489,6 +488,12 @@ else
> >   SYSTEMD_CONF_OPTS += -Dsysext=false
> >   endif
> >
> > +ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUPDATE),y)
> > +SYSTEMD_CONF_OPTS += -Dsysupdate=true
> > +else
> > +SYSTEMD_CONF_OPTS += -Dsysupdate=false
> > +endif
> > +
> >   ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
> >   SYSTEMD_CONF_OPTS += -Dnetworkd=true
> >   SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
