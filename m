Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EA7C3ABA1
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 17:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 371248143F;
	Sun, 15 Sep 2024 17:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xq2OhyB0mEfH; Sun, 15 Sep 2024 17:05:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C698781402
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C698781402;
	Sun, 15 Sep 2024 17:05:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23FD21BF5E9
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 17:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1286D606ED
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 17:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8-rQyUxdyhO for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 17:05:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=baxiche@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DB5E606E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DB5E606E0
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DB5E606E0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 17:05:15 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e1d06c728b8so3207706276.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 10:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726419914; x=1727024714;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fszR2Et872RrISHJB+z4fmhqLZJJZsOMzYMzyJshpls=;
 b=m3v3TSZkhGsyOQVKmQxkgeYcGYtXmjTryEyPmBujLbstwAM9frlrkfTHpLfM3NAtoH
 C41Zl9m68RNbqy849IRheLt/1wYqBrGPkY1Y3n7GkkR8dqVqiRr1QZC2j3B9VN0iCubO
 XMLTSxgN+SqCVQFUPBp9fk5aKyzLu+WZkZI7GGb52TgPQbznDChxc0dP7SH1/M+6uFf2
 u4feDAhUExO3k4/EAVuznYcgBpBJ3tDGclSuFQ5jtiaSmGzjzxgqJ+RSB6TsCxhgllGk
 Xg3xh6aDKInFKPNSeEHNrerK5C02iJ66bfRhlVVyy4il2ChtCDUhEhVXrx0aQ61CnAEK
 aLcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMKcG9L1ciL7R/JmYatkxsgYSmX9eDuh0IZ2iimuY6tqnGwED8Y7nRt2BVvLbDAb8VM4zYSJzcBqY=@buildroot.org
X-Gm-Message-State: AOJu0YyQrBA+65s9/7C7kaRrCmmsfFyRQXwrWbG/Nib5TJrtPCrU2PDM
 F2HxBb67+g5OrxoBpnw+Rlj6fi+PhRxyVuCnD4bdldQ3MNs29E0MIIsMiudLe8MKgNDBgqknm9/
 Z190u3o4g3AzGBcNdXq+7Xfs0dk8=
X-Google-Smtp-Source: AGHT+IHS3rxzMsFoMcMZHwczPIs4Ye6Ckgzg26p0xIy8m1LOFsbJTqoG7Cm1140Fxetot6SfAkwE6mV2VHNWxOnEfgg=
X-Received: by 2002:a25:9c44:0:b0:e1d:a827:2a46 with SMTP id
 3f1490d57ef6-e1da8273182mr6473440276.36.1726419914064; Sun, 15 Sep 2024
 10:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240810171335.19227-1-baxiche@gmail.com>
 <CA+R_dep6gZd6Kv6SuDPE-+RCfjbNArRd9U+yvnYiZ=YX5R9H7Q@mail.gmail.com>
 <20240914121320.4672b1ca@windsurf>
In-Reply-To: <20240914121320.4672b1ca@windsurf>
From: baxiche su <baxiche@gmail.com>
Date: Mon, 16 Sep 2024 01:05:03 +0800
Message-ID: <CAE3sgKinBiJn9SdBHhC7NgeZ9edpfs-yMigBNYzqA5ndrAv3KA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726419914; x=1727024714; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fszR2Et872RrISHJB+z4fmhqLZJJZsOMzYMzyJshpls=;
 b=C+uw+xKvTpMJoRMRALzIdG/5CHBb6V6ipAPyEUSCe2A6GdRBFpXWl5IlQKfofoUTld
 XYQd6eNr2/5lzzKPpb4AJyMfsOYBCypXYYR7oqdpIAeKSqECJ5SrRrKcezqlGVqQeBxB
 nT3mpGcsQS+rG88TvZZGZ07dNp7grM66ZtAB0eHebiVRFVTqZmdbSZR87yqAkuBree1X
 X8g5XVyrrKrL/Fzp5wcCSKxTnvCpxau48Ye+lAXIXL6d9ANRnqp/g+FRVp98QWevINkq
 ugZqcD+3eFm44GheT4UcisRGae0Inp/5/c3wLLpRfDNt8E7JBPvIkUPvyvrQUTbjpvJu
 blDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C+uw+xKv
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6: add qt6 multimedia
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8134877848783154507=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8134877848783154507==
Content-Type: multipart/alternative; boundary="000000000000b60c7106222b758c"

--000000000000b60c7106222b758c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

I have a few questions regarding your comments:

1. Should I push a new patch after discussing the patch details with you
via email,
    or should I push a new patch each time we have a discussion?

2. Regarding FFmpeg integration in Qt6 Multimedia compilation:
    When building Qt6 Multimedia from source, it requires specifying the
FFmpeg directory
    containing the include, lib, and bin subdirectories. Are there
alternative methods
    to achieve this integration without directly modifying the FFmpeg
source code?

3. Regarding PulseAudio in Qt6 Multimedia:
    Qt6 Multimedia can be built without PulseAudio. The configuration
process automatically detects
    the PulseAudio library if present. Therefore, there is no need to
specify an alternative option in the absence of PulseAudio.

For more information on Qt6 Multimedia, please see the following resources:
https://doc.qt.io/qt-6/qtmultimedia-building-from-source.html

That's my question about your comment.

By the way, this is my first patch in the open-source community, your
feedback means a lot to me.

Thank you for taking the time to review my work.

Baxiche

Thomas Petazzoni <thomas.petazzoni@bootlin.com> =E6=96=BC 2024=E5=B9=B49=E6=
=9C=8814=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=886:13=E5=AF=AB=E9=81=
=93=EF=BC=9A

> Hello Baxiche, Hello Roy,
>
> First of all, thanks Roy for the review, much appreciated! See my
> comments below.
>
> On Wed, 14 Aug 2024 13:59:04 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
>
> > > +QT6MULTIMEDIA_LICENSE =3D \
> > > +       LGPL-3.0 or GPL-2.0 or GPL-3.0, \
> > > +       LGPL-2.1+, \
> > > +       BSD-3-Clause (docs), \
> > > +       GFDL-1.3 no invariants (docs), \
> > > +       BSD-3-Clause (examples), \
> > > +       BSL-1.0, \
> > > +       MPL-2.0 \
> > > +       MIT
> >
> > Thomas, should we order these licenses alpabetically, and avoid
> > duplicating the lines?:
> >
> > To avoid duplicating lines I would do:
> >
> > QT6MULTIMEDIA_LICENSE =3D \
> >       LGPL-3.0 or GPL-2.0 or GPL-3.0, \
> >       LGPL-2.1+, \
> >       BSD-3-Clause (docs, examples), \
> >       GFDL-1.3 no invariants (docs), \
> >       BSL-1.0, \
> >       MPL-2.0 \
> >       MIT
> >
> > And order alphabetically:
> >       BSD-3-Clause (docs, examples), \
> >       BSL-1.0, \
> >       GFDL-1.3 no invariants (docs), \
> >       LGPL-2.1+, \
> >       LGPL-3.0 or GPL-2.0 or GPL-3.0, \
> >       MIT \
> >       MPL-2.0
>
> Yes, I agree this looks nicer. We don't enforce alphabetic ordering for
> the licenses currently, but here it definitely makes sense to do so.
>
>
> > > +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> > > +QT6MULTIMEDIA_DEPENDENCIES +=3D qt6declarative
> > > +endif
> >
> > I think it is custom to order these ifeq-statements alphabetically?
>
> Yes, it's good to do so.
>
> > > +ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
> > > +QT6MULTIMEDIA_DEPENDENCIES +=3D pulseaudio
> > > +endif
> > > +
> > > +ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_PULSEAUDIO),yy)
> >
> > It may be better to avoid doing the BR2_PACKAGE_PULSEAUDIO=3D=3Dy twice=
,
> > by moving the BR2_PACKAGE_FFMPEG=3D=3Dy inside ifeq
> > ($(BR2_PACKAGE_PULSEAUDIO),y)-block above.
> >
> > > +QT6MULTIMEDIA_CONF_OPTS +=3D
> -DFFMPEG_DIR=3D$(BUILD_DIR)/ffmpeg-$(FFMPEG_VERSION) -DQT_DEPLOY_FFMPEG=
=3DON
> >
> > What about splitting the long line to increase readability?:
> >
> > QT6MULTIMEDIA_CONF_OPTS +=3D \
> >       -DFFMPEG_DIR=3D$(BUILD_DIR)/ffmpeg-$(FFMPEG_VERSION) \
>
> I don't really like this. Why is this needed? Why does qt6multimedia
> need to poke directly into the ffmpeg source code?
>
> If this hadn't been present, I would have applied the patch with the
> fixes proposed by Roy, but I'm not a big fan of this ffmpeg thing.
>
> Also, are there some options to explicitly disable things?
>
> I.e, instead of:
>
> +ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
> +QT6MULTIMEDIA_DEPENDENCIES +=3D pulseaudio
> +endif
>
> have something to explicitly enable pulseaudio support in
> qt6multimedia, and in an "else" clause, something to explicitly disable
> pulseaudio support?
>
> Roy: as Baxiche didn't come back with a new iteration, I'm not sure
> they will ever come back with a new version. I'm going to mark this
> patch as Changes Requested, but if Baxiche doesn't come back with a new
> version and no-one else picks it up, it means it will be forgotten.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000b60c7106222b758c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><h3 class=3D"gmail-iw gmail-gFxsud" style=3D"overflow:hidd=
en;margin:inherit;text-overflow:ellipsis;font-family:&quot;Google Sans&quot=
;,Roboto,RobotoDraft,Helvetica,Arial,sans-serif;line-height:20px"><font col=
or=3D"#1f1f1f"><span style=3D"font-size:14px;font-weight:normal">Hi Thomas,=
=C2=A0</span></font></h3><div><font color=3D"#1f1f1f"><span style=3D"font-s=
ize:14px;font-weight:normal"><br></span></font></div><div>I have a few ques=
tions regarding your comments:<font color=3D"#1f1f1f"><span style=3D"font-s=
ize:14px;font-weight:normal"><br></span></font></div><div><br></div><div>1.=
 Should I push a new patch after discussing the patch details with you via =
email,=C2=A0</div><div>=C2=A0 =C2=A0 or should I push a new patch each time=
 we have a discussion?<br><br>2. Regarding FFmpeg integration in Qt6 Multim=
edia compilation:<br>=C2=A0 =C2=A0 When building Qt6 Multimedia from source=
, it requires specifying the FFmpeg directory <br>=C2=A0 =C2=A0 containing =
the include, lib, and bin subdirectories. Are there alternative methods <br=
>=C2=A0 =C2=A0 to achieve this integration without directly modifying the F=
Fmpeg source code?<br><br>3. Regarding PulseAudio in Qt6 Multimedia:<br>=C2=
=A0 =C2=A0 Qt6 Multimedia can be built without PulseAudio. The configuratio=
n process automatically detects <br>=C2=A0 =C2=A0 the PulseAudio library if=
 present. Therefore, there is no need to specify an alternative option in t=
he absence of PulseAudio.<br><br>For more information on Qt6 Multimedia,=C2=
=A0please see the following resources:<br><a href=3D"https://doc.qt.io/qt-6=
/qtmultimedia-building-from-source.html">https://doc.qt.io/qt-6/qtmultimedi=
a-building-from-source.html</a><br><br>That&#39;s my question about your co=
mment.<br><br><div dir=3D"auto">By the way, this is my first patch in the o=
pen-source community, your feedback means a lot to me.=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thank you for taking the time to revi=
ew my work.=C2=A0<br><br>Baxiche<br></div></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Thomas Petazzoni &lt;<a hre=
f=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&=
gt; =E6=96=BC 2024=E5=B9=B49=E6=9C=8814=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=
=8B=E5=8D=886:13=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hello Baxiche, Hello Roy,<br>
<br>
First of all, thanks Roy for the review, much appreciated! See my<br>
comments below.<br>
<br>
On Wed, 14 Aug 2024 13:59:04 +0200<br>
Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" targ=
et=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote:<br>
<br>
<br>
&gt; &gt; +QT6MULTIMEDIA_LICENSE =3D \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0LGPL-3.0 or GPL-2.0 or GPL-3.0, \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0LGPL-2.1+, \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BSD-3-Clause (docs), \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0GFDL-1.3 no invariants (docs), \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BSD-3-Clause (examples), \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BSL-1.0, \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MPL-2.0 \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MIT=C2=A0 <br>
&gt; <br>
&gt; Thomas, should we order these licenses alpabetically, and avoid<br>
&gt; duplicating the lines?:<br>
&gt; <br>
&gt; To avoid duplicating lines I would do:<br>
&gt; <br>
&gt; QT6MULTIMEDIA_LICENSE =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0LGPL-3.0 or GPL-2.0 or GPL-3.0, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0LGPL-2.1+, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BSD-3-Clause (docs, examples), \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GFDL-1.3 no invariants (docs), \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BSL-1.0, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MPL-2.0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MIT<br>
&gt; <br>
&gt; And order alphabetically:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BSD-3-Clause (docs, examples), \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BSL-1.0, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GFDL-1.3 no invariants (docs), \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0LGPL-2.1+, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0LGPL-3.0 or GPL-2.0 or GPL-3.0, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MIT \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MPL-2.0<br>
<br>
Yes, I agree this looks nicer. We don&#39;t enforce alphabetic ordering for=
<br>
the licenses currently, but here it definitely makes sense to do so.<br>
<br>
<br>
&gt; &gt; +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)<br>
&gt; &gt; +QT6MULTIMEDIA_DEPENDENCIES +=3D qt6declarative<br>
&gt; &gt; +endif=C2=A0 <br>
&gt; <br>
&gt; I think it is custom to order these ifeq-statements alphabetically?<br=
>
<br>
Yes, it&#39;s good to do so.<br>
<br>
&gt; &gt; +ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)<br>
&gt; &gt; +QT6MULTIMEDIA_DEPENDENCIES +=3D pulseaudio<br>
&gt; &gt; +endif<br>
&gt; &gt; +<br>
&gt; &gt; +ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_PULSEAUDIO),yy)=C2=A0 <=
br>
&gt; <br>
&gt; It may be better to avoid doing the BR2_PACKAGE_PULSEAUDIO=3D=3Dy twic=
e,<br>
&gt; by moving the BR2_PACKAGE_FFMPEG=3D=3Dy inside ifeq<br>
&gt; ($(BR2_PACKAGE_PULSEAUDIO),y)-block above.<br>
&gt; <br>
&gt; &gt; +QT6MULTIMEDIA_CONF_OPTS +=3D -DFFMPEG_DIR=3D$(BUILD_DIR)/ffmpeg-=
$(FFMPEG_VERSION) -DQT_DEPLOY_FFMPEG=3DON=C2=A0 <br>
&gt; <br>
&gt; What about splitting the long line to increase readability?:<br>
&gt; <br>
&gt; QT6MULTIMEDIA_CONF_OPTS +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFFMPEG_DIR=3D$(BUILD_DIR)/ffmpeg-$(FFMPEG_=
VERSION) \<br>
<br>
I don&#39;t really like this. Why is this needed? Why does qt6multimedia<br=
>
need to poke directly into the ffmpeg source code?<br>
<br>
If this hadn&#39;t been present, I would have applied the patch with the<br=
>
fixes proposed by Roy, but I&#39;m not a big fan of this ffmpeg thing.<br>
<br>
Also, are there some options to explicitly disable things?<br>
<br>
I.e, instead of:<br>
<br>
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D pulseaudio<br>
+endif<br>
<br>
have something to explicitly enable pulseaudio support in<br>
qt6multimedia, and in an &quot;else&quot; clause, something to explicitly d=
isable<br>
pulseaudio support?<br>
<br>
Roy: as Baxiche didn&#39;t come back with a new iteration, I&#39;m not sure=
<br>
they will ever come back with a new version. I&#39;m going to mark this<br>
patch as Changes Requested, but if Baxiche doesn&#39;t come back with a new=
<br>
version and no-one else picks it up, it means it will be forgotten.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000b60c7106222b758c--

--===============8134877848783154507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8134877848783154507==--
