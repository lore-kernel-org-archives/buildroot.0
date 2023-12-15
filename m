Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE70EC4167B
	for <buildroot@archiver.kernel.org>; Fri, 15 Dec 2023 19:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C5AB40201;
	Fri, 15 Dec 2023 19:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C5AB40201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p3rd7Bu3bCUY; Fri, 15 Dec 2023 19:41:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E13D403AF;
	Fri, 15 Dec 2023 19:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E13D403AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6A8E1BF83A
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 19:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCBE160BF8
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 19:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCBE160BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tb8syI5kxsGi for <buildroot@lists.busybox.net>;
 Fri, 15 Dec 2023 19:41:53 +0000 (UTC)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E71960BBA
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 19:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E71960BBA
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5c673b01eeeso632386a12.1
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 11:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702669313; x=1703274113;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W1OdUjsIaH/qLPC817qeIwJt51m7T4mOazxOzQHX0vs=;
 b=j28pusO1xjwpFCfDtjM6JFFMfpeuhSK+0vWGX7bWG44FHJBqnIg6wYBQ372Md17K69
 c3u6I6k7FEvaJwKcRG0BB1BWjvpFrkNCNv0AS2o3mM+a+rDtuxFDxJxWH95LYomaMedE
 iX3Qfei4uYGACetx+LepTVPrXLmL1g/d9LAN/ZqrKtHk6F0vIDvROFGILEPxMtLbbCSn
 PrGHJf1bRF+JADdrXcGuMAB6HIEyQbLYRL7fd0Rk5AfACwErlsAISBX098FDrpzf6l2F
 ppPr47Vh07oOwT9U3fBcfHFQnLhEIxSz9gxNtOyOcSeqzppHLYdBpxULaPfqOgQp93ry
 llqQ==
X-Gm-Message-State: AOJu0YwY/ou6SzHdSHfcyU6E+LZYFKTvcuqGjqVyi2gUSxQMwEWZ9ZT8
 NIBhayPwMnm7g1/qgd+rA0+1qphl8jW+QEeZpZ7TOA==
X-Google-Smtp-Source: AGHT+IH+tcTP+s5ysJrBodBzZsk/Sh5IdHwzbpwSibK5MepMQHIwV5WR1Y2POhtSBqwqd3CLSuudyIEnXAvFUUK2t78=
X-Received: by 2002:a05:6a20:f383:b0:18f:97c:928f with SMTP id
 qr3-20020a056a20f38300b0018f097c928fmr6801268pzb.116.1702669312619; Fri, 15
 Dec 2023 11:41:52 -0800 (PST)
MIME-Version: 1.0
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
 <20231213164311.4180059-4-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231213164311.4180059-4-dario.binacchi@amarulasolutions.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 15 Dec 2023 20:41:41 +0100
Message-ID: <CAAE6iEUqGKqt=qvBQQ+NAqXsJ2dk=5W3PK+=1A5hzFJqrA2uGQ@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1702669313; x=1703274113; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W1OdUjsIaH/qLPC817qeIwJt51m7T4mOazxOzQHX0vs=;
 b=OLtaoUaVG53rQd7B81xlRtXEia2JJvMDxOerqg/af+N+7O3VrnUAcXB/qjgEKcDVAS
 9swBhXAcmq255jjNuP7OiLfzEa9v+Y/ibPSQiwFx6azN55/ydeJvV3/V+1/wmhdPI3mk
 MJzemMwN5NwQh6XbREf11j9vdyDIBb0RJ0xcrzUcIvQLIUQtKpF0IOc6rh9d4ApuxSyo
 Irm+PggvVGC8+onh+hiuHE1sXTN8j4iSk+QZ12/UGF50FO8FYTbjTf6mrEqp5LHTSxOr
 2So0g2UblQiFLQ7Qrv2M8uqZ32+CVqCRB6SAeuznDH0rj2aNTo7tOvR/hc1ghvU5tbfq
 RBbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=OLtaoUaV
Subject: Re: [Buildroot] [PATCH v2 03/11] package/python-jsonschema: add
 host variant
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: multipart/mixed; boundary="===============6110618406196831647=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6110618406196831647==
Content-Type: multipart/alternative; boundary="0000000000008cd002060c91973c"

--0000000000008cd002060c91973c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 13 d=C3=A9c. 2023 =C3=A0 17:44, Dario Binacchi <
dario.binacchi@amarulasolutions.com> a =C3=A9crit :

> Recent version of U-Boot use binman to provide a mechanism for building
> images, from simple SPL + U-Boot combinations, to more complex
> arrangements with many parts. This package is required by binman.
>
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/Config.in.host                         | 1 +
>  package/python-jsonschema/Config.in.host       | 6 ++++++
>

Adding an Config.in.host for this kind of package is not useful, see
documentation section 18.2.2. Config.in.host file

Fran=C3=A7ois

 package/python-jsonschema/python-jsonschema.mk | 6 ++++++
>  3 files changed, 13 insertions(+)
>  create mode 100644 package/python-jsonschema/Config.in.host
>
> diff --git a/package/Config.in.host b/package/Config.in.host
> index c80842c33a2f..5d2121de02a4 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -85,6 +85,7 @@ menu "Host utilities"
>         source "package/python-cython/Config.in.host"
>         source "package/python-greenlet/Config.in.host"
>         source "package/python-iniparse/Config.in.host"
> +       source "package/python-jsonschema/Config.in.host"
>         source "package/python-kflash/Config.in.host"
>         source "package/python-lxml/Config.in.host"
>         source "package/python-pyyaml/Config.in.host"
> diff --git a/package/python-jsonschema/Config.in.host
> b/package/python-jsonschema/Config.in.host
> new file mode 100644
> index 000000000000..fd275a41b200
> --- /dev/null
> +++ b/package/python-jsonschema/Config.in.host
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA
> +       bool "host python-jsonschema"
> +       help
> +         The host implementation of JSON Schema validation for Python.
> +
> +         https://github.com/python-jsonschema/jsonschema
> diff --git a/package/python-jsonschema/python-jsonschema.mk
> b/package/python-jsonschema/python-jsonschema.mk
> index dee87e8f9d9b..6f2206f3a03c 100644
> --- a/package/python-jsonschema/python-jsonschema.mk
> +++ b/package/python-jsonschema/python-jsonschema.mk
> @@ -15,4 +15,10 @@ PYTHON_JSONSCHEMA_DEPENDENCIES =3D \
>         host-python-hatch-fancy-pypi-readme \
>         host-python-hatch-vcs
>
> +HOST_PYTHON_JSONSCHEMA_DEPENDENCIES =3D \
> +       host-python-hatchling \
> +       host-python-hatch-fancy-pypi-readme \
> +       host-python-hatch-vcs
> +
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> --
> 2.43.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000008cd002060c91973c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 13 d=C3=A9c. 2023 =C3=A0=
=C2=A017:44, Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulasol=
utions.com">dario.binacchi@amarulasolutions.com</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Recent version =
of U-Boot use binman to provide a mechanism for building<br>
images, from simple SPL + U-Boot combinations, to more complex<br>
arrangements with many parts. This package is required by binman.<br>
<br>
Co-developed-by: Michael Trimarchi &lt;<a href=3D"mailto:michael@amarulasol=
utions.com" target=3D"_blank">michael@amarulasolutions.com</a>&gt;<br>
Signed-off-by: Michael Trimarchi &lt;<a href=3D"mailto:michael@amarulasolut=
ions.com" target=3D"_blank">michael@amarulasolutions.com</a>&gt;<br>
Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulas=
olutions.com" target=3D"_blank">dario.binacchi@amarulasolutions.com</a>&gt;=
<br>
---<br>
=C2=A0package/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0package/python-jsonschema/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
6 ++++++<br></blockquote><div><br></div><div>Adding an Config.in.host for t=
his kind of package is not useful, see documentation section 18.2.2. Config=
.in.host file</div><div><br></div><div>Fran=C3=A7ois<br></div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0package/python-jsonschema/<a href=3D"http://python-jsonschema.mk" rel=
=3D"noreferrer" target=3D"_blank">python-jsonschema.mk</a> | 6 ++++++<br>
=C2=A03 files changed, 13 insertions(+)<br>
=C2=A0create mode 100644 package/python-jsonschema/Config.in.host<br>
<br>
diff --git a/package/Config.in.host b/package/Config.in.host<br>
index c80842c33a2f..5d2121de02a4 100644<br>
--- a/package/Config.in.host<br>
+++ b/package/Config.in.host<br>
@@ -85,6 +85,7 @@ menu &quot;Host utilities&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-cython/Config.in.ho=
st&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-greenlet/Config.in.=
host&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-iniparse/Config.in.=
host&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-jsonschema/Config.i=
n.host&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-kflash/Config.in.ho=
st&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-lxml/Config.in.host=
&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-pyyaml/Config.in.ho=
st&quot;<br>
diff --git a/package/python-jsonschema/Config.in.host b/package/python-json=
schema/Config.in.host<br>
new file mode 100644<br>
index 000000000000..fd275a41b200<br>
--- /dev/null<br>
+++ b/package/python-jsonschema/Config.in.host<br>
@@ -0,0 +1,6 @@<br>
+config BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;host python-jsonschema&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The host implementation of JSON Schema v=
alidation for Python.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/python-jso=
nschema/jsonschema" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/python-jsonschema/jsonschema</a><br>
diff --git a/package/python-jsonschema/<a href=3D"http://python-jsonschema.=
mk" rel=3D"noreferrer" target=3D"_blank">python-jsonschema.mk</a> b/package=
/python-jsonschema/<a href=3D"http://python-jsonschema.mk" rel=3D"noreferre=
r" target=3D"_blank">python-jsonschema.mk</a><br>
index dee87e8f9d9b..6f2206f3a03c 100644<br>
--- a/package/python-jsonschema/<a href=3D"http://python-jsonschema.mk" rel=
=3D"noreferrer" target=3D"_blank">python-jsonschema.mk</a><br>
+++ b/package/python-jsonschema/<a href=3D"http://python-jsonschema.mk" rel=
=3D"noreferrer" target=3D"_blank">python-jsonschema.mk</a><br>
@@ -15,4 +15,10 @@ PYTHON_JSONSCHEMA_DEPENDENCIES =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-python-hatch-fancy-pypi-readme \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-python-hatch-vcs<br>
<br>
+HOST_PYTHON_JSONSCHEMA_DEPENDENCIES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-python-hatchling \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-python-hatch-fancy-pypi-readme \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-python-hatch-vcs<br>
+<br>
=C2=A0$(eval $(python-package))<br>
+$(eval $(host-python-package))<br>
-- <br>
2.43.0<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--0000000000008cd002060c91973c--

--===============6110618406196831647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6110618406196831647==--
