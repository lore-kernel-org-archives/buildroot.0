Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F277EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 11:28:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EDFC61247
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 11:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EDFC61247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15B12606BD;
	Sun, 17 Oct 2021 11:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBMDn8oGOBqN; Sun, 17 Oct 2021 11:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10B2B60851;
	Sun, 17 Oct 2021 11:28:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F6821BF5AD
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 11:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6477B60851
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 11:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yUuv6RZQL-2B for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 11:27:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0092E606BD
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 11:27:57 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id r17so2452513uaf.8
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 04:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OMpDLqeXAtHWVXk+p0uAHseo1w0Bx6O1CYf52nr9wyQ=;
 b=F8HRCyl6Dk/sMlRhmhZdlQKOLO9yvsdGIp1BMU2KMzzyJ9lJqJUU7Cl2nalBsbGKwS
 ux1cBN6aF7S0gE1UWhw+fwkLi/A6xF2xoYsWaR5/Xth64F6ddg7GDeGLk8a7loXaUn5b
 6nFAiie4i/j6QKoJ+PDRz+b4QKxLIo7Vqy83XeCCVoxlKnWPCsqARoaRmN2+TErtHfFK
 ZUmO+ztepBfvqZ4rO7725+/YRuLhrT8zUTl0QpYJ8jdk9dYtVt9MVZsk9oBA9QYHC7du
 6GAach07mkiNRcp1QztYsuiPa9v6lQxxkaiGFwJZl1KXMXe52t2JnBwkoaIhMG5WzQqB
 3b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OMpDLqeXAtHWVXk+p0uAHseo1w0Bx6O1CYf52nr9wyQ=;
 b=sq9D7bI5B0t1bsLg4zCUtLc0FIyDuPlaMsmTdgjt5HoftIQFcW8B/WHKZBvGEuAYk1
 80D/YMqUtEO65Bdi0TX53D7zaNjPII0VSqWej4qtQrKQleKgQOmyfCIlH74EbFU8OWPz
 TBl5N+0uDqeddNp0vX6g9onRkgsFbI4fvThRrX5VN940NdAoyHz6bFh4IZWYJP9BKHNd
 qZr4F/TCfNJA2CPDcix2awMJEBYCVpmwS6GkzcW24vPhWkKXBlS2aMaBWGts1MnQU0J9
 6dUBza41dCSgQxY/Id9UMu0CHd6rqcAjVveYLoTvTPZK6JDSwy6F3GW9OQvcSYRc2Ip6
 TgaQ==
X-Gm-Message-State: AOAM530+xKxCyybPaBK+BrtBimJhbZlCREb3SA45nIA6PFl2yTzQhKu6
 g9oUIqAVQhZpmuHYKGHth7cb2H+NGkHfolgcSGpiqsrIqLA=
X-Google-Smtp-Source: ABdhPJz83/SQ2Xz9l7lA2V6tJbmy/wC23+zPUxVHiuuKrAdQ5Y+K05kMbNW7/ikJ/nxfKTZSZXAAzh5E2pu9+aOCr2c=
X-Received: by 2002:a67:d996:: with SMTP id u22mr23276502vsj.12.1634470076882; 
 Sun, 17 Oct 2021 04:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211015083830.1971193-1-jose.pekkarinen@unikie.com>
 <CAKcgs2zBHeE_G-LA6dsCRZpLvx6Ox9mf6s_d347cZO+fJZbfxA@mail.gmail.com>
In-Reply-To: <CAKcgs2zBHeE_G-LA6dsCRZpLvx6Ox9mf6s_d347cZO+fJZbfxA@mail.gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 17 Oct 2021 13:27:45 +0200
Message-ID: <CAKcgs2xDOJCJZF_-_=hYp_7JsATUOiqXpeZ+=+DTPkJeWV1=uQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0555923115458007591=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0555923115458007591==
Content-Type: multipart/alternative; boundary="0000000000005420f805ce8ab803"

--0000000000005420f805ce8ab803
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jos=C3=A9,

Le dim. 17 oct. 2021 =C3=A0 13:13, Gilles Talis <gilles.talis@gmail.com> a
=C3=A9crit :

> Hi Jos=C3=A9,
>
> Le ven. 15 oct. 2021 =C3=A0 10:39, Jos=C3=A9 Pekkarinen <jose.pekkarinen@=
unikie.com>
> a =C3=A9crit :
>
>> The patch adds a basic config file and a basic
>> recipe to build softhsm2.
>>
>> Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
>>
> Thanks for your contribution.
>
>
>> ---
>>  package/softhsm2/Config.in   |  8 ++++++++
>>  package/softhsm2/softhsm2.mk | 15 +++++++++++++++
>>  2 files changed, 23 insertions(+)
>>  create mode 100644 package/softhsm2/Config.in
>>  create mode 100644 package/softhsm2/softhsm2.mk
>
> You miss a few things here:
> 1)  an entry to the package/Config,in file that provides a link to your
> package, thus a way to find it and select it. In your case, it would go
> under "Security" menu.
> 2) a file that contains the hash sum of the package and its license file.
> 3) an entry to the DEVELOPERS file with your name and package.
>
>
>> diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in
>> new file mode 100644
>> index 0000000000..10c9f0e557
>> --- /dev/null
>> +++ b/package/softhsm2/Config.in
>> @@ -0,0 +1,8 @@
>> +config BR2_PACKAGE_SOFTHSM2
>> +       bool "softhsm2"
>>
> what's a bit confusing is that the package name is SoftHSM on the
> opendnssec website, but called SoftHSM version 2 on github. I assume we
> could go for SoftHSM2
>
>
>> +       depends on BR2_PACKAGE_LIBOPENSSL
>>
> Even though the package has openssl as a dependency, "select
> BR2_PACKAGE_LIBOPENSSL" is more appropriate here. It means that openssl
> will be automatically selected when softhsm2 is selected. "depends on"
> means that your package will not appear in the list if openssl is not
> already slected.
> By the way, it seems like botan is a potential crypto library dependency.
> If you want to give the user the choice between the crypto libraries to
> use, please have a look at package/libcurl/Config.in in the "choice"
> section.
>
>
>> +       select BR2_PACKAGE_LIBTOOL
>>
> libtool does not need to be selected. buildroot build system will take
> care of installing it for you.
>
>
>> +       help
>> +               SoftHSM is an implementation of a cryptographic store
>> accessible through a PKCS\#11 interface. You can use it to explore PKCS\=
#11
>> without having a Hardware Security Module.
>>
> The help text should be indented with one tab and two spaces, lines shoul=
d
> be wrapped to fit 72 columns, where tab counts for 8, so 62 characters in
> the text itself. You don't need the "\" before the #11
>
>
>> +
>> +               https://github.com/opendnssec/SoftHSMv2
>
> It seems like https://www.opendnssec.org/softhsm/ is the actual SoftHSM
> home page.
>
>
>> diff --git a/package/softhsm2/softhsm2.mk b/package/softhsm2/softhsm2.mk
>> new file mode 100644
>> index 0000000000..4496d70c3d
>> --- /dev/null
>> +++ b/package/softhsm2/softhsm2.mk
>> @@ -0,0 +1,15 @@
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
>> +SOFTHSM2_SITE =3D $(call github,opendnssec,SoftHSMv2,$(SOFTHSM2_VERSION=
))
>>
> The home page provides a tarball in (
> https://www.opendnssec.org/2020/04/1602/). We prefer to work with already
> packaged tarballs.
>
> +SOFTHSM2_LICENSE =3D GPL-2
>>
> It is actually BSD-2-Clause
>
> +SOFTHSM2_LICENSE_FILES =3D LICENSE
>> +SOFTHSM2_DEPENDENCIES =3D libtool openssl
>>
> As mentioned above, you do not need to mention libtool as a dependency.
>
> +SOFTHSM2_AUTORECONF =3D YES
>> +SOFTHSM2_INSTALL_TARGET =3D YES
>>
> It seems like SoftHSM also provides a library. In that case, you will nee=
d
> a SOFTHSM2_INSTALL_STAGING =3D YES as well.
>
>
>> +
>> +$(eval $(autotools-package))
>> --
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>
> Can you please review my comments and send a second version?
> When in doubt, please consult the documentation:
> https://buildroot.org/downloads/manual/manual.html#adding-packages
>
> I would also recommend you run the following utilities to verify that you=
r
> patch is correct:
> 1) check-package (
> https://buildroot.org/downloads/manual/manual.html#check-package) to
> check the coding style of added files
> 2) test-pkg (chapter 18.24.3 of the buildroot documentation) to check if
> your package can build in various configurations.
>
> Thanks
> Gilles.
>
I forgot to mention that your package is written in C++ 11, which means
that it has a dependency on the C++ library.
You will need to indicate this in the Config.in file of your package as
follows:
depends on BR2_INSTALL_LIBSTDCPP
depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11

You will also need a comment in case the dependencies are not met. The
following file provides a reference: package/restclient-cpp/Config.in

thanks
Gilles

--0000000000005420f805ce8ab803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small">Hi Jos=C3=A9,<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0d=
im. 17 oct. 2021 =C3=A0=C2=A013:13, Gilles Talis &lt;<a href=3D"mailto:gill=
es.talis@gmail.com">gilles.talis@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div style=3D"font-family:arial,sans-serif;font-size:small">H=
i Jos=C3=A9,<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Le=C2=A0ven. 15 oct. 2021 =C3=A0=C2=A010:39, Jos=C3=
=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@unikie.com" target=3D"=
_blank">jose.pekkarinen@unikie.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">The patch adds a basic confi=
g file and a basic<br>
recipe to build softhsm2.<br>
<br>
Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@u=
nikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br></blockq=
uote><div><div style=3D"font-family:arial,sans-serif;font-size:small">Thank=
s for your contribution.</div></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
---<br>
=C2=A0package/softhsm2/Config.in=C2=A0 =C2=A0|=C2=A0 8 ++++++++<br>
=C2=A0package/softhsm2/<a href=3D"http://softhsm2.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">softhsm2.mk</a> | 15 +++++++++++++++<br>
=C2=A02 files changed, 23 insertions(+)<br>
=C2=A0create mode 100644 package/softhsm2/Config.in<br>
=C2=A0create mode 100644 package/softhsm2/<a href=3D"http://softhsm2.mk" re=
l=3D"noreferrer" target=3D"_blank">softhsm2.mk</a></blockquote><div><div st=
yle=3D"font-family:arial,sans-serif;font-size:small">You miss a few things =
here:</div><div style=3D"font-family:arial,sans-serif;font-size:small">1)=
=C2=A0 an entry to the package/Config,in file that provides a link to your =
package, thus a way to find it and select it. In your case, it would go und=
er &quot;Security&quot; menu.</div><div style=3D"font-family:arial,sans-ser=
if;font-size:small">2) a file that contains the hash sum of the package and=
 its license file.<br></div><div style=3D"font-family:arial,sans-serif;font=
-size:small">3) an entry to the DEVELOPERS file with your name and package.=
<br></div></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in<br>
new file mode 100644<br>
index 0000000000..10c9f0e557<br>
--- /dev/null<br>
+++ b/package/softhsm2/Config.in<br>
@@ -0,0 +1,8 @@<br>
+config BR2_PACKAGE_SOFTHSM2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;softhsm2&quot;<br></blockquote><div>=
<div style=3D"font-family:arial,sans-serif;font-size:small">what&#39;s a bi=
t confusing is that the package name is SoftHSM on the opendnssec website, =
but called SoftHSM version 2 on github. I assume we could go for SoftHSM2</=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBOPENSSL<br></blockquo=
te><div><div style=3D"font-family:arial,sans-serif;font-size:small">Even th=
ough the package has openssl as a dependency, &quot;select BR2_PACKAGE_LIBO=
PENSSL&quot; is more appropriate here. It means that openssl will be automa=
tically selected when softhsm2 is selected. &quot;depends on&quot; means th=
at your package will not appear in the list if openssl is not already slect=
ed.</div><div style=3D"font-family:arial,sans-serif;font-size:small">By the=
 way, it seems like botan is a potential crypto library dependency. If you =
want to give the user the choice between the crypto libraries to use, pleas=
e have a look at package/libcurl/Config.in in the &quot;choice&quot; sectio=
n.<br></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBTOOL<br></blockquote><div=
><div style=3D"font-family:arial,sans-serif;font-size:small">libtool does n=
ot need to be selected. buildroot build system will take care of installing=
 it for you.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SoftHSM is an imple=
mentation of a cryptographic store accessible through a PKCS\#11 interface.=
 You can use it to explore PKCS\#11 without having a Hardware Security Modu=
le.<br></blockquote><div><div style=3D"font-family:arial,sans-serif;font-si=
ze:small">The help text should be indented with one tab and two spaces, lin=
es should
be wrapped to fit 72 columns, where tab counts for 8, so 62 characters
in the text itself. You don&#39;t need the &quot;\&quot; before the #11<br>=
</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://=
github.com/opendnssec/SoftHSMv2" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/opendnssec/SoftHSMv2</a></blockquote><div><div style=3D"font-=
family:arial,sans-serif;font-size:small">It seems like <a href=3D"https://w=
ww.opendnssec.org/softhsm/" target=3D"_blank">https://www.opendnssec.org/so=
fthsm/</a> is the actual SoftHSM home page.</div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
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
mall">The home page provides a tarball in (<a href=3D"https://www.opendnsse=
c.org/2020/04/1602/" target=3D"_blank">https://www.opendnssec.org/2020/04/1=
602/</a>). We prefer to work with already packaged tarballs.</div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
+SOFTHSM2_LICENSE =3D GPL-2<br></blockquote><div><div style=3D"font-family:=
arial,sans-serif;font-size:small">It is actually BSD-2-Clause</div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+SOFTHSM2_LICENSE_FILES =3D LICENSE<br>
+SOFTHSM2_DEPENDENCIES =3D libtool openssl<br></blockquote><div><div style=
=3D"font-family:arial,sans-serif;font-size:small">As mentioned above, you d=
o not need to mention libtool as a dependency.</div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
+SOFTHSM2_AUTORECONF =3D YES<br>
+SOFTHSM2_INSTALL_TARGET =3D YES<br></blockquote><div><div style=3D"font-fa=
mily:arial,sans-serif;font-size:small">It seems like SoftHSM also provides =
a library. In that case, you will need a SOFTHSM2_INSTALL_STAGING =3D YES a=
s well.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
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
nt-size:small"></div><div style=3D"font-family:arial,sans-serif;font-size:s=
mall">Can you please review my comments and send a second version?</div><di=
v style=3D"font-family:arial,sans-serif;font-size:small">When in doubt, ple=
ase consult the documentation: <a href=3D"https://buildroot.org/downloads/m=
anual/manual.html#adding-packages" target=3D"_blank">https://buildroot.org/=
downloads/manual/manual.html#adding-packages</a></div><div style=3D"font-fa=
mily:arial,sans-serif;font-size:small"><br></div><div style=3D"font-family:=
arial,sans-serif;font-size:small">I would also recommend you run the follow=
ing utilities to verify that your patch is correct:<br></div><div style=3D"=
font-family:arial,sans-serif;font-size:small">1) check-package (<a href=3D"=
https://buildroot.org/downloads/manual/manual.html#check-package" target=3D=
"_blank">https://buildroot.org/downloads/manual/manual.html#check-package</=
a>) to check the coding style of added files</div><div style=3D"font-family=
:arial,sans-serif;font-size:small">2) test-pkg (chapter 18.24.3 of the buil=
droot documentation) to check if your package can build in various configur=
ations.</div><div style=3D"font-family:arial,sans-serif;font-size:small"><b=
r></div><div style=3D"font-family:arial,sans-serif;font-size:small">Thanks<=
/div><div style=3D"font-family:arial,sans-serif;font-size:small">Gilles.</d=
iv></div></div></div></blockquote><div><span class=3D"gmail_default" style=
=3D"font-family:arial,sans-serif;font-size:small">I forgot to mention that =
your package is written in C++ 11, which means that it has a dependency on =
</span><span class=3D"gmail_default" style=3D"font-family:arial,sans-serif;=
font-size:small">the C++ library.</span></div><div><span class=3D"gmail_def=
ault" style=3D"font-family:arial,sans-serif;font-size:small">You will need =
to indicate this in the Config.in file of your package as follows:</span></=
div><div><span class=3D"gmail_default" style=3D"font-family:arial,sans-seri=
f;font-size:small">depends on BR2_INSTALL_LIBSTDCPP</span></div><div><span =
class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:sma=
ll">depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11</span></div><div><spa=
n class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:s=
mall"><br></span></div><div><span class=3D"gmail_default" style=3D"font-fam=
ily:arial,sans-serif;font-size:small">You will also need a comment in case =
the dependencies are not met. The following file provides a reference: pack=
age/restclient-cpp/Config.in</span></div><div><span class=3D"gmail_default"=
 style=3D"font-family:arial,sans-serif;font-size:small"><br></span></div><d=
iv><span class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font=
-size:small">thanks</span></div><div><span class=3D"gmail_default" style=3D=
"font-family:arial,sans-serif;font-size:small">Gilles<br></span></div><div>=
<span class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-si=
ze:small"></span></div></div></div>

--0000000000005420f805ce8ab803--

--===============0555923115458007591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0555923115458007591==--
