Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC9EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 11:14:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3048260F46
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 11:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3048260F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9EA04018A;
	Sun, 17 Oct 2021 11:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHCB_PB5w648; Sun, 17 Oct 2021 11:14:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E54E4027A;
	Sun, 17 Oct 2021 11:14:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 029D01BF5AD
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 11:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E65B980CAB
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 11:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2LOuvxC6tnxE for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 11:14:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2C4783089
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 11:14:05 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id f3so2495328uap.6
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 04:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eVDYP6BpCXAYiILB6z9BQiEKBsqtNR0j1j0LUqrby3I=;
 b=DcSq6KVCayGLfk//Wu42WJEv+1oxyhX15Rm2T+KAZq9UwtrBYhWDcnW5Xm4oX2CKDJ
 uDbNVvsfB+dLGzy6wrQwb+RzBELAo5j/BCw/n60yf+JOTGEhfV4WCovehnDjJwGoiSkP
 Y7mrgVLKNq//0MYAwJdlo9NoaL9zu98WrzvZeVF1eg1Q2Y4Z+GmH8yoa/n6rLlPA2t+z
 GZ7ggdl14C3Ue8GQUuevDVfS8HkUI4fxUdUPqJ7Raoq0EUEjWXJYJ9rhe6mj28JVWLKb
 k0Z6URBZSJ9NaaOurLUmBLNpgzWHr1Y27xNuZCykQLFgaoQwbDP60sWopzuUINRr+pEo
 iXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eVDYP6BpCXAYiILB6z9BQiEKBsqtNR0j1j0LUqrby3I=;
 b=F8KQQ7vxFBb0pJwLDX5dnuG9Injx9uE1frWu5H/43uvOfHhG8yDf9GBdIgA7g++k3z
 cXyCWCIUgVHzPy0oZbxUcqxYXXWykr1Cp1isLA0xQ07zTMpQe8rt/w+COkkVcqaJAdi+
 iMF+A2oicW/bEyYQEYk3sDksAgyZ5BWfebLowBGoanU3PtkeiGXTybgT7dtfvGXWjEWE
 mZ2+TxcFX8aHNZAT0FtnarbXZW612tcfjuGGdQPKQqKGE5OqeoZSkQw0XpRede5l85ks
 c3HheCC1YaLACOGk73C47NQay+XCQjHM4D1y9wlaVCz1PunU3hnxsoscoEfxO74sAtW3
 MI5g==
X-Gm-Message-State: AOAM532uS5t5qSCeweqNSmxnINsXUt3t66JP0/4vHo0J4EZkn2tQEZkL
 Es2b0p18WnfrtjeIB+BV5W1XaWFuNgPxCf2PcEwO2az4KRU=
X-Google-Smtp-Source: ABdhPJznPXl99ov4bbBSb3ujQYcwuuTE5PownOXPT10kti1raIK9fZhmo0DNdd2+8yEOHGirr4nIZL/g0lke1Z14hks=
X-Received: by 2002:a67:df07:: with SMTP id s7mr22717088vsk.42.1634469244684; 
 Sun, 17 Oct 2021 04:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211015083830.1971193-1-jose.pekkarinen@unikie.com>
In-Reply-To: <20211015083830.1971193-1-jose.pekkarinen@unikie.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 17 Oct 2021 13:13:53 +0200
Message-ID: <CAKcgs2zBHeE_G-LA6dsCRZpLvx6Ox9mf6s_d347cZO+fJZbfxA@mail.gmail.com>
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Subject: Re: [Buildroot] [PATCH] package/softhsm2: new package
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
Content-Type: multipart/mixed; boundary="===============3011202243305685020=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3011202243305685020==
Content-Type: multipart/alternative; boundary="000000000000b9cced05ce8a8689"

--000000000000b9cced05ce8a8689
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jos=C3=A9,

Le ven. 15 oct. 2021 =C3=A0 10:39, Jos=C3=A9 Pekkarinen <jose.pekkarinen@un=
ikie.com>
a =C3=A9crit :

> The patch adds a basic config file and a basic
> recipe to build softhsm2.
>
> Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
>
Thanks for your contribution.


> ---
>  package/softhsm2/Config.in   |  8 ++++++++
>  package/softhsm2/softhsm2.mk | 15 +++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 package/softhsm2/Config.in
>  create mode 100644 package/softhsm2/softhsm2.mk

You miss a few things here:
1)  an entry to the package/Config,in file that provides a link to your
package, thus a way to find it and select it. In your case, it would go
under "Security" menu.
2) a file that contains the hash sum of the package and its license file.
3) an entry to the DEVELOPERS file with your name and package.


> diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in
> new file mode 100644
> index 0000000000..10c9f0e557
> --- /dev/null
> +++ b/package/softhsm2/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_SOFTHSM2
> +       bool "softhsm2"
>
what's a bit confusing is that the package name is SoftHSM on the
opendnssec website, but called SoftHSM version 2 on github. I assume we
could go for SoftHSM2


> +       depends on BR2_PACKAGE_LIBOPENSSL
>
Even though the package has openssl as a dependency, "select
BR2_PACKAGE_LIBOPENSSL" is more appropriate here. It means that openssl
will be automatically selected when softhsm2 is selected. "depends on"
means that your package will not appear in the list if openssl is not
already slected.
By the way, it seems like botan is a potential crypto library dependency.
If you want to give the user the choice between the crypto libraries to
use, please have a look at package/libcurl/Config.in in the "choice"
section.


> +       select BR2_PACKAGE_LIBTOOL
>
libtool does not need to be selected. buildroot build system will take care
of installing it for you.


> +       help
> +               SoftHSM is an implementation of a cryptographic store
> accessible through a PKCS\#11 interface. You can use it to explore PKCS\#=
11
> without having a Hardware Security Module.
>
The help text should be indented with one tab and two spaces, lines should
be wrapped to fit 72 columns, where tab counts for 8, so 62 characters in
the text itself. You don't need the "\" before the #11


> +
> +               https://github.com/opendnssec/SoftHSMv2

It seems like https://www.opendnssec.org/softhsm/ is the actual SoftHSM
home page.


> diff --git a/package/softhsm2/softhsm2.mk b/package/softhsm2/softhsm2.mk
> new file mode 100644
> index 0000000000..4496d70c3d
> --- /dev/null
> +++ b/package/softhsm2/softhsm2.mk
> @@ -0,0 +1,15 @@
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
> +SOFTHSM2_SITE =3D $(call github,opendnssec,SoftHSMv2,$(SOFTHSM2_VERSION)=
)
>
The home page provides a tarball in (
https://www.opendnssec.org/2020/04/1602/). We prefer to work with already
packaged tarballs.

+SOFTHSM2_LICENSE =3D GPL-2
>
It is actually BSD-2-Clause

+SOFTHSM2_LICENSE_FILES =3D LICENSE
> +SOFTHSM2_DEPENDENCIES =3D libtool openssl
>
As mentioned above, you do not need to mention libtool as a dependency.

+SOFTHSM2_AUTORECONF =3D YES
> +SOFTHSM2_INSTALL_TARGET =3D YES
>
It seems like SoftHSM also provides a library. In that case, you will need
a SOFTHSM2_INSTALL_STAGING =3D YES as well.


> +
> +$(eval $(autotools-package))
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Can you please review my comments and send a second version?
When in doubt, please consult the documentation:
https://buildroot.org/downloads/manual/manual.html#adding-packages

I would also recommend you run the following utilities to verify that your
patch is correct:
1) check-package (
https://buildroot.org/downloads/manual/manual.html#check-package) to check
the coding style of added files
2) test-pkg (chapter 18.24.3 of the buildroot documentation) to check if
your package can build in various configurations.

Thanks
Gilles.

--000000000000b9cced05ce8a8689
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small">Hi Jos=C3=A9,<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0v=
en. 15 oct. 2021 =C3=A0=C2=A010:39, Jos=C3=A9 Pekkarinen &lt;<a href=3D"mai=
lto:jose.pekkarinen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.co=
m</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">The patch adds a basic config file and a basic<br>
recipe to build softhsm2.<br>
<br>
Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@u=
nikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br></blockq=
uote><div><div style=3D"font-family:arial,sans-serif;font-size:small" class=
=3D"gmail_default">Thanks for your contribution.</div></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0package/softhsm2/Config.in=C2=A0 =C2=A0|=C2=A0 8 ++++++++<br>
=C2=A0package/softhsm2/<a href=3D"http://softhsm2.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">softhsm2.mk</a> | 15 +++++++++++++++<br>
=C2=A02 files changed, 23 insertions(+)<br>
=C2=A0create mode 100644 package/softhsm2/Config.in<br>
=C2=A0create mode 100644 package/softhsm2/<a href=3D"http://softhsm2.mk" re=
l=3D"noreferrer" target=3D"_blank">softhsm2.mk</a></blockquote><div><div st=
yle=3D"font-family:arial,sans-serif;font-size:small" class=3D"gmail_default=
">You miss a few things here:</div><div style=3D"font-family:arial,sans-ser=
if;font-size:small" class=3D"gmail_default">1)=C2=A0 an entry to the packag=
e/Config,in file that provides a link to your package, thus a way to find i=
t and select it. In your case, it would go under &quot;Security&quot; menu.=
</div><div style=3D"font-family:arial,sans-serif;font-size:small" class=3D"=
gmail_default">2) a file that contains the hash sum of the package and its =
license file.<br></div><div style=3D"font-family:arial,sans-serif;font-size=
:small" class=3D"gmail_default">3) an entry to the DEVELOPERS file with you=
r name and package.<br></div></div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in<br>
new file mode 100644<br>
index 0000000000..10c9f0e557<br>
--- /dev/null<br>
+++ b/package/softhsm2/Config.in<br>
@@ -0,0 +1,8 @@<br>
+config BR2_PACKAGE_SOFTHSM2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;softhsm2&quot;<br></blockquote><div>=
<div style=3D"font-family:arial,sans-serif;font-size:small" class=3D"gmail_=
default">what&#39;s a bit confusing is that the package name is SoftHSM on =
the opendnssec website, but called SoftHSM version 2 on github. I assume we=
 could go for SoftHSM2</div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBOPENSSL<br></blockquo=
te><div><div style=3D"font-family:arial,sans-serif;font-size:small" class=
=3D"gmail_default">Even though the package has openssl as a dependency, &qu=
ot;select BR2_PACKAGE_LIBOPENSSL&quot; is more appropriate here. It means t=
hat openssl will be automatically selected when softhsm2 is selected. &quot=
;depends on&quot; means that your package will not appear in the list if op=
enssl is not already slected.</div><div style=3D"font-family:arial,sans-ser=
if;font-size:small" class=3D"gmail_default">By the way, it seems like botan=
 is a potential crypto library dependency. If you want to give the user the=
 choice between the crypto libraries to use, please have a look at package/=
libcurl/Config.in in the &quot;choice&quot; section.<br></div></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBTOOL<br></blockquote><div=
><div style=3D"font-family:arial,sans-serif;font-size:small" class=3D"gmail=
_default">libtool does not need to be selected. buildroot build system will=
 take care of installing it for you.</div></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SoftHSM is an imple=
mentation of a cryptographic store accessible through a PKCS\#11 interface.=
 You can use it to explore PKCS\#11 without having a Hardware Security Modu=
le.<br></blockquote><div><div style=3D"font-family:arial,sans-serif;font-si=
ze:small" class=3D"gmail_default">The help text should be indented with one=
 tab and two spaces, lines should
be wrapped to fit 72 columns, where tab counts for 8, so 62 characters
in the text itself. You don&#39;t need the &quot;\&quot; before the #11<br>=
</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://=
github.com/opendnssec/SoftHSMv2" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/opendnssec/SoftHSMv2</a></blockquote><div><div style=3D"font-=
family:arial,sans-serif;font-size:small" class=3D"gmail_default">It seems l=
ike <a href=3D"https://www.opendnssec.org/softhsm/">https://www.opendnssec.=
org/softhsm/</a> is the actual SoftHSM home page.</div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><br>
diff --git a/package/softhsm2/<a href=3D"http://softhsm2.mk" rel=3D"norefer=
rer" target=3D"_blank">softhsm2.mk</a> b/package/softhsm2/<a href=3D"http:/=
/softhsm2.mk" rel=3D"noreferrer" target=3D"_blank">softhsm2.mk</a><br>
new file mode 100644<br>
index 0000000000..4496d70c3d<br>
--- /dev/null<br>
+++ b/package/softhsm2/<a href=3D"http://softhsm2.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">softhsm2.mk</a><br>
@@ -0,0 +1,15 @@<br>
+##########################################################################=
######<br>
+#<br>
+# softhsm2<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+SOFTHSM2_VERSION =3D 2.6.1<br>
+SOFTHSM2_SITE =3D $(call github,opendnssec,SoftHSMv2,$(SOFTHSM2_VERSION))<=
br></blockquote><div><div style=3D"font-family:arial,sans-serif;font-size:s=
mall" class=3D"gmail_default">The home page provides a tarball in (<a href=
=3D"https://www.opendnssec.org/2020/04/1602/">https://www.opendnssec.org/20=
20/04/1602/</a>). We prefer to work with already packaged tarballs.</div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+SOFTHSM2_LICENSE =3D GPL-2<br></blockquote><div><div style=3D"font-family:=
arial,sans-serif;font-size:small" class=3D"gmail_default">It is actually BS=
D-2-Clause</div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
+SOFTHSM2_LICENSE_FILES =3D LICENSE<br>
+SOFTHSM2_DEPENDENCIES =3D libtool openssl<br></blockquote><div><div style=
=3D"font-family:arial,sans-serif;font-size:small" class=3D"gmail_default">A=
s mentioned above, you do not need to mention libtool as a dependency.</div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+SOFTHSM2_AUTORECONF =3D YES<br>
+SOFTHSM2_INSTALL_TARGET =3D YES<br></blockquote><div><div style=3D"font-fa=
mily:arial,sans-serif;font-size:small" class=3D"gmail_default">It seems lik=
e SoftHSM also provides a library. In that case, you will need a SOFTHSM2_I=
NSTALL_STAGING =3D YES as well.</div></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
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
uildroot</a></blockquote><div><div style=3D"font-family:arial,sans-serif;fo=
nt-size:small" class=3D"gmail_default"></div><div style=3D"font-family:aria=
l,sans-serif;font-size:small" class=3D"gmail_default">Can you please review=
 my comments and send a second version?</div><div style=3D"font-family:aria=
l,sans-serif;font-size:small" class=3D"gmail_default">When in doubt, please=
 consult the documentation: <a href=3D"https://buildroot.org/downloads/manu=
al/manual.html#adding-packages">https://buildroot.org/downloads/manual/manu=
al.html#adding-packages</a></div><div style=3D"font-family:arial,sans-serif=
;font-size:small" class=3D"gmail_default"><br></div><div style=3D"font-fami=
ly:arial,sans-serif;font-size:small" class=3D"gmail_default">I would also r=
ecommend you run the following utilities to verify that your patch is corre=
ct:<br></div><div style=3D"font-family:arial,sans-serif;font-size:small" cl=
ass=3D"gmail_default">1) check-package (<a href=3D"https://buildroot.org/do=
wnloads/manual/manual.html#check-package">https://buildroot.org/downloads/m=
anual/manual.html#check-package</a>) to check the coding style of added fil=
es</div><div style=3D"font-family:arial,sans-serif;font-size:small" class=
=3D"gmail_default">2) test-pkg (chapter 18.24.3 of the buildroot documentat=
ion) to check if your package can build in various configurations.</div><di=
v style=3D"font-family:arial,sans-serif;font-size:small" class=3D"gmail_def=
ault"><br></div><div style=3D"font-family:arial,sans-serif;font-size:small"=
 class=3D"gmail_default">Thanks</div><div style=3D"font-family:arial,sans-s=
erif;font-size:small" class=3D"gmail_default">Gilles.<br></div><br></div><d=
iv>=C2=A0</div></div></div>

--000000000000b9cced05ce8a8689--

--===============3011202243305685020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3011202243305685020==--
