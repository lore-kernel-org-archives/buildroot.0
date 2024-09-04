Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2479CD4F32
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 21:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A43BA8131A;
	Wed,  4 Sep 2024 21:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GimmgucKfcRJ; Wed,  4 Sep 2024 21:27:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B6CA8131B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B6CA8131B;
	Wed,  4 Sep 2024 21:27:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6011BF423
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 21:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B4C58131A
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 21:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnWDL1_nBHSr for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 21:27:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 008E681319
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 008E681319
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 008E681319
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 21:27:35 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e1651f48c31so158901276.0
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 14:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725485255; x=1726090055;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A1NBCN1XZYVrZ6ATtLcnftVLEM3e1rCI6O7Q2uXzBIs=;
 b=ardeFDabgXqKmcC8ZrhhyRIg17A9QrfhhRGHJuKHd95HuRnC4pryzt/mB1ie2UaFnv
 5RMlV1RsO07sNb31RPT5KP1pE6m4ZULBmwEBESzxZdi5VEvgmt1dSfd/pFuLDzSw9z9O
 JcUpiMHuEr9GfaCeXn5YN3ZkcLHAs0t9CDfNU3w5ARFabefu6FTEFInlNhUfQTNTDp0b
 Epe2pdQ1NxZbmUUPIhpPCfDQplKN/mLyjz+ruTQkW9jD2eSkA54UyVT1b3rN12jvpl3F
 Nv0d9E/cLbyL1iH/pM4nUxdfknXByvDekUaUKFYjDV+O3nMFSTYBe7uHTcwshShNF81u
 1Qhg==
X-Gm-Message-State: AOJu0Yw5ps77VrfuZmRxYzKxcERmmbvPF61n6e6IdO9arJmNbm+jcrbT
 LAhtPrktoeYA0EgaXawNoiCKi+vM7epHbS3krsuoz6Y5D5FZfc2DU0W7W5C4WTEVNrGlzNgE1I8
 pkq/+lHSAN5A8yMzp2wDfLPexJm+HOAFm
X-Google-Smtp-Source: AGHT+IGZWlDDTQgEAgROO0O32SC56WC+9Ff5xacEdhGvuk8qij66hRR/x1EAGbV4Ht9es6257+DKLMjKY8ZGA68NPsg=
X-Received: by 2002:a05:690c:6788:b0:6d4:e841:20b7 with SMTP id
 00721157ae682-6d4e8412806mr199083567b3.17.1725485254565; Wed, 04 Sep 2024
 14:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240904122040.738362-1-roykollensvendsen@gmail.com>
 <20240904143016.14accde3@windsurf>
In-Reply-To: <20240904143016.14accde3@windsurf>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Wed, 4 Sep 2024 23:27:23 +0200
Message-ID: <CA+R_der6G24qK3xgcOoF9vp_-3Oecx3v2U3F7gujNBUA4Q73FQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725485255; x=1726090055; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A1NBCN1XZYVrZ6ATtLcnftVLEM3e1rCI6O7Q2uXzBIs=;
 b=cn8HebhOdjkFhK2FFO/cDeLi3k6DurVpK6Zc3TUucD0GUJQ+wegsUInz8R+HEqRJ2H
 B3yupwzbf5U3KVyPSx29znd1cM7PwqfcsIE3Yn2hQnnZFfG0GkrYR7SurBJLxVjSSSAY
 m7OOiP40dQTPrgkQKNMhwGeqycwmpcMHQ7uapHh829f6G4dgJPAFMRVEvSxShMj9luzD
 akJ018Kgq9bi41r65n8PSmkr4DOJg7zZKvqlCekXgdK8YAqYEd3OvOpk/qF6uFMy4vBW
 5xo8GSZQAoa/e0hoj6javgH1hqUaSVgtZBP7MN1X8Mns9rIM5dYQNs50sbDi1M7z2ygF
 mixQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cn8HebhO
Subject: Re: [Buildroot] [PATCH 1/2] package/qt6/qt6tools: allow building
 host Qt Linguist Tools
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

Here is v2:

PATCH 2/3:
https://patchwork.ozlabs.org/project/buildroot/patch/20240904211049.866640-2-roykollensvendsen@gmail.com/

PATCH 3/3:
https://patchwork.ozlabs.org/project/buildroot/patch/20240904211049.866640-3-roykollensvendsen@gmail.com/



Roy



ons. 4. sep. 2024 kl. 14:30 skrev Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> On Wed,  4 Sep 2024 14:20:37 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > According to src/linguist/CMakeLists.txt we need to enable the
> > linguist feature:
> >
> > ...
> > if(NOT QT_FEATURE_linguist)
> >     return()
> > endif()
> > add_subdirectory(lconvert)
> > add_subdirectory(lprodump)
> > add_subdirectory(lrelease)
> > add_subdirectory(lrelease-pro)
> > add_subdirectory(lupdate)
> > add_subdirectory(lupdate-pro)
> > if(QT_FEATURE_process AND QT_FEATURE_pushbutton AND QT_FEATURE_toolbutton AND TARGET Qt::Widgets AND NOT no-png)
> >     add_subdirectory(linguist)
> > endif()
> > ...
> >
> > And according to configure.cmake we need to select print support:
> > ...
> > qt_feature("linguist" PRIVATE
> >     LABEL "Qt Linguist"
> >     PURPOSE "Qt Linguist can be used by translator to translate text in Qt applications."
> >     CONDITION TARGET Qt::PrintSupport
> > )
> > ...
> >
> > Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> > ---
> >  package/qt6/qt6tools/Config.in   | 11 +++++++++++
> >  package/qt6/qt6tools/qt6tools.mk | 10 ++++++++--
> >  2 files changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
> > index 5f52c5644f..eea461a2a9 100644
> > --- a/package/qt6/qt6tools/Config.in
> > +++ b/package/qt6/qt6tools/Config.in
> > @@ -15,3 +15,14 @@ config BR2_PACKAGE_QT6TOOLS
> >         and design of applications.
> >
> >         https://github.com/qt/qttools
> > +
> > +if BR2_PACKAGE_QT6TOOLS
> > +
> > +config BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS
> > +     bool "linguist tools (host)"
> > +     select BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT
> > +     help
> > +       Translate Qt C++ and Qt Quick applications into local
> > +       languages.
>
> This should go in a package/qt6/qt6tools/Config.in.host, not in
> Config.in as Config.in is for options that affect the target build.



>
> > +
> > +endif
> > diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
> > index 09c986cfc6..897cf43054 100644
> > --- a/package/qt6/qt6tools/qt6tools.mk
> > +++ b/package/qt6/qt6tools/qt6tools.mk
> > @@ -37,11 +37,17 @@ QT6TOOLS_DEPENDENCIES = \
> >       qt6base \
> >       host-qt6tools
> >
> > +HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
> > +
> > +ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
> > +HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
> > +else
> > +HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=OFF
> > +endif
>
> Please group these host package things...
>
> > +
> >  ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> >  QT6TOOLS_DEPENDENCIES += qt6declarative
> >  endif
> >
> > -HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
>
> ... here. Rather than inter-twining target package and host package
> details.
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
