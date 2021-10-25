Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9518C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 05:47:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EABD660F92
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 05:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EABD660F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE9164023A;
	Mon, 25 Oct 2021 05:47:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7H15pEuuaL25; Mon, 25 Oct 2021 05:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BBFF40344;
	Mon, 25 Oct 2021 05:47:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EC231BF3FB
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 05:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49DB280E4D
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 05:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Le8GP4PfZt-J for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 05:47:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A34380DFC
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 05:47:52 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id l13so17398742edi.8
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 22:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZMKo301dHcynFMEHC7jjs879r+yhrZz0hwpXF09sWVU=;
 b=cd6mnkdkRCMVXbl3gFG4X/rxazmEJLuzhgltkFAd9E2PHxyWfLPq8EfWzkisoRIxCq
 cNlFW0MleAPie5sbNuOPpCxs+QJb0AiFd8lPa3ohA8nEAfoRCNZM33lariKwoFoNV9a+
 7c/vbsK1ybGuk5zWpQGsEKsezDGtNLwdNR7Eh/3gHTA7chpDcQd6vNJTiJW7BaiPcPxH
 KMF0XmXHVVDIzIFD3j5p2k4/u/Zbvcd5MiZQvizgFg7xPOphM3+Fpy58kWfkje1qaOOz
 D+qFuVX7FXj6AgZrAtFAOtsfXYMdK5x9HiCw72SxubzvkFlX15lDAa6qXCV/Av7ZrvhS
 P3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZMKo301dHcynFMEHC7jjs879r+yhrZz0hwpXF09sWVU=;
 b=t23bGDWKHozLbanWKh0dGh596KudU2KSWgIwQLp2eBxHfPoA0llun8ybsLuepwjdkb
 r4nwT2Yue9vNKFDa7YSt3Gg6liBLg1SpRXy+fIy9Zld1eJG3FkoUOSVYdEyz3D8fmlNi
 7Bna/Uf3L9OTiPypDD9NT+JrN1zDse/ltr9BKcW2NCTAUnMj6pTc/e5zFOL/02BwpZLq
 2JxEM3agBDYVjKVwYlAJ5fI+BDe2kc+y76QAgqJovh3lbMSvla5r8XOXztw09GiKZL/G
 DpWO1JT+HkIoZZbRRWYvGnbG8vtrvoSNaRYQcuI1nSkyBd97Jm8AkXgcLnb413k9GFUM
 s4WA==
X-Gm-Message-State: AOAM5331xU3tt8pjzm6s2mLY4Xeocqx9+SuWsaPw05OEaYWYfnPUuEuj
 H4eErANmgGtxQ8bgkwrTi/a2cTDLHI+o4FSqRJ2rlA==
X-Google-Smtp-Source: ABdhPJxek9iHIykx2D9m9Sme8zdxLIyumY/bD6XWN4yVRpODRI35PzL38TxM3zXnYWIxQ4Og80X8K3YpWGfZNfuNn1g=
X-Received: by 2002:a17:906:6403:: with SMTP id
 d3mr19117333ejm.37.1635140870491; 
 Sun, 24 Oct 2021 22:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211019080458.308969-1-jose.pekkarinen@unikie.com>
 <CAKcgs2yyKVhG6t=kuQtwyvsVpHMjjz73PLkF8mTH6qBc7BMVyw@mail.gmail.com>
In-Reply-To: <CAKcgs2yyKVhG6t=kuQtwyvsVpHMjjz73PLkF8mTH6qBc7BMVyw@mail.gmail.com>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Mon, 25 Oct 2021 08:47:39 +0300
Message-ID: <CAJPV9MpOm4ucv7vdvqtzQ1+VnTAPrLs4giU33c+mbF5sX9QKqQ@mail.gmail.com>
To: Gilles Talis <gilles.talis@gmail.com>
Subject: Re: [Buildroot] [PATCH v2] package/softhsm2: new package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1813555495261583430=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1813555495261583430==
Content-Type: multipart/alternative; boundary="000000000000be696a05cf26e669"

--000000000000be696a05cf26e669
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 24, 2021 at 11:39 AM Gilles Talis <gilles.talis@gmail.com>
wrote:

> Hi Jos=C3=A9,
>
> Le mar. 19 oct. 2021 =C3=A0 10:05, Jos=C3=A9 Pekkarinen <jose.pekkarinen@=
unikie.com>
> a =C3=A9crit :
>
>> This patch adds a package for softhsm2.
>>
>> Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
>> ---
>> [ v1 -> v2 ]
>>   - Added hash file and license information
>>   - Moved recipe to use tarball
>>   - Provided support to build against different ssl libraries
>>   - Fixed toolchain dependencies and ssl select
>>   - Referenced the package in package/Config.in
>>   - Added myself as developer
>>
> thanks for this update. There are still a few things to fix in your patch=
.
>

Hi,

No problem, I'll get to them.



>
>>  DEVELOPERS                     |  3 +++
>>  package/Config.in              |  1 +
>>  package/softhsm2/Config.in     | 35 ++++++++++++++++++++++++++++++++++
>>  package/softhsm2/softhsm2.hash |  4 ++++
>>  package/softhsm2/softhsm2.mk   | 16 ++++++++++++++++
>>  5 files changed, 59 insertions(+)
>>  create mode 100644 package/softhsm2/Config.in
>>  create mode 100644 package/softhsm2/softhsm2.hash
>>  create mode 100644 package/softhsm2/softhsm2.mk
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index f6c39516b5..83d20d56cc 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -2927,3 +2927,6 @@ F:        package/qjson/
>>  F:     package/quazip/
>>  F:     package/shapelib/
>>  F:     package/tinc/
>> +
>> +N:     Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
>> +F:     package/softhsm2/
>> diff --git a/package/Config.in b/package/Config.in
>> index 7971726875..4f9cd38a97 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -2019,6 +2019,7 @@ menu "Security"
>>         source "package/libsemanage/Config.in"
>>         source "package/libsepol/Config.in"
>>         source "package/safeclib/Config.in"
>> +       source "package/softhsm2/Config.in"
>>  endmenu
>>
>>  menu "Text and terminal handling"
>> diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in
>> new file mode 100644
>> index 0000000000..e4ca75de12
>> --- /dev/null
>> +++ b/package/softhsm2/Config.in
>> @@ -0,0 +1,35 @@
>> +config BR2_PACKAGE_SOFTHSM2
>> +       bool "softhsm2"
>> +       depends on BR2_INSTALL_LIBSTDCPP
>> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>> +       depends on !BR2_STATIC_LIBS # dlopen()
>> +       select BR2_PACKAGE_OPENSSL
>> +       select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>>
> I know I somewhat confused you in my first review :-) But did you check
> whether your package could work with libressl. If it does, you do not nee=
d
> the select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL.
> Please refer to Arnout's comment on the first version of your patch.
>

Is this something I can quickly test by changing the

config snippet in test-pkg?


> +       help
>> +         SoftHSM is an implementation of a cryptographic store
>> +         accessible through a PKCS#11 interface. You can use it
>> +         to explore PKCS#11 without having a Hardware Security
>> +         Module.
>> +
>> +               https://www.opendnssec.org/softhsm
>
> The upstream url should have the same indentation as the help text above.
> Please make sure you run the "./utils/check-package" utility before pushi=
ng
> your patch.
>

Well, sorry, but I did, this is the output of the

patch before correcting the indentation:

$ ./utils/check-package package/softhsm2/*
55 lines processed
0 warnings generated


>
>> +
>> +choice
>> +       prompt "SSL/TLS library to use"
>> +
>> +config BR2_PACKAGE_SOFTHSM2_OPENSSL
>> +       bool "OpenSSL"
>> +       depends on BR2_PACKAGE_OPENSSL
>> +       select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENS=
SL
>> +
>> +config BR2_PACKAGE_SOFTHSM2_BEARSSL
>> +       bool "BearSSL"
>> +       depends on BR2_PACKAGE_BEARSSL
>> +
>> +config BR2_PACKAGE_SOFTHSM2_WOLFSSL
>> +       bool "WolfSSL"
>> +       depends on BR2_PACKAGE_WOLFSSL
>> +       select BR2_PACKAGE_WOLFSSL_ALL
>> +
>> +endchoice
>>
> This is not required. You can get rid of the choice menu, as you are not
> interested in supporting botan.
>

Alright, removing.


+
>> +comment "softhsm2 needs a toolchain with dynamic library"
>>
> a few comments there:
> 1) this should appear conditionally so you should mention the
> dependencies. Please refer to other packages that have the same type of
> constraints.
> 2) you should mention the CPP and C++11 requirements ("sofhsm2 needs a
> toolchain w/ C++, gcc >=3D 4.8 and dynamic library support")
>
>
>> diff --git a/package/softhsm2/softhsm2.hash
>> b/package/softhsm2/softhsm2.hash
>> new file mode 100644
>> index 0000000000..a33e0d7e6f
>> --- /dev/null
>> +++ b/package/softhsm2/softhsm2.hash
>> @@ -0,0 +1,4 @@
>> +# From https://www.opendnssec.org/2020/04/1602/
>> +sha256 61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614df475f2
>> softhsm-2.6.1.tar.gz
>> +# Locally computed
>> +sha256 230cab7102816e99f7ce03ef476352fcad09d742fcbc6580d44393db6280b64c
>> LICENSE
>>
> the correct indentation is
> sha256 <2 spaces> sha256sum <2 spaces> package/license
>

Ack.



> diff --git a/package/softhsm2/softhsm2.mk b/package/softhsm2/softhsm2.mk
>> new file mode 100644
>> index 0000000000..4b47def3bf
>> --- /dev/null
>> +++ b/package/softhsm2/softhsm2.mk
>> @@ -0,0 +1,16 @@
>>
>> +#######################################################################=
#########
>> +#
>> +# softhsm2
>> +#
>>
>> +#######################################################################=
#########
>> +
>> +SOFTHSM2_VERSION =3D 2.6.1
>> +SOFTHSM2_SOURCE =3D softhsm-$(SOFTHSM2_VERSION).tar.gz
>>
> This is not required as it is the default
>

Ack.



> +SOFTHSM2_SITE =3D https://dist.opendnssec.org/source
>> +SOFTHSM2_LICENSE =3D BSD-2-Clause
>> +SOFTHSM2_LICENSE_FILES =3D LICENSE
>> +SOFTHSM2_DEPENDENCIES =3D openssl
>> +SOFTHSM2_AUTORECONF =3D YES
>>
> you should explain why it is required, e.g. "no configure script provided=
"
>

Hum... I thought I removed this because of previous comments,

I'll recheck this out.

Thanks!


Jos=C3=A9.

--000000000000be696a05cf26e669
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 24, 2021 at 11:39 AM Gill=
es Talis &lt;<a href=3D"mailto:gilles.talis@gmail.com">gilles.talis@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-family:arial,sans-se=
rif;font-size:small">Hi Jos=C3=A9,<br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 19 oct. 2021 =C3=
=A0=C2=A010:05, Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@=
unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt; a =C3=A9cr=
it=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This p=
atch adds a package for softhsm2.<br>
<br>
Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@u=
nikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
---<br>
[ v1 -&gt; v2 ]<br>
=C2=A0 - Added hash file and license information<br>
=C2=A0 - Moved recipe to use tarball<br>
=C2=A0 - Provided support to build against different ssl libraries<br>
=C2=A0 - Fixed toolchain dependencies and ssl select<br>
=C2=A0 - Referenced the package in package/Config.in<br>
=C2=A0 - Added myself as developer<br></blockquote><div><div style=3D"font-=
family:arial,sans-serif;font-size:small">thanks for this update. There are =
still a few things to fix in your patch.</div></div></div></div></blockquot=
e><div><br></div></div><blockquote style=3D"margin:0 0 0 40px;border:none;p=
adding:0px"><div class=3D"gmail_quote"><div>Hi,</div><div><br></div></div><=
/blockquote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"=
><div class=3D"gmail_quote"><div>No problem, I&#39;ll get to them.</div></d=
iv></blockquote><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0package/softhsm2/Config.in=C2=A0 =C2=A0 =C2=A0| 35 ++++++++++++++++++=
++++++++++++++++<br>
=C2=A0package/softhsm2/softhsm2.hash |=C2=A0 4 ++++<br>
=C2=A0package/softhsm2/<a href=3D"http://softhsm2.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">softhsm2.mk</a>=C2=A0 =C2=A0| 16 ++++++++++++++++<br>
=C2=A05 files changed, 59 insertions(+)<br>
=C2=A0create mode 100644 package/softhsm2/Config.in<br>
=C2=A0create mode 100644 package/softhsm2/softhsm2.hash<br>
=C2=A0create mode 100644 package/softhsm2/<a href=3D"http://softhsm2.mk" re=
l=3D"noreferrer" target=3D"_blank">softhsm2.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index f6c39516b5..83d20d56cc 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -2927,3 +2927,6 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 package/qjson/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/quazip/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/shapelib/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/tinc/<br>
+<br>
+N:=C2=A0 =C2=A0 =C2=A0Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekk=
arinen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0package/softhsm2/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 7971726875..4f9cd38a97 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -2019,6 +2019,7 @@ menu &quot;Security&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/libsemanage/Config.in&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/libsepol/Config.in&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/safeclib/Config.in&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/softhsm2/Config.in&quot;<b=
r>
=C2=A0endmenu<br>
<br>
=C2=A0menu &quot;Text and terminal handling&quot;<br>
diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in<br>
new file mode 100644<br>
index 0000000000..e4ca75de12<br>
--- /dev/null<br>
+++ b/package/softhsm2/Config.in<br>
@@ -0,0 +1,35 @@<br>
+config BR2_PACKAGE_SOFTHSM2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;softhsm2&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++=
11<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # dlopen()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select <span class=3D"gmail_default" style=3D"f=
ont-family:arial,sans-serif;font-size:small"></span>BR2_PACKAGE_OPENSSL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<span class=3D"gmail_default" style=3D"font-fam=
ily:arial,sans-serif;font-size:small"></span>select BR2_PACKAGE_OPENSSL_FOR=
CE_LIBOPENSSL<br></blockquote><div><div style=3D"font-family:arial,sans-ser=
if;font-size:small">I know I somewhat confused you in my first review :-) B=
ut did you check whether your package could work with libressl. If it does,=
 you do not need the <span class=3D"gmail_default" style=3D"font-family:ari=
al,sans-serif;font-size:small"></span>select BR2_PACKAGE_OPENSSL_FORCE_LIBO=
PENSSL.</div><div style=3D"font-family:arial,sans-serif;font-size:small">Pl=
ease refer to Arnout&#39;s comment on the first version of your patch.<br><=
/div></div></div></div></blockquote><div><br></div></div><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><=
div>Is this something I can quickly test by changing the</div></div></block=
quote>config snippet in test-pkg?<br><div class=3D"gmail_quote"><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SoftHSM is an implementation of a crypto=
graphic store<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0accessible through a PKCS#11 interface. =
You can use it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to explore PKCS#11 without having a Hard=
ware Security<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Module.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://=
www.opendnssec.org/softhsm" rel=3D"noreferrer" target=3D"_blank">https://ww=
w.opendnssec.org/softhsm</a></blockquote><div><div style=3D"font-family:ari=
al,sans-serif;font-size:small">The upstream url should have the same indent=
ation as the help text above. Please make sure you run the &quot;./utils/ch=
eck-package&quot; utility before pushing your patch.</div></div></div></div=
></blockquote><div><br></div></div><blockquote style=3D"margin:0 0 0 40px;b=
order:none;padding:0px"><div class=3D"gmail_quote"><div>Well, sorry, but I =
did, this is the output of the</div></div></blockquote>patch before correct=
ing the indentation:<div><br></div><div><span style=3D"font-family:monospac=
e"><span style=3D"color:rgb(0,0,0)">$ ./utils/check-package package/softhsm=
2/*
</span><br>55 lines processed
<br>0 warnings generated<br></span><div class=3D"gmail_quote"><div>=C2=A0=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
+<br>
+choice<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0prompt &quot;SSL/TLS library to use&quot;<br>
+<br>
+config BR2_PACKAGE_SOFTHSM2_OPENSSL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;OpenSSL&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_OPENSSL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2=
_PACKAGE_LIBOPENSSL<br>
+<br>
+config BR2_PACKAGE_SOFTHSM2_BEARSSL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;BearSSL&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_BEARSSL<br>
+<br>
+config BR2_PACKAGE_SOFTHSM2_WOLFSSL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;WolfSSL&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_WOLFSSL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_WOLFSSL_ALL<br>
+<br>
+endchoice<br></blockquote><div><div style=3D"font-family:arial,sans-serif;=
font-size:small">This is not required. You can get rid of the choice menu, =
as you are not interested in supporting botan.<br></div></div></div></div><=
/blockquote><div><br></div></div></div><blockquote style=3D"margin:0 0 0 40=
px;border:none;padding:0px"><div><div class=3D"gmail_quote"><div>Alright, r=
emoving.=C2=A0</div></div></div></blockquote><div><div class=3D"gmail_quote=
"><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
+comment &quot;softhsm2 needs a toolchain with dynamic library&quot;<br></b=
lockquote><div><div style=3D"font-family:arial,sans-serif;font-size:small">=
a few comments there:<br></div><div style=3D"font-family:arial,sans-serif;f=
ont-size:small">1) this should appear conditionally so you should mention t=
he dependencies. Please refer to other packages that have the same type of =
constraints.<br></div><div style=3D"font-family:arial,sans-serif;font-size:=
small">2) you should mention the CPP and C++11 requirements (&quot;sofhsm2 =
needs a toolchain w/ C++, gcc &gt;=3D 4.8 and dynamic library support&quot;=
)<br></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
diff --git a/package/softhsm2/softhsm2.hash b/package/softhsm2/softhsm2.has=
h<br>
new file mode 100644<br>
index 0000000000..a33e0d7e6f<br>
--- /dev/null<br>
+++ b/package/softhsm2/softhsm2.hash<br>
@@ -0,0 +1,4 @@<br>
+# From <a href=3D"https://www.opendnssec.org/2020/04/1602/" rel=3D"norefer=
rer" target=3D"_blank">https://www.opendnssec.org/2020/04/1602/</a><br>
+sha256 61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614df475f2 so=
fthsm-2.6.1.tar.gz<br>
+# Locally computed<br>
+sha256 230cab7102816e99f7ce03ef476352fcad09d742fcbc6580d44393db6280b64c LI=
CENSE<br></blockquote><div><div style=3D"font-family:arial,sans-serif;font-=
size:small">the correct indentation is</div><div style=3D"font-family:arial=
,sans-serif;font-size:small">sha256 &lt;2 spaces&gt; sha256sum &lt;2 spaces=
&gt; package/license</div></div></div></div></blockquote><div><br></div></d=
iv></div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><d=
iv><div class=3D"gmail_quote"><div>Ack.</div></div></div></blockquote><div>=
<div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
diff --git a/package/softhsm2/<a href=3D"http://softhsm2.mk" rel=3D"norefer=
rer" target=3D"_blank">softhsm2.mk</a> b/package/softhsm2/<a href=3D"http:/=
/softhsm2.mk" rel=3D"noreferrer" target=3D"_blank">softhsm2.mk</a><br>
new file mode 100644<br>
index 0000000000..4b47def3bf<br>
--- /dev/null<br>
+++ b/package/softhsm2/<a href=3D"http://softhsm2.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">softhsm2.mk</a><br>
@@ -0,0 +1,16 @@<br>
+##########################################################################=
######<br>
+#<br>
+# softhsm2<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+SOFTHSM2_VERSION =3D 2.6.1<br>
+SOFTHSM2_SOURCE =3D softhsm-$(SOFTHSM2_VERSION).tar.gz<br></blockquote><di=
v><div style=3D"font-family:arial,sans-serif;font-size:small">This is not r=
equired as it is the default</div></div></div></div></blockquote><div><br><=
/div></div></div><blockquote style=3D"margin:0 0 0 40px;border:none;padding=
:0px"><div><div class=3D"gmail_quote"><div>Ack.=C2=A0</div></div></div></bl=
ockquote><div><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+SOFTHSM2_SITE =3D <a href=3D"https://dist.opendnssec.org/source" rel=3D"no=
referrer" target=3D"_blank">https://dist.opendnssec.org/source</a><br>
+SOFTHSM2_LICENSE =3D BSD-2-Clause<br>
+SOFTHSM2_LICENSE_FILES =3D LICENSE<br>
+SOFTHSM2_DEPENDENCIES =3D openssl<br>
+SOFTHSM2_AUTORECONF =3D YES<br></blockquote><div><div style=3D"font-family=
:arial,sans-serif;font-size:small">you should explain why it is required, e=
.g. &quot;no configure script provided&quot;</div></div></div></div></block=
quote><div><br></div></div></div><blockquote style=3D"margin:0 0 0 40px;bor=
der:none;padding:0px"><div><div class=3D"gmail_quote"><div>Hum... I thought=
 I removed this because of previous comments,</div></div></div></blockquote=
>I&#39;ll recheck this out.<div><br></div><div><blockquote style=3D"margin:=
0 0 0 40px;border:none;padding:0px"><div>Thanks!</div></blockquote><div><di=
v><br></div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><bl=
ockquote style=3D"margin:0px 0px 0px 40px;border:none;padding:0px">Jos=C3=
=A9.</blockquote></div></div></div></div></div>

--000000000000be696a05cf26e669--

--===============1813555495261583430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1813555495261583430==--
