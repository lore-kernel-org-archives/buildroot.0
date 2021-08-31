Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,T_KAM_HTML_FONT_INVALID
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC55C4320E
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 22:05:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F06456102A
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 22:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F06456102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dynonavionics.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C13F480DA9;
	Tue, 31 Aug 2021 22:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJrkwdicCTwq; Tue, 31 Aug 2021 22:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 913BA80DBC;
	Tue, 31 Aug 2021 22:05:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90A261BF5E6
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 22:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D04F80DBC
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 22:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZX1alMUH_yJ for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 22:05:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C30780DA9
 for <buildroot@busybox.net>; Tue, 31 Aug 2021 22:05:14 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id s25so876295edw.0
 for <buildroot@busybox.net>; Tue, 31 Aug 2021 15:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dynonavionics.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=klXdyK5u5Y6yKYRqMIYPqhnuhuDTu6Z6/kLyyDdTjbI=;
 b=PSmC2TE/T2Ja9jr5Pd8I7v1BEuGLKK7joYtLhyNxzmCQv93clIkSK9Xkmr7nqV9/BN
 gXzGb/rmMX/tlFSURj3p9gLEQanYBMHSBhsJS09CyuQD0wBmEcjctZlu0r1LUw86Ec/O
 4LI7QXd28HxiIgxPNG+5HZU6PH8Yi7ffD5xUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=klXdyK5u5Y6yKYRqMIYPqhnuhuDTu6Z6/kLyyDdTjbI=;
 b=nz0Ev/7w9o8VlwxYJOVYDrPM0KeHoB6ifo+oLE69nq/KVp20Ikg9Y8iHrQV2fzt+Gh
 a6APf0eYzNdKQxujysFKXSdS57G3QpNg5PWwIqGefkHkI3EmxzXHbOTrWuvw6av4rOio
 hZ1TGvq8wF4eN2s3mMoKOMZiMpUnP6ion9VlbWFoQZElp7QIoDzJFaS58Rzom/KLbiYQ
 vgCqFvQZHZc59Lq1/3Y0n36bfIeVIQfVLHjY4lvbhFbhoduMkPOWbZMzA7iTG+f5rEEn
 roiuW3nbcnTV0l7IUfJ0qo6Ny7HcEDr1GPiZu7aE8XrnKyrzAcuA+5HjtO/sBaI7s/Gh
 Re7g==
X-Gm-Message-State: AOAM531n9daavdD8dGpv6MV6ew2WVdWxvMpRf2mufEUJmMjQoukkUTXj
 oZuS510tqF1nv/vnnQQ2zF7HygrZ5JDztb7/8au/sUl6PgjwRg==
X-Google-Smtp-Source: ABdhPJyksAehAaMLjO8TkIhWq4typqc2Hl9W4QBjI7iOTfQ2mExC5bNox5OkTKXPMVEMrSqosEUyJaIvOvL8dBRjHnY=
X-Received: by 2002:aa7:db10:: with SMTP id t16mr37043eds.357.1630447512297;
 Tue, 31 Aug 2021 15:05:12 -0700 (PDT)
MIME-Version: 1.0
From: David Corbeil <david.corbeil@dynonavionics.com>
Date: Tue, 31 Aug 2021 15:05:01 -0700
Message-ID: <CAHth+TX_S-rcD3MLLZ+PZLPWWG8V4p++aRtxsy3ED3_NUoAzTg@mail.gmail.com>
To: buildroot@busybox.net
Subject: [Buildroot] Buildroot + Rpi4 + Accelerated OpenGL + X11
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
Content-Type: multipart/mixed; boundary="===============2054056363462493065=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============2054056363462493065==
Content-Type: multipart/alternative; boundary="000000000000cbb83705cae224aa"

--000000000000cbb83705cae224aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Using Buildroot, I=E2=80=99m trying to build an OS that can run my OpenGL (=
not ES)
app with accelerated 3D graphics. I also want it to use X11 as a display
server. So far I haven=E2=80=99t tried my app directly on my built OS becau=
se it
has many dependencies but I=E2=80=99m using glmark2, kmscube and glxgear to=
 debug
and try out different Buildroot configurations.

I tried the *vc4-kms-v3d-pi4* and *vc4-kms-v3d* overlays in the config.txt,
but I=E2=80=99ve had better results using the former.

So far I was able to get glmark2 to run but it was using a software OpenGL
renderer (swrast). Although performance is abysmal so that=E2=80=99s a no g=
o.

I have 4 flavors of glmark2 in my OS, glmark2, glmark2-es2, glmark-es2-drm
and glmark2-drm. The only ones that run are glmark2-drm and
glmark2-es2-drm. They run really well at 60fps. kmscube runs really well as
well.

The problem comes when I try to run glxgears and glxinfo when X11 is
running. I get the following errors:

   -

   Glxgears

Error: Couldn=E2=80=99t get an RGB, Doubled-buffered visual


   -

   Glxinfo:

name of display: :0

Error: couldn=E2=80=99t find RGB GLX visual or fbconfig


   -

   Glmark2:

Error: GLX version >=3D 1.3 is required

Error: Error: Couldn=E2=80=99t get GL visual config

Error: main: Could not initialize canvas

I=E2=80=99d like to get the regular glmark2 to run since, from my understan=
ding, it
uses regular OpenGL?

I=E2=80=99m pretty convinced my end goal is possible because I was able to =
get my
app to run flawlessly in Raspberry Pi OS using regular OpenGL. Just need to
find all the necessary packages and configure the OS correctly. Easy to
say, easy to do right?

I linked my defconfig, the xorg configuration file and xorg log file.

buidlroot Rpi4_32_defconfig_eudev: https://pastebin.com/xfJ9WbdQ

xorg.conf: https://pastebin.com/vewDwmtD

xorg log: https://pastebin.com/0yDXGDr7

Maybe the xorg configuration file needs to be modified? But how? According
to this <https://github.com/raspberrypi/linux/issues/4526>, I should not be
using fbturbo but I don=E2=80=99t know what to replace it with.


Mesa version: 21.1.6

Kernel version: 5.10.60

Thanks for the help.
--=20
*David Corbeil-Stroombergen*
Software development engineer
Dynon
www.dynon.aero <http://www.dynonavionics.com/>

--000000000000cbb83705cae224aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-b948a4ff-7fff-5622-6e=
a2-0709b6625400"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre-wrap">Hi,=C2=A0</span></p><br>=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">Using Buildroot, I=E2=80=99m trying to bu=
ild an OS that can run my OpenGL (not ES) app with accelerated 3D graphics.=
 I also want it to use X11 as a display server. So far I haven=E2=80=99t tr=
ied my app directly on my built OS because it has many dependencies but I=
=E2=80=99m using glmark2, kmscube and glxgear to debug and try out differen=
t Buildroot configurations.=C2=A0</span></p><br><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre=
-wrap">I tried the <i>vc4-kms-v3d-pi4</i> and <i>vc4-kms-v3d</i> overlays i=
n the config.txt, but I=E2=80=99ve had better results using the former.=C2=
=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre-wrap">So far I was able to ge=
t glmark2 to run but it was using a software OpenGL renderer (swrast). Alth=
ough performance is abysmal so that=E2=80=99s a no go.=C2=A0</span></p><br>=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">I have 4 flavors of glmark2 in my OS, glm=
ark2, glmark2-es2, glmark-es2-drm and glmark2-drm. The only ones that run a=
re glmark2-drm and glmark2-es2-drm. They run really well at 60fps. kmscube =
runs really well as well.=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:Ar=
ial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-w=
rap">The problem comes when I try to run glxgears and glxinfo when X11 is r=
unning. I get the following errors:</span></p></span><span><ul style=3D"mar=
gin-top:0px;margin-bottom:0px"><li style=3D"list-style-type:disc;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re"><p style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"=
presentation"><span style=3D"background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">Glxgears</span></p></li></ul></span><blockquote style=3D"margi=
n:0 0 0 40px;border:none;padding:0px"><blockquote style=3D"margin:0 0 0 40p=
x;border:none;padding:0px"><span style=3D"background-color:transparent;colo=
r:rgb(0,0,0);font-family:Arial;white-space:pre-wrap">Error: Couldn=E2=80=99=
t get an RGB, </span>Doubled-buffered<span style=3D"background-color:transp=
arent;color:rgb(0,0,0);font-family:Arial;white-space:pre-wrap"> visual</spa=
n></blockquote></blockquote><span><ul style=3D"margin-top:0px;margin-bottom=
:0px"><li style=3D"list-style-type:disc;font-family:Arial;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre"><p style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">Glxinfo:=C2=
=A0</span></p></li></ul></span><blockquote style=3D"margin:0 0 0 40px;borde=
r:none;padding:0px"><blockquote style=3D"margin:0 0 0 40px;border:none;padd=
ing:0px"><span style=3D"background-color:transparent;color:rgb(0,0,0);font-=
family:Arial;white-space:pre-wrap">name of display: :0</span></blockquote><=
/blockquote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"=
><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><span styl=
e=3D"background-color:transparent;color:rgb(0,0,0);font-family:Arial;white-=
space:pre-wrap">Error: couldn=E2=80=99t find RGB GLX visual or fbconfig</sp=
an></blockquote></blockquote><span><ul style=3D"margin-top:0px;margin-botto=
m:0px"><li style=3D"list-style-type:disc;font-family:Arial;color:rgb(0,0,0)=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre"><p style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Glmark2:</s=
pan></p></li></ul></span><blockquote style=3D"margin:0 0 0 40px;border:none=
;padding:0px"><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0p=
x"><span style=3D"background-color:transparent;white-space:pre-wrap;color:r=
gb(0,0,0);font-family:Arial">Error: GLX version &gt;=3D 1.3 is required</sp=
an></blockquote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:=
0px"><div><span style=3D"background-color:transparent;color:rgb(0,0,0);font=
-family:Arial;white-space:pre-wrap">Error: Error: Couldn=E2=80=99t get GL v=
isual config</span></div></blockquote><blockquote style=3D"margin:0 0 0 40p=
x;border:none;padding:0px"><div><span style=3D"background-color:transparent=
;white-space:pre-wrap;color:rgb(0,0,0);font-family:Arial">Error: main: Coul=
d not initialize canvas</span></div></blockquote></blockquote><div><span><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-family:Arial;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">I=E2=80=99d like to get the regular glmark2=
 to run since, from my understanding, it uses regular OpenGL?</span></p><br=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-family:Arial;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre-wrap">I=E2=80=99m pretty convinced my end goal=
 is possible because I was able to get my app to run flawlessly in Raspberr=
y Pi OS using regular OpenGL. Just need to find all the necessary packages =
and configure the OS correctly. Easy to say, easy to do right?</span></p><b=
r><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-family:Arial;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre-wrap">I linked my defconfig, the xorg configu=
ration file and xorg log file.=C2=A0</span></p><br><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-fami=
ly:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre-wrap">buidlroot Rpi4_32_defconfig_eudev: <a href=3D"https://pastebin.co=
m/xfJ9WbdQ">https://pastebin.com/xfJ9WbdQ</a></span></p><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre-wrap">xorg.conf: </span><a href=3D"https://pastebin.com/vewDwmtD" =
style=3D"text-decoration-line:none"><span style=3D"font-family:Arial;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;text-decoration-line:underline;vertical-align:baseline;white-space:p=
re-wrap">https://pastebin.com/vewDwmtD</span></a><span style=3D"font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap">xorg log: </span=
><a href=3D"https://pastebin.com/0yDXGDr7" style=3D"text-decoration-line:no=
ne"><span style=3D"font-family:Arial;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;text-decoration-line:unde=
rline;vertical-align:baseline;white-space:pre-wrap">https://pastebin.com/0y=
DXGDr7</span></a><span style=3D"font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre-wrap">=C2=A0</span></p><br><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-family:Arial;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre-wrap">Maybe the xorg configuration file needs to b=
e modified? But how? According to <a href=3D"https://github.com/raspberrypi=
/linux/issues/4526">this</a></span><span style=3D"font-family:Arial;color:r=
gb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">, I sh=
ould not be using fbturbo but I don=E2=80=99t know what to replace it with.=
</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-weight:700;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre-wrap"><br></span><sp=
an style=3D"font-family:Arial;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre-wrap">Mesa version: 21.1.6</span></p><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre-wrap">Kernel version: 5.10.60</span></p><br><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">Thanks for the help.</span></p></span>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div dir=3D"ltr"><div><b style=3D"color:rgb(68,68,68);font-size=
:12.8px">David Corbeil-Stroombergen</b><br></div><font color=3D"#444444">So=
ftware development=C2=A0engineer<br></font></div><div dir=3D"ltr"><font col=
or=3D"#444444">Dynon</font></div><div dir=3D"ltr"><font color=3D"#444444"><=
a href=3D"http://www.dynonavionics.com/" style=3D"color:rgb(17,85,204);font=
-size:12.8px" target=3D"_blank">www.dynon.aero</a></font></div></div></div>=
</div></div>

--000000000000cbb83705cae224aa--

--===============2054056363462493065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============2054056363462493065==--
