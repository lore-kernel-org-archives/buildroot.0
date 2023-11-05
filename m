Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE434C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 17:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AEB74013F;
	Sun,  5 Nov 2023 17:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AEB74013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id emZ37LR1n2UV; Sun,  5 Nov 2023 17:07:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4194401E1;
	Sun,  5 Nov 2023 17:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4194401E1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B4091BF45A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 17:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1389B61027
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 17:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1389B61027
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UJhyGOqK6yIY for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 17:07:30 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DA0161025
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 17:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DA0161025
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9d8d3b65a67so534327766b.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 09:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699204048; x=1699808848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4eTHRHZ55qo907DG6w52l2+iUXDE7roajx/VkPsOO54=;
 b=Sx6gkL3Uec53UNrfQUBnnX0h3lSUy4+RZ4SR1Tv8ixBdoTlcsisWS+rrwljaokbmB6
 SQvfxcGj973m2A9Rp13OpltzUdvJa9rF+dLDWza83co5/jl5/eu73M23NYO13m+XEjG8
 KPkbLOA1uwotObWyL9JJIEdgILJmyokWEGo8bS56ER+9zoqo4sWOs7T+oeULXzMqPwx4
 +yLEWyfeWmzTu8iH80uEflPUFbewU8mvpirUfxVA1Ob2B1ZPRI1MIuws+PKUJeptFQoW
 JNwzLRU7bxcZOnssjZytlG4a99R18WkOr/pFjczzCu6BXdtq0MCBk3ypQLC73TqPhsvG
 JbsA==
X-Gm-Message-State: AOJu0YznE3HWiAVWJ5vfJ29lQxc+rlgNWtoDBd52uRfhIWxJ4tVSUU9/
 w9nzeVvrMENZ6Y/sBKM1KIAMcUblz6GKOxeHbGNvTWLn17uNVWs42IE=
X-Google-Smtp-Source: AGHT+IHgiOUmUjREnFNf4ZoSeyMO7W68KixBoV3OepeAqv+ho2D2n5pcjsrGb3MRgmwnjPHKD41YTjk6HHGqim/XOtI=
X-Received: by 2002:a17:907:c003:b0:9df:867f:f74c with SMTP id
 ss3-20020a170907c00300b009df867ff74cmr2103580ejc.65.1699204047777; Sun, 05
 Nov 2023 09:07:27 -0800 (PST)
MIME-Version: 1.0
References: <20231103182745.903344-1-adam.duskett@amarulasolutions.com>
 <20231103213125.GB2875@scaer>
In-Reply-To: <20231103213125.GB2875@scaer>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Sun, 5 Nov 2023 10:07:17 -0700
Message-ID: <CAHDQB6OVYYoG+y7JjcUFs5js_Kqe48z69BskS8MOCV62kpc4LQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699204048; x=1699808848;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4eTHRHZ55qo907DG6w52l2+iUXDE7roajx/VkPsOO54=;
 b=QubEcDMTPOkLJArlSEn+ujZLrIMs+0B2qPh0DBsr7ONOXZwH8v2o2c8hHVvT3Ds4Z6
 dk1xvC5zURA4n2CJd6S2sFd8uCGIfX8Lw7hQqV5385saNyUzxSWLuJNyXwQ3gjrd43zu
 N5aOn3J4/YlKUfrWUlk7qRf2Vu7K6t9ErC1mk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=QubEcDMT
Subject: Re: [Buildroot] [PATCH 0/3] Add tainting support
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8550149758472196923=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8550149758472196923==
Content-Type: multipart/alternative; boundary="000000000000ab45e506096ac52c"

--000000000000ab45e506096ac52c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, but to your original points
https://patchwork.ozlabs.org/project/buildroot/list/?series=3D64340, this i=
s
not
an acceptable solution to put  "NODEJS_SRC_LICENSE +=3D , vendored
dependencies licenses probably not listed"

in the makefile, because there are several valid instances where you may be
able to guarantee the integrity of

the licenses and provide hashsums for each of them. Hence, the ability to
disable the taint check.


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



On Fri, Nov 3, 2023 at 3:31=E2=80=AFPM Yann E. MORIN <yann.morin.1998@free.=
fr>
wrote:

> Adam, All,
>
> On 2023-11-03 12:27 -0600, Adam Duskett spake thusly:
> > Originally taken from Angelo Compagnucci's patch series:
> > https://patchwork.ozlabs.org/project/buildroot/list/?series=3D64340
> >
> > When the original patch series was submitted, Buildroot was quite a bit
> > smaller! With almost 1,000 packages added since then and more and more
> external
> > package managers being available for various languages, it is not
> possible to
> > package every single dependency needed for some packages.
> >
> > Indeed, looking at NPM, for example, some packages rely on tens, if not
> > hundreds, of others. While this could be better and is indeed quite bad=
,
> it is,
> > unfortunately, the reality we must deal with.
> >
> > With this patch series, we add initial tainting support to Buildroot
> with the
> > added option to turn the support off by way of the
> BR2_DISABLE_TAINT_CHECKING
> > option. This option gives us the best of both worlds: A sane default an=
d
> an
> > option for advanced users to turn off the check if they understand the
> risks
> > and can guarantee their build is reproducible.
>
> It does not require any such thing as tainted, and is just as simple as
> this:
>
>     diff --git a/package/nodejs/nodejs-src/nodejs-src.mk
> b/package/nodejs/nodejs-src/nodejs-src.mk
>     index 3452c93728..2d716d8547 100644
>     --- a/package/nodejs/nodejs-src/nodejs-src.mk
>     +++ b/package/nodejs/nodejs-src/nodejs-src.mk
>     @@ -241,6 +241,7 @@ NODEJS_SRC_MODULES_LIST=3D $(call qstrip,\
>      # We can only call NPM if there's something to install.
>      #
>      ifneq ($(NODEJS_SRC_MODULES_LIST),)
>     +NODEJS_SRC_LICENSE +=3D , vendored dependencies licenses probably no=
t
> listed
>      NODEJS_SRC_DEPENDENCIES +=3D host-nodejs
>      define NODEJS_SRC_INSTALL_MODULES
>         # If you're having trouble with module installation, adding -d
>         # to the
>
> As for reproducibility: if the package is not reproducible, either it is
> fixed so that it is reproducible, or if that is not possible, then the
> package should be hidden away behind depends on !BR2_REPRODUCIBLE
>
> That's as simple as that, I would say.
>
> Regards,
> Yann E. MORIN.
>
> >
> > This patch series has two significant benefits:
> >   - Taint checking paves the way for additional package managers to be
> >     incorporated into Buildroot while maintaining reproducible integrit=
y
> for
> >     packages provided by Buildroot.
> >
> >   - It tells the user their build is tainted and what packages they
> >     have selected are causing the taint.
> >
> >   - It makes support easier. If a user has a build that is tainted and
> the
> >     the problem they are experiencing is with a tainted package; it is
> >     more straightforward to tell the user they are on their own.
> >
> > Adam Duskett (3):
> >   Makefile: add tainting support
> >   docs/manual: add information about tainting
> >   package/nodejs: taint the build when using external modules
> >
> >  Config.in                                |  9 +++++++++
> >  Makefile                                 | 17 +++++++++++++++++
> >  docs/manual/adding-packages-generic.adoc |  9 +++++++++
> >  docs/manual/legal-notice.adoc            | 24 ++++++++++++++++++++++++
> >  package/nodejs/Config.in                 |  3 +++
> >  package/nodejs/nodejs-src/nodejs-src.mk  |  1 +
> >  package/pkg-generic.mk                   | 19 +++++++++++++++++++
> >  7 files changed, 82 insertions(+)
> >
> > --
> > 2.41.0
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

--000000000000ab45e506096ac52c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, but to your original points=C2=A0

<a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=3D64=
340" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/proj=
ect/buildroot/list/?series=3D64340</a>, this is not<div>an acceptable solut=
ion to put=C2=A0 &quot;NODEJS_SRC_LICENSE +=3D , vendored dependencies lice=
nses probably not listed&quot;<br clear=3D"all"><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><s=
pan><p style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom=
:0pt"><font color=3D"#000000" face=3D"Ubuntu, sans-serif"><span style=3D"fo=
nt-size:13.3333px">in the makefile, because there are several valid instanc=
es where you may be able to guarantee the integrity of</span></font></p><p =
style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><=
font color=3D"#000000" face=3D"Ubuntu, sans-serif"><span style=3D"font-size=
:13.3333px">the licenses and provide hashsums for each of them. Hence, the =
ability to disable the taint check.</span></font></p><p style=3D"line-heigh=
t:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><br></p><p dir=3D"lt=
r" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0=
,0);background-color:transparent;vertical-align:baseline;white-space:pre-wr=
ap">Adam Duskett</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999=
999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font=
-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color=
:transparent;vertical-align:baseline;white-space:pre-wrap">Senior Embedded =
Systems Developer</span></p><p dir=3D"ltr" style=3D"line-height:1.799999999=
9999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;fon=
t-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-colo=
r:transparent;vertical-align:baseline;white-space:pre-wrap">M. +1208-515-81=
02</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;=
Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;v=
ertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:adam.duskett=
@amarulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com<=
/a></span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot=
;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;=
vertical-align:baseline;white-space:pre-wrap">_____________________________=
_____</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=3D"f=
ont-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;vertical-align:baseline;white-space:pre-wrap">Amarula Soluti=
ons BV</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&q=
uot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transpare=
nt;vertical-align:baseline;white-space:pre-wrap">Joop Geesinkweg 125, 1114 =
AB, Amsterdam, NL</span></p><p dir=3D"ltr" style=3D"line-height:1.799999999=
9999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;fon=
t-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-colo=
r:transparent;vertical-align:baseline;white-space:pre-wrap">T. +31 (0)85 11=
1 9170</span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&qu=
ot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:=
baseline;white-space:pre-wrap"><br></span><span style=3D"font-size:10pt;fon=
t-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-colo=
r:transparent;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mail=
to:info@amarulasolutions.com" target=3D"_blank">info@amarulasolutions.com</=
a></span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-=
top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.com/" tar=
get=3D"_blank"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&=
quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-alig=
n:baseline;white-space:pre-wrap">www.amarulasolutions.com</span></a></p><di=
v><br></div></span></div></div></div><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 3, 2023 at 3:31=
=E2=80=AFPM Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">ya=
nn.morin.1998@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Adam, All,<br>
<br>
On 2023-11-03 12:27 -0600, Adam Duskett spake thusly:<br>
&gt; Originally taken from Angelo Compagnucci&#39;s patch series:<br>
&gt; <a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=
=3D64340" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.org=
/project/buildroot/list/?series=3D64340</a><br>
&gt; <br>
&gt; When the original patch series was submitted, Buildroot was quite a bi=
t<br>
&gt; smaller! With almost 1,000 packages added since then and more and more=
 external<br>
&gt; package managers being available for various languages, it is not poss=
ible to<br>
&gt; package every single dependency needed for some packages.<br>
&gt; <br>
&gt; Indeed, looking at NPM, for example, some packages rely on tens, if no=
t<br>
&gt; hundreds, of others. While this could be better and is indeed quite ba=
d, it is,<br>
&gt; unfortunately, the reality we must deal with.<br>
&gt; <br>
&gt; With this patch series, we add initial tainting support to Buildroot w=
ith the<br>
&gt; added option to turn the support off by way of the BR2_DISABLE_TAINT_C=
HECKING<br>
&gt; option. This option gives us the best of both worlds: A sane default a=
nd an<br>
&gt; option for advanced users to turn off the check if they understand the=
 risks<br>
&gt; and can guarantee their build is reproducible.<br>
<br>
It does not require any such thing as tainted, and is just as simple as<br>
this:<br>
<br>
=C2=A0 =C2=A0 diff --git a/package/nodejs/nodejs-src/<a href=3D"http://node=
js-src.mk" rel=3D"noreferrer" target=3D"_blank">nodejs-src.mk</a> b/package=
/nodejs/nodejs-src/<a href=3D"http://nodejs-src.mk" rel=3D"noreferrer" targ=
et=3D"_blank">nodejs-src.mk</a><br>
=C2=A0 =C2=A0 index 3452c93728..2d716d8547 100644<br>
=C2=A0 =C2=A0 --- a/package/nodejs/nodejs-src/<a href=3D"http://nodejs-src.=
mk" rel=3D"noreferrer" target=3D"_blank">nodejs-src.mk</a><br>
=C2=A0 =C2=A0 +++ b/package/nodejs/nodejs-src/<a href=3D"http://nodejs-src.=
mk" rel=3D"noreferrer" target=3D"_blank">nodejs-src.mk</a><br>
=C2=A0 =C2=A0 @@ -241,6 +241,7 @@ NODEJS_SRC_MODULES_LIST=3D $(call qstrip,=
\<br>
=C2=A0 =C2=A0 =C2=A0# We can only call NPM if there&#39;s something to inst=
all.<br>
=C2=A0 =C2=A0 =C2=A0#<br>
=C2=A0 =C2=A0 =C2=A0ifneq ($(NODEJS_SRC_MODULES_LIST),)<br>
=C2=A0 =C2=A0 +NODEJS_SRC_LICENSE +=3D , vendored dependencies licenses pro=
bably not listed<br>
=C2=A0 =C2=A0 =C2=A0NODEJS_SRC_DEPENDENCIES +=3D host-nodejs<br>
=C2=A0 =C2=A0 =C2=A0define NODEJS_SRC_INSTALL_MODULES<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If you&#39;re having trouble with module inst=
allation, adding -d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to the<br>
<br>
As for reproducibility: if the package is not reproducible, either it is<br=
>
fixed so that it is reproducible, or if that is not possible, then the<br>
package should be hidden away behind depends on !BR2_REPRODUCIBLE<br>
<br>
That&#39;s as simple as that, I would say.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; <br>
&gt; This patch series has two significant benefits:<br>
&gt;=C2=A0 =C2=A0- Taint checking paves the way for additional package mana=
gers to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0incorporated into Buildroot while maintaining repro=
ducible integrity for<br>
&gt;=C2=A0 =C2=A0 =C2=A0packages provided by Buildroot.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- It tells the user their build is tainted and what packag=
es they<br>
&gt;=C2=A0 =C2=A0 =C2=A0have selected are causing the taint.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- It makes support easier. If a user has a build that is t=
ainted and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0the problem they are experiencing is with a tainted=
 package; it is<br>
&gt;=C2=A0 =C2=A0 =C2=A0more straightforward to tell the user they are on t=
heir own.<br>
&gt; <br>
&gt; Adam Duskett (3):<br>
&gt;=C2=A0 =C2=A0Makefile: add tainting support<br>
&gt;=C2=A0 =C2=A0docs/manual: add information about tainting<br>
&gt;=C2=A0 =C2=A0package/nodejs: taint the build when using external module=
s<br>
&gt; <br>
&gt;=C2=A0 Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++++++++=
+<br>
&gt;=C2=A0 Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 ++++++++=
+++++++++<br>
&gt;=C2=A0 docs/manual/adding-packages-generic.adoc |=C2=A0 9 +++++++++<br>
&gt;=C2=A0 docs/manual/legal-notice.adoc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 24 ++++++++++++++++++++++++<br>
&gt;=C2=A0 package/nodejs/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
&gt;=C2=A0 package/nodejs/nodejs-src/<a href=3D"http://nodejs-src.mk" rel=
=3D"noreferrer" target=3D"_blank">nodejs-src.mk</a>=C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 package/<a href=3D"http://pkg-generic.mk" rel=3D"noreferrer" tar=
get=3D"_blank">pkg-generic.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++++++++++++++++++<br>
&gt;=C2=A0 7 files changed, 82 insertions(+)<br>
&gt; <br>
&gt; -- <br>
&gt; 2.41.0<br>
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

--000000000000ab45e506096ac52c--

--===============8550149758472196923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8550149758472196923==--
