Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D341C072A2
	for <buildroot@archiver.kernel.org>; Sun, 19 Nov 2023 21:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FEDB4010D;
	Sun, 19 Nov 2023 21:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FEDB4010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4303bG02U5gE; Sun, 19 Nov 2023 21:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F3904010F;
	Sun, 19 Nov 2023 21:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F3904010F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E6861BF23C
 for <buildroot@lists.busybox.net>; Sun, 19 Nov 2023 21:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0098360A47
 for <buildroot@lists.busybox.net>; Sun, 19 Nov 2023 21:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0098360A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dFZfxYo08xzK for <buildroot@lists.busybox.net>;
 Sun, 19 Nov 2023 21:08:37 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 893F760784
 for <buildroot@buildroot.org>; Sun, 19 Nov 2023 21:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 893F760784
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9d0b4dfd60dso490685366b.1
 for <buildroot@buildroot.org>; Sun, 19 Nov 2023 13:08:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700428115; x=1701032915;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WzZTCf5ziphK+F5xiV3N2rrcEIr3My6nXxEi0r3y570=;
 b=fKRBR2Dq8kXXsGDl7gHnnr+hkOOay1s2cMk0ahbYVQTEZkxTqKPlz2MwV94iB/VG2p
 hCq1zBUlGoaj/aHfG9VOdwPpuMMZ3z9QdUl3Sl5JBhWJMJSa4MAMFtCfXMH0o1f9U9Yp
 uU7KQv6OIy34NSbJ6+acl6op7Yp5BMDSHc3CYFlZwmL6XArZVgngUNnwW21Zl44rSE1m
 im3r/EZqU5vdmUs3jcBZl19Mn2UknTY3nM1n2xpjdMHk8r4GuTZpIHYGQgpPfVb7rEm9
 Mx7q5F/q8FGsr5mENaHRRpWACSYN+zIV+q2ftAeBdQnidoCXNFUXPYHj/KZln1GiLoqo
 ETJw==
X-Gm-Message-State: AOJu0YyUEbLdAmVGOfBei+jO992MjLw7wPuwQKqq3W/DjKxhggJJDcMD
 u2gZdIu5LguJG4MrbrAtaO8yh8Z8Nu4+HuAjMgdxm3aUfgNJMaPc8j8otw==
X-Google-Smtp-Source: AGHT+IHjN4TOMlFcYDI2G+vTX2QfAvM0doIPhqic9/KJWaiSwsz6MePEM78yCidAIzqd/l7l1KcAVN09VUY9y7wF9SI=
X-Received: by 2002:a17:907:d311:b0:9ae:4776:5a3a with SMTP id
 vg17-20020a170907d31100b009ae47765a3amr5348432ejc.39.1700428115098; Sun, 19
 Nov 2023 13:08:35 -0800 (PST)
MIME-Version: 1.0
References: <20231118221206.1369389-1-adam.duskett@amarulasolutions.com>
 <20231118221206.1369389-5-adam.duskett@amarulasolutions.com>
 <75d4ac75-ee6a-4a5b-af29-7eee2fa11580@mind.be>
In-Reply-To: <75d4ac75-ee6a-4a5b-af29-7eee2fa11580@mind.be>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Sun, 19 Nov 2023 14:08:23 -0700
Message-ID: <CAHDQB6MoBM+TJj3ysJD9VVDCV4pErHQP=Gbf5xw8aQfjnPRMTw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700428115; x=1701032915;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WzZTCf5ziphK+F5xiV3N2rrcEIr3My6nXxEi0r3y570=;
 b=cBaF2s2PTc6zXzNtFcLPzc1n5KkzFFZl4+lvB99qonn/1oUmDbaW24mo7iu0Dr40YM
 I4pBYnVFQn8fZrYbej2GXpRiNiiSCkSkQkRAf9zVXM6xVDwm34hid1qvaHYjdfD+8Scm
 4gKs+hHGDDOnm1yLTDfHDDuWMSvXMt1iWJrMA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cBaF2s2P
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
Content-Type: multipart/mixed; boundary="===============3374575632532090792=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3374575632532090792==
Content-Type: multipart/alternative; boundary="000000000000c45327060a87c528"

--000000000000c45327060a87c528
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll change the patch to set a default to $(DL_DIR)/br-flutter-pub-cache.
That seems reasonable and a small change.

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



On Sun, Nov 19, 2023 at 1:43=E2=80=AFPM Arnout Vandecappelle <arnout@mind.b=
e> wrote:

>
>
> On 18/11/2023 23:12, Adam Duskett wrote:
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
> >
> > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> > ---
> >   package/flutter-sdk-bin/Config.in.host     | 11 +++++++++++
> >   package/flutter-sdk-bin/flutter-sdk-bin.mk |  2 +-
> >   2 files changed, 12 insertions(+), 1 deletion(-)
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
> >   $(eval $(host-generic-package))
> >
> >   # For target packages to locate said pub-cache
> > -FLUTTER_SDK_BIN_PUB_CACHE =3D $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
> > +FLUTTER_SDK_BIN_PUB_CACHE =3D $(call
> qstrip,$(BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION))
>
>   What about this code?
>
> # Remove the cache, as we will run precache after setting up flutter and
> dart
> # with the new config options.
> define HOST_FLUTTER_SDK_BIN_BUILD_CMDS
>          mkdir -p $(HOST_FLUTTER_SDK_BIN_SDK)
>          rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
>          cd $(@D) && \
>                  $(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter precache;
> endef
>
>
>   Either this code is needed and the idea of a shared cache is void, and
> it
> really shouldn't be in DL_DIR at all. Or it is not needed and it should b=
e
> removed, with an explanation about why this "setting up flutter and dart
> with
> the new config optoins" doesn't actually apply.
>
>   Regards,
>   Arnout
>

--000000000000c45327060a87c528
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ll change the patch to set a default to $(DL_DIR)/br=
-flutter-pub-cache.<div>That seems reasonable and a small change.<br><div><=
br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr"><span><p dir=3D"ltr" style=3D"lin=
e-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;vertical-align:baseline;white-space:pre-wrap">Adam Dusk=
ett</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot=
;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;=
vertical-align:baseline;white-space:pre-wrap">Senior Embedded Systems Devel=
oper</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quo=
t;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent=
;vertical-align:baseline;white-space:pre-wrap">M. +1208-515-8102</span></p>=
<p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&q=
uot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align=
:baseline;white-space:pre-wrap"><a href=3D"mailto:adam.duskett@amarulasolut=
ions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a></span></p=
><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&=
quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-alig=
n:baseline;white-space:pre-wrap">__________________________________</span><=
/p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mon=
o&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-al=
ign:baseline;white-space:pre-wrap"><br></span><span style=3D"font-size:10pt=
;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;vertical-align:baseline;white-space:pre-wrap">Amarula Solutions BV</span>=
</p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mo=
no&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-a=
lign:baseline;white-space:pre-wrap">Joop Geesinkweg 125, 1114 AB, Amsterdam=
, NL</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quo=
t;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent=
;vertical-align:baseline;white-space:pre-wrap">T. +31 (0)85 111 9170</span>=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;whit=
e-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:&quo=
t;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent=
;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:info@amaru=
lasolutions.com" target=3D"_blank">info@amarulasolutions.com</a></span></p>=
<p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margi=
n-bottom:0pt"><a href=3D"http://www.amarulasolutions.com/" target=3D"_blank=
"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospa=
ce;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;wh=
ite-space:pre-wrap">www.amarulasolutions.com</span></a></p><div><br></div><=
/span></div></div></div><br></div></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 19, 2023 at 1:43=E2=80=
=AFPM Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@min=
d.be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
<br>
On 18/11/2023 23:12, Adam Duskett wrote:<br>
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
&gt; <br>
&gt; Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarula=
solutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<=
br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/flutter-sdk-bin/Config.in.host=C2=A0 =C2=A0 =C2=A0=
| 11 +++++++++++<br>
&gt;=C2=A0 =C2=A0package/flutter-sdk-bin/<a href=3D"http://flutter-sdk-bin.=
mk" rel=3D"noreferrer" target=3D"_blank">flutter-sdk-bin.mk</a> |=C2=A0 2 +=
-<br>
&gt;=C2=A0 =C2=A02 files changed, 12 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/package/flutter-sdk-bin/Config.in.host b/package/flutter-=
sdk-bin/Config.in.host<br>
&gt; index a48714ea7f..0e31a8e0fa 100644<br>
&gt; --- a/package/flutter-sdk-bin/Config.in.host<br>
&gt; +++ b/package/flutter-sdk-bin/Config.in.host<br>
&gt; @@ -14,3 +14,14 @@ config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free and open source.<br>
&gt;=C2=A0 =C2=A0<br>
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
&gt;=C2=A0 =C2=A0$(eval $(host-generic-package))<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# For target packages to locate said pub-cache<br>
&gt; -FLUTTER_SDK_BIN_PUB_CACHE =3D $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache<=
br>
&gt; +FLUTTER_SDK_BIN_PUB_CACHE =3D $(call qstrip,$(BR2_PACKAGE_HOST_FLUTTE=
R_SDK_BIN_PUB_CACHE_LOCATION))<br>
<br>
=C2=A0 What about this code?<br>
<br>
# Remove the cache, as we will run precache after setting up flutter and da=
rt<br>
# with the new config options.<br>
define HOST_FLUTTER_SDK_BIN_BUILD_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(HOST_FLUTTER_SDK_BIN_SDK)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-c=
ache<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd $(@D) &amp;&amp; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(HOST_FLUTTE=
R_SDK_BIN_ENV) $(@D)/bin/flutter precache;<br>
endef<br>
<br>
<br>
=C2=A0 Either this code is needed and the idea of a shared cache is void, a=
nd it <br>
really shouldn&#39;t be in DL_DIR at all. Or it is not needed and it should=
 be <br>
removed, with an explanation about why this &quot;setting up flutter and da=
rt with <br>
the new config optoins&quot; doesn&#39;t actually apply.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
</blockquote></div>

--000000000000c45327060a87c528--

--===============3374575632532090792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3374575632532090792==--
