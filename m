Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E6BC61D92
	for <buildroot@archiver.kernel.org>; Tue, 21 Nov 2023 11:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29E9F417CD;
	Tue, 21 Nov 2023 11:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29E9F417CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJ7m6sAyQSLj; Tue, 21 Nov 2023 11:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 138EE417D1;
	Tue, 21 Nov 2023 11:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 138EE417D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F2511BF3EB
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 11:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14A3281E49
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 11:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14A3281E49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jedomds6ESHA for <buildroot@lists.busybox.net>;
 Tue, 21 Nov 2023 11:11:17 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBB7A81E47
 for <buildroot@busybox.net>; Tue, 21 Nov 2023 11:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBB7A81E47
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a00ac0101d9so174397766b.0
 for <buildroot@busybox.net>; Tue, 21 Nov 2023 03:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700565075; x=1701169875;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z7wq8NSG1xtZhYC18oRq0Y7GB0ydtMOEswYEUHEF0ek=;
 b=Wl93vX0YmL+UmSX1LPhMycJjKgVdFkeo19rkCbMHNRB/hDaJui85losCmlhFhodffL
 PJpx3GT5SxxhZr5DnF15xkQUSVLEX/LAcE7Ze7YqJax79oA5TcHjzw/sBQuAcIvUb+x1
 283lJ6/YdVpxOh0o6u7I7ualMkFjJ2BOY2C+ZAYC2zCGVAYp0D7AFIY8wdeP/J4pY4p6
 j9fAR5RmX/+SLHqvMho3641uHLa2hEfCjlkY5oNccnzlHFjrCt9Z/tn9shPsJfY0v1SH
 /YlDnWY6lvp6mjWUuN902Pf+kYJanSSnJkWIYvC5VL+BeAPEPMcL5ifbNwfFttrtlqTN
 JbQw==
X-Gm-Message-State: AOJu0YxHxgHKAcFifcK/UjD7keoYpHG90j9tZZ43+E5nxDwi6lPUel7j
 yZw1Nm3GkuGjgVCVkCqhnqKN8sMTUs28JnIWMZCwAzFQ
X-Google-Smtp-Source: AGHT+IElFpV5rpOVzMCc7AZZVgvjwZF4dQE521reRU6uXYVgQnDBKxBKsl8z0iBMI6/VuUtfdvDEOqj32heaAIT7jKI=
X-Received: by 2002:a17:907:c715:b0:9da:f85a:233f with SMTP id
 ty21-20020a170907c71500b009daf85a233fmr8385278ejc.28.1700565074547; Tue, 21
 Nov 2023 03:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20230318193159.1418922-1-francois.perrad@gadz.org>
In-Reply-To: <20230318193159.1418922-1-francois.perrad@gadz.org>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Tue, 21 Nov 2023 12:11:03 +0100
Message-ID: <CAGhdn57aiJ5OSYxPUFoBzVpFo-Hrt+k4W7X8e=5wnkjv4GKP5w@mail.gmail.com>
To: buildroot@busybox.net
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700565075; x=1701169875; darn=busybox.net;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z7wq8NSG1xtZhYC18oRq0Y7GB0ydtMOEswYEUHEF0ek=;
 b=dL0pAjbxWgBbmAmSr900tUhkHtgn2fMlJ5JSME4YOpdxbn4irLzwlMJpAulItbep2C
 3TR3JIAFZfUsXvwHL8KTclen7YThIN8pRoAFYAZO0glHC/DRuMtToHTImQcjjiLomsF9
 orit642CU6ayhOWq4ONu+Om41bbO+zTynYaS+xbpH8n1fskXnp6CWhsnbRnDsGV3HkJb
 fdKuYXUBdJ1CA6xYTTLu5R79a20/rGlQln76vBdKVGz4LZOxUXkvy94Wu7cmxIcZQHr/
 /uM/pGeyfMfygSHEgFwu1VbAwKZFxTaOb0dHpNCqlLU/bvZYoQyomEjU7CYH4nGqfOE8
 F4IQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dL0pAjbx
Subject: Re: [Buildroot] [PATCH 1/2] package/graphene: new package
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
Content-Type: multipart/mixed; boundary="===============2230558426971674839=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2230558426971674839==
Content-Type: multipart/alternative; boundary="0000000000002f96c9060aa7a9ac"

--0000000000002f96c9060aa7a9ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

Le sam. 18 mars 2023 =C3=A0 20:32, Francois Perrad <fperrad@gmail.com> a =
=C3=A9crit :

> a dependency for gtk4
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/graphene/Config.in     |  6 +++++
>  package/graphene/graphene.hash |  3 +++
>  package/graphene/graphene.mk   | 44 ++++++++++++++++++++++++++++++++++
>  5 files changed, 55 insertions(+)
>  create mode 100644 package/graphene/Config.in
>  create mode 100644 package/graphene/graphene.hash
>  create mode 100644 package/graphene/graphene.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7ef8f79a7..5000d7230 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1057,6 +1057,7 @@ F:        package/copas/
>  F:     package/coxpcall/
>  F:     package/dado/
>  F:     package/ficl/
> +F:     package/graphene/
>  F:     package/janet/
>  F:     package/libtomcrypt/
>  F:     package/libtommath/
> diff --git a/package/Config.in b/package/Config.in
> index c7bb52d27..272ea7f4a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1574,6 +1574,7 @@ menu "Graphics"
>         source "package/giblib/Config.in"
>         source "package/giflib/Config.in"
>         source "package/granite/Config.in"
> +       source "package/graphene/Config.in"
>         source "package/graphite2/Config.in"
>         source "package/gtkmm3/Config.in"
>         source "package/gtksourceview/Config.in"
> diff --git a/package/graphene/Config.in b/package/graphene/Config.in
> new file mode 100644
> index 000000000..60f6073a1
> --- /dev/null
> +++ b/package/graphene/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_GRAPHENE
> +       bool "graphene"
> +       help
> +         A thin layer of types for graphic libraries.
> +
> +         https://ebassi.github.io/graphene/
> diff --git a/package/graphene/graphene.hash
> b/package/graphene/graphene.hash
> new file mode 100644
> index 000000000..7d2b56945
> --- /dev/null
> +++ b/package/graphene/graphene.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  922dc109d2dc5dc56617a29bd716c79dd84db31721a8493a13a5f79109a4a4ed
> graphene-1.10.8.tar.gz
> +sha256  cfd9fd7b2be592d2c0910d32dc1d8910c08dc0670b1d9ce417a82fa9eb788df9
> LICENSE.txt
> diff --git a/package/graphene/graphene.mk b/package/graphene/graphene.mk
> new file mode 100644
> index 000000000..efdae9140
> --- /dev/null
> +++ b/package/graphene/graphene.mk
> @@ -0,0 +1,44 @@
>
> +########################################################################=
########
> +#
> +# graphene
> +#
>
> +########################################################################=
########
> +
> +GRAPHENE_VERSION =3D 1.10.8
> +GRAPHENE_SITE =3D $(call github,ebassi,graphene,$(GRAPHENE_VERSION))
> +GRAPHENE_LICENSE =3D MIT
> +GRAPHENE_LICENSE_FILES =3D LICENSE.txt
> +GRAPHENE_INSTALL_STAGING =3D YES
> +
> +GRAPHENE_CONF_OPTS =3D \
> +       -Dtests=3Dfalse \
> +       -Dinstalled_tests=3Dfalse \
> +       -Dgtk_doc=3Dfalse
> +
> +ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
> +GRAPHENE_CONF_OPTS +=3D -Dgobject_types=3Dtrue
> +GRAPHENE_DEPENDENCIES +=3D libglib2
> +else
> +GRAPHENE_CONF_OPTS +=3D -Dgobject_types=3Dfalse
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +GRAPHENE_CONF_OPTS +=3D -Dintrospection=3Denabled
> +GRAPHENE_DEPENDENCIES +=3D gobject-introspection
> +else
> +GRAPHENE_CONF_OPTS +=3D -Dintrospection=3Ddisabled
> +endif
> +
> +ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
> +GRAPHENE_CONF_OPTS +=3D -Dsse2=3Dtrue
> +else
> +GRAPHENE_CONF_OPTS +=3D -Dsse2=3Dfalse
> +endif
> +
> +ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
> +GRAPHENE_CONF_OPTS +=3D -Darm_neon=3Dtrue
> +else
> +GRAPHENE_CONF_OPTS +=3D -Darm_neon=3Dfalse
> +endif
> +
> +$(eval $(meson-package))
> --
> 2.37.2
>
>

--0000000000002f96c9060aa7a9ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 18 mars 2023 =C3=A0=
=C2=A020:32, Francois Perrad &lt;<a href=3D"mailto:fperrad@gmail.com">fperr=
ad@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">a dependency for gtk4<br>
<br>
Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.o=
rg" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0package/graphene/Config.in=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++++<br>
=C2=A0package/graphene/graphene.hash |=C2=A0 3 +++<br>
=C2=A0package/graphene/<a href=3D"http://graphene.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">graphene.mk</a>=C2=A0 =C2=A0| 44 ++++++++++++++++++++++++++=
++++++++<br>
=C2=A05 files changed, 55 insertions(+)<br>
=C2=A0create mode 100644 package/graphene/Config.in<br>
=C2=A0create mode 100644 package/graphene/graphene.hash<br>
=C2=A0create mode 100644 package/graphene/<a href=3D"http://graphene.mk" re=
l=3D"noreferrer" target=3D"_blank">graphene.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 7ef8f79a7..5000d7230 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1057,6 +1057,7 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 package/copas/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/coxpcall/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/dado/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/ficl/<br>
+F:=C2=A0 =C2=A0 =C2=A0package/graphene/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/janet/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libtomcrypt/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libtommath/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index c7bb52d27..272ea7f4a 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -1574,6 +1574,7 @@ menu &quot;Graphics&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/giblib/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/giflib/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/granite/Config.in&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/graphene/Config.in&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/graphite2/Config.in&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/gtkmm3/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/gtksourceview/Config.in&qu=
ot;<br>
diff --git a/package/graphene/Config.in b/package/graphene/Config.in<br>
new file mode 100644<br>
index 000000000..60f6073a1<br>
--- /dev/null<br>
+++ b/package/graphene/Config.in<br>
@@ -0,0 +1,6 @@<br>
+config BR2_PACKAGE_GRAPHENE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;graphene&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0A thin layer of types for graphic librar=
ies.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://ebassi.github.io/grap=
hene/" rel=3D"noreferrer" target=3D"_blank">https://ebassi.github.io/graphe=
ne/</a><br>
diff --git a/package/graphene/graphene.hash b/package/graphene/graphene.has=
h<br>
new file mode 100644<br>
index 000000000..7d2b56945<br>
--- /dev/null<br>
+++ b/package/graphene/graphene.hash<br>
@@ -0,0 +1,3 @@<br>
+# Locally calculated<br>
+sha256=C2=A0 922dc109d2dc5dc56617a29bd716c79dd84db31721a8493a13a5f79109a4a=
4ed=C2=A0 graphene-1.10.8.tar.gz<br>
+sha256=C2=A0 cfd9fd7b2be592d2c0910d32dc1d8910c08dc0670b1d9ce417a82fa9eb788=
df9=C2=A0 LICENSE.txt<br>
diff --git a/package/graphene/<a href=3D"http://graphene.mk" rel=3D"norefer=
rer" target=3D"_blank">graphene.mk</a> b/package/graphene/<a href=3D"http:/=
/graphene.mk" rel=3D"noreferrer" target=3D"_blank">graphene.mk</a><br>
new file mode 100644<br>
index 000000000..efdae9140<br>
--- /dev/null<br>
+++ b/package/graphene/<a href=3D"http://graphene.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">graphene.mk</a><br>
@@ -0,0 +1,44 @@<br>
+##########################################################################=
######<br>
+#<br>
+# graphene<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+GRAPHENE_VERSION =3D 1.10.8<br>
+GRAPHENE_SITE =3D $(call github,ebassi,graphene,$(GRAPHENE_VERSION))<br>
+GRAPHENE_LICENSE =3D MIT<br>
+GRAPHENE_LICENSE_FILES =3D LICENSE.txt<br>
+GRAPHENE_INSTALL_STAGING =3D YES<br>
+<br>
+GRAPHENE_CONF_OPTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dtests=3Dfalse \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dinstalled_tests=3Dfalse \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dgtk_doc=3Dfalse<br>
+<br>
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)<br>
+GRAPHENE_CONF_OPTS +=3D -Dgobject_types=3Dtrue<br>
+GRAPHENE_DEPENDENCIES +=3D libglib2<br>
+else<br>
+GRAPHENE_CONF_OPTS +=3D -Dgobject_types=3Dfalse<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)<br>
+GRAPHENE_CONF_OPTS +=3D -Dintrospection=3Denabled<br>
+GRAPHENE_DEPENDENCIES +=3D gobject-introspection<br>
+else<br>
+GRAPHENE_CONF_OPTS +=3D -Dintrospection=3Ddisabled<br>
+endif<br>
+<br>
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)<br>
+GRAPHENE_CONF_OPTS +=3D -Dsse2=3Dtrue<br>
+else<br>
+GRAPHENE_CONF_OPTS +=3D -Dsse2=3Dfalse<br>
+endif<br>
+<br>
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)<br>
+GRAPHENE_CONF_OPTS +=3D -Darm_neon=3Dtrue<br>
+else<br>
+GRAPHENE_CONF_OPTS +=3D -Darm_neon=3Dfalse<br>
+endif<br>
+<br>
+$(eval $(meson-package))<br>
-- <br>
2.37.2<br>
<br>
</blockquote></div></div>

--0000000000002f96c9060aa7a9ac--

--===============2230558426971674839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2230558426971674839==--
