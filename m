Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3343C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 08:39:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15BE160F46
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 08:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15BE160F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8846605A7;
	Sun, 24 Oct 2021 08:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJU_rRhy7Wqd; Sun, 24 Oct 2021 08:39:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DB2F605BE;
	Sun, 24 Oct 2021 08:39:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B79641BF37B
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 08:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A73C6605BE
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 08:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q5AyeRBC35OE for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 08:39:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FCAB605A7
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 08:39:05 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id b4so3897807uaq.9
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 01:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VkfdHDkKE1VLDEEQ47BJ1g9zfOTBNpcjBCWefdgHWEo=;
 b=VdiqoB/rtADaQkX0HT7KBiBQQn7lgkAbV1JhejxncPwnQjHXF9k61sGyy8u42WVyUT
 cIcJDdZPmXhR3Pt7o3jDVKASLfZStUqOa+1Rz35Lotagbe9cXPy3QdmUmATLFAqpaRIK
 WoZPQjIeP6lfpUCuPBZBduAwto2O+NqqIJ6AG2vjTsfS8dBPV0wEi3pN5HrJ905nbW85
 fzjlT1wa9ftWaZ9/KV6NwNbeWk5SWbUdiDWvH1NuHnM8kpKh6Of7noT0VwsZLPjrE1T3
 ssICTiSufuYqYso1pc79Ux5O70Mvh9q8EX416Dg3Y+sDYtey6bAXs+0ELxr5Jy9+sQkx
 f9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VkfdHDkKE1VLDEEQ47BJ1g9zfOTBNpcjBCWefdgHWEo=;
 b=afLV6N9AZNlGVXkcFLCP4hDlbJHRKqj7Gc9zD5QSqyv53z0IK7o0kjCXyhs6AHJ/ou
 sd5X2xWhR5fdC3e4eIcDOv1XcCKz5Vjf9CUQ/DPg4W5CfE0dXIlreSTwDqjwRgeneQvJ
 FLoiACqBcViwego/tkCmK7wZwPr77XvTARziTioOnYwUzUOAtdE5aDI7CUAOQ8l7PRtM
 t20vIGShr+LLbdTg4lWn5AcD/H2sJL+8qCBhrzU4V40AeumCaN7rzyWbvyie4p5vywtf
 XOb3b30oHWLGdB0iO7E39Zc3RV4HLaHJnUvTHFi/Db3JlJEEkr2Y3PrPtMcLCQ3ymWtI
 zgzg==
X-Gm-Message-State: AOAM533OTLrmtSnjukTr3p/Nw6pqFjUT3/6ZSgwGEx2qPBL6mUjFSFne
 Ql0ivV6TV8bfFVDaz4V1A76G6uVwnNO2YhBSlJk=
X-Google-Smtp-Source: ABdhPJyNqaXwq/HKTPtv4PeA6hKjPqtFGiSl34zXighsraHu7fOZCBdrj2V7VmOBxLRdURqqWqR9IVQfGaIDw/RY9/E=
X-Received: by 2002:a67:26c2:: with SMTP id m185mr9484543vsm.2.1635064743670; 
 Sun, 24 Oct 2021 01:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211019080458.308969-1-jose.pekkarinen@unikie.com>
In-Reply-To: <20211019080458.308969-1-jose.pekkarinen@unikie.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 24 Oct 2021 10:38:52 +0200
Message-ID: <CAKcgs2yyKVhG6t=kuQtwyvsVpHMjjz73PLkF8mTH6qBc7BMVyw@mail.gmail.com>
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
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
Content-Type: multipart/mixed; boundary="===============0437561735679142192=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0437561735679142192==
Content-Type: multipart/alternative; boundary="0000000000003b35c105cf152de2"

--0000000000003b35c105cf152de2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jos=C3=A9,

Le mar. 19 oct. 2021 =C3=A0 10:05, Jos=C3=A9 Pekkarinen <jose.pekkarinen@un=
ikie.com>
a =C3=A9crit :

> This patch adds a package for softhsm2.
>
> Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> ---
> [ v1 -> v2 ]
>   - Added hash file and license information
>   - Moved recipe to use tarball
>   - Provided support to build against different ssl libraries
>   - Fixed toolchain dependencies and ssl select
>   - Referenced the package in package/Config.in
>   - Added myself as developer
>
thanks for this update. There are still a few things to fix in your patch.


>  DEVELOPERS                     |  3 +++
>  package/Config.in              |  1 +
>  package/softhsm2/Config.in     | 35 ++++++++++++++++++++++++++++++++++
>  package/softhsm2/softhsm2.hash |  4 ++++
>  package/softhsm2/softhsm2.mk   | 16 ++++++++++++++++
>  5 files changed, 59 insertions(+)
>  create mode 100644 package/softhsm2/Config.in
>  create mode 100644 package/softhsm2/softhsm2.hash
>  create mode 100644 package/softhsm2/softhsm2.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f6c39516b5..83d20d56cc 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2927,3 +2927,6 @@ F:        package/qjson/
>  F:     package/quazip/
>  F:     package/shapelib/
>  F:     package/tinc/
> +
> +N:     Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> +F:     package/softhsm2/
> diff --git a/package/Config.in b/package/Config.in
> index 7971726875..4f9cd38a97 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2019,6 +2019,7 @@ menu "Security"
>         source "package/libsemanage/Config.in"
>         source "package/libsepol/Config.in"
>         source "package/safeclib/Config.in"
> +       source "package/softhsm2/Config.in"
>  endmenu
>
>  menu "Text and terminal handling"
> diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in
> new file mode 100644
> index 0000000000..e4ca75de12
> --- /dev/null
> +++ b/package/softhsm2/Config.in
> @@ -0,0 +1,35 @@
> +config BR2_PACKAGE_SOFTHSM2
> +       bool "softhsm2"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +       depends on !BR2_STATIC_LIBS # dlopen()
> +       select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>
I know I somewhat confused you in my first review :-) But did you check
whether your package could work with libressl. If it does, you do not need
the select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL.
Please refer to Arnout's comment on the first version of your patch.

+       help
> +         SoftHSM is an implementation of a cryptographic store
> +         accessible through a PKCS#11 interface. You can use it
> +         to explore PKCS#11 without having a Hardware Security
> +         Module.
> +
> +               https://www.opendnssec.org/softhsm

The upstream url should have the same indentation as the help text above.
Please make sure you run the "./utils/check-package" utility before pushing
your patch.


>
> +
> +choice
> +       prompt "SSL/TLS library to use"
> +
> +config BR2_PACKAGE_SOFTHSM2_OPENSSL
> +       bool "OpenSSL"
> +       depends on BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSS=
L
> +
> +config BR2_PACKAGE_SOFTHSM2_BEARSSL
> +       bool "BearSSL"
> +       depends on BR2_PACKAGE_BEARSSL
> +
> +config BR2_PACKAGE_SOFTHSM2_WOLFSSL
> +       bool "WolfSSL"
> +       depends on BR2_PACKAGE_WOLFSSL
> +       select BR2_PACKAGE_WOLFSSL_ALL
> +
> +endchoice
>
This is not required. You can get rid of the choice menu, as you are not
interested in supporting botan.

+
> +comment "softhsm2 needs a toolchain with dynamic library"
>
a few comments there:
1) this should appear conditionally so you should mention the dependencies.
Please refer to other packages that have the same type of constraints.
2) you should mention the CPP and C++11 requirements ("sofhsm2 needs a
toolchain w/ C++, gcc >=3D 4.8 and dynamic library support")


> diff --git a/package/softhsm2/softhsm2.hash
> b/package/softhsm2/softhsm2.hash
> new file mode 100644
> index 0000000000..a33e0d7e6f
> --- /dev/null
> +++ b/package/softhsm2/softhsm2.hash
> @@ -0,0 +1,4 @@
> +# From https://www.opendnssec.org/2020/04/1602/
> +sha256 61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614df475f2
> softhsm-2.6.1.tar.gz
> +# Locally computed
> +sha256 230cab7102816e99f7ce03ef476352fcad09d742fcbc6580d44393db6280b64c
> LICENSE
>
the correct indentation is
sha256 <2 spaces> sha256sum <2 spaces> package/license

diff --git a/package/softhsm2/softhsm2.mk b/package/softhsm2/softhsm2.mk
> new file mode 100644
> index 0000000000..4b47def3bf
> --- /dev/null
> +++ b/package/softhsm2/softhsm2.mk
> @@ -0,0 +1,16 @@
>
> +########################################################################=
########
> +#
> +# softhsm2
> +#
>
> +########################################################################=
########
> +
> +SOFTHSM2_VERSION =3D 2.6.1
> +SOFTHSM2_SOURCE =3D softhsm-$(SOFTHSM2_VERSION).tar.gz
>
This is not required as it is the default


> +SOFTHSM2_SITE =3D https://dist.opendnssec.org/source
> +SOFTHSM2_LICENSE =3D BSD-2-Clause
> +SOFTHSM2_LICENSE_FILES =3D LICENSE
> +SOFTHSM2_DEPENDENCIES =3D openssl
> +SOFTHSM2_AUTORECONF =3D YES
>
you should explain why it is required, e.g. "no configure script provided"

+SOFTHSM2_INSTALL_STAGING =3D YES
> +
> +$(eval $(autotools-package))
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000003b35c105cf152de2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small">Hi Jos=C3=A9,<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0m=
ar. 19 oct. 2021 =C3=A0=C2=A010:05, Jos=C3=A9 Pekkarinen &lt;<a href=3D"mai=
lto:jose.pekkarinen@unikie.com">jose.pekkarinen@unikie.com</a>&gt; a =C3=A9=
crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This=
 patch adds a package for softhsm2.<br>
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
family:arial,sans-serif;font-size:small" class=3D"gmail_default">thanks for=
 this update. There are still a few things to fix in your patch.</div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
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
if;font-size:small" class=3D"gmail_default">I know I somewhat confused you =
in my first review :-) But did you check whether your package could work wi=
th libressl. If it does, you do not need the <span class=3D"gmail_default" =
style=3D"font-family:arial,sans-serif;font-size:small"></span>select BR2_PA=
CKAGE_OPENSSL_FORCE_LIBOPENSSL.</div><div style=3D"font-family:arial,sans-s=
erif;font-size:small" class=3D"gmail_default">Please refer to Arnout&#39;s =
comment on the first version of your patch.<br></div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
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
al,sans-serif;font-size:small" class=3D"gmail_default">The upstream url sho=
uld have the same indentation as the help text above. Please make sure you =
run the &quot;./utils/check-package&quot; utility before pushing your patch=
.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
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
font-size:small" class=3D"gmail_default">This is not required. You can get =
rid of the choice menu, as you are not interested in supporting botan.<br><=
/div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+comment &quot;softhsm2 needs a toolchain with dynamic library&quot;<br></b=
lockquote><div><div style=3D"font-family:arial,sans-serif;font-size:small" =
class=3D"gmail_default">a few comments there:<br></div><div style=3D"font-f=
amily:arial,sans-serif;font-size:small" class=3D"gmail_default">1) this sho=
uld appear conditionally so you should mention the dependencies. Please ref=
er to other packages that have the same type of constraints.<br></div><div =
style=3D"font-family:arial,sans-serif;font-size:small" class=3D"gmail_defau=
lt">2) you should mention the CPP and C++11 requirements (&quot;sofhsm2 nee=
ds a toolchain w/ C++, gcc &gt;=3D 4.8 and dynamic library support&quot;)<b=
r></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
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
size:small" class=3D"gmail_default">the correct indentation is</div><div st=
yle=3D"font-family:arial,sans-serif;font-size:small" class=3D"gmail_default=
">sha256 &lt;2 spaces&gt; sha256sum &lt;2 spaces&gt; package/license</div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
v><div style=3D"font-family:arial,sans-serif;font-size:small" class=3D"gmai=
l_default">This is not required as it is the default</div></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
+SOFTHSM2_SITE =3D <a href=3D"https://dist.opendnssec.org/source" rel=3D"no=
referrer" target=3D"_blank">https://dist.opendnssec.org/source</a><br>
+SOFTHSM2_LICENSE =3D BSD-2-Clause<br>
+SOFTHSM2_LICENSE_FILES =3D LICENSE<br>
+SOFTHSM2_DEPENDENCIES =3D openssl<br>
+SOFTHSM2_AUTORECONF =3D YES<br></blockquote><div><div style=3D"font-family=
:arial,sans-serif;font-size:small" class=3D"gmail_default">you should expla=
in why it is required, e.g. &quot;no configure script provided&quot;</div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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

--0000000000003b35c105cf152de2--

--===============0437561735679142192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0437561735679142192==--
