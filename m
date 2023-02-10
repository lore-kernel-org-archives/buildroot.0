Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65981C636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 10:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEAE040301;
	Fri, 10 Feb 2023 10:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEAE040301
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 65tDQqwusHS1; Fri, 10 Feb 2023 10:14:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACE1B4191F;
	Fri, 10 Feb 2023 10:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACE1B4191F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D98111BF31B
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 10:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C08464191F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 10:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C08464191F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AmlUbMH-gJDy for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 10:14:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B1E140301
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B1E140301
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 10:14:33 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id n3so3376343pgr.9
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 02:14:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3djdBhZQqUcSEpQWzz97Sybugj6Gh78SyBEavflHBTc=;
 b=I/ZYRav3iIx5vrSn/rZpDwCiZ/WIgroSiF973BZJdN35ZXMbFftAMBZ3o3rvFmvYtH
 GUsPJCEzYFhcKYNP8ekgzO7xELzB2noOYnzXV546ah5ooocmXc3D2+LYqmVa6QUBrMx9
 KkLQBqHY0nTfvmZIAR178gNuAndaKr+PJYDJkV6vdEzZuebe+EfC6T7w6/aliKOy3kQ6
 VJFOP3GuwR3f3zkIGrEoVqkOpEBTy9MyBbSPljfZeOZ8xnMGX799THtkof0QT1Uu9hdd
 neAesJXeNgBhkjQby6zUcv75pu3qTbpxwJaA0b4mmlMSQH5cKmHHljQJJdZ0E3gleg2N
 s43w==
X-Gm-Message-State: AO0yUKW2+wPXT8cshQYFzOazavGHCadNCafgJk/GlziBW0xHwRY3zoOW
 QCq+x/V10dj+VjfM+vwZB5Zob99ioeemTtN2F3I=
X-Google-Smtp-Source: AK7set9GVaHchQvoRF9CmYaZ/eKb9LEVOBBeVv+ksiaE4SMZNUK6DFWjy++JFDXv40qakcPKaBV56ttENgsxvqQyG6A=
X-Received: by 2002:a62:3347:0:b0:592:429a:95db with SMTP id
 z68-20020a623347000000b00592429a95dbmr3385448pfz.16.1676024072467; Fri, 10
 Feb 2023 02:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
 <20230207171721.2973997-14-angelo@amarulasolutions.com>
 <20230208121829.126bc242@windsurf>
In-Reply-To: <20230208121829.126bc242@windsurf>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Fri, 10 Feb 2023 11:14:21 +0100
Message-ID: <CAMdwsN-FSG4J8rPrDE1LAf=5EdFZt6L25uca33emPce-FWO7xQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3djdBhZQqUcSEpQWzz97Sybugj6Gh78SyBEavflHBTc=;
 b=RAFAgriS8g0Wekc106S+hB2aEKMxCVFeem7sMC0IhSU+oShXb3Vzj1eap2vUzz1aCr
 2uCEaAQVPCAyTlwM4XTy6m+RKDakktEZ2Mra++EA5QNwa6d12vPMN3D5i2ZFXQxB4QSC
 SEPRif4hZoKv/bTWBBpTRc0osLqZsbJq46NpharVcaZn+m/4udzqkJT3+xrqhBCYS/aO
 nDyK4htd9z5JF35MGzfidzriwVExCykCLv53hEGgJhBh5ah/wOsgGzc8fTr5HoaFx7Px
 EzV7w/4Q7fVwOf3ESAv4Aco4olBXv76YkOnhf9Y9C3LzPgzCcm5eGqW0cidOAZaX/ENj
 B+Iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RAFAgriS
Subject: Re: [Buildroot] [PATCH v6 13/13] package/qt6: Add qmake
 functionality
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
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

You're right, this won't work with a relocated HOST_DIR the
QT6_INSTALL_QT_CONF seems to have gotten dropped in Angelo his patch
series, I'll rebase onto what has been approved and submit a new
series for the qmake functionality.
Thanks for the reviews!

Regards,
Jesse

Op wo 8 feb. 2023 om 12:18 schreef Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> On Tue,  7 Feb 2023 18:17:21 +0100
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > diff --git a/package/qt6/qt6base/qt.conf.in b/package/qt6/qt6base/qt.conf.in
> > new file mode 100644
> > index 0000000000..4842bcb462
> > --- /dev/null
> > +++ b/package/qt6/qt6base/qt.conf.in
> > @@ -0,0 +1,7 @@
> > +[Paths]
> > +Prefix=/usr
> > +HostPrefix=@@HOST_DIR@@
> > +HostData=../target/usr
>
> This looks very very odd, and most likely doesn't work. If I understand
> correctly, this is a path that will be interpreted relatively to
> $(HOST_DIR), so this value assumes that host/ and target/ are side by
> side, but that's not true in the general case. Indeed, BR2_HOST_DIR
> allows to customize where $(HOST_DIR) is located, and it can be
> elsewhere than side by side to target/.
>
> What is this trying to do exactly?
>
>
>
> > +Sysroot=@@STAGING_DIR@@
> > +SysrootifyPrefix=true
> > +TargetSpec=devices/linux-buildroot-g++
> > diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> > index ec1c65f827..f37b2bafce 100644
> > --- a/package/qt6/qt6base/qt6base.mk
> > +++ b/package/qt6/qt6base/qt6base.mk
> > @@ -54,6 +54,9 @@ QT6BASE_CONF_OPTS = \
> >       -DFEATURE_system_zlib=ON \
> >       -DFEATURE_system_libb2=ON
> >
> > +QT6BASE_CFLAGS = $(TARGET_CFLAGS)
> > +QT6BASE_CXXFLAGS = $(TARGET_CXXFLAGS)
> > +
> >  # x86 optimization options. While we have a BR2_X86_CPU_HAS_AVX512, it
> >  # is not clear yet how it maps to all the avx512* options of Qt, so we
> >  # for now keeps them disabled.
> > @@ -384,5 +387,18 @@ else
> >  QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
> >  endif
> >
> > +define QT6BASE_MAKE_BR_SPEC
> > +     $(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qmake.conf.in \
> > +             $(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
> > +     $(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qplatformdefs.h \
> > +             $(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
> > +endef
> > +
> > +QT6BASE_CONF_OPTS += -DQT_QMAKE_DEVICE_OPTIONS=CROSS_COMPILE="$(TARGET_CROSS)";BR_COMPILER_CFLAGS="$(QT6BASE_CFLAGS)";BR_COMPILER_CXXFLAGS="$(QT6BASE_CXX_FLAGS)"
> > +
> > +QT6BASE_PRE_CONFIGURE_HOOKS += QT6BASE_MAKE_BR_SPEC
> > +
> > +QT6BASE_POST_INSTALL_STAGING_HOOKS += QT6_INSTALL_QT_CONF
>
> Where is QT6_INSTALL_QT_CONF implemented ?
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
