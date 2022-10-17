Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6B8C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 07:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 236758142D;
	Mon, 17 Oct 2022 07:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 236758142D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IfNp_6UOhJqb; Mon, 17 Oct 2022 07:44:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8DF68142C;
	Mon, 17 Oct 2022 07:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8DF68142C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62E4A1BF3F4
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 07:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 365DD41558
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 07:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 365DD41558
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zTmRXhVfEt2P for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 07:44:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A74DC41705
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A74DC41705
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 07:44:02 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 o17-20020a17090aac1100b0020d98b0c0f4so12080407pjq.4
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 00:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dmKcV+dmiHBfluguddcfLbRDSMAe6zIZLJ27TV9+7EQ=;
 b=JyGvIXk5JCWilwR/81huQqUOiQ8Ag5Etml9Ob1UTbZA9VskRvJ69VoAelmWeYZsryP
 ps1ulCOjTFmwhQ1xsCQlYaa62BAGj7S6eTTmTDkvEbi+tyW//XbQDiFyOzwu3+OJIBZY
 p4vzR/Err58EGCNF+dTp+F9Z9gIvD4L1wcHA5JRAyTdveHvu/1bxf+BPB6W6asymk8/M
 yMrOHHgB2jWeFXD/aiamlTDHRVIBKmojG8Uxs+ciNyyusVcl6/Xxc2YPhcsxIRz5v5n1
 yn4q5T9jIWW4LOmlBdyYYuIVh2OVYOkA60QTQGUR7Oa1VvE4FyG62GgtjVED3fcloNw9
 intQ==
X-Gm-Message-State: ACrzQf013fs7WzrBIP+QcZfKx6+OkNmoXgX58rpWUDOU12LDReoFG+dF
 8mLy1U1HL6fPjsco70ysjhHAg0i0Yf61ZNaAQeTPNw==
X-Google-Smtp-Source: AMsMyM7GZat6t041bV0w6KdOtZ38+uhoPWGJt2anHASAA0Dq6EmZtja5IXNo9D68k+IiF7/IpgcGwZeDuuNsp+yktZw=
X-Received: by 2002:a17:902:70c4:b0:17c:f9fe:3200 with SMTP id
 l4-20020a17090270c400b0017cf9fe3200mr10745714plt.1.1665992641944; Mon, 17 Oct
 2022 00:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221016175025.22545-1-angelo@amarulasolutions.com>
In-Reply-To: <20221016175025.22545-1-angelo@amarulasolutions.com>
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Mon, 17 Oct 2022 09:43:51 +0200
Message-ID: <CABNF3=Z6zNg-KoDquPd89e4yQ=E4PV7kgR0JGtRMFKet6denVA@mail.gmail.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dmKcV+dmiHBfluguddcfLbRDSMAe6zIZLJ27TV9+7EQ=;
 b=NW7HHICGqZ33q2lulYQ42DEr4L4LaojCag7PVdseuMveU8wizl2UDNPYJ9fVHYqIbt
 11Ai7siRp3oZSDTJRnONu8V++tmXv/cpZhCz+FURg1M/QfhjMoeQLLcSUI+/+dEr5Efa
 GLHf9RHrAj69qUrPb7tpDSmkO8VqrhFLxDkHs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NW7HHICG
Subject: Re: [Buildroot] [PATCH v3] package/cutekeyboard: new package
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2920842068285045449=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2920842068285045449==
Content-Type: multipart/alternative; boundary="0000000000009f33a305eb362335"

--0000000000009f33a305eb362335
Content-Type: text/plain; charset="UTF-8"

Acked-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>

On Sun, Oct 16, 2022 at 7:50 PM Angelo Compagnucci <
angelo@amarulasolutions.com> wrote:

> CuteKeyboard is a Qt virtual keyboard plugin for embedded applications
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> v2:
> * bump to verison v1.0.1
> v3:
> * Adding me to developers file
>
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/cutekeyboard/Config.in         | 18 ++++++++++++++++++
>  package/cutekeyboard/cutekeyboard.hash |  3 +++
>  package/cutekeyboard/cutekeyboard.mk   | 18 ++++++++++++++++++
>  5 files changed, 41 insertions(+)
>  create mode 100644 package/cutekeyboard/Config.in
>  create mode 100644 package/cutekeyboard/cutekeyboard.hash
>  create mode 100644 package/cutekeyboard/cutekeyboard.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c0e6f8bbef..4640abe3b2 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -158,6 +158,7 @@ F:  package/apparmor/
>  F:     package/corkscrew/
>  F:     package/cups/
>  F:     package/cups-filters/
> +F:     package/cutekeyboard/
>  F:     package/fail2ban/
>  F:     package/grep/
>  F:     package/htpdate/
> diff --git a/package/Config.in b/package/Config.in
> index e3a34d6e97..f11210d313 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1522,6 +1522,7 @@ menu "Graphics"
>         source "package/cairo/Config.in"
>         source "package/cairomm/Config.in"
>         source "package/chipmunk/Config.in"
> +       source "package/cutekeyboard/Config.in"
>         source "package/exempi/Config.in"
>         source "package/exiv2/Config.in"
>         source "package/fltk/Config.in"
> diff --git a/package/cutekeyboard/Config.in
> b/package/cutekeyboard/Config.in
> new file mode 100644
> index 0000000000..389c583313
> --- /dev/null
> +++ b/package/cutekeyboard/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_CUTEKEYBOARD
> +       bool "cutekeyboard"
> +       depends on BR2_PACKAGE_QT5DECLARATIVE
> +       depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK
> +       depends on BR2_PACKAGE_QT5QUICKCONTROLS2
> +       help
> +         CuteKeyboard is a Qt virtual keyboard plugin for embedded
> applications.
> +
> +         https://amarula.github.io/cutekeyboard/
> +
> +if BR2_PACKAGE_CUTEKEYBOARD
> +
> +config BR2_PACKAGE_CUTEKEYBOARD_EXAMPLES
> +       bool "cutekeyboard example"
> +       help
> +         Compile also application example
> +
> +endif
> diff --git a/package/cutekeyboard/cutekeyboard.hash
> b/package/cutekeyboard/cutekeyboard.hash
> new file mode 100644
> index 0000000000..4720d7ec40
> --- /dev/null
> +++ b/package/cutekeyboard/cutekeyboard.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  1c7950d176678e82f99e8a6f67cac2e030f623f1ea40937f12c3dbdd6f0c701f
> cutekeyboard-v1.0.1.tar.gz
> +sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d
> LICENSE
> diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/
> cutekeyboard.mk
> new file mode 100644
> index 0000000000..b43595075a
> --- /dev/null
> +++ b/package/cutekeyboard/cutekeyboard.mk
> @@ -0,0 +1,18 @@
>
> +################################################################################
> +#
> +# cutekeyboard
> +#
>
> +################################################################################
> +
> +CUTEKEYBOARD_VERSION = v1.0.1
> +CUTEKEYBOARD_SITE = $(call
> github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
> +CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
> +CUTEKEYBOARD_INSTALL_STAGING = YES
> +CUTEKEYBOARD_LICENSE = MIT
> +CUTEKEYBOARD_LICENSE_FILES = LICENSE
> +
> +ifeq ($(BR2_PACKAGE_CUTEKEYBOARD_EXAMPLES),y)
> +CUTEKEYBOARD_CONF_OPTS += CONFIG+=BUILD_EXAMPLES
> +endif
> +
> +$(eval $(qmake-package))
> --
> 2.34.1
>
>

--0000000000009f33a305eb362335
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Acked-by: Andrea Ricchi &lt;<a href=3D"mailto:andrea.ricch=
i@amarulasolutions.com">andrea.ricchi@amarulasolutions.com</a>&gt;<br></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Su=
n, Oct 16, 2022 at 7:50 PM Angelo Compagnucci &lt;<a href=3D"mailto:angelo@=
amarulasolutions.com">angelo@amarulasolutions.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">CuteKeyboard is a Qt virtu=
al keyboard plugin for embedded applications<br>
<br>
Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolut=
ions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br>
---<br>
v2:<br>
* bump to verison v1.0.1<br>
v3:<br>
* Adding me to developers file<br>
<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0package/cutekeyboard/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 =
++++++++++++++++++<br>
=C2=A0package/cutekeyboard/cutekeyboard.hash |=C2=A0 3 +++<br>
=C2=A0package/cutekeyboard/<a href=3D"http://cutekeyboard.mk" rel=3D"norefe=
rrer" target=3D"_blank">cutekeyboard.mk</a>=C2=A0 =C2=A0| 18 ++++++++++++++=
++++<br>
=C2=A05 files changed, 41 insertions(+)<br>
=C2=A0create mode 100644 package/cutekeyboard/Config.in<br>
=C2=A0create mode 100644 package/cutekeyboard/cutekeyboard.hash<br>
=C2=A0create mode 100644 package/cutekeyboard/<a href=3D"http://cutekeyboar=
d.mk" rel=3D"noreferrer" target=3D"_blank">cutekeyboard.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index c0e6f8bbef..4640abe3b2 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -158,6 +158,7 @@ F:=C2=A0 package/apparmor/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/corkscrew/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/cups/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/cups-filters/<br>
+F:=C2=A0 =C2=A0 =C2=A0package/cutekeyboard/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/fail2ban/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/grep/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/htpdate/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index e3a34d6e97..f11210d313 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -1522,6 +1522,7 @@ menu &quot;Graphics&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/cairo/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/cairomm/Config.in&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/chipmunk/Config.in&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/cutekeyboard/Config.in&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/exempi/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/exiv2/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/fltk/Config.in&quot;<br>
diff --git a/package/cutekeyboard/Config.in b/package/cutekeyboard/Config.i=
n<br>
new file mode 100644<br>
index 0000000000..389c583313<br>
--- /dev/null<br>
+++ b/package/cutekeyboard/Config.in<br>
@@ -0,0 +1,18 @@<br>
+config BR2_PACKAGE_CUTEKEYBOARD<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;cutekeyboard&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QT5DECLARATIVE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QT5QUICKCONTROLS2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CuteKeyboard is a Qt virtual keyboard pl=
ugin for embedded applications.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://amarula.github.io/cut=
ekeyboard/" rel=3D"noreferrer" target=3D"_blank">https://amarula.github.io/=
cutekeyboard/</a><br>
+<br>
+if BR2_PACKAGE_CUTEKEYBOARD<br>
+<br>
+config BR2_PACKAGE_CUTEKEYBOARD_EXAMPLES<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;cutekeyboard example&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Compile also application example<br>
+<br>
+endif<br>
diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/=
cutekeyboard.hash<br>
new file mode 100644<br>
index 0000000000..4720d7ec40<br>
--- /dev/null<br>
+++ b/package/cutekeyboard/cutekeyboard.hash<br>
@@ -0,0 +1,3 @@<br>
+# Locally computed<br>
+sha256=C2=A0 1c7950d176678e82f99e8a6f67cac2e030f623f1ea40937f12c3dbdd6f0c7=
01f=C2=A0 cutekeyboard-v1.0.1.tar.gz<br>
+sha256=C2=A0 bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd659=
64d=C2=A0 LICENSE<br>
diff --git a/package/cutekeyboard/<a href=3D"http://cutekeyboard.mk" rel=3D=
"noreferrer" target=3D"_blank">cutekeyboard.mk</a> b/package/cutekeyboard/<=
a href=3D"http://cutekeyboard.mk" rel=3D"noreferrer" target=3D"_blank">cute=
keyboard.mk</a><br>
new file mode 100644<br>
index 0000000000..b43595075a<br>
--- /dev/null<br>
+++ b/package/cutekeyboard/<a href=3D"http://cutekeyboard.mk" rel=3D"norefe=
rrer" target=3D"_blank">cutekeyboard.mk</a><br>
@@ -0,0 +1,18 @@<br>
+##########################################################################=
######<br>
+#<br>
+# cutekeyboard<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+CUTEKEYBOARD_VERSION =3D v1.0.1<br>
+CUTEKEYBOARD_SITE =3D $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VE=
RSION))<br>
+CUTEKEYBOARD_DEPENDENCIES =3D qt5declarative qt5quickcontrols2<br>
+CUTEKEYBOARD_INSTALL_STAGING =3D YES<br>
+CUTEKEYBOARD_LICENSE =3D MIT<br>
+CUTEKEYBOARD_LICENSE_FILES =3D LICENSE<br>
+<br>
+ifeq ($(BR2_PACKAGE_CUTEKEYBOARD_EXAMPLES),y)<br>
+CUTEKEYBOARD_CONF_OPTS +=3D CONFIG+=3DBUILD_EXAMPLES<br>
+endif<br>
+<br>
+$(eval $(qmake-package))<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--0000000000009f33a305eb362335--

--===============2920842068285045449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2920842068285045449==--
