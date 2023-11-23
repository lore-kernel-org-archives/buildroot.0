Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A667C61D85
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 19:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6B6E82125;
	Thu, 23 Nov 2023 19:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6B6E82125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ci-eljRKbruL; Thu, 23 Nov 2023 19:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04F8B82142;
	Thu, 23 Nov 2023 19:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04F8B82142
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F3A31BF28B
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 19:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6848482142
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 19:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6848482142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIFH9--MZQ_G for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 19:13:46 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB84482125
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 19:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB84482125
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9ff26d7c0a6so168904166b.2
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 11:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700766824; x=1701371624;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HixY6/pOiqmtibgb63fPayuu1L6UzpuQHvGGL8Op3Lc=;
 b=Nr9UpW44juFaPLJCSsIlKYsgjw1ykqJrrA2B4lhrz0vFuqr/GZ9A2aoYjd2tqFGuFb
 zVLNX8JmyPO/gaNqO5J1yiE1GjzJ3ISOUYU00MWGS3eQvmpVeKNNL5FhBRuQjukvB4le
 FUY54LqQ3/kqqUlh3Icag6dS9wDYtO0qMwWjofA7mQ6zwUkekMHVZb5zTQp+/fHo4fLz
 HPy4sAkBFewiaOMeOv0SklMsu3jv9R/Sby0VT257tD/VZlI1AYTyFt+JLKeXMEJftymC
 ESuGxr6f/1b8lJc29lCAOFUf65iq1hBjD+69qRFVC75uZPMSSRW5HeJBVid7LHbjo+NI
 zBMA==
X-Gm-Message-State: AOJu0Yyogfo1GTppjaijpGrEhrYjTrZTekQ3oZMYYqN2oL+sB4hD8Ut7
 S93koZ8VjhXmuB2DgXY70r+Kzkayws9aQWg9t7JPUQ==
X-Google-Smtp-Source: AGHT+IHV5tCZm/5bFnBt8GFOsovkPwMLeAI4LBI+ySEYMdvgE0S4R4x319XFEoHsPLWf3dhe9jFs9WATxzbDKDaMHMk=
X-Received: by 2002:a17:906:ca55:b0:a04:e6d8:dbc with SMTP id
 jx21-20020a170906ca5500b00a04e6d80dbcmr175653ejb.42.1700766823963; Thu, 23
 Nov 2023 11:13:43 -0800 (PST)
MIME-Version: 1.0
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
 <20231123000819.488595-3-adam.duskett@amarulasolutions.com>
 <20231123144454.50fd7944@windsurf>
 <CAHDQB6NSD3y2mwAZocqQ4Z4V6uD7LQaJ6hdp6xqHh7cB6_AYcg@mail.gmail.com>
In-Reply-To: <CAHDQB6NSD3y2mwAZocqQ4Z4V6uD7LQaJ6hdp6xqHh7cB6_AYcg@mail.gmail.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 23 Nov 2023 12:13:32 -0700
Message-ID: <CAHDQB6M3-hgq+Pdyz=fS3G=f4xh_OLJXLEmkfKZpi87qQEEqLg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700766824; x=1701371624;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HixY6/pOiqmtibgb63fPayuu1L6UzpuQHvGGL8Op3Lc=;
 b=fBGIIE0sxmoqORh8wqkMgPcRqhcMMsHDxvzn5mB83ioGx+efTyEGQ7IAhiSSUzBUQR
 4//q/tQwnNZe60R2wQueVBsBT7Ws4uN1Y0pg1ljBlqa78udiJ6XXlXF2Wl58+bAU+21y
 kqU4suRBwi84OfxVk9Haw5SdQ4hRF/zzND4QM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fBGIIE0s
Subject: Re: [Buildroot] [PATCH/next 02/13] package/dmenu-wayland: new
 package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0293402739256589230=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0293402739256589230==
Content-Type: multipart/alternative; boundary="000000000000636f6d060ad6a25b"

--000000000000636f6d060ad6a25b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forgot to mention, does it really matter if I use
ln -sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu vs what is there now? Does it
not achieve the same goal?

Thanks!

Adam Duskett

Senior Embedded Systems Developer

M. +1208-515-8102

adam.duskett@amarulasolutions.com

__________________________________


Amarula Solutions BV

Joop Geesinkweg 125, 1114 AB, Amsterdam, NL

T. +31 (0)85 111 9170
info@amarulasolutions.com

www.amarulasolutions.com



On Thu, Nov 23, 2023 at 12:12=E2=80=AFPM Adam Duskett <
adam.duskett@amarulasolutions.com> wrote:

> Hey Thomas;
>
> lib2 -> glib2
>
> "I think listing the first order dependency is enough." Not sure what you
> mean.
>
> Using the github macro wouldn't work as the release is quite old and lack=
s
> an absurd amount
> of features and fixes.
>
>
> Adam Duskett
>
> Senior Embedded Systems Developer
>
> adam.duskett@amarulasolutions.com
>
> __________________________________
>
>
> Amarula Solutions BV
>
> Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
>
> T. +31 (0)85 111 9170
> info@amarulasolutions.com
>
> www.amarulasolutions.com
>
>
>
> On Thu, Nov 23, 2023 at 6:44=E2=80=AFAM Thomas Petazzoni <
> thomas.petazzoni@bootlin.com> wrote:
>
>> Hello Adam,
>>
>> On Wed, 22 Nov 2023 17:08:08 -0700
>> Adam Duskett <adam.duskett@amarulasolutions.com> wrote:
>>
>> > diff --git a/package/dmenu-wayland/Config.in
>> b/package/dmenu-wayland/Config.in
>> > new file mode 100644
>> > index 0000000000..111bbfb434
>> > --- /dev/null
>> > +++ b/package/dmenu-wayland/Config.in
>> > @@ -0,0 +1,26 @@
>> > +config BR2_PACKAGE_DMENU_WAYLAND
>> > +     bool "dmenu-wayland"
>> > +     depends on BR2_USE_MMU # pango -> lib2
>>
>> lib2 ?
>>
>> > +     depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2, wayland
>> > +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuz
>> > +     depends on !BR2_STATIC_LIBS # wayland -> dlfcn.h
>> > +     depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype support
>> > +     depends on BR2_USE_WCHAR # pango -> glib2
>>
>> I think listing the first order dependency is enough.
>>
>> > +DMENU_WAYLAND_VERSION =3D a380201dff5bfac2dace553d7eaedb6cea6855f9
>> > +DMENU_WAYLAND_SITE =3D https://github.com/nyyManni/dmenu-wayland.git
>> > +DMENU_WAYLAND_SITE_METHOD =3D git
>>
>> Use the github macro?
>>
>> > +DMENU_WAYLAND_LICENSE =3D MIT
>> > +DMENU_WAYLAND_LICENSE_FILES =3D LICENSE
>> > +
>> > +DMENU_WAYLAND_DEPENDENCIES =3D \
>> > +     cairo \
>> > +     libglib2 \
>> > +     libxkbcommon \
>> > +     pango \
>> > +     wayland \
>> > +     wayland-protocols
>> > +
>> > +# By default, sway calls dmenu not dmenu-wl
>> > +define DMENU_WAYLAND_SYMLINK_DMENU_WL
>> > +     cd $(TARGET_DIR)/usr/bin && \
>> > +     ln -sf dmenu-wl dmenu
>>
>> I think:
>>
>>         ln -sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu
>>
>> achieves the same.
>>
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
>>
>

--000000000000636f6d060ad6a25b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Forgot to mention, does it really matter if I use<div>ln -=
sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu vs what is there now? Does it not a=
chieve the same goal?</div><div><br></div><div>Thanks!</div><div><br></div>=
<div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmai=
l_signature"><div dir=3D"ltr"><span><p dir=3D"ltr" style=3D"line-height:1.7=
999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;vertical-align:baseline;white-space:pre-wrap">Adam Duskett</span></p>=
<p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&q=
uot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align=
:baseline;white-space:pre-wrap">Senior Embedded Systems Developer</span></p=
><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&=
quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-alig=
n:baseline;white-space:pre-wrap">M. +1208-515-8102</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;whit=
e-space:pre-wrap"><a href=3D"mailto:adam.duskett@amarulasolutions.com" targ=
et=3D"_blank">adam.duskett@amarulasolutions.com</a></span></p><p dir=3D"ltr=
" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospac=
e;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;whi=
te-space:pre-wrap">__________________________________</span></p><p dir=3D"l=
tr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monosp=
ace;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;w=
hite-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:U=
buntu,sans-serif;color:rgb(0,0,0);background-color:transparent;vertical-ali=
gn:baseline;white-space:pre-wrap">Amarula Solutions BV</span></p><p dir=3D"=
ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monos=
pace;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;=
white-space:pre-wrap">Joop Geesinkweg 125, 1114 AB, Amsterdam, NL</span></p=
><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&=
quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-alig=
n:baseline;white-space:pre-wrap">T. +31 (0)85 111 9170</span><span style=3D=
"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0=
,0);background-color:transparent;vertical-align:baseline;white-space:pre-wr=
ap"><br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&=
quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-alig=
n:baseline;white-space:pre-wrap"><a href=3D"mailto:info@amarulasolutions.co=
m" target=3D"_blank">info@amarulasolutions.com</a></span></p><p dir=3D"ltr"=
 style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt">=
<a href=3D"http://www.amarulasolutions.com/" target=3D"_blank"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;vertical-align:baseline;white-space:pre=
-wrap">www.amarulasolutions.com</span></a></p><div><br></div></span></div><=
/div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Nov 23, 2023 at 12:12=E2=80=AFPM Adam Duskett =
&lt;<a href=3D"mailto:adam.duskett@amarulasolutions.com">adam.duskett@amaru=
lasolutions.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr">Hey Thomas;<div><br></div><div>lib2 -&gt; g=
lib2</div><div><br></div><div>&quot;I think listing the first order depende=
ncy is enough.&quot; Not sure what you mean.<span style=3D"color:rgb(80,0,8=
0)"><br></span></div><div><br></div><div>Using the github macro wouldn&#39;=
t work as the release is quite old and lacks an absurd amount</div><div>of =
features and fixes.</div><div><br></div><div><br clear=3D"all"><div><div di=
r=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><span><p dir=3D"ltr" s=
tyle=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;vertical-align:baseline;white-space:pre-wrap">Adam Duskett</s=
pan></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-botto=
m:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,mo=
nospace;color:rgb(0,0,0);background-color:transparent;vertical-align:baseli=
ne;white-space:pre-wrap">Senior Embedded Systems Developer</span></p><p dir=
=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><a href=
=3D"mailto:adam.duskett@amarulasolutions.com" style=3D"background-color:tra=
nsparent;font-family:&quot;Ubuntu Mono&quot;,monospace;font-size:10pt" targ=
et=3D"_blank">adam.duskett@amarulasolutions.com</a><br></p><p dir=3D"ltr" s=
tyle=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0)=
;background-color:transparent;vertical-align:baseline;white-space:pre-wrap"=
>__________________________________</span></p><p dir=3D"ltr" style=3D"line-=
height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;=
font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-c=
olor:transparent;vertical-align:baseline;white-space:pre-wrap"><br></span><=
span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;vertical-align:baseline;white-space:pre-wrap"=
>Amarula Solutions BV</span></p><p dir=3D"ltr" style=3D"line-height:1.8;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&q=
uot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transpare=
nt;vertical-align:baseline;white-space:pre-wrap">Joop Geesinkweg 125, 1114 =
AB, Amsterdam, NL</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;=
Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;v=
ertical-align:baseline;white-space:pre-wrap">T. +31 (0)85 111 9170</span><s=
pan style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;c=
olor:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-=
space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:&quot;=
Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;v=
ertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:info@amarula=
solutions.com" target=3D"_blank">info@amarulasolutions.com</a></span></p><p=
 dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><a =
href=3D"http://www.amarulasolutions.com/" target=3D"_blank"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;vertical-align:baseline;white-space:pre-wra=
p">www.amarulasolutions.com</span></a></p><div><br></div></span></div></div=
></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, Nov 23, 2023 at 6:44=E2=80=AFAM Thomas Petazzoni &=
lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank">thomas=
.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hello Adam,<br>
<br>
On Wed, 22 Nov 2023 17:08:08 -0700<br>
Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolutions.com" targe=
t=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; diff --git a/package/dmenu-wayland/Config.in b/package/dmenu-wayland/C=
onfig.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..111bbfb434<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/dmenu-wayland/Config.in<br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +config BR2_PACKAGE_DMENU_WAYLAND<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;dmenu-wayland&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # pango -&gt; lib2<br>
<br>
lib2 ?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -&gt;=
 harfbuzz<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # pango -&gt=
; glib2, wayland<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango=
 -&gt; harfbuz<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # wayland -&gt; dlfcn=
.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP # pango -&gt; fr=
eetype support<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # pango -&gt; glib2<br>
<br>
I think listing the first order dependency is enough.<br>
<br>
&gt; +DMENU_WAYLAND_VERSION =3D a380201dff5bfac2dace553d7eaedb6cea6855f9<br=
>
&gt; +DMENU_WAYLAND_SITE =3D <a href=3D"https://github.com/nyyManni/dmenu-w=
ayland.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/nyyMann=
i/dmenu-wayland.git</a><br>
&gt; +DMENU_WAYLAND_SITE_METHOD =3D git<br>
<br>
Use the github macro?<br>
<br>
&gt; +DMENU_WAYLAND_LICENSE =3D MIT<br>
&gt; +DMENU_WAYLAND_LICENSE_FILES =3D LICENSE<br>
&gt; +<br>
&gt; +DMENU_WAYLAND_DEPENDENCIES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cairo \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libglib2 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libxkbcommon \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pango \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0wayland \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0wayland-protocols<br>
&gt; +<br>
&gt; +# By default, sway calls dmenu not dmenu-wl<br>
&gt; +define DMENU_WAYLAND_SYMLINK_DMENU_WL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cd $(TARGET_DIR)/usr/bin &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ln -sf dmenu-wl dmenu<br>
<br>
I think:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu<br>
<br>
achieves the same.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>
</blockquote></div>

--000000000000636f6d060ad6a25b--

--===============0293402739256589230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0293402739256589230==--
