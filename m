Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3631C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 03:31:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17B5B60F46
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 03:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17B5B60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E8F60670;
	Sun, 10 Oct 2021 03:31:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ZZh_IqvucDm; Sun, 10 Oct 2021 03:31:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAFBA60761;
	Sun, 10 Oct 2021 03:31:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A82D21BF976
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 03:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 971FE4041F
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 03:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id efHpeMOGO4ml for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 03:31:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5724C40417
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 03:31:41 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w14so789056edv.11
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 20:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=796rllH3lVI8TjLHYIQ9MKj2KQaOPKQygeFg3zSGWOM=;
 b=ZPTlUE9p/WIW+kqEe2G4BdkYBUKHmb58r5uuwfMmoD2VyicHRXuUbMNO1dcfP9tLzW
 NYpAMXJivjH+z7tgswRlaloIJDqubfIQXq1KH/vGXcM6UHUDWO60kPqe4fC4UNNq+Axb
 A1hQqtlqAm5JIhiWcbCHCiWlwO8Lnjg4zJhbt/thR0XPHKutdwwyTjeROmSFuhJHcB4h
 7DOH0wDoESCwy7NDXmw7L0R3CKLARZWqIbTNmrJWCsZs06e9qeAEu3zBe+EGfBgOtpmL
 dBAErrUjyPTcdgOBrbFNlRwg3djn4jP2KqMx317KjlmlYafrPQdXz8rmNyYDbpfOEMDE
 WRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=796rllH3lVI8TjLHYIQ9MKj2KQaOPKQygeFg3zSGWOM=;
 b=dPkfhpYyBiIndXSTo6tm0kiOFBt8qdnecq9gGzVlSrj4ald267mYx0SQ/52lqlDsw2
 lJNZ6j+lAZiUongxj80CLDbrxxGD/zc2dpJ/9dPjv/hJK00a5Jf0jtZ2uaDrNfM7YqI2
 9AMOhPouKYUyebjCrpbUUVIzIBzsxOFiyjVcCIsyK35eHAnfYqYiMhv86CIKehX+HyYG
 2mDZJm8lWZaWb3QZjdcs5rkcMSLfpa23GlsdQVHA0F/3CZ5IvkbOmX6uPPqzJuDEg900
 rJ9A4fgcjtz4cdxuvg7ORluQWtleSAi3Jc2mFaiNbZNbQT4fzxCJbrtagI45tjCUOndK
 Qiig==
X-Gm-Message-State: AOAM5300vWonsCHWucCjnJzt/gwh21FnwTCYWm1vrZfLKT8W9polnGm7
 Dem5rMx+2oKkNVtG643U48ScaKrD9NuB0pz4MtU=
X-Google-Smtp-Source: ABdhPJz+MdXn5HtPQgnYHfaZfvpMa8eokLj+uuiZvEDRbCo9Ri3diGbCaaaLyNl2boWGY6ffOEcNuZg/RDy1EIUhp/4=
X-Received: by 2002:a50:ff14:: with SMTP id a20mr30085647edu.81.1633836699310; 
 Sat, 09 Oct 2021 20:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211009205523.3137859-1-aduskett@gmail.com>
 <20211009205523.3137859-10-aduskett@gmail.com>
In-Reply-To: <20211009205523.3137859-10-aduskett@gmail.com>
From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 10 Oct 2021 06:31:29 +0300
Message-ID: <CALFsTFU2njETMhqksw4iezDwq5KR1JotSVvz3Rpz5-pz4bupnw@mail.gmail.com>
To: Adam Duskett <aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH 09/20] package/python-dataclasses: new
 package
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Mauro Condarelli <mc5686@mclink.it>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: multipart/mixed; boundary="===============2023109842679373166=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2023109842679373166==
Content-Type: multipart/alternative; boundary="000000000000155da105cdf740e1"

--000000000000155da105cdf740e1
Content-Type: text/plain; charset="UTF-8"

Hello,

On Sat, Oct 9, 2021, 23:55 Adam Duskett <aduskett@gmail.com> wrote:

> python-pydantic 1.8.2 depends on this package.
>

pydantic adds this dependency only when then python version is lower than
3.7 (https://github.com/samuelcolvin/pydantic/blob/master/setup.py#L133),
so we don't really need it.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/Config.in                                  |  1 +
>  package/python-dataclasses/Config.in               |  6 ++++++
>  package/python-dataclasses/python-dataclasses.hash |  5 +++++
>  package/python-dataclasses/python-dataclasses.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-dataclasses/Config.in
>  create mode 100644 package/python-dataclasses/python-dataclasses.hash
>  create mode 100644 package/python-dataclasses/python-dataclasses.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 9fed0ab4cb..b4164734c6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -969,6 +969,7 @@ menu "External python modules"
>         source "package/python-daemon/Config.in"
>         source "package/python-daemonize/Config.in"
>         source "package/python-daphne/Config.in"
> +       source "package/python-dataclasses/Config.in"
>         source "package/python-dataproperty/Config.in"
>         source "package/python-dateutil/Config.in"
>         source "package/python-dbus-next/Config.in"
> diff --git a/package/python-dataclasses/Config.in
> b/package/python-dataclasses/Config.in
> new file mode 100644
> index 0000000000..dae4343d8a
> --- /dev/null
> +++ b/package/python-dataclasses/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_DATACLASSES
> +       bool "python-dataclasses"
> +       help
> +         A backport of the dataclasses module for Python 3.6.
> +
> +         https://github.com/ericvsmith/dataclasses
> diff --git a/package/python-dataclasses/python-dataclasses.hash
> b/package/python-dataclasses/python-dataclasses.hash
> new file mode 100644
> index 0000000000..2228cb5d39
> --- /dev/null
> +++ b/package/python-dataclasses/python-dataclasses.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/dataclasses/json
> +md5  c9a52e322ada1406bfde9ebe3cdbbcca  dataclasses-0.8.tar.gz
> +sha256  8479067f342acf957dc82ec415d355ab5edb7e7646b90dc6e2fd1d96ad084c97
> dataclasses-0.8.tar.gz
> +# Locally computed sha256 checksums
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30
> LICENSE.txt
> diff --git a/package/python-dataclasses/python-dataclasses.mk
> b/package/python-dataclasses/python-dataclasses.mk
> new file mode 100644
> index 0000000000..a12bab2a0d
> --- /dev/null
> +++ b/package/python-dataclasses/python-dataclasses.mk
> @@ -0,0 +1,14 @@
>
> +################################################################################
> +#
> +# python-dataclasses
> +#
>
> +################################################################################
> +
> +PYTHON_DATACLASSES_VERSION = 0.8
> +PYTHON_DATACLASSES_SOURCE =
> dataclasses-$(PYTHON_DATACLASSES_VERSION).tar.gz
> +PYTHON_DATACLASSES_SITE =
> https://files.pythonhosted.org/packages/1f/12/7919c5d8b9c497f9180db15ea8ead6499812ea8264a6ae18766d93c59fe5
> +PYTHON_DATACLASSES_SETUP_TYPE = setuptools
> +PYTHON_DATACLASSES_LICENSE = Apache-2.0
> +PYTHON_DATACLASSES_LICENSE_FILES = LICENSE.txt
> +
> +$(eval $(python-package))
> --
> 2.30.2
>

Regards,
Asaf.

>
>

--000000000000155da105cdf740e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello,<br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Sat, Oct 9, 2021, 23:55 Adam Duskett &lt;<a h=
ref=3D"mailto:aduskett@gmail.com" target=3D"_blank" rel=3D"noreferrer">adus=
kett@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">pytho=
n-pydantic 1.8.2 depends on this package.<br></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">pydantic adds this dependency only=
 when then python version is lower than 3.7 (<a href=3D"https://github.com/=
samuelcolvin/pydantic/blob/master/setup.py#L133">https://github.com/samuelc=
olvin/pydantic/blob/master/setup.py#L133</a>), so we don&#39;t really need =
it.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:aduskett@gmail.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">aduskett@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
=C2=A0package/python-dataclasses/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++++<br>
=C2=A0package/python-dataclasses/python-dataclasses.hash |=C2=A0 5 +++++<br=
>
=C2=A0package/python-dataclasses/<a href=3D"http://python-dataclasses.mk" r=
el=3D"noreferrer noreferrer noreferrer" target=3D"_blank">python-dataclasse=
s.mk</a>=C2=A0 =C2=A0| 14 ++++++++++++++<br>
=C2=A04 files changed, 26 insertions(+)<br>
=C2=A0create mode 100644 package/python-dataclasses/Config.in<br>
=C2=A0create mode 100644 package/python-dataclasses/python-dataclasses.hash=
<br>
=C2=A0create mode 100644 package/python-dataclasses/<a href=3D"http://pytho=
n-dataclasses.mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank=
">python-dataclasses.mk</a><br>
<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 9fed0ab4cb..b4164734c6 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -969,6 +969,7 @@ menu &quot;External python modules&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-daemon/Config.in&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-daemonize/Config.in=
&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-daphne/Config.in&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-dataclasses/Config.=
in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-dataproperty/Config=
.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-dateutil/Config.in&=
quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-dbus-next/Config.in=
&quot;<br>
diff --git a/package/python-dataclasses/Config.in b/package/python-dataclas=
ses/Config.in<br>
new file mode 100644<br>
index 0000000000..dae4343d8a<br>
--- /dev/null<br>
+++ b/package/python-dataclasses/Config.in<br>
@@ -0,0 +1,6 @@<br>
+config BR2_PACKAGE_PYTHON_DATACLASSES<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;python-dataclasses&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0A backport of the dataclasses module for=
 Python 3.6.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/ericvsmith=
/dataclasses" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ht=
tps://github.com/ericvsmith/dataclasses</a><br>
diff --git a/package/python-dataclasses/python-dataclasses.hash b/package/p=
ython-dataclasses/python-dataclasses.hash<br>
new file mode 100644<br>
index 0000000000..2228cb5d39<br>
--- /dev/null<br>
+++ b/package/python-dataclasses/python-dataclasses.hash<br>
@@ -0,0 +1,5 @@<br>
+# md5, sha256 from <a href=3D"https://pypi.org/pypi/dataclasses/json" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://pypi.org/py=
pi/dataclasses/json</a><br>
+md5=C2=A0 c9a52e322ada1406bfde9ebe3cdbbcca=C2=A0 dataclasses-0.8.tar.gz<br=
>
+sha256=C2=A0 8479067f342acf957dc82ec415d355ab5edb7e7646b90dc6e2fd1d96ad084=
c97=C2=A0 dataclasses-0.8.tar.gz<br>
+# Locally computed sha256 checksums<br>
+sha256=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523=
d30=C2=A0 LICENSE.txt<br>
diff --git a/package/python-dataclasses/<a href=3D"http://python-dataclasse=
s.mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">python-dat=
aclasses.mk</a> b/package/python-dataclasses/<a href=3D"http://python-datac=
lasses.mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">pytho=
n-dataclasses.mk</a><br>
new file mode 100644<br>
index 0000000000..a12bab2a0d<br>
--- /dev/null<br>
+++ b/package/python-dataclasses/<a href=3D"http://python-dataclasses.mk" r=
el=3D"noreferrer noreferrer noreferrer" target=3D"_blank">python-dataclasse=
s.mk</a><br>
@@ -0,0 +1,14 @@<br>
+##########################################################################=
######<br>
+#<br>
+# python-dataclasses<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+PYTHON_DATACLASSES_VERSION =3D 0.8<br>
+PYTHON_DATACLASSES_SOURCE =3D dataclasses-$(PYTHON_DATACLASSES_VERSION).ta=
r.gz<br>
+PYTHON_DATACLASSES_SITE =3D <a href=3D"https://files.pythonhosted.org/pack=
ages/1f/12/7919c5d8b9c497f9180db15ea8ead6499812ea8264a6ae18766d93c59fe5" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://files.pyth=
onhosted.org/packages/1f/12/7919c5d8b9c497f9180db15ea8ead6499812ea8264a6ae1=
8766d93c59fe5</a><br>
+PYTHON_DATACLASSES_SETUP_TYPE =3D setuptools<br>
+PYTHON_DATACLASSES_LICENSE =3D Apache-2.0<br>
+PYTHON_DATACLASSES_LICENSE_FILES =3D LICENSE.txt<br>
+<br>
+$(eval $(python-package))<br>
-- <br>
2.30.2<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Regards,</div><div dir=3D"auto">Asaf.</div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--000000000000155da105cdf740e1--

--===============2023109842679373166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2023109842679373166==--
