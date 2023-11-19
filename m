Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A737C54E76
	for <buildroot@archiver.kernel.org>; Sun, 19 Nov 2023 17:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C00B760A5B;
	Sun, 19 Nov 2023 17:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C00B760A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XMrWtCsG2J-b; Sun, 19 Nov 2023 17:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E4E960AB1;
	Sun, 19 Nov 2023 17:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E4E960AB1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 255E21BF239
 for <buildroot@lists.busybox.net>; Sun, 19 Nov 2023 17:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07BEC41755
 for <buildroot@lists.busybox.net>; Sun, 19 Nov 2023 17:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07BEC41755
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-xc2M7hY9sR for <buildroot@lists.busybox.net>;
 Sun, 19 Nov 2023 17:47:19 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4611841754
 for <buildroot@buildroot.org>; Sun, 19 Nov 2023 17:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4611841754
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9e623356d5dso495419366b.3
 for <buildroot@buildroot.org>; Sun, 19 Nov 2023 09:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700416037; x=1701020837;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=babnxdOU+YYkMY+mRDu8Jpgzf8NKnMYmNxS5ruUDF9g=;
 b=h7qlP2m/OzoViW2L8PktlTsu8PPvAwOyGCAWFo1vwQUhc4v5JPK+5fRKhepStFZ7VV
 QAb4V16xjdSxzifWPzoTo06PtFNl+Epx3n2Q5kC7W4F5jMrzY/if1mYD2tfhN5KgoJbS
 gLsAvSe9j8nFMiXhZw87j8Sr3IK6cylV0jGNacCbMICNDigM0ZGBSATKmUokIpA5U7fZ
 SD+0/1m1FD/JwUNGHSlSMIvytRxGyb1OucTNad9FVRsYUjQHCFHBhAnGO3zzBZqtQNo3
 vJEXU3dXGGQ+QInCk2Kn0ja9M6rg3kZI+8p+kjsykf5atlxCYiAd2YU7WUrYMCCTsBOP
 BJtw==
X-Gm-Message-State: AOJu0YzX8hOAFPAJat02E6jTaStkq1+Q//c2oCJD0yYjROU9Abfrg68d
 JClRrSIuWxXmkfLwdIPgcp4v7uqwxCpWTMdTlpSnsQ==
X-Google-Smtp-Source: AGHT+IH9MdKHI1vwp5nRfMJH6bbwHDuSUeBeUMoFt9rtIJ8b7n5hSYZ7WyHXmXKK3xS+f3mA043a3utP+DqSwpP5QJI=
X-Received: by 2002:a17:906:2295:b0:9e0:2319:16d4 with SMTP id
 p21-20020a170906229500b009e0231916d4mr4016378eja.40.1700416036896; Sun, 19
 Nov 2023 09:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20231118221206.1369389-1-adam.duskett@amarulasolutions.com>
 <20231118221206.1369389-5-adam.duskett@amarulasolutions.com>
 <20231119082120.GM996011@scaer>
In-Reply-To: <20231119082120.GM996011@scaer>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Sun, 19 Nov 2023 10:47:05 -0700
Message-ID: <CAHDQB6OGJb-HzXTUBosu4dzb=pnkUiJ0RU=xE3PF0eWCqVa2yg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700416037; x=1701020837;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=babnxdOU+YYkMY+mRDu8Jpgzf8NKnMYmNxS5ruUDF9g=;
 b=JWoLXHyiTS3bLiJV6fBbCy+mHiWDhQ1kXA/BIquq+mU+wwS0wBDAcghrm3x+wUGXz2
 ofUTcC4bGlBtn5cZwtfpVuVC6UOudIXpMGWjkKc221fM5r4OJ+5So0Wx3FQmjm/Tvc/4
 P3Om1fJWy+3CEs2jn2tNIEAi7uPVRDtgnWHWs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JWoLXHyi
Subject: Re: [Buildroot] [PATCH/next v2 5/9]
 package/flutter-sdk-bin/Config.in.host: add pub-cache location option
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
Content-Type: multipart/mixed; boundary="===============1739609311190378455=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1739609311190378455==
Content-Type: multipart/alternative; boundary="000000000000d994dd060a84f5e0"

--000000000000d994dd060a84f5e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This one we should discuss.

While it's reasonable to set a default to either dl/flutter-pub-cache or
dl/pub-cache (your choice obviously!),
we should still have this as a configurable string.

1) The work is already done, and most users won't change the default.
2) When developing an application, the pub-cache directory may be somewhere
more convenient for the developer.
     Maybe they want to use ~/.pub-cache, or in my case
/home/adam/projects/${company}/${project}/pub-cache

This allows users to not have to re-download the pub-cache if it already
exists on their system.
As Thomas seems interested in Flutter, I'll also bring him in for his
thoughts.

Thanks so much for the quick response!

Adam Duskett

Senior Embedded Systems Developer

adam.duskett@amarulasolutions.com

__________________________________


Amarula Solutions BV

Joop Geesinkweg 125, 1114 AB, Amsterdam, NL

T. +31 (0)85 111 9170
info@amarulasolutions.com

www.amarulasolutions.com



On Sun, Nov 19, 2023 at 1:21=E2=80=AFAM Yann E. MORIN <yann.morin.1998@free=
.fr>
wrote:

> On 2023-11-18 15:12 -0700, Adam Duskett spake thusly:
> > When running the command "flutter pub get," the plugins are stored in t=
he
> > pub-cache directory along with their sha256sum hashes. The default
> location
> > of the pub-cache directory is $(HOST_DIR)/share/flutter/sdk/.pub-cache.
> > While the above location is a perfectly acceptable choice by default,
> users
> > may want to define an alternate location to prevent downloading all of
> the
> > plugins on each fresh build of a Flutter application, and they may want
> to
> > commit the pub-cache directory to their project.
> >
> > Add the new option BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION
> to the
> > flutter-sdk-bin/Config.in.host file, and set the default to the current
> > default of $(HOST_DIR)/share/flutter/sdk/.pub-cache.
>
> So, this is for caching the downloaded artefacts. It should probably be
> non-configurable, and should be moved into a sub-directory iof
> BR2_DL_DIR, like we have for cargo:
>
>     8450b7691870 package/pkg-cargo: move CARGO_HOME into DL_DIR
>
> So I would suggest that we do similar for the flutter download cache.
>
> As for wanted to commit that downladed stuff to git: if people want
> that, then they would also want to commit all ofthe download stuff, so
> just have them point BR2_DL_DIR to a sub-dir of their outter repository.
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> > ---
> >  package/flutter-sdk-bin/Config.in.host     | 11 +++++++++++
> >  package/flutter-sdk-bin/flutter-sdk-bin.mk |  2 +-
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/flutter-sdk-bin/Config.in.host
> b/package/flutter-sdk-bin/Config.in.host
> > index a48714ea7f..0e31a8e0fa 100644
> > --- a/package/flutter-sdk-bin/Config.in.host
> > +++ b/package/flutter-sdk-bin/Config.in.host
> > @@ -14,3 +14,14 @@ config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
> >         free and open source.
> >
> >         https://flutter.dev/
> > +
> > +if BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
> > +
> > +config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION
> > +     string "pub-cache location"
> > +     default "$(HOST_DIR)/share/flutter/sdk/.pub-cache"
> > +     help
> > +       Directory to store cached packages used by Pub with
> > +       Dart/Flutter.
> > +
> > +endif
> > diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk
> b/package/flutter-sdk-bin/flutter-sdk-bin.mk
> > index 9461148dfb..6471c11d4e 100644
> > --- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
> > +++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
> > @@ -95,4 +95,4 @@ HOST_FLUTTER_SDK_BIN_DART_BIN =3D \
> >  $(eval $(host-generic-package))
> >
> >  # For target packages to locate said pub-cache
> > -FLUTTER_SDK_BIN_PUB_CACHE =3D $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
> > +FLUTTER_SDK_BIN_PUB_CACHE =3D $(call
> qstrip,$(BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION))
> > --
> > 2.42.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>

--000000000000d994dd060a84f5e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This one we should discuss.<div><br></div><div>While it&#3=
9;s reasonable to set a default=C2=A0to either dl/flutter-pub-cache or dl/p=
ub-cache (your choice obviously!),</div><div>we should still have this as a=
 configurable string.</div><div><br></div><div>1) The work is already done,=
 and most users won&#39;t change the default.</div><div>2) When developing =
an application, the pub-cache directory may be somewhere more convenient=C2=
=A0for the developer.</div><div>=C2=A0 =C2=A0 =C2=A0Maybe they want to use =
~/.pub-cache, or in my case /home/adam/projects/${company}/${project}/pub-c=
ache</div><div><br></div><div>This allows users to not have to re-download =
the pub-cache if it already exists on their system.=C2=A0</div><div>As Thom=
as seems interested in Flutter, I&#39;ll also bring him in for his thoughts=
.</div><div><br></div><div>Thanks so much for the quick response!</div><div=
><br></div><div><span style=3D"background-color:transparent;color:rgb(0,0,0=
);font-family:Ubuntu,sans-serif;font-size:10pt">Adam Duskett</span><br></di=
v><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gm=
ail_signature"><div dir=3D"ltr"><span><p dir=3D"ltr" style=3D"line-height:1=
.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);backg=
round-color:transparent;vertical-align:baseline;white-space:pre-wrap">Senio=
r Embedded Systems Developer</span></p><p dir=3D"ltr" style=3D"line-height:=
1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><a href=3D"mailto:adam=
.duskett@amarulasolutions.com" target=3D"_blank" style=3D"background-color:=
transparent;font-family:&quot;Ubuntu Mono&quot;,monospace;font-size:10pt">a=
dam.duskett@amarulasolutions.com</a><br></p><p dir=3D"ltr" style=3D"line-he=
ight:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0)=
;background-color:transparent;vertical-align:baseline;white-space:pre-wrap"=
>__________________________________</span></p><p dir=3D"ltr" style=3D"line-=
height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;vertical-align:baseline;white-space:pre-wra=
p"><br></span><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-=
space:pre-wrap">Amarula Solutions BV</span></p><p dir=3D"ltr" style=3D"line=
-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0=
,0);background-color:transparent;vertical-align:baseline;white-space:pre-wr=
ap">Joop Geesinkweg 125, 1114 AB, Amsterdam, NL</span></p><p dir=3D"ltr" st=
yle=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;co=
lor:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-s=
pace:pre-wrap">T. +31 (0)85 111 9170</span><span style=3D"font-size:10pt;fo=
nt-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-col=
or:transparent;vertical-align:baseline;white-space:pre-wrap"><br></span><sp=
an style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;co=
lor:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-s=
pace:pre-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blan=
k">info@amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-hei=
ght:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><a href=3D"http://=
www.amarulasolutions.com/" target=3D"_blank"><span style=3D"font-size:10pt;=
font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-c=
olor:transparent;vertical-align:baseline;white-space:pre-wrap">www.amarulas=
olutions.com</span></a></p><div><br></div></span></div></div></div><br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sun, Nov 19, 2023 at 1:21=E2=80=AFAM Yann E. MORIN &lt;<a href=3D"mail=
to:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On 2023-11-18 15:12 -070=
0, Adam Duskett spake thusly:<br>
&gt; When running the command &quot;flutter pub get,&quot; the plugins are =
stored in the<br>
&gt; pub-cache directory along with their sha256sum hashes. The default loc=
ation<br>
&gt; of the pub-cache directory is $(HOST_DIR)/share/flutter/sdk/.pub-cache=
.<br>
&gt; While the above location is a perfectly acceptable choice by default, =
users<br>
&gt; may want to define an alternate location to prevent downloading all of=
 the<br>
&gt; plugins on each fresh build of a Flutter application, and they may wan=
t to<br>
&gt; commit the pub-cache directory to their project.<br>
&gt; <br>
&gt; Add the new option BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION=
 to the<br>
&gt; flutter-sdk-bin/Config.in.host file, and set the default to the curren=
t<br>
&gt; default of $(HOST_DIR)/share/flutter/sdk/.pub-cache.<br>
<br>
So, this is for caching the downloaded artefacts. It should probably be<br>
non-configurable, and should be moved into a sub-directory iof<br>
BR2_DL_DIR, like we have for cargo:<br>
<br>
=C2=A0 =C2=A0 8450b7691870 package/pkg-cargo: move CARGO_HOME into DL_DIR<b=
r>
<br>
So I would suggest that we do similar for the flutter download cache.<br>
<br>
As for wanted to commit that downladed stuff to git: if people want<br>
that, then they would also want to commit all ofthe download stuff, so<br>
just have them point BR2_DL_DIR to a sub-dir of their outter repository.<br=
>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarula=
solutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<=
br>
&gt; ---<br>
&gt;=C2=A0 package/flutter-sdk-bin/Config.in.host=C2=A0 =C2=A0 =C2=A0| 11 +=
++++++++++<br>
&gt;=C2=A0 package/flutter-sdk-bin/<a href=3D"http://flutter-sdk-bin.mk" re=
l=3D"noreferrer" target=3D"_blank">flutter-sdk-bin.mk</a> |=C2=A0 2 +-<br>
&gt;=C2=A0 2 files changed, 12 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/package/flutter-sdk-bin/Config.in.host b/package/flutter-=
sdk-bin/Config.in.host<br>
&gt; index a48714ea7f..0e31a8e0fa 100644<br>
&gt; --- a/package/flutter-sdk-bin/Config.in.host<br>
&gt; +++ b/package/flutter-sdk-bin/Config.in.host<br>
&gt; @@ -14,3 +14,14 @@ config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free and open source.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://flutter.dev/" rel=
=3D"noreferrer" target=3D"_blank">https://flutter.dev/</a><br>
&gt; +<br>
&gt; +if BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS<br>
&gt; +<br>
&gt; +config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION<br>
&gt; +=C2=A0 =C2=A0 =C2=A0string &quot;pub-cache location&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default &quot;$(HOST_DIR)/share/flutter/sdk/.pub-=
cache&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Directory to store cached packages used by=
 Pub with<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Dart/Flutter.<br>
&gt; +<br>
&gt; +endif<br>
&gt; diff --git a/package/flutter-sdk-bin/<a href=3D"http://flutter-sdk-bin=
.mk" rel=3D"noreferrer" target=3D"_blank">flutter-sdk-bin.mk</a> b/package/=
flutter-sdk-bin/<a href=3D"http://flutter-sdk-bin.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">flutter-sdk-bin.mk</a><br>
&gt; index 9461148dfb..6471c11d4e 100644<br>
&gt; --- a/package/flutter-sdk-bin/<a href=3D"http://flutter-sdk-bin.mk" re=
l=3D"noreferrer" target=3D"_blank">flutter-sdk-bin.mk</a><br>
&gt; +++ b/package/flutter-sdk-bin/<a href=3D"http://flutter-sdk-bin.mk" re=
l=3D"noreferrer" target=3D"_blank">flutter-sdk-bin.mk</a><br>
&gt; @@ -95,4 +95,4 @@ HOST_FLUTTER_SDK_BIN_DART_BIN =3D \<br>
&gt;=C2=A0 $(eval $(host-generic-package))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # For target packages to locate said pub-cache<br>
&gt; -FLUTTER_SDK_BIN_PUB_CACHE =3D $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache<=
br>
&gt; +FLUTTER_SDK_BIN_PUB_CACHE =3D $(call qstrip,$(BR2_PACKAGE_HOST_FLUTTE=
R_SDK_BIN_PUB_CACHE_LOCATION))<br>
&gt; -- <br>
&gt; 2.42.0<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>

--000000000000d994dd060a84f5e0--

--===============1739609311190378455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1739609311190378455==--
