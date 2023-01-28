Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5963DC38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 00:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5AC740017;
	Sat, 28 Jan 2023 00:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5AC740017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8OtGg_LXDL5U; Sat, 28 Jan 2023 00:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8EAD4026F;
	Sat, 28 Jan 2023 00:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8EAD4026F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 348E11BF977
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 00:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A930823C6
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 00:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A930823C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8fjaiHnWSX9 for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 00:17:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F61882390
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F61882390
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 00:17:39 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id m199so7943326ybm.4
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 16:17:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6u0wtK00WWIFsgfeM2IY3WQUtmgJ2aZaQZ85N4iu1CI=;
 b=E+BxwB/uKKTa4kNhfSg2j+8tsDmaRHCKswnQpiRQL4KvDMjNBqS6NPbLNxML1sBbkM
 49wOjKnjWO5zt2GYOKhspGiFM0FFX92nys0WZgyf8KT9MUfIbX0QXpiKt3bUZjT2XGHI
 S/MqBx+jySYhY1ULeDYwgxxh1WDtz3H75DIFwsY9u2IokEyxujpYi+j0JDIq7V4z47+N
 WxWM65fYE5IlTxqOo2CXRmwfcfzd9qt9f0E0wxR7Dtw17i0pfAc2HS9ZY+fzmw9ejnHF
 /DXbCd8e90YuVimce6Y0hR/NNbsbIVQ18dWsjV1kOOlTS6+lfjbGV7BJwzhXZqqdbSBs
 KbJA==
X-Gm-Message-State: AFqh2kppRj6sJKUMsmLpbCBwHq8qgUIL3p5daIQ920tl8NUEuqdXJ2bV
 bYQ5oI+YkOEEqTFn6KU7g305euYVqgv5YWUZOrU=
X-Google-Smtp-Source: AMrXdXuXq8Wz0vBLYgI+uZOSZhI54W1lFkcjXFwdjIBG0w1dXEF/fnEWVFvVtPGCi5ytjYtfQkZV1L4bpNxUZwR+h1c=
X-Received: by 2002:a5b:ca:0:b0:7fb:feb3:380e with SMTP id
 d10-20020a5b00ca000000b007fbfeb3380emr2973778ybp.587.1674865058308; 
 Fri, 27 Jan 2023 16:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20230127231808.1364957-1-a.partesotti@gmail.com>
In-Reply-To: <20230127231808.1364957-1-a.partesotti@gmail.com>
From: bryce.schober@gmail.com
Date: Fri, 27 Jan 2023 16:17:02 -0800
Message-ID: <CAJpxd07BcA_2mEosZwDFMjkzfUwu40-yMWE8DUeFeEoC+z-8HA@mail.gmail.com>
To: Alessandro Partesotti <a.partesotti@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6u0wtK00WWIFsgfeM2IY3WQUtmgJ2aZaQZ85N4iu1CI=;
 b=Q8AYg4f0/T9jCM+KlnPdIXDV6bRJyILvamIBF0GUQRs+2uYWsMG6LKeWXZVVr8EFo6
 qvzDlQ9Cb+uXrlboT7gwcmPmBag3rL4KXLNZThXUN33YQ4asCjzPIUqMLapIp6ePg9Qx
 JQ7M1TdWSssXXhGac/sj5xPHQ23RQitDUVk9NKFWS1ZFGJ6OggPSNt59VfubyZcNX1NJ
 fi6TP9+rreduz7GpS9uzyY6OP/LsX9P4BYGvnaGC6MiRGwokTaNs/PxOumKredM6/h0y
 KFJUIYj3M+m6DlfiQuOB7qapjD4fqiAeps9OFin85L5CXxMakjaFR/8gu4haeFo2pVQx
 rkUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Q8AYg4f0
Subject: Re: [Buildroot] [PATCH 1/1] package/oatpp:: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8774486709639145192=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8774486709639145192==
Content-Type: multipart/alternative; boundary="000000000000d8e7db05f347e818"

--000000000000d8e7db05f347e818
Content-Type: text/plain; charset="UTF-8"

For https://oatpp.io/docs/, I get:

server=oatpp/1.3.0
code=500
description=Internal Server Error
message=Page not found

It looks like it doesn't like trimming the URL, and
https://oatpp.io/docs/start looks better.

<><  <><  <><
Bryce Schober


On Fri, Jan 27, 2023 at 3:18 PM Alessandro Partesotti <
a.partesotti@gmail.com> wrote:

> This package introduce oatpp in BR buildsystem. oatpp must be used as
> static linkable library in
> $(STAGING_DIR)/usr/include/oatpp-$(OATPP_VERSION)/oatpp for user that want
> to build therir own application by linking oatpp in a buildroot build
> system.
>
> Signed-off-by: Alessandro Partesotti <a.partesotti@gmail.com>
> ---
>  package/Config.in       |  3 +++
>  package/oatpp/Config.in | 14 ++++++++++++++
>  package/oatpp/oatpp.mk  | 16 ++++++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 package/oatpp/Config.in
>  create mode 100644 package/oatpp/oatpp.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 995dae2c57..481876a278 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1941,6 +1941,7 @@ menu "Networking"
>         source "package/nss-mdns/Config.in"
>         source "package/nss-myhostname/Config.in"
>         source "package/nss-pam-ldapd/Config.in"
> +       source "package/oatpp/Config.in"
>         source "package/omniorb/Config.in"
>         source "package/open-isns/Config.in"
>         source "package/open62541/Config.in"
> @@ -2702,4 +2703,6 @@ menu "Text editors and viewers"
>         source "package/vim/Config.in"
>  endmenu
>
> +
>  endmenu
> +
> diff --git a/package/oatpp/Config.in b/package/oatpp/Config.in
> new file mode 100644
> index 0000000000..3cf6bf3ef5
> --- /dev/null
> +++ b/package/oatpp/Config.in
> @@ -0,0 +1,14 @@
> +comment "Oat++ needs a toolchain w/ C++, threads and Paranoid Unsafe Path
> compiler flag disabled"
> +        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> || BR2_COMPILER_PARANOID_UNSAFE_PATH
> +
> +config BR2_PACKAGE_OATPP
> +       bool "Oat++"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !BR2_COMPILER_PARANOID_UNSAFE_PATH
> +       help
> +               Oat++ is an open-source C++ web framework for highly
> scalable and resource-efficient web applications.
> +               It provides all the necessary components for
> production-grade development.
> +               This package allows you to use oatpp to statically build
> this a project inside the staging directory.
> +               See https://oatpp.io/docs/
> +
> diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
> new file mode 100644
> index 0000000000..7abdeb6de5
> --- /dev/null
> +++ b/package/oatpp/oatpp.mk
> @@ -0,0 +1,16 @@
>
> +################################################################################
> +#
> +# oatpp
> +#
>
> +################################################################################
> +
> +OATPP_VERSION= 1.3.0
> +OATPP_SOURCE= $(OATPP_VERSION).tar.gz
> +OATPP_SITE= https://github.com/oatpp/oatpp/archive/refs/tags
> +#OATPP_SITE= git://github.com/oatpp/oatpp.git
> +OATPP_INSTALL_STAGING= YES
> +OATPP_INSTALL_TARGET= NO
> +OATPP_MAKE=make
> +
> +$(eval $(cmake-package))
> +
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000d8e7db05f347e818
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">For=C2=A0<a href=3D"https://oatpp.io/docs=
/" rel=3D"noreferrer" target=3D"_blank">https://oatpp.io/docs/</a>, I get:<=
br><br>server=3Doatpp/1.3.0<br>code=3D500<br>description=3DInternal Server =
Error<br>message=3DPage not found</div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr">It looks like it doesn&#39;t like trimming the URL, and=C2=A0<a hr=
ef=3D"https://oatpp.io/docs/start">https://oatpp.io/docs/start</a>=C2=A0loo=
ks better.<br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div><br></div><div>&lt;&gt;&l=
t; =C2=A0&lt;&gt;&lt; =C2=A0&lt;&gt;&lt;</div><div>Bryce Schober</div></div=
></div></div></div></div></div><br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 27, 2023 at 3:18 PM Alessand=
ro Partesotti &lt;<a href=3D"mailto:a.partesotti@gmail.com">a.partesotti@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">This package introduce oatpp in BR buildsystem. oatpp must be used a=
s static linkable library in $(STAGING_DIR)/usr/include/oatpp-$(OATPP_VERSI=
ON)/oatpp for user that want to build therir own application by linking oat=
pp in a buildroot build system.<br>
<br>
Signed-off-by: Alessandro Partesotti &lt;<a href=3D"mailto:a.partesotti@gma=
il.com" target=3D"_blank">a.partesotti@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A0package/oatpp/Config.in | 14 ++++++++++++++<br>
=C2=A0package/oatpp/<a href=3D"http://oatpp.mk" rel=3D"noreferrer" target=
=3D"_blank">oatpp.mk</a>=C2=A0 | 16 ++++++++++++++++<br>
=C2=A03 files changed, 33 insertions(+)<br>
=C2=A0create mode 100644 package/oatpp/Config.in<br>
=C2=A0create mode 100644 package/oatpp/<a href=3D"http://oatpp.mk" rel=3D"n=
oreferrer" target=3D"_blank">oatpp.mk</a><br>
<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 995dae2c57..481876a278 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -1941,6 +1941,7 @@ menu &quot;Networking&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/nss-mdns/Config.in&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/nss-myhostname/Config.in&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/nss-pam-ldapd/Config.in&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/oatpp/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/omniorb/Config.in&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/open-isns/Config.in&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/open62541/Config.in&quot;<=
br>
@@ -2702,4 +2703,6 @@ menu &quot;Text editors and viewers&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/vim/Config.in&quot;<br>
=C2=A0endmenu<br>
<br>
+<br>
=C2=A0endmenu<br>
+<br>
diff --git a/package/oatpp/Config.in b/package/oatpp/Config.in<br>
new file mode 100644<br>
index 0000000000..3cf6bf3ef5<br>
--- /dev/null<br>
+++ b/package/oatpp/Config.in<br>
@@ -0,0 +1,14 @@<br>
+comment &quot;Oat++ needs a toolchain w/ C++, threads and Paranoid Unsafe =
Path compiler flag disabled&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOL=
CHAIN_HAS_THREADS || BR2_COMPILER_PARANOID_UNSAFE_PATH<br>
+<br>
+config BR2_PACKAGE_OATPP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Oat++&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_COMPILER_PARANOID_UNSAFE_PATH<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Oat++ is an open-so=
urce C++ web framework for highly scalable and resource-efficient web appli=
cations.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0It provides all the=
 necessary components for production-grade development.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This package allows=
 you to use oatpp to statically build this a project inside the staging dir=
ectory.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0See <a href=3D"http=
s://oatpp.io/docs/" rel=3D"noreferrer" target=3D"_blank">https://oatpp.io/d=
ocs/</a><br>
+<br>
diff --git a/package/oatpp/<a href=3D"http://oatpp.mk" rel=3D"noreferrer" t=
arget=3D"_blank">oatpp.mk</a> b/package/oatpp/<a href=3D"http://oatpp.mk" r=
el=3D"noreferrer" target=3D"_blank">oatpp.mk</a><br>
new file mode 100644<br>
index 0000000000..7abdeb6de5<br>
--- /dev/null<br>
+++ b/package/oatpp/<a href=3D"http://oatpp.mk" rel=3D"noreferrer" target=
=3D"_blank">oatpp.mk</a><br>
@@ -0,0 +1,16 @@<br>
+##########################################################################=
######<br>
+#<br>
+# oatpp<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+OATPP_VERSION=3D 1.3.0<br>
+OATPP_SOURCE=3D $(OATPP_VERSION).tar.gz<br>
+OATPP_SITE=3D <a href=3D"https://github.com/oatpp/oatpp/archive/refs/tags"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/oatpp/oatpp/archiv=
e/refs/tags</a><br>
+#OATPP_SITE=3D git://<a href=3D"http://github.com/oatpp/oatpp.git" rel=3D"=
noreferrer" target=3D"_blank">github.com/oatpp/oatpp.git</a><br>
+OATPP_INSTALL_STAGING=3D YES<br>
+OATPP_INSTALL_TARGET=3D NO<br>
+OATPP_MAKE=3Dmake<br>
+<br>
+$(eval $(cmake-package))<br>
+<br>
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

--000000000000d8e7db05f347e818--

--===============8774486709639145192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8774486709639145192==--
