Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F40CD4F32
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 21:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 581D4812EF;
	Wed,  4 Sep 2024 21:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPMhL_P6EybE; Wed,  4 Sep 2024 21:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2907C812F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2907C812F1;
	Wed,  4 Sep 2024 21:24:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E6F11BF97A
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 21:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 098B5608B2
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 21:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGI4ggxe-xw6 for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 21:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DC0F4608AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC0F4608AD
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC0F4608AD
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 21:24:09 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-6daf46ee332so73807b3.0
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 14:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725485048; x=1726089848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iBqfreAweirWDRNrobyVcPmItTsiQfLh081DG86PYeA=;
 b=J4UuFA9DDV/qLtSNUQfW4ywygx4RKpMm9njJUtCuGphdIldU/mN6VTtVTWJaHYsQxj
 +kG7tUbn/nWbtbo4qQRQVVgsQLmkR0GaSLmH1iTGZPe+zUndA5C5kdFWhBjqPvy1Runa
 6PvPUBH50Bo48kWgi1UcLA/lQQhkfN/0FKVUp3h8pAOV/nPkt6yXJJ9akFnnOzrlb/PI
 O9wAeJlGopXeAw7bhWD2Zg8jbleJLrHHLm3D2cZRb4lxNp89y1E09bWlXJBBGy2SE+2I
 CB1lA2JqkmzNen1GOapd+nYTpWa5fBmudX1KinVhNyBbMcnBivlQZpjqvBUQ468MUDsp
 QAwg==
X-Gm-Message-State: AOJu0Yyr8uJfALjpKQje635gSKPQl40akxrYqW7hmmRt56zbjNEPNsO9
 kvZQJpiOQD2Acu3l7/aghhq5/xyHSsiFc2IWQzmmyOzX3sM4v5+eMXeUrzF8pl3Phi+K0VAOB2q
 gIPEBqHVzmpXAksZXyaTqqr/lYmw=
X-Google-Smtp-Source: AGHT+IEByfDpUiXyMkENq/07mbkCjkP39PZi7aXfx5ZKIY/S/R+HI6df1vFCKKqE6h6/lS8v1dB8/t9lowYP//ijq+U=
X-Received: by 2002:a05:690c:398:b0:6b1:8d2:8819 with SMTP id
 00721157ae682-6d40f43953bmr200639687b3.15.1725485048266; Wed, 04 Sep 2024
 14:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240904122040.738362-1-roykollensvendsen@gmail.com>
 <20240904122040.738362-2-roykollensvendsen@gmail.com>
 <20240904143345.42fb7e47@windsurf>
In-Reply-To: <20240904143345.42fb7e47@windsurf>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Wed, 4 Sep 2024 23:23:56 +0200
Message-ID: <CA+R_derkVf0VVgs8ySaeOxx8PgEVZ6QzV62NjtLUcRDcDB-qfQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725485048; x=1726089848; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iBqfreAweirWDRNrobyVcPmItTsiQfLh081DG86PYeA=;
 b=K03374piUH4T2WRqYPmF/fuAJFZiCWgpGYqDKSXykbUIFWek77/fqJmuzENTUWsCCm
 7BnFGoU7d4Qqhy4rb58960H015MVnzWN7aFobJ/pUY0/xg9aZsgwSWMMlOMN98pG4jAS
 gCDeOM8BXXYn1dkuNs9NlgNPEHmg/7SZ1JaqtY19I92514axGmNhVjefTQqjwxRnXRKK
 Tex5HdTei/1tzhBO5ZotaRnSGi0o0liLDi9OBGKKGjW/G43DR7K4RAH0hRYogAPREcJf
 BB16fDEr9E07U+41oLxXXZtD17BAMEF98Ebvgd0IulMGUGR/8dtfkisR8XOR8paC1f6H
 UOng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K03374pi
Subject: Re: [Buildroot] [PATCH 2/2] package/qt6/qt6base: allow selecting
 the host Qt Print Support module
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Here is v2 of the patchset:

https://patchwork.ozlabs.org/project/buildroot/patch/20240904211049.866640-1-roykollensvendsen@gmail.com/

Roy

ons. 4. sep. 2024 kl. 14:33 skrev Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> On Wed,  4 Sep 2024 14:20:38 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > According to configure.cmake printsupport requires widgets:
> >
> > qt_feature("printsupport" PRIVATE
> >     LABEL "Qt PrintSupport"
> >     CONDITION QT_FEATURE_widgets
> >     SECTION "Module"
> >     PURPOSE "Provides the Qt PrintSupport module."
> > )
> >
> > So we let print support automatically select widgets support.
> >
> > Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
>
> This should be PATCH 1/2 in the series, because your patch adding
> BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS uses this new
> BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT option.
>
> > ---
> >  package/qt6/qt6base/Config.in.host | 11 +++++++++++
> >  package/qt6/qt6base/qt6base.mk     | 16 ++++++++++++++--
> >  2 files changed, 25 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
> > index 46fb668817..8f0bc1f070 100644
> > --- a/package/qt6/qt6base/Config.in.host
> > +++ b/package/qt6/qt6base/Config.in.host
> > @@ -8,6 +8,13 @@ config BR2_PACKAGE_HOST_QT6BASE_GUI
> >  config BR2_PACKAGE_HOST_QT6BASE_NETWORK
> >       bool
> >
> > +# Select this if you need host qt6 tools that require the Qt Print Support
> > +# module
> > +# (e.g. Qt Tools Linguist Tools).
>
> I don't think that this really makes sense. We don't really care about
> how is using this (in the future, it may be other things). We care
> about what the option does... but what it does is actually pretty
> obvious from the option name. I think the only comment is to clarify
> that yes, widget support is needed for the print support, which isn't
> really obvious.
>
> > +config BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT
> > +     bool
> > +     select BR2_PACKAGE_HOST_QT6BASE_WIDGETS
> > +
> >  # Select this if you need host qt6 tools that require the Qt::Test module
> >  # (e.g. qmltestrunner).
> >  config BR2_PACKAGE_HOST_QT6BASE_TEST
> > @@ -17,3 +24,7 @@ config BR2_PACKAGE_HOST_QT6BASE_TEST
> >  # (e.g. qhelpgenerator).
> >  config BR2_PACKAGE_HOST_QT6BASE_SQL
> >       bool
> > +
> > +# The Qt Widgets module is required by the Qt Print Support module
>
> And this comment would become useless.
>
> > +config BR2_PACKAGE_HOST_QT6BASE_WIDGETS
> > +     bool
>
> Isn't widget support dependent on GUI support?
>
> > diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> > index 4c0392f92d..271f464115 100644
> > --- a/package/qt6/qt6base/qt6base.mk
> > +++ b/package/qt6/qt6base/qt6base.mk
> > @@ -113,10 +113,8 @@ HOST_QT6BASE_CONF_OPTS += \
> >       -DFEATURE_png=OFF \
> >       -DFEATURE_gif=OFF \
> >       -DFEATURE_jpeg=OFF \
> > -     -DFEATURE_printsupport=OFF \
> >       -DFEATURE_kms=OFF \
> >       -DFEATURE_fontconfig=OFF \
> > -     -DFEATURE_widgets=OFF \
> >       -DFEATURE_libinput=OFF \
> >       -DFEATURE_tslib=OFF \
> >       -DFEATURE_eglfs=OFF
> > @@ -131,6 +129,13 @@ else
> >  HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
> >  endif
> >
> > +# The Qt Print Support module is required for building Qt Tools Linguist Tools
>
> Not needed, it could be other things.
>
> > +ifeq ($(BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT),y)
> > +HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=ON
> > +else
> > +HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=OFF
> > +endif
> > +
> >  # We need host qt6base with Sql support for host-qt6tools to generate the
> >  # qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
> >  # available.
> > @@ -150,6 +155,13 @@ else
> >  HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
> >  endif
> >
> > +# The Qt Widgets module is required by the Qt Print Support module
>
> Also not very relevant comment IMO.
>
> > +ifeq ($(BR2_PACKAGE_HOST_QT6BASE_WIDGETS),y)
> > +HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
> > +else
> > +HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
> > +endif
>
> Thanks!
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
