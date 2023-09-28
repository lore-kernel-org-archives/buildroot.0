Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80168CE7B1E
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 19:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05C4C4206E;
	Thu, 28 Sep 2023 19:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05C4C4206E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EL0JuW3TZgFQ; Thu, 28 Sep 2023 19:04:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE094207F;
	Thu, 28 Sep 2023 19:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE094207F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6939D1BF30F
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 19:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50F74401B2
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 19:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50F74401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wUar-XAgHohL for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 19:04:35 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF765400D1
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 19:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF765400D1
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2c012232792so223215521fa.0
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 12:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695927872; x=1696532672;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a6ylAYgjTFDGpFBeGL0tT1ZXBiimAKVx6tpEM+uQznE=;
 b=LXb935RtmuLxWkWEwaX7TzXDjR4izj6uxLIPzeTlc9itlfYtVSCP917C6cPKEekaD6
 cLWw1/OB8xZh8KE9LldxeWHyeaQuXU7GEvlIKjQjeW+6/ledP/DJq41grlHMMFbuUw9P
 +y/945cGvMH9nQ5mjnR832lvBUJdDuHg0C8R4VMoQZiasziAH8jlC3qNoUxeY7TB3boa
 nWPrrfagdy+dVHac7JvHHHA1Gp7uLF2ZVESg/Ugo8OM918J3QPwPed2dCxyDTKUsiBzc
 FmrNtuKcop6+Qjqc1Br8d2GqQlMXroAeYKRbKHZZrdjdSpUNVNPU5BqWq33nZIqDC2zy
 nPSQ==
X-Gm-Message-State: AOJu0Yz8eJTwI+8OQFhaDrEyaO9IHlyiIA49MynNh0xUfR2/40aPJ0OY
 049NdOWthM23PdqXRhimh4gaIwQTTDvCNw==
X-Google-Smtp-Source: AGHT+IF2Z3lCKT+tWy/UiQMnsvFjTQiFqslBP6856K7SMHl2vFZGTtgckWnp2n8F5otBYoiyiroSHA==
X-Received: by 2002:a2e:8089:0:b0:2bc:f78a:e5e0 with SMTP id
 i9-20020a2e8089000000b002bcf78ae5e0mr2285587ljg.43.1695927871709; 
 Thu, 28 Sep 2023 12:04:31 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41]) by smtp.gmail.com with ESMTPSA id
 k10-20020a05651c0a0a00b002b6d7682050sm2387657ljq.89.2023.09.28.12.04.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Sep 2023 12:04:31 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-50307acd445so20984139e87.0
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 12:04:31 -0700 (PDT)
X-Received: by 2002:ac2:43dc:0:b0:4fb:7559:aea3 with SMTP id
 u28-20020ac243dc000000b004fb7559aea3mr1805097lfl.39.1695927871042; Thu, 28
 Sep 2023 12:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230919172300.9901-1-brandon.maier@collins.com>
 <20230928002728.2402-1-brandon.maier@collins.com>
 <20230928002728.2402-2-brandon.maier@collins.com>
In-Reply-To: <20230928002728.2402-2-brandon.maier@collins.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 28 Sep 2023 21:04:19 +0200
X-Gmail-Original-Message-ID: <CACXRmJi3+Oboiyi=35GRGwTgB0a-4OVsTOHtXE7u5ft5gnzwWQ@mail.gmail.com>
Message-ID: <CACXRmJi3+Oboiyi=35GRGwTgB0a-4OVsTOHtXE7u5ft5gnzwWQ@mail.gmail.com>
To: Brandon Maier <brandon.maier@collins.com>
Subject: Re: [Buildroot] [PATCH v2 2/2] unifdef: add target package
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6078578979921944031=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6078578979921944031==
Content-Type: multipart/alternative; boundary="000000000000517df306066ffa8f"

--000000000000517df306066ffa8f
Content-Type: text/plain; charset="UTF-8"

> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
>
Reviewed-by: Thomas Devoogdt <thomas@devoogdt.com>

> ---
> Change v1 -> v2:
>   - Move from Misc packages to Dev packages
> ---
>  DEVELOPERS                 | 1 +
>  package/Config.in          | 1 +
>  package/unifdef/Config.in  | 9 +++++++++
>  package/unifdef/unifdef.mk | 9 +++++++++
>  4 files changed, 20 insertions(+)
>  create mode 100644 package/unifdef/Config.in
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e8b78a8d46..defeb502ab 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -513,6 +513,7 @@ F:  package/iftop/
>  F:     package/ncdu/
>
>  N:     Brandon Maier <brandon.maier@collins.com>
> +F:     package/unifdef/
>  F:     package/vmtouch/
>
>  N:     Brock Williams <brock@cottonwoodcomputer.com>
> diff --git a/package/Config.in b/package/Config.in
> index e8dbadadf3..e70479059e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -201,6 +201,7 @@ menu "Development tools"
>         source "package/sed/Config.in"
>         source "package/subversion/Config.in"
>         source "package/tree/Config.in"
> +       source "package/unifdef/Config.in"
>         source "package/yasm/Config.in"
>  endmenu
>
> diff --git a/package/unifdef/Config.in b/package/unifdef/Config.in
> new file mode 100644
> index 0000000000..a1a44d9f5a
> --- /dev/null
> +++ b/package/unifdef/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_UNIFDEF
> +       bool "unifdef"
> +       help
> +         The unifdef utility selectively processes conditional C
> +         preprocessor #if and #ifdef directives. It removes from a file
> +         both the #directives and the additional text that they
> +         delimit, while otherwise leaving the file alone.
> +
> +         http://dotat.at/prog/unifdef/
> diff --git a/package/unifdef/unifdef.mk b/package/unifdef/unifdef.mk
> index fd74455894..6761e32b69 100644
> --- a/package/unifdef/unifdef.mk
> +++ b/package/unifdef/unifdef.mk
> @@ -9,6 +9,14 @@ UNIFDEF_SITE = https://dotat.at/prog/unifdef
>  UNIFDEF_LICENSE = BSD-2-Clause, BSD-3-Clause
>  UNIFDEF_LICENSE_FILES = COPYING
>
> +define UNIFDEF_BUILD_CMDS
> +       $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +endef
> +
> +define UNIFDEF_INSTALL_TARGET_CMDS
> +       $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(TARGET_DIR)
> install
> +endef
> +
>  define HOST_UNIFDEF_BUILD_CMDS
>         $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
>  endef
> @@ -17,4 +25,5 @@ define HOST_UNIFDEF_INSTALL_CMDS
>         $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
>  endef
>
> +$(eval $(generic-package))
>  $(eval $(host-generic-package))
> --
> 2.41.0
>
>
>

--000000000000517df306066ffa8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Brando=
n Maier &lt;<a href=3D"mailto:brandon.maier@collins.com" target=3D"_blank" =
rel=3D"noreferrer">brandon.maier@collins.com</a>&gt;<br></blockquote></div>=
</div><div dir=3D"auto">Reviewed-by: Thomas Devoogdt &lt;<a href=3D"mailto:=
thomas@devoogdt.com">thomas@devoogdt.com</a>&gt;=C2=A0</div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
Change v1 -&gt; v2:<br>
=C2=A0 - Move from Misc packages to Dev packages<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 +<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0package/unifdef/Config.in=C2=A0 | 9 +++++++++<br>
=C2=A0package/unifdef/<a href=3D"http://unifdef.mk" rel=3D"noreferrer noref=
errer" target=3D"_blank">unifdef.mk</a> | 9 +++++++++<br>
=C2=A04 files changed, 20 insertions(+)<br>
=C2=A0create mode 100644 package/unifdef/Config.in<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index e8b78a8d46..defeb502ab 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -513,6 +513,7 @@ F:=C2=A0 package/iftop/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/ncdu/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Brandon Maier &lt;<a href=3D"mailto:brandon.mai=
er@collins.com" target=3D"_blank" rel=3D"noreferrer">brandon.maier@collins.=
com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0package/unifdef/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/vmtouch/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Brock Williams &lt;<a href=3D"mailto:brock@cott=
onwoodcomputer.com" target=3D"_blank" rel=3D"noreferrer">brock@cottonwoodco=
mputer.com</a>&gt;<br>
diff --git a/package/Config.in b/package/Config.in<br>
index e8dbadadf3..e70479059e 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -201,6 +201,7 @@ menu &quot;Development tools&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/sed/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/subversion/Config.in&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/tree/Config.in&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/unifdef/Config.in&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/yasm/Config.in&quot;<br>
=C2=A0endmenu<br>
<br>
diff --git a/package/unifdef/Config.in b/package/unifdef/Config.in<br>
new file mode 100644<br>
index 0000000000..a1a44d9f5a<br>
--- /dev/null<br>
+++ b/package/unifdef/Config.in<br>
@@ -0,0 +1,9 @@<br>
+config BR2_PACKAGE_UNIFDEF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;unifdef&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The unifdef utility selectively processe=
s conditional C<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0preprocessor #if and #ifdef directives. =
It removes from a file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0both the #directives and the additional =
text that they<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0delimit, while otherwise leaving the fil=
e alone.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://dotat.at/prog/unifdef/=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://dotat.at/prog/unif=
def/</a><br>
diff --git a/package/unifdef/<a href=3D"http://unifdef.mk" rel=3D"noreferre=
r noreferrer" target=3D"_blank">unifdef.mk</a> b/package/unifdef/<a href=3D=
"http://unifdef.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">unifdef=
.mk</a><br>
index fd74455894..6761e32b69 100644<br>
--- a/package/unifdef/<a href=3D"http://unifdef.mk" rel=3D"noreferrer noref=
errer" target=3D"_blank">unifdef.mk</a><br>
+++ b/package/unifdef/<a href=3D"http://unifdef.mk" rel=3D"noreferrer noref=
errer" target=3D"_blank">unifdef.mk</a><br>
@@ -9,6 +9,14 @@ UNIFDEF_SITE =3D <a href=3D"https://dotat.at/prog/unifdef"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://dotat.at/prog/unif=
def</a><br>
=C2=A0UNIFDEF_LICENSE =3D BSD-2-Clause, BSD-3-Clause<br>
=C2=A0UNIFDEF_LICENSE_FILES =3D COPYING<br>
<br>
+define UNIFDEF_BUILD_CMDS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)<br>
+endef<br>
+<br>
+define UNIFDEF_INSTALL_TARGET_CMDS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefi=
x=3D$(TARGET_DIR) install<br>
+endef<br>
+<br>
=C2=A0define HOST_UNIFDEF_BUILD_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)<br>
=C2=A0endef<br>
@@ -17,4 +25,5 @@ define HOST_UNIFDEF_INSTALL_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=
=3D$(HOST_DIR) install<br>
=C2=A0endef<br>
<br>
+$(eval $(generic-package))<br>
=C2=A0$(eval $(host-generic-package))<br>
-- <br>
2.41.0<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000517df306066ffa8f--

--===============6078578979921944031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6078578979921944031==--
