Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8B9C61D85
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 19:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4453B82123;
	Thu, 23 Nov 2023 19:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4453B82123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8MJQcglODGH; Thu, 23 Nov 2023 19:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A93C82125;
	Thu, 23 Nov 2023 19:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A93C82125
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B71501BF28B
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 19:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F97060E2D
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 19:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F97060E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1W_syopBXEzG for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 19:13:06 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E85E60AF2
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 19:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E85E60AF2
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5488bf9e193so1603131a12.2
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 11:13:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700766784; x=1701371584;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=78sZVRnNOauJqTnYo9bYwNH0V9ScfpEhfiV5DkHnm9M=;
 b=NDkh8VgISbiCPg0AXfm26TbMDOn+mxenwLYHUU8T01RJ1mC9EHeLb7S/3vaZVdLP4V
 F6lz+Uc8a8vEWOKdvlsQzepzqwnxb41zhyCCaaoPd6DUTsl794qLw5Z8K8B0YRjoTA9E
 coiTtVypHPOTqiCYasmUi/hp6n6IjRf9IeMIFKFJFEPlmXs5VHK89wSZo03xbaCLy2SB
 8Wrt++rqSLEZfUO0+zeGYlwvXPEXxQcxXSsBUzfBLqwPBckSbcpIXH/CbckrLVwIy0PK
 vEc5pmT3zWIDj4Ae4kdAwLP1kG+9YBC4fCelaFkfQAR/2eRZz7F+qF7RCZ9EomyFHTJc
 BwPw==
X-Gm-Message-State: AOJu0YzSiI+z3fDYB/9wW+rP5RyO2/Jqqpr/W90FNYTgGTZYTOZ7sele
 1/2ATFGRn04zvacZrQsbdlEgSQd3ZTaeocB9cnd2Pg==
X-Google-Smtp-Source: AGHT+IG7UdAsloMWW28qXdTTaoO7vAYk7+T5y0p+rZf7W4KbXjmV68DVOSs3j3zir4np8NqT/ETjJ4/YbeRDqhCnYZs=
X-Received: by 2002:a17:906:240d:b0:9fc:32f9:170c with SMTP id
 z13-20020a170906240d00b009fc32f9170cmr159499eja.63.1700766784086; Thu, 23 Nov
 2023 11:13:04 -0800 (PST)
MIME-Version: 1.0
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
 <20231123000819.488595-3-adam.duskett@amarulasolutions.com>
 <20231123144454.50fd7944@windsurf>
In-Reply-To: <20231123144454.50fd7944@windsurf>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 23 Nov 2023 12:12:52 -0700
Message-ID: <CAHDQB6NSD3y2mwAZocqQ4Z4V6uD7LQaJ6hdp6xqHh7cB6_AYcg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700766784; x=1701371584;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=78sZVRnNOauJqTnYo9bYwNH0V9ScfpEhfiV5DkHnm9M=;
 b=JKPkm0ksjHY8m0Q5s212Xdc5piddd3jdxZJz58Qs6g3RbZD383oDw7dQOUn0btTXyi
 OhSxMJxEEH5ckq7QqQCHjrdy1SiXzjY0LfVOOtsNlhBoLDIjeTGK2HGPHV2ZJ2lHPbZE
 HJIl+ksdiRERZSvu0b2Vt/qXPpT0IFDHq/FMM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JKPkm0ks
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
Content-Type: multipart/mixed; boundary="===============9120458903968103907=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9120458903968103907==
Content-Type: multipart/alternative; boundary="00000000000002f7e1060ad6a0e5"

--00000000000002f7e1060ad6a0e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Thomas;

lib2 -> glib2

"I think listing the first order dependency is enough." Not sure what you
mean.

Using the github macro wouldn't work as the release is quite old and lacks
an absurd amount
of features and fixes.


Adam Duskett

Senior Embedded Systems Developer

adam.duskett@amarulasolutions.com

__________________________________


Amarula Solutions BV

Joop Geesinkweg 125, 1114 AB, Amsterdam, NL

T. +31 (0)85 111 9170
info@amarulasolutions.com

www.amarulasolutions.com



On Thu, Nov 23, 2023 at 6:44=E2=80=AFAM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Adam,
>
> On Wed, 22 Nov 2023 17:08:08 -0700
> Adam Duskett <adam.duskett@amarulasolutions.com> wrote:
>
> > diff --git a/package/dmenu-wayland/Config.in
> b/package/dmenu-wayland/Config.in
> > new file mode 100644
> > index 0000000000..111bbfb434
> > --- /dev/null
> > +++ b/package/dmenu-wayland/Config.in
> > @@ -0,0 +1,26 @@
> > +config BR2_PACKAGE_DMENU_WAYLAND
> > +     bool "dmenu-wayland"
> > +     depends on BR2_USE_MMU # pango -> lib2
>
> lib2 ?
>
> > +     depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2, wayland
> > +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuz
> > +     depends on !BR2_STATIC_LIBS # wayland -> dlfcn.h
> > +     depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype support
> > +     depends on BR2_USE_WCHAR # pango -> glib2
>
> I think listing the first order dependency is enough.
>
> > +DMENU_WAYLAND_VERSION =3D a380201dff5bfac2dace553d7eaedb6cea6855f9
> > +DMENU_WAYLAND_SITE =3D https://github.com/nyyManni/dmenu-wayland.git
> > +DMENU_WAYLAND_SITE_METHOD =3D git
>
> Use the github macro?
>
> > +DMENU_WAYLAND_LICENSE =3D MIT
> > +DMENU_WAYLAND_LICENSE_FILES =3D LICENSE
> > +
> > +DMENU_WAYLAND_DEPENDENCIES =3D \
> > +     cairo \
> > +     libglib2 \
> > +     libxkbcommon \
> > +     pango \
> > +     wayland \
> > +     wayland-protocols
> > +
> > +# By default, sway calls dmenu not dmenu-wl
> > +define DMENU_WAYLAND_SYMLINK_DMENU_WL
> > +     cd $(TARGET_DIR)/usr/bin && \
> > +     ln -sf dmenu-wl dmenu
>
> I think:
>
>         ln -sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu
>
> achieves the same.
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000002f7e1060ad6a0e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Thomas;<div><br></div><div>lib2 -&gt; glib2</div><div>=
<br></div><div>&quot;I think listing the first order dependency is enough.&=
quot; Not sure what you mean.<span class=3D"gmail-im" style=3D"color:rgb(80=
,0,80)"><br></span></div><div><br></div><div>Using the github macro wouldn&=
#39;t work as the release is quite old and lacks an absurd amount</div><div=
>of features and fixes.</div><div><br></div><div><br clear=3D"all"><div><di=
v dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=
<div dir=3D"ltr"><span><p dir=3D"ltr" style=3D"line-height:1.79999999999999=
98;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-fam=
ily:Ubuntu,sans-serif;color:rgb(0,0,0);background-color:transparent;vertica=
l-align:baseline;white-space:pre-wrap">Adam Duskett</span></p><p dir=3D"ltr=
" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospac=
e;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;whi=
te-space:pre-wrap">Senior Embedded Systems Developer</span></p><p dir=3D"lt=
r" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt=
"><a href=3D"mailto:adam.duskett@amarulasolutions.com" target=3D"_blank" st=
yle=3D"background-color:transparent;font-family:&quot;Ubuntu Mono&quot;,mon=
ospace;font-size:10pt">adam.duskett@amarulasolutions.com</a><br></p><p dir=
=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,m=
onospace;color:rgb(0,0,0);background-color:transparent;vertical-align:basel=
ine;white-space:pre-wrap">__________________________________</span></p><p d=
ir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;=
,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:bas=
eline;white-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-f=
amily:Ubuntu,sans-serif;color:rgb(0,0,0);background-color:transparent;verti=
cal-align:baseline;white-space:pre-wrap">Amarula Solutions BV</span></p><p =
dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:ba=
seline;white-space:pre-wrap">Joop Geesinkweg 125, 1114 AB, Amsterdam, NL</s=
pan></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubunt=
u Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertic=
al-align:baseline;white-space:pre-wrap">T. +31 (0)85 111 9170</span><span s=
tyle=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:=
rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-space=
:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:&quot;Ubunt=
u Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertic=
al-align:baseline;white-space:pre-wrap"><a href=3D"mailto:info@amarulasolut=
ions.com" target=3D"_blank">info@amarulasolutions.com</a></span></p><p dir=
=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bott=
om:0pt"><a href=3D"http://www.amarulasolutions.com/" target=3D"_blank"><spa=
n style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;col=
or:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-sp=
ace:pre-wrap">www.amarulasolutions.com</span></a></p><div><br></div></span>=
</div></div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Nov 23, 2023 at 6:44=E2=80=AFAM Thoma=
s Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.peta=
zzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hello Adam,<br>
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

--00000000000002f7e1060ad6a0e5--

--===============9120458903968103907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9120458903968103907==--
