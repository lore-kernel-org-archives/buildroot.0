Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4187EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 23:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA5C240519;
	Thu, 20 Jul 2023 23:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA5C240519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pR8OcN3agoHU; Thu, 20 Jul 2023 23:37:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 767A24051B;
	Thu, 20 Jul 2023 23:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 767A24051B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C42651BF39A
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 23:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA2908229D
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 23:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA2908229D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wy-U5GW5g5ml for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 23:37:47 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24C3882284
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 23:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24C3882284
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-997c4107d62so196734866b.0
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 16:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689896265; x=1690501065;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f+YmKx4BkMFQSapYimausCzcD8PGruz37aEN4RlqJcE=;
 b=I3YZ2Hk1UzG8onYQ+NFC2sgCQ4DvyWCVrKXYaKgiwDpdq5GCCCj5EHn8EijCAc9rny
 aN3N0AgXXAg+y8tevO6mqt6ogMEkWP9l7oRGi+P2gxMcdvxWI53HWMCLQAcg/ctCwTdM
 Swpu2/jHsUoz4Ts1F+AMXOlEChoClAkM5XRKgt/I6zD4+i+byKrxiec6lOPKHQ3rlcDi
 nFjWqShSmf48J+6XG+0+U7iuv7Nu3gj0RJxprw3QJ0KoPBJDRHgklpvaRw3Dn81sYByZ
 SAtYCKI1MG+8rL67u/M9z2LCUibYj3bOcFzbDrHWIHDnJDJKOvekBvGayWVMjuO890dv
 Zrww==
X-Gm-Message-State: ABy/qLaBi1LRHAHsUArOAakHApPqgVvJJsV/0hxhlc8ChgHQUD9GVPrc
 JyLjvvLm6TlMxHa/brOWE6MJqdUNmHuJxmPwaGUQzWTj9ndI1EVT5lc=
X-Google-Smtp-Source: APBJJlHjzX7XjBBLTT5poYsLFu2MW+rJMMa8upsKBtwU5vwbemr6g/kcQQCF8JwrWECTRx7MOsv5JZJ3cPW7VHoAMdg=
X-Received: by 2002:a17:906:d7:b0:997:c0c7:6f4e with SMTP id
 23-20020a17090600d700b00997c0c76f4emr150244eji.74.1689896264933; Thu, 20 Jul
 2023 16:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230720233629.1642220-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20230720233629.1642220-1-adam.duskett@amarulasolutions.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 20 Jul 2023 16:37:34 -0700
Message-ID: <CAHDQB6N5V0EB1ZFWQBGK1fb6KTo+bPq6esnRX-_7+bzcOzRqXw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1689896265; x=1690501065;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f+YmKx4BkMFQSapYimausCzcD8PGruz37aEN4RlqJcE=;
 b=BxJJh7yjIqLdWv/sQ7jvzRqRQPeD78LP0sbwt6aYhs+JrRjdE43AuFaFT9aIDCTNMr
 w4fpaBAJ6qzdAlvJ/X/fd9kzUV1XSrjhRFLvOlPB0qLQti8gxMZodpihaFPQrNzuJFgZ
 jbnDe3reY/gU3zBy9jWf3m4wY4HY/Bx4FXGto=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BxJJh7yj
Subject: Re: [Buildroot] [PATCH vRFC 0/3] Initial flutter packages
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============5894523607984924241=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5894523607984924241==
Content-Type: multipart/alternative; boundary="00000000000094379b0600f3a2d0"

--00000000000094379b0600f3a2d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry about sending this patchset twice, I forgot to sign up for the
mailing list under my Amarula email address. :)

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



On Thu, Jul 20, 2023 at 4:36=E2=80=AFPM Adam Duskett <
adam.duskett@amarulasolutions.com> wrote:

> Preface: Thank you for all the help, thoughts and insight for this initia=
l
> RFC of the flutter-engine library. There are many other flutter packages
> that
> need to be ported, but this is the largest hurdle to overcome.
>
> There are many issues with the flutter-engine package:
>
> - The release tarballs from https://github.com/flutter/engine are in no
> state
>   to compile. They are only for the use of gclient to download a source
>   directory structure suitable to build the Flutter engine! If you
> download,
>   extract and attempt to run `./tools/gn --no-goma
> --no-prebuilt-dart-sdk`, you
>   receive the error message:
>   `No such file or directory: 'flutter/flutter/third_party/gn/gn.'
>
>   But wait! Wasn't the gn binary just called? No, that's a wrapper in the
>   Flutter source tree that formats arguments to call the real gn binary.
>   The real gn is not provided in the tarball but is downloaded via gclien=
t
>   (among many other supporting repositories.)
>
>   Even worse, the flutter repository depends on the .git dirs being
> present.
>   (https://github.com/meta-flutter/meta-flutter/issues/271) This
> dependency
>   means it is not possible to create a reproducible tarball from the
> downloaded
>   sources, which is why there is no .hash file provided.
>
>   I have asked the flutter project to release full tarballs suitable for
>   compiling here: https://github.com/flutter/flutter/issues/130734
>
> - The clang toolchain wrapper does not work properly, resulting in the
> immediate
>   errors of:
>     -Wl,-z,now: 'linker' input unused
>     -Wl,-z,relro: 'linker' input unused
>   The solution is to use clang.br_real and clang++.br_real.
>
> - If using per_package builds, flutter-engine tries to use the host
> /usr/bin/ld
>   instead of the one provided by the compiler, resulting in linking error=
s.
>   As such, if BR2_PER_PACKAGE_DIRECTORIES is enabled, we search for the l=
d
>   provided by the compiler in the host directory and set the path
> accordingly.
>
> - libtessellator.so (built by flutter) requires three files:
>   crtbeginS.o crtendS.o libgcc.a. However, the toolchain path isn't
> referenced
>   when linking. The solution is to copy those three files to the staging
> lib
>   directory before building.
>
> Tested with:
>   - Debian 11 and 12
>   - Ubuntu 18.04, 20.04, and 22.04
>   - Fedora 38
>   - Per package directory enabled and disabled
>   - x86_64, arm64
>
> Adam Duskett (3):
>   package/python-httplib2: add host variant
>   package/depot-tools: new package
>   package/flutter-engine: new package
>
>  DEVELOPERS                                    |   4 +
>  package/Config.in                             |   1 +
>  package/Config.in.host                        |   1 +
>  .../0001-Disable-ninjalog-upload.patch        |  35 +++
>  package/depot-tools/Config.in.host            |  10 +
>  package/depot-tools/depot-tools.hash          |   3 +
>  package/depot-tools/depot-tools.mk            |  33 ++
>  .../0001-disable-pre-canned-sysroot.patch     |  32 ++
>  .../0002-remove-explicit-x11-dependency.patch |  33 ++
>  .../0003-disable-undefined-version.patch      |  32 ++
>  ...onfig.py-do-not-prepend-sysroot-path.patch |  34 +++
>  package/flutter-engine/Config.in              |  93 ++++++
>  package/flutter-engine/flutter-engine.mk      | 286 ++++++++++++++++++
>  package/flutter-engine/gclient                |  16 +
>  package/python-httplib2/python-httplib2.mk    |   1 +
>  15 files changed, 614 insertions(+)
>  create mode 100644 package/depot-tools/0001-Disable-ninjalog-upload.patc=
h
>  create mode 100644 package/depot-tools/Config.in.host
>  create mode 100644 package/depot-tools/depot-tools.hash
>  create mode 100644 package/depot-tools/depot-tools.mk
>  create mode 100644
> package/flutter-engine/0001-disable-pre-canned-sysroot.patch
>  create mode 100644
> package/flutter-engine/0002-remove-explicit-x11-dependency.patch
>  create mode 100644
> package/flutter-engine/0003-disable-undefined-version.patch
>  create mode 100644
> package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.pat=
ch
>  create mode 100644 package/flutter-engine/Config.in
>  create mode 100644 package/flutter-engine/flutter-engine.mk
>  create mode 100644 package/flutter-engine/gclient
>
> --
> 2.41.0
>
>

--00000000000094379b0600f3a2d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry about sending this patchset twice, I forgot to sign =
up for the mailing list under my Amarula email address. :)<br clear=3D"all"=
><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gma=
il_signature"><div dir=3D"ltr"><span><p dir=3D"ltr" style=3D"line-height:1.=
7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;vertical-align:baseline;white-space:pre-wrap">Adam Duskett</span></p=
><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&=
quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-alig=
n:baseline;white-space:pre-wrap">Senior Embedded Systems Developer</span></=
p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono=
&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-ali=
gn:baseline;white-space:pre-wrap">M. +1208-515-8102</span></p><p dir=3D"ltr=
" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospac=
e;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;whi=
te-space:pre-wrap"><a href=3D"mailto:adam.duskett@amarulasolutions.com" tar=
get=3D"_blank">adam.duskett@amarulasolutions.com</a></span></p><p dir=3D"lt=
r" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospa=
ce;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;wh=
ite-space:pre-wrap">__________________________________</span></p><p dir=3D"=
ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monos=
pace;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;=
white-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:=
Ubuntu,sans-serif;color:rgb(0,0,0);background-color:transparent;vertical-al=
ign:baseline;white-space:pre-wrap">Amarula Solutions BV</span></p><p dir=3D=
"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,mono=
space;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline=
;white-space:pre-wrap">Joop Geesinkweg 125, 1114 AB, Amsterdam, NL</span></=
p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono=
&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-ali=
gn:baseline;white-space:pre-wrap">T. +31 (0)85 111 9170</span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;vertical-align:baseline;white-space:pre=
-wrap"><br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mo=
no&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-a=
lign:baseline;white-space:pre-wrap"><a href=3D"mailto:info@amarulasolutions=
.com" target=3D"_blank">info@amarulasolutions.com</a></span></p><p dir=3D"l=
tr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0p=
t"><a href=3D"http://www.amarulasolutions.com/" target=3D"_blank"><span sty=
le=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rg=
b(0,0,0);background-color:transparent;vertical-align:baseline;white-space:p=
re-wrap">www.amarulasolutions.com</span></a></p><div><br></div></span></div=
></div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, Jul 20, 2023 at 4:36=E2=80=AFPM Adam Duskett=
 &lt;<a href=3D"mailto:adam.duskett@amarulasolutions.com">adam.duskett@amar=
ulasolutions.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Preface: Thank you for all the help, thoughts and insight f=
or this initial<br>
RFC of the flutter-engine library. There are many other flutter packages th=
at<br>
need to be ported, but this is the largest hurdle to overcome.<br>
<br>
There are many issues with the flutter-engine package:<br>
<br>
- The release tarballs from <a href=3D"https://github.com/flutter/engine" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/flutter/engine</a> a=
re in no state<br>
=C2=A0 to compile. They are only for the use of gclient to download a sourc=
e<br>
=C2=A0 directory structure suitable to build the Flutter engine! If you dow=
nload,<br>
=C2=A0 extract and attempt to run `./tools/gn --no-goma --no-prebuilt-dart-=
sdk`, you<br>
=C2=A0 receive the error message:<br>
=C2=A0 `No such file or directory: &#39;flutter/flutter/third_party/gn/gn.&=
#39;<br>
<br>
=C2=A0 But wait! Wasn&#39;t the gn binary just called? No, that&#39;s a wra=
pper in the<br>
=C2=A0 Flutter source tree that formats arguments to call the real gn binar=
y.<br>
=C2=A0 The real gn is not provided in the tarball but is downloaded via gcl=
ient<br>
=C2=A0 (among many other supporting repositories.)<br>
<br>
=C2=A0 Even worse, the flutter repository depends on the .git dirs being pr=
esent.<br>
=C2=A0 (<a href=3D"https://github.com/meta-flutter/meta-flutter/issues/271"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/meta-flutter/meta-=
flutter/issues/271</a>) This dependency<br>
=C2=A0 means it is not possible to create a reproducible tarball from the d=
ownloaded<br>
=C2=A0 sources, which is why there is no .hash file provided.<br>
<br>
=C2=A0 I have asked the flutter project to release full tarballs suitable f=
or<br>
=C2=A0 compiling here: <a href=3D"https://github.com/flutter/flutter/issues=
/130734" rel=3D"noreferrer" target=3D"_blank">https://github.com/flutter/fl=
utter/issues/130734</a><br>
<br>
- The clang toolchain wrapper does not work properly, resulting in the imme=
diate<br>
=C2=A0 errors of:<br>
=C2=A0 =C2=A0 -Wl,-z,now: &#39;linker&#39; input unused<br>
=C2=A0 =C2=A0 -Wl,-z,relro: &#39;linker&#39; input unused<br>
=C2=A0 The solution is to use clang.br_real and clang++.br_real.<br>
<br>
- If using per_package builds, flutter-engine tries to use the host /usr/bi=
n/ld<br>
=C2=A0 instead of the one provided by the compiler, resulting in linking er=
rors.<br>
=C2=A0 As such, if BR2_PER_PACKAGE_DIRECTORIES is enabled, we search for th=
e ld<br>
=C2=A0 provided by the compiler in the host directory and set the path acco=
rdingly.<br>
<br>
- libtessellator.so (built by flutter) requires three files:<br>
=C2=A0 crtbeginS.o crtendS.o libgcc.a. However, the toolchain path isn&#39;=
t referenced<br>
=C2=A0 when linking. The solution is to copy those three files to the stagi=
ng lib<br>
=C2=A0 directory before building.<br>
<br>
Tested with:<br>
=C2=A0 - Debian 11 and 12<br>
=C2=A0 - Ubuntu 18.04, 20.04, and 22.04<br>
=C2=A0 - Fedora 38<br>
=C2=A0 - Per package directory enabled and disabled<br>
=C2=A0 - x86_64, arm64<br>
<br>
Adam Duskett (3):<br>
=C2=A0 package/python-httplib2: add host variant<br>
=C2=A0 package/depot-tools: new package<br>
=C2=A0 package/flutter-engine: new package<br>
<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 +<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0package/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../0001-Disable-ninjalog-upload.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 35 +++<br>
=C2=A0package/depot-tools/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 10 +<br>
=C2=A0package/depot-tools/depot-tools.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0package/depot-tools/<a href=3D"http://depot-tools.mk" rel=3D"noreferr=
er" target=3D"_blank">depot-tools.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 33 ++<br>
=C2=A0.../0001-disable-pre-canned-sysroot.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
32 ++<br>
=C2=A0.../0002-remove-explicit-x11-dependency.patch |=C2=A0 33 ++<br>
=C2=A0.../0003-disable-undefined-version.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
32 ++<br>
=C2=A0...onfig.py-do-not-prepend-sysroot-path.patch |=C2=A0 34 +++<br>
=C2=A0package/flutter-engine/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 93 ++++++<br>
=C2=A0package/flutter-engine/<a href=3D"http://flutter-engine.mk" rel=3D"no=
referrer" target=3D"_blank">flutter-engine.mk</a>=C2=A0 =C2=A0 =C2=A0 | 286=
 ++++++++++++++++++<br>
=C2=A0package/flutter-engine/gclient=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 16 +<br>
=C2=A0package/python-httplib2/<a href=3D"http://python-httplib2.mk" rel=3D"=
noreferrer" target=3D"_blank">python-httplib2.mk</a>=C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A015 files changed, 614 insertions(+)<br>
=C2=A0create mode 100644 package/depot-tools/0001-Disable-ninjalog-upload.p=
atch<br>
=C2=A0create mode 100644 package/depot-tools/Config.in.host<br>
=C2=A0create mode 100644 package/depot-tools/depot-tools.hash<br>
=C2=A0create mode 100644 package/depot-tools/<a href=3D"http://depot-tools.=
mk" rel=3D"noreferrer" target=3D"_blank">depot-tools.mk</a><br>
=C2=A0create mode 100644 package/flutter-engine/0001-disable-pre-canned-sys=
root.patch<br>
=C2=A0create mode 100644 package/flutter-engine/0002-remove-explicit-x11-de=
pendency.patch<br>
=C2=A0create mode 100644 package/flutter-engine/0003-disable-undefined-vers=
ion.patch<br>
=C2=A0create mode 100644 package/flutter-engine/0004-pkg-config.py-do-not-p=
repend-sysroot-path.patch<br>
=C2=A0create mode 100644 package/flutter-engine/Config.in<br>
=C2=A0create mode 100644 package/flutter-engine/<a href=3D"http://flutter-e=
ngine.mk" rel=3D"noreferrer" target=3D"_blank">flutter-engine.mk</a><br>
=C2=A0create mode 100644 package/flutter-engine/gclient<br>
<br>
-- <br>
2.41.0<br>
<br>
</blockquote></div>

--00000000000094379b0600f3a2d0--

--===============5894523607984924241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5894523607984924241==--
