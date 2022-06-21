Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C698C43334
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 08:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E02B83E19;
	Tue, 21 Jun 2022 08:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E02B83E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4raZEzHSWkU0; Tue, 21 Jun 2022 08:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AD7E837C9;
	Tue, 21 Jun 2022 08:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AD7E837C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B4811BF5DB
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 08:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34804837C9
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 08:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34804837C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ufKszBSrHhny for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 08:34:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CD3283267
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CD3283267
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 08:34:33 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id u13so4821905uaq.10
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 01:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eiH4TlXJf1+s24WK3tYOyM8s3ioQuP/hpviezgNcjes=;
 b=7GioAqzFpPQj61qOOsVXYzAzxYHeoYLw4IehtTi9/3x9ggI7Yzsli406tawUzUJfHo
 hdm9R374XiVpf3S+FybyYi3k1ThdrgbXGN0/b5EPWLtQbigyr+q5974XC0hEoGMknIMV
 6O+rAzddwVnqDrDGVLlx8g4Me3OmAnbsGgku3Boalx7FVz9QaZyZHccgGY9Fmci5oJbO
 ZHxXZ0r3vnV32nTyPcV2xbAo/koPLBfp1VdRetcDjXeMZrWXGHtu6ujCb4duIB2CPZ3K
 MK9rLeJ1Q9Awl7Zp3O4eoL1cDxlIFF7YsM0ortPSs4nea/+lhTF6l6hT4P5zcW0hkRaX
 Gv9Q==
X-Gm-Message-State: AJIora8q3bC6hOndmObtA2ZuIPfsHjw+yrUtA1y8DZtTZQhVc/zcR77a
 ncQYhpT/6yvq0znPvTAnmRkzJNYcX6J2NmgJZ5c=
X-Google-Smtp-Source: AGRyM1tCbZ+V/MbGgao2ZosRS+HKaFPGtdxNG+VDa/IV6F3liFPp14yQX5v1aTnS1t5Lq9tLqDrLuQ==
X-Received: by 2002:ab0:1430:0:b0:37f:315b:8802 with SMTP id
 b45-20020ab01430000000b0037f315b8802mr72284uae.90.1655800471676; 
 Tue, 21 Jun 2022 01:34:31 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com.
 [209.85.221.177]) by smtp.gmail.com with ESMTPSA id
 v2-20020a056122120200b0036c2021bd76sm626537vkc.48.2022.06.21.01.34.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 01:34:31 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id b4so2817127vkh.6
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 01:34:31 -0700 (PDT)
X-Received: by 2002:ac5:cff3:0:b0:36b:f6ce:430c with SMTP id
 m51-20020ac5cff3000000b0036bf6ce430cmr4702780vkf.16.1655800471038; Tue, 21
 Jun 2022 01:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220530151612.3072914-1-thomas.devoogdt@barco.com>
 <4c9eff36-58b8-c617-b4e9-c52826aeca32@mind.be>
In-Reply-To: <4c9eff36-58b8-c617-b4e9-c52826aeca32@mind.be>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 21 Jun 2022 10:34:20 +0200
X-Gmail-Original-Message-ID: <CACXRmJh9hqYSXuQ6hsgZyMSHxebbsVBqqN4ywJ+XHCUOaj43Fw@mail.gmail.com>
Message-ID: <CACXRmJh9hqYSXuQ6hsgZyMSHxebbsVBqqN4ywJ+XHCUOaj43Fw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: add qemu host tools
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3340230751721099090=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3340230751721099090==
Content-Type: multipart/alternative; boundary="000000000000e5320305e1f1169d"

--000000000000e5320305e1f1169d
Content-Type: text/plain; charset="UTF-8"

Hi,

I did not find a way to update this series (using git send-email), should I
send my mail to something else than buildroot@buildroot.org?
Anyway, a new patch can be found here:
https://patchwork.ozlabs.org/project/buildroot/patch/20220621083027.2587218-1-thomas@devoogdt.com/

Kind regards,

Thomas Devoogdt

Op ma 20 jun. 2022 om 21:40 schreef Arnout Vandecappelle <arnout@mind.be>:

>   Hi Thomas,
>
> On 30/05/2022 17:16, Thomas Devoogdt wrote:
> > From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
> >
> > Allow host tools e.g. qemu-img to be built.
> > Similar to the BR2_PACKAGE_QEMU_TOOLS option.
> >
> > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
> > ---
> >   package/qemu/Config.in.host | 6 ++++++
> >   package/qemu/qemu.mk        | 6 ++++++
> >   2 files changed, 12 insertions(+)
> >
> > diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> > index f9cdb9b703..2aa6991263 100644
> > --- a/package/qemu/Config.in.host
> > +++ b/package/qemu/Config.in.host
> > @@ -102,4 +102,10 @@ config BR2_PACKAGE_HOST_QEMU_USB
> >       help
> >         Enables USB passthrough support from guest to host.
> >
> > +config BR2_PACKAGE_HOST_QEMU_TOOLS
> > +     bool "Enable tools"
> > +     help
> > +       Say 'y' here to include tools packaged with QEMU
> > +       (e.g. qemu-img).
>
>   For host packages, there's no rootfs size constraint, so there is
> normally no
> reason to have sub-options. Only if it would dramatically increase the
> build
> time, it's worth to make an option for this feature.
>
>   In other words: simply do --enable-tools unconditionally.
>
>   Regards,
>   Arnout
>
> > +
> >   endif
> > diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> > index 1bcffc2340..9623068c93 100644
> > --- a/package/qemu/qemu.mk
> > +++ b/package/qemu/qemu.mk
> > @@ -348,6 +348,12 @@ else
> >   HOST_QEMU_OPTS += --disable-libusb
> >   endif
> >
> > +ifeq ($(BR2_PACKAGE_HOST_QEMU_TOOLS),y)
> > +HOST_QEMU_OPTS += --enable-tools
> > +else
> > +HOST_QEMU_OPTS += --disable-tools
> > +endif
> > +
> >   # Override CPP, as it expects to be able to call it like it'd
> >   # call the compiler.
> >   define HOST_QEMU_CONFIGURE_CMDS
>

--000000000000e5320305e1f1169d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I did not find a way to update=C2=
=A0this series (using git send-email), should I send my mail to something e=
lse than=C2=A0<a href=3D"mailto:buildroot@buildroot.org">buildroot@buildroo=
t.org</a>?</div><div>Anyway, a new patch can be found here:=C2=A0<a href=3D=
"https://patchwork.ozlabs.org/project/buildroot/patch/20220621083027.258721=
8-1-thomas@devoogdt.com/">https://patchwork.ozlabs.org/project/buildroot/pa=
tch/20220621083027.2587218-1-thomas@devoogdt.com/</a></div><div><br></div><=
div>Kind regards,</div><div><br></div><div>Thomas Devoogdt</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Op ma 20 ju=
n. 2022 om 21:40 schreef Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@=
mind.be">arnout@mind.be</a>&gt;:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">=C2=A0 Hi Thomas,<br>
<br>
On 30/05/2022 17:16, Thomas Devoogdt wrote:<br>
&gt; From: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@gmail.com"=
 target=3D"_blank">thomas.devoogdt@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Allow host tools e.g. qemu-img to be built.<br>
&gt; Similar to the BR2_PACKAGE_QEMU_TOOLS option.<br>
&gt; <br>
&gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@g=
mail.com" target=3D"_blank">thomas.devoogdt@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/qemu/Config.in.host | 6 ++++++<br>
&gt;=C2=A0 =C2=A0package/qemu/<a href=3D"http://qemu.mk" rel=3D"noreferrer"=
 target=3D"_blank">qemu.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 12 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host=
<br>
&gt; index f9cdb9b703..2aa6991263 100644<br>
&gt; --- a/package/qemu/Config.in.host<br>
&gt; +++ b/package/qemu/Config.in.host<br>
&gt; @@ -102,4 +102,10 @@ config BR2_PACKAGE_HOST_QEMU_USB<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enables USB passthrough support from =
guest to host.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +config BR2_PACKAGE_HOST_QEMU_TOOLS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;Enable tools&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Say &#39;y&#39; here to include tools pack=
aged with QEMU<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0(e.g. qemu-img).<br>
<br>
=C2=A0 For host packages, there&#39;s no rootfs size constraint, so there i=
s normally no <br>
reason to have sub-options. Only if it would dramatically increase the buil=
d <br>
time, it&#39;s worth to make an option for this feature.<br>
<br>
=C2=A0 In other words: simply do --enable-tools unconditionally.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt; diff --git a/package/qemu/<a href=3D"http://qemu.mk" rel=3D"noreferrer=
" target=3D"_blank">qemu.mk</a> b/package/qemu/<a href=3D"http://qemu.mk" r=
el=3D"noreferrer" target=3D"_blank">qemu.mk</a><br>
&gt; index 1bcffc2340..9623068c93 100644<br>
&gt; --- a/package/qemu/<a href=3D"http://qemu.mk" rel=3D"noreferrer" targe=
t=3D"_blank">qemu.mk</a><br>
&gt; +++ b/package/qemu/<a href=3D"http://qemu.mk" rel=3D"noreferrer" targe=
t=3D"_blank">qemu.mk</a><br>
&gt; @@ -348,6 +348,12 @@ else<br>
&gt;=C2=A0 =C2=A0HOST_QEMU_OPTS +=3D --disable-libusb<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +ifeq ($(BR2_PACKAGE_HOST_QEMU_TOOLS),y)<br>
&gt; +HOST_QEMU_OPTS +=3D --enable-tools<br>
&gt; +else<br>
&gt; +HOST_QEMU_OPTS +=3D --disable-tools<br>
&gt; +endif<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0# Override CPP, as it expects to be able to call it like i=
t&#39;d<br>
&gt;=C2=A0 =C2=A0# call the compiler.<br>
&gt;=C2=A0 =C2=A0define HOST_QEMU_CONFIGURE_CMDS<br>
</blockquote></div>

--000000000000e5320305e1f1169d--

--===============3340230751721099090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3340230751721099090==--
