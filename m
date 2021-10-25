Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE45AC433FE
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:20:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A20B60FD7
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A20B60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F325D4016C;
	Mon, 25 Oct 2021 07:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ieaJSzkeTQ3d; Mon, 25 Oct 2021 07:20:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7FA340173;
	Mon, 25 Oct 2021 07:20:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A5B71BF2CC
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 468A960649
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKSQNNx-Nmz9 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 07:20:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44275600C4
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 07:20:30 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id r4so13971997edi.5
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 00:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+33ZM/bA9PzwLhOiOxrGcO6h1KX4G14AbPnWe1jW6YQ=;
 b=QUQ4jb6oGZ0ywTUpLdjSXDsoqipg1Vc95UndUzWtQkAxF8CMv7XBoszdXxL//hIOLM
 UBzTDkl5OKXmEIUQxDwZRXiEfSf/19L4571ueKtEeQfNEj5TcCG0A6M2JtkgbcTpOKwJ
 A8Hrlj0suRTu7wq23y5iDiOdUr+Tp/672Hs+/O4S5BrdxLsIr9AJq7bLrDGz5G3d+1ry
 O0DylPG9lan3xALGZHuKINORsbO4WVP9dTvj8nAaMKw1JWCFGNbZixE0JFDo3iILYmty
 feaDAqHkw6g5wajWGiRrXkZkwv1UducFZnox23wS06+7s/g8cFmPy/gsm9omHt8liBAS
 gPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+33ZM/bA9PzwLhOiOxrGcO6h1KX4G14AbPnWe1jW6YQ=;
 b=w46AFXKciss9v8UAffalFLHvCD1lOj+qRvl30RMaSng27A0poNKmCkdFQF01cE8SAu
 yblpPn6oJf7B1DjxVv298xn8L9rpLFhlVt4lzbYcJ1dvEe0V2RhzCeVLERmkwU9yXxyg
 7665WNofPjY+KEC/mZFl/FXCMO3GYWf7ImpnKNAqJAstPDZf6GR059wWurkmbZ+b7l4p
 sPz8ELKq5cBpIJLnVXSVM+tAvrG02vLejYC0rShFDwTgOreuozJKriHvuU4nylFLwyoz
 +UGdaQ8osAHHg7m3GwmJqxNuppqLkDnGfUCmyFpMRotoys7FkbERwlJnD1pt8grIfm0/
 +P1g==
X-Gm-Message-State: AOAM531cwffJZBtdUwEhFIhM8mOANZ2U32bAJBg7Gf8nVZfL+jYFAHJm
 hyn1vCcf5eiLsTwxnRIWbiLbAxOH0TWZdiTJ+gh3xQhv8djszHoYnqw=
X-Google-Smtp-Source: ABdhPJzb+EBPukn3GbzxYU+qEG0o4dB+aHk5I9ROfgzR5UQKgocQBhGcGc8XCXNMPNETdseSpMPO4w43z2g2MR0w+Qw=
X-Received: by 2002:a17:907:ea5:: with SMTP id
 ho37mr20036773ejc.355.1635146427727; 
 Mon, 25 Oct 2021 00:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211019080458.308969-1-jose.pekkarinen@unikie.com>
 <CAKcgs2yyKVhG6t=kuQtwyvsVpHMjjz73PLkF8mTH6qBc7BMVyw@mail.gmail.com>
In-Reply-To: <CAKcgs2yyKVhG6t=kuQtwyvsVpHMjjz73PLkF8mTH6qBc7BMVyw@mail.gmail.com>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Mon, 25 Oct 2021 10:20:16 +0300
Message-ID: <CAJPV9Mq=G_88-bNtxBp8Mq6yAjjN8iGE3eR06c+BqftQGPfDWA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7966998967514076073=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7966998967514076073==
Content-Type: multipart/alternative; boundary="000000000000fb191105cf283194"

--000000000000fb191105cf283194
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

Seems it is needed according to test-pkg, see the output:


In file included from OSSLComp.cpp:34:
OSSLComp.h:87:2: error: #error This OpenSSL version is incompatible with
EDDSA
  87 | #error This OpenSSL version is incompatible with EDDSA
     |  ^~~~~
libtool: compile:
 /home/pekkari/br-test-pkg/bootlin-armv5-uclibc/host/bin/arm-linux-g++
-DHAVE_CONFIG_H -I. -I../../.. -I./.. -I./../common -I./../data_mgr
-I./../pkcs11 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LA
RGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Os -g0 -Wall -Wextra
-fvisibility=3Dhidden -c OSSLDHPublicKey.cpp  -fPIC -DPIC -o
.libs/OSSLDHPublicKey.o
In file included from OSSLDH.cpp:38:
OSSLComp.h:87:2: error: #error This OpenSSL version is incompatible with
EDDSA
  87 | #error This OpenSSL version is incompatible with EDDSA
     |  ^~~~~
make[7]: *** [Makefile:865: OSSLComp.lo] Error 1
make[7]: *** Waiting for unfinished jobs....
In file included from OSSLDHPrivateKey.cpp:35:
OSSLComp.h:87:2: error: #error This OpenSSL version is incompatible with
EDDSA
  87 | #error This OpenSSL version is incompatible with EDDSA
     |  ^~~~~
libtool: compile:
 /home/pekkari/br-test-pkg/bootlin-armv5-uclibc/host/bin/arm-linux-g++
-DHAVE_CONFIG_H -I. -I../../.. -I./.. -I./../common -I./../data_mgr
-I./../pkcs11 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LA
RGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Os -g0 -Wall -Wextra
-fvisibility=3Dhidden -c OSSLDSA.cpp  -fPIC -DPIC -o .libs/OSSLDSA.o
In file included from OSSLDHPublicKey.cpp:35:
OSSLComp.h:87:2: error: #error This OpenSSL version is incompatible with
EDDSA
  87 | #error This OpenSSL version is incompatible with EDDSA
     |  ^~~~~
In file included from OSSLDSA.cpp:39:
OSSLComp.h:87:2: error: #error This OpenSSL version is incompatible with
EDDSA
  87 | #error This OpenSSL version is incompatible with EDDSA
     |  ^~~~~

$ cat softhsm2.config
BR2_PACKAGE_LIBRESSL=3Dy
BR2_PACKAGE_SOFTHSM2=3Dy

Best regards.


Jos=C3=A9.


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
>
>>
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
> +
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
>
>> +SOFTHSM2_SITE =3D https://dist.opendnssec.org/source
>> +SOFTHSM2_LICENSE =3D BSD-2-Clause
>> +SOFTHSM2_LICENSE_FILES =3D LICENSE
>> +SOFTHSM2_DEPENDENCIES =3D openssl
>> +SOFTHSM2_AUTORECONF =3D YES
>>
> you should explain why it is required, e.g. "no configure script provided=
"
>
> +SOFTHSM2_INSTALL_STAGING =3D YES
>> +
>> +$(eval $(autotools-package))
>> --
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>

--=20

Jos=C3=A9.

--000000000000fb191105cf283194
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 24, 2021 at 11:39 AM Gill=
es Talis &lt;<a href=3D"mailto:gilles.talis@gmail.com" target=3D"_blank">gi=
lles.talis@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-fa=
mily:arial,sans-serif;font-size:small">Hi Jos=C3=A9,<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. =
19 oct. 2021 =C3=A0=C2=A010:05, Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:=
jose.pekkarinen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">This patch adds a package for softhsm2.<br>
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
still a few things to fix in your patch.</div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
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
=3D"margin:0 0 0 40px;border:none;padding:0px">Seems it is needed according=
 to test-pkg, see the output:</blockquote><br>In file included from OSSLCom=
p.cpp:34:<br>OSSLComp.h:87:2: error: #error This OpenSSL version is incompa=
tible with EDDSA<br>=C2=A0 87 | #error This OpenSSL version is incompatible=
 with EDDSA<br>=C2=A0 =C2=A0 =C2=A0| =C2=A0^~~~~<br>libtool: compile: =C2=
=A0/home/pekkari/br-test-pkg/bootlin-armv5-uclibc/host/bin/arm-linux-g++ -D=
HAVE_CONFIG_H -I. -I../../.. -I./.. -I./../common -I./../data_mgr -I./../pk=
cs11 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_=
LARGEFILE_SOURCE -D_LA<br>RGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Os -g0=
 -Wall -Wextra -fvisibility=3Dhidden -c OSSLDHPublicKey.cpp =C2=A0-fPIC -DP=
IC -o .libs/OSSLDHPublicKey.o<br>In file included from OSSLDH.cpp:38:<br>OS=
SLComp.h:87:2: error: #error This OpenSSL version is incompatible with EDDS=
A<br>=C2=A0 87 | #error This OpenSSL version is incompatible with EDDSA<br>=
=C2=A0 =C2=A0 =C2=A0| =C2=A0^~~~~<br>make[7]: *** [Makefile:865: OSSLComp.l=
o] Error 1<br>make[7]: *** Waiting for unfinished jobs....<br>In file inclu=
ded from OSSLDHPrivateKey.cpp:35:<br>OSSLComp.h:87:2: error: #error This Op=
enSSL version is incompatible with EDDSA<br>=C2=A0 87 | #error This OpenSSL=
 version is incompatible with EDDSA<br>=C2=A0 =C2=A0 =C2=A0| =C2=A0^~~~~<br=
>libtool: compile: =C2=A0/home/pekkari/br-test-pkg/bootlin-armv5-uclibc/hos=
t/bin/arm-linux-g++ -DHAVE_CONFIG_H -I. -I../../.. -I./.. -I./../common -I.=
/../data_mgr -I./../pkcs11 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FIL=
E_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LA<br>RGEFILE64_SOURCE -D_FILE_OF=
FSET_BITS=3D64 -Os -g0 -Wall -Wextra -fvisibility=3Dhidden -c OSSLDSA.cpp =
=C2=A0-fPIC -DPIC -o .libs/OSSLDSA.o<br>In file included from OSSLDHPublicK=
ey.cpp:35:<br>OSSLComp.h:87:2: error: #error This OpenSSL version is incomp=
atible with EDDSA<br>=C2=A0 87 | #error This OpenSSL version is incompatibl=
e with EDDSA<br>=C2=A0 =C2=A0 =C2=A0| =C2=A0^~~~~<br>In file included from =
OSSLDSA.cpp:39:<br>OSSLComp.h:87:2: error: #error This OpenSSL version is i=
ncompatible with EDDSA<br>=C2=A0 87 | #error This OpenSSL version is incomp=
atible with EDDSA<br>=C2=A0 =C2=A0 =C2=A0| =C2=A0^~~~~<br>=C2=A0<br>$ cat s=
ofthsm2.config =C2=A0<br>BR2_PACKAGE_LIBRESSL=3Dy<br>BR2_PACKAGE_SOFTHSM2=
=3Dy<br><br><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"=
>Best regards.</blockquote><br><blockquote style=3D"margin:0 0 0 40px;borde=
r:none;padding:0px">Jos=C3=A9.<br><br></blockquote><div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div class=3D"gmail_quote"><div><div style=3D"font-family:arial,sans-serif;=
font-size:small"></div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
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
eck-package&quot; utility before pushing your patch.</div></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
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
as you are not interested in supporting botan.<br></div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
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
&gt; package/license</div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
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
equired as it is the default</div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+SOFTHSM2_SITE =3D <a href=3D"https://dist.opendnssec.org/source" rel=3D"no=
referrer" target=3D"_blank">https://dist.opendnssec.org/source</a><br>
+SOFTHSM2_LICENSE =3D BSD-2-Clause<br>
+SOFTHSM2_LICENSE_FILES =3D LICENSE<br>
+SOFTHSM2_DEPENDENCIES =3D openssl<br>
+SOFTHSM2_AUTORECONF =3D YES<br></blockquote><div><div style=3D"font-family=
:arial,sans-serif;font-size:small">you should explain why it is required, e=
.g. &quot;no configure script provided&quot;</div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
+SOFTHSM2_INSTALL_STAGING =3D YES<br>
+<br>
+$(eval $(autotools-package))<br>
-- <br>
2.25.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0px 40px;border:none;=
padding:0px">Jos=C3=A9.</blockquote></div></div></div></div>

--000000000000fb191105cf283194--

--===============7966998967514076073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7966998967514076073==--
