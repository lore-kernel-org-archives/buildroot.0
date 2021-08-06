Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCB2C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 11:39:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DED66108D
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 11:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DED66108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B07634048D;
	Fri,  6 Aug 2021 11:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9NiJ3wI-rr-x; Fri,  6 Aug 2021 11:39:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC931404FD;
	Fri,  6 Aug 2021 11:39:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83C971BF421
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 11:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8105781C19
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 11:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kk645CPQ1kiq for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 11:39:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1763881BE3
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 11:39:19 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b6so979304lff.10
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 04:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9mt9d4wetYdQDY/tIx6S8EAsLU7lPRziUWSzJZb/iVo=;
 b=d2rAThreqx+ZFhg/lyObTAV8+txpaPYaWCKoVsbK+rE2K/qRmDd2UXbJmOyCTBgMJL
 ZdZeEnt4kyMSJnESM4osAgeHeGT+7yqiPttMhVwXYGAj1iKJ/THFFpq98fxAXimrdBoj
 vcWwtr2C9Ug+7cSfk6BBPwjMQgR9iQRFV2yst5UwEfaFE+UuEdb/4k6QM+zcXtVjb3tH
 Gxd9hqoDN7GTpoNbCEOFhKz2jzunEnynRJtxeonmoi+jM3gk+/8YTSZDs6wOAxHciDgt
 dE2yzazVZi6ejuLeoOKUu2siscaOBzPYqGFg2iKxuPGPRgN+iBnZRh9BwFY+0f8Tkw2h
 ayIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9mt9d4wetYdQDY/tIx6S8EAsLU7lPRziUWSzJZb/iVo=;
 b=IrofZvgYQ1a3Bp+X50n/wChKqJu8jT4LX62j5SErHrYorvAk7qE/rAPCVtQthgEudL
 3mWgwqQXPsoxOleA6N5SWZolHUEH2ju1plfWGO+mGSfnAerr6VPaBY0BFs1/YRQhESP9
 BjE2sQWvOM5J3ePJ4SFqoKyb7wwUSC4wovOHNBN8lZrqn60YQg5merLMKHM6nlfinnxK
 rMlgi8MGP/mx8l1DtwkmmEGUM9OKH+YCi1eAwbAyMRwbAGuGyxQ4nGoicQusCTDb2a0X
 XA0n/UiETTM9acUDzVz5oUE8kemXpEYyl6RvAh5fA+fiiKlzdFGVn1ywH5YeaDX48fwC
 WdKw==
X-Gm-Message-State: AOAM531ZjK21OMcKNRYfgt/QIozkXUOQacVovEyEk4onsYbX+qhirpU4
 P+aYCeS85RJFcGBMdocgnNvAfksIXVl9mieYnYA=
X-Google-Smtp-Source: ABdhPJzxiJ4k/8+K1DpEBqlt+uWuw2oXZDwsk+kkxZUcGggtf9lNGq1VMi7jKowMmxIPo5s0kQttxr/gZSY0MiV4nR0=
X-Received: by 2002:a19:740c:: with SMTP id v12mr7070874lfe.519.1628249957925; 
 Fri, 06 Aug 2021 04:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200107123209.6608-1-mehmetsamitok@gmail.com>
 <20200107123209.6608-2-mehmetsamitok@gmail.com>
 <20210805220339.112d2451@windsurf>
In-Reply-To: <20210805220339.112d2451@windsurf>
From: Mehmet Sami Tok <mehmetsamitok@gmail.com>
Date: Fri, 6 Aug 2021 14:39:07 +0300
Message-ID: <CAPsw1ZrjE45daCMAZB+eMpm9q4tz9G=O6ep_g2Gc4uSJd_oh9g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5: remove optimize by default
 on debug builds made with qmake
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3206509514454300524=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============3206509514454300524==
Content-Type: multipart/alternative; boundary="0000000000005908bb05c8e27ce1"

--0000000000005908bb05c8e27ce1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,
Thanks for the response. This is an old patch and I don't know if the
problem is still there. But the main point of this patch was not changing
flags of Qt package build.
When you want to use gcc toolchain and qmake generated by buildroot, It was
affecting your application builds. These flags directly passed to qt
toolchain and even if you want to build a debug build of any application,
it is built with -o2. So the problem is not occuring when root file system
is created, it appears when you want to build something else with toolchain
generated by buildroot.

Best Regards,
Mehmet Sami Tok

Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 5 A=C4=9Fu 2021 Per, 23:03
tarihinde =C5=9Funu yazd=C4=B1:

> Hello Mehmet,
>
> On Tue,  7 Jan 2020 15:32:09 +0300
> Mehmet Sami Tok <mehmetsamitok@gmail.com> wrote:
>
> > diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/
> qt5base.mk
> > index 774c771bc9..3415172fcb 100644
> > --- a/package/qt5/qt5base/qt5base.mk
> > +++ b/package/qt5/qt5base/qt5base.mk
> > @@ -34,8 +34,12 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> >  QT5BASE_CONFIGURE_OPTS +=3D -no-optimize-debug
> >  endif
> >
> > -QT5BASE_CFLAGS =3D $(TARGET_CFLAGS)
> > -QT5BASE_CXXFLAGS =3D $(TARGET_CXXFLAGS)
> > +# Passing optimization flags directly to CFLAGS or CXXFLAGS makes qmak=
e
> > +# builds optimized by default. Decision of optimization while developi=
ng
> > +# with qmake should be leaved to configuration of the project.
> > +FILTERED_ITEMS =3D -O%
> > +QT5BASE_CFLAGS =3D $(filter-out $(FILTERED_ITEMS),$(TARGET_CFLAGS))
> > +QT5BASE_CXXFLAGS =3D $(filter-out $(FILTERED_ITEMS),$(TARGET_CXXFLAGS)=
)
>
> Thanks for your patch, and sorry for the long delay in providing
> feedback to you and your patch. However, what the code currently does
> it what we want: we want the optimization level defined at the
> Buildroot configuration level to apply to all packages. We certainly do
> not want individual packages to pick and chose their own optimization
> level. So basically, your proposal unfortunately goes against the
> very principle of Buildroot. For this reason, I'm afraid we have to
> reject your patch.
>
> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Best Regards,
=C4=B0yi G=C3=BCnler Dilerim,
Mehmet Sami Tok

--0000000000005908bb05c8e27ce1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas,<div>Thanks for the response. This is an old pat=
ch and I don&#39;t know if the problem is still there. But the main point o=
f this patch was not changing flags of Qt package build.</div><div>When you=
 want to use gcc toolchain and qmake generated by buildroot, It was affecti=
ng your application builds. These flags directly passed to qt toolchain and=
 even if you want to build a debug build of any application, it is built wi=
th -o2. So the problem is not occuring when root file system is created, it=
 appears when you want to build something else with toolchain generated by =
buildroot.</div><div><br></div><div>Best Regards,</div><div>Mehmet Sami Tok=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">=
thomas.petazzoni@bootlin.com</a>&gt;, 5 A=C4=9Fu 2021 Per, 23:03 tarihinde =
=C5=9Funu yazd=C4=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hello Mehmet,<br>
<br>
On Tue,=C2=A0 7 Jan 2020 15:32:09 +0300<br>
Mehmet Sami Tok &lt;<a href=3D"mailto:mehmetsamitok@gmail.com" target=3D"_b=
lank">mehmetsamitok@gmail.com</a>&gt; wrote:<br>
<br>
&gt; diff --git a/package/qt5/qt5base/<a href=3D"http://qt5base.mk" rel=3D"=
noreferrer" target=3D"_blank">qt5base.mk</a> b/package/qt5/qt5base/<a href=
=3D"http://qt5base.mk" rel=3D"noreferrer" target=3D"_blank">qt5base.mk</a><=
br>
&gt; index 774c771bc9..3415172fcb 100644<br>
&gt; --- a/package/qt5/qt5base/<a href=3D"http://qt5base.mk" rel=3D"norefer=
rer" target=3D"_blank">qt5base.mk</a><br>
&gt; +++ b/package/qt5/qt5base/<a href=3D"http://qt5base.mk" rel=3D"norefer=
rer" target=3D"_blank">qt5base.mk</a><br>
&gt; @@ -34,8 +34,12 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)<br>
&gt;=C2=A0 QT5BASE_CONFIGURE_OPTS +=3D -no-optimize-debug<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt; -QT5BASE_CFLAGS =3D $(TARGET_CFLAGS)<br>
&gt; -QT5BASE_CXXFLAGS =3D $(TARGET_CXXFLAGS)<br>
&gt; +# Passing optimization flags directly to CFLAGS or CXXFLAGS makes qma=
ke<br>
&gt; +# builds optimized by default. Decision of optimization while develop=
ing<br>
&gt; +# with qmake should be leaved to configuration of the project.<br>
&gt; +FILTERED_ITEMS =3D -O%<br>
&gt; +QT5BASE_CFLAGS =3D $(filter-out $(FILTERED_ITEMS),$(TARGET_CFLAGS))<b=
r>
&gt; +QT5BASE_CXXFLAGS =3D $(filter-out $(FILTERED_ITEMS),$(TARGET_CXXFLAGS=
))<br>
<br>
Thanks for your patch, and sorry for the long delay in providing<br>
feedback to you and your patch. However, what the code currently does<br>
it what we want: we want the optimization level defined at the<br>
Buildroot configuration level to apply to all packages. We certainly do<br>
not want individual packages to pick and chose their own optimization<br>
level. So basically, your proposal unfortunately goes against the<br>
very principle of Buildroot. For this reason, I&#39;m afraid we have to<br>
reject your patch.<br>
<br>
Best regards,<br>
<br>
Thomas Petazzoni<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div style=3D"color:rgb(34,34,3=
4)">Best Regards,<br>=C4=B0yi G=C3=BCnler Dilerim,</div><div style=3D"color=
:rgb(34,34,34)">Mehmet Sami Tok</div></div></div>

--0000000000005908bb05c8e27ce1--

--===============3206509514454300524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3206509514454300524==--
