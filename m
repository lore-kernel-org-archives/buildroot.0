Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8703C61DA3
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 11:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2259460FD2;
	Fri, 24 Feb 2023 11:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2259460FD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DZDv36YhQYRG; Fri, 24 Feb 2023 11:21:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CB6A60F5C;
	Fri, 24 Feb 2023 11:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CB6A60F5C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD4AA1BF36B
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 11:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 935D18195C
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 11:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 935D18195C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBK3tiuHCGKZ for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 11:21:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 820C781422
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 820C781422
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 11:21:48 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so2572043pjb.1
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 03:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iTtk7EeBg92lT0RQScY6V/ocpVoyoYGUxLXhCtC3ZlA=;
 b=vdOVUEJkODW2Iu604dqfdgR3a42UebfmHRQnNnj1K233jiqeY8YAVuG/T08ut8D8A8
 cq1ZNJEhiqufJFFaHj35cYgMErBp43TfZOsdcczwjwJc9JPOeS8p8w838xTsWyjKuIgl
 Iopemc/N9s1t/UbaUfXQ16na4QhfFjjda3rQwDZO50KjCE9Vq/P/zlz4AVU94ByEXvKo
 XA+EOHBcQBKhoIr5wK4LK4EyGmYRH0oAcGqubTO2HS5u3xOlSWkqvDMWgqLZXfhW4HXN
 rLaMdIXeYumPc/z1ijGDH1zelm5RV/Fbf2DF6v/v1EiKjMFFo1fA26QQfVX8L86ULwmG
 tFXg==
X-Gm-Message-State: AO0yUKUJpQGkJH2LV8yKGPCLf2rMCTBBKSL81GwzAiJwaRvCoBEMphV8
 B8IBazlNvj4rZu+qiPj5EvXBkDhwAFshbVApoF4FqGS9WwY=
X-Google-Smtp-Source: AK7set+GnkVIdXUhD1XXt7R9kRPxVrX8OBzyGheHdvKP7yldrR+nMjQRvMQp0KFF+is1KmN5gKpAetAw2azmXgmCtnU=
X-Received: by 2002:a17:902:6f17:b0:19c:9035:7864 with SMTP id
 w23-20020a1709026f1700b0019c90357864mr655397plk.5.1677237707778; Fri, 24 Feb
 2023 03:21:47 -0800 (PST)
MIME-Version: 1.0
References: <20230220093336.77462-1-fontaine.fabrice@gmail.com>
 <20230220214423.1a42a0e5@windsurf>
In-Reply-To: <20230220214423.1a42a0e5@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 Feb 2023 12:21:36 +0100
Message-ID: <CAPi7W83JXfQ2azAbruds6sZ9U-Up=2MgxVzx+KMOuFsRGrFGug@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iTtk7EeBg92lT0RQScY6V/ocpVoyoYGUxLXhCtC3ZlA=;
 b=ZcuUroxFAoMPH1p5k7s9VIUKleh2QrQrzAJlgpw2aNfNtoviX/yCshyy9Q6Kak3HLu
 kGDFktCg4/G3Hh3uR7mUw/YLbUo2vshBp1+G6eq9Pchy2yMMIIPkKGGRJSj3FFqsxzNP
 Qy3n+PXNz6U7Udfz1RpZq1TAqBy6LJ9+qrDOoyUwakTZhpIoYub77He66N4El47BsscE
 rhC/1vqXT37qY+J53gRKGkkI+UX0EJfMlxS06t/yEJ57UWltnVn9hVN7tsjMOLkRu+8e
 bQApt4dXGdXQcXkfXHSx8JYziqbZDyb/obkb/D4YYChAhLMUrznoISYHS3pMRFsvnEHb
 UCuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZcuUroxF
Subject: Re: [Buildroot] [PATCH 1/1] package/zabbix: fix libcurl build
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8037706230963721083=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8037706230963721083==
Content-Type: multipart/alternative; boundary="000000000000c6b0f405f57055c3"

--000000000000c6b0f405f57055c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le lun. 20 f=C3=A9vr. 2023 =C3=A0 21:44, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> Hello Fabrice,
>
> On Mon, 20 Feb 2023 10:33:36 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fix the following libcurl build failure:
> >
> > In file included from
> /tmp/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/inclu=
de/curl/curl.h:3195,
> >                  from ../../../../include/sysinc.h:384,
> >                  from ../../../../include/common.h:23,
> >                  from simple.c:20:
> > simple.c: In function 'check_https':
> > simple.c:167:65: error: invalid use of void expression
> >   167 |         if (CURLE_OK !=3D (err =3D curl_easy_setopt(easyhandle,=
 opt
> =3D CURLOPT_USERAGENT, "Zabbix " ZABBIX_VERSION)) ||
> >       |                                                                =
 ^
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/053a62e9969046a7f8a0e1890c24d2bfb0=
99ae42
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...se-parentheses-to-ensure-compilation.patch | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644
> package/zabbix/0002-Use-parentheses-to-ensure-compilation.patch
>
> This was reported to curl upstream in
> https://github.com/curl/curl/issues/10148, and apparently fixed in curl
> by
>
> https://github.com/curl/curl/commit/e2aed004302e51cfa5b6ce8c8ab65ef92aa83=
196
> .
>
> So it apparently was considered a bug in curl, so perhaps it should be
> fixed in curl rather than in zabbix?
>

Indeed, I'll set this patch as not applicable as the build failure is not
raised since commit 14ca6b5fdb6a5e0fa99b04461240772d93076b2e


>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best Regards,

Fabrice

--000000000000c6b0f405f57055c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello,<br></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 20 f=C3=A9vr. 2023=
 =C3=A0=C2=A021:44, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni=
@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Fabrice,<br>
<br>
On Mon, 20 Feb 2023 10:33:36 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Fix the following libcurl build failure:<br>
&gt; <br>
&gt; In file included from /tmp/instance-1/output-1/host/s390x-buildroot-li=
nux-gnu/sysroot/usr/include/curl/curl.h:3195,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../=
../../../include/sysinc.h:384,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../=
../../../include/common.h:23,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from sim=
ple.c:20:<br>
&gt; simple.c: In function &#39;check_https&#39;:<br>
&gt; simple.c:167:65: error: invalid use of void expression<br>
&gt;=C2=A0 =C2=A0167 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (CURLE_OK !=3D (=
err =3D curl_easy_setopt(easyhandle, opt =3D CURLOPT_USERAGENT, &quot;Zabbi=
x &quot; ZABBIX_VERSION)) ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/053a62e99690=
46a7f8a0e1890c24d2bfb099ae42" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/053a62e9969046a7f8a0e1890c24d2bfb099ae42</a>=
<br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...se-parentheses-to-ensure-compilation.patch | 65 +++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 65 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/zabbix/0002-Use-parentheses-to-ensure=
-compilation.patch<br>
<br>
This was reported to curl upstream in<br>
<a href=3D"https://github.com/curl/curl/issues/10148" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/curl/curl/issues/10148</a>, and apparent=
ly fixed in curl<br>
by<br>
<a href=3D"https://github.com/curl/curl/commit/e2aed004302e51cfa5b6ce8c8ab6=
5ef92aa83196" rel=3D"noreferrer" target=3D"_blank">https://github.com/curl/=
curl/commit/e2aed004302e51cfa5b6ce8c8ab65ef92aa83196</a>.<br>
<br>
So it apparently was considered a bug in curl, so perhaps it should be<br>
fixed in curl rather than in zabbix?<br></blockquote><div><br></div><div>In=
deed, I&#39;ll set this patch as not applicable as the build failure is not=
 raised since commit 14ca6b5fdb6a5e0fa99b04461240772d93076b2e</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote><div>Best Regards,</div><div><br></div><div>F=
abrice <br></div></div></div>

--000000000000c6b0f405f57055c3--

--===============8037706230963721083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8037706230963721083==--
