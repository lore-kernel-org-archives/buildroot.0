Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651C7C05027
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 06:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A50AC60FEA;
	Tue, 14 Feb 2023 06:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A50AC60FEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c3W7hDXA7KmM; Tue, 14 Feb 2023 06:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B998160E22;
	Tue, 14 Feb 2023 06:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B998160E22
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 114F81BF307
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 06:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC26780F04
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 06:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC26780F04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCbWucL0LgD7 for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 06:38:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AC2280DB9
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AC2280DB9
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 06:38:34 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id g8so15543366vso.3
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 22:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676356713;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aMzsxJpamRXTMZYt3btmDZfgMeedLd1wjUTp5M67yVY=;
 b=L2hC3HH03tKGew7v/62NBbSoRl5F4VcJsU5Az9xp46RLT/a1+BifaENst01o7EnX2n
 vQUen9CaYwJkmwVL95jPdaS+zG1b+fYw34GgiaWGmuSVYxf7Bb1dKodMIssb/JhnKFkz
 iuODs+JXOdudFNaUybNXyDslbpVDZ1EJMQIMgUWthBg1kzA/s6v9Gm1zhjT0dnZFtt8X
 9Mx9GaIKPgftGYveZo0dVDwJJrrlkXlJHV3WvABT8JSNvsvVxfSisHHO0rvmFzHC9NpI
 j3cwXedsf2OLiDD9jVk1+D3/K2sIFprimnOLhhPJ6Jdi0SAJr4vd4e5b8/TOiBKScge6
 wnIw==
X-Gm-Message-State: AO0yUKVZgj9Uec1gIbWNAsLNKtIs+8bdBf8U2rd3Ihh0/aKCyav8Xn7c
 ueRzNNAtcURFjEtmfFL3FAlDtoP963SoNiuTdTH0yX3z0Dw=
X-Google-Smtp-Source: AK7set+c/yunzXy2A6b+XaIIKWW870Ic2rL01Bu2X0w65ynpjIuQjr0MLZahpo62rOS+09RRCJ460h38WtqkfrGKPyE=
X-Received: by 2002:a67:c808:0:b0:412:5092:4e1b with SMTP id
 u8-20020a67c808000000b0041250924e1bmr138302vsk.36.1676356712854; Mon, 13 Feb
 2023 22:38:32 -0800 (PST)
MIME-Version: 1.0
References: <20230130104308.483243-1-marcus.folkesson@gmail.com>
In-Reply-To: <20230130104308.483243-1-marcus.folkesson@gmail.com>
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 14 Feb 2023 07:38:21 +0100
Message-ID: <CAM8FrKJbGWDCB66E50cSYDG=AjLJH1UXK3jRgOv2nFTZMfGgfg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1676356713;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aMzsxJpamRXTMZYt3btmDZfgMeedLd1wjUTp5M67yVY=;
 b=l3DWiH+Sda1CkyrEdAPquqm2Gos6vv68KT2IPP7/WYF4lGObKCs4on4fjJTKMKTMST
 Ti73aAc53AxZFrY4fz3b/Z+XEYw5g3n479QaZ9Vud21txFfyZPIBHGYTqz7B2sjPcUFX
 FW/ejicbRCt2a3Ce1T05wiLoy/FXSNQZDuUCZtOY00NU09Vj37WNQArKlw9EMYVIw7Es
 i4B0msF2QC/rfWZ/wOE/j3HNiBjbcb6E8bSzk28EWyNUX9ZpkC8+1slf/r+NboiY3wWx
 CU6OdKwIXrb40oQNaX+5ErDQaKdlOuD9ieLLYXJw6ubaYPb5R2CiHYT+LIYilhhHerms
 4Cgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l3DWiH+S
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pkg-kconfig.mk new
 <pkg>-show-fragment target
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: multipart/mixed; boundary="===============5868932697778380358=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5868932697778380358==
Content-Type: multipart/alternative; boundary="00000000000062f70205f4a33678"

--00000000000062f70205f4a33678
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping

Den m=C3=A5n 30 jan. 2023 kl 11:43 skrev Marcus Folkesson <
marcus.folkesson@gmail.com>:

> This patch introduce the new target to simplify the generation of
> configuration fragments as the output could be directly copied into a
> fragment file as-is.
>
> It is *heavily* based on the <pkg>-diff-config target, but serves a
> different purpose.
>
> Output from linux-diff-config:
> -CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK y
> -CONFIG_GCC_PLUGIN_CYC_COMPLEXITY n
> -CONFIG_GCC_PLUGIN_LATENT_ENTROPY n
> -CONFIG_GCC_PLUGIN_RANDSTRUCT n
> -CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF n
> -CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL n
> -CONFIG_GCC_PLUGIN_STRUCTLEAK_USER n
> -CONFIG_STACKPROTECTOR_PER_TASK y
> CONFIG_CRYPTO_DH n -> y
> CONFIG_CRYPTO_KPP m -> y
> CONFIG_GCC_PLUGINS y -> n
> CONFIG_KEY_DH_OPERATIONS n -> y
> CONFIG_PKCS8_PRIVATE_KEY_PARSER n -> y
> CONFIG_VIDEO_IMX274 n -> m
>
> Output from linux-show-fragment:
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_KPP=3Dy
> CONFIG_KEY_DH_OPERATIONS=3Dy
> CONFIG_PKCS8_PRIVATE_KEY_PARSER=3Dy
> CONFIG_VIDEO_IMX274=3Dm
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/pkg-kconfig.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index f4f35bf96a..ee96525c47 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -309,12 +309,26 @@ $(1)-diff-config: $(1)-check-configuration-done
>         $$(Q)cp -a $$($(2)_DIR)/.config.dc.bak
> $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
>         $$(Q)rm -f $$($(2)_DIR)/.config.dc.bak
>
> +# Target to output differences between the configuration obtained via th=
e
> +# defconfig + fragments (if any) and the current configuration.
> +# Output format is suitable to be used as-is in fragment files.
> +# Note: it preserves the timestamp of the current configuration when
> moving it
> +# around.
> +$(1)-show-fragment: $(1)-check-configuration-done
> +       $$(Q)cp -a $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
> $$($(2)_DIR)/.config.dc.bak
> +       $$(call
> kconfig-package-merge-config,$(2),$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)=
,\
> +               $$($(2)_KCONFIG_FRAGMENT_FILES))
> +       $$(Q)utils/diffconfig -m $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) =
\
> +                $$($(2)_DIR)/.config.dc.bak
> +       $$(Q)cp -a $$($(2)_DIR)/.config.dc.bak
> $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
> +       $$(Q)rm -f $$($(2)_DIR)/.config.dc.bak
>
>  endif # package enabled
>
>  .PHONY: \
>         $(1)-diff-config \
>         $(1)-check-configuration-done \
> +       $(1)-show-fragment \
>         $$($(2)_DIR)/.kconfig_editor_% \
>         $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))
>
> --
> 2.38.1
>
>

--00000000000062f70205f4a33678
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Den m=C3=A5n 30 jan. 2023 kl 11:43 skrev Marcus Folkes=
son &lt;<a href=3D"mailto:marcus.folkesson@gmail.com">marcus.folkesson@gmai=
l.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
his patch introduce the new target to simplify the generation of<br>
configuration fragments as the output could be directly copied into a<br>
fragment file as-is.<br>
<br>
It is *heavily* based on the &lt;pkg&gt;-diff-config target, but serves a<b=
r>
different purpose.<br>
<br>
Output from linux-diff-config:<br>
-CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK y<br>
-CONFIG_GCC_PLUGIN_CYC_COMPLEXITY n<br>
-CONFIG_GCC_PLUGIN_LATENT_ENTROPY n<br>
-CONFIG_GCC_PLUGIN_RANDSTRUCT n<br>
-CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF n<br>
-CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL n<br>
-CONFIG_GCC_PLUGIN_STRUCTLEAK_USER n<br>
-CONFIG_STACKPROTECTOR_PER_TASK y<br>
CONFIG_CRYPTO_DH n -&gt; y<br>
CONFIG_CRYPTO_KPP m -&gt; y<br>
CONFIG_GCC_PLUGINS y -&gt; n<br>
CONFIG_KEY_DH_OPERATIONS n -&gt; y<br>
CONFIG_PKCS8_PRIVATE_KEY_PARSER n -&gt; y<br>
CONFIG_VIDEO_IMX274 n -&gt; m<br>
<br>
Output from linux-show-fragment:<br>
CONFIG_CRYPTO_DH=3Dy<br>
CONFIG_CRYPTO_KPP=3Dy<br>
CONFIG_KEY_DH_OPERATIONS=3Dy<br>
CONFIG_PKCS8_PRIVATE_KEY_PARSER=3Dy<br>
CONFIG_VIDEO_IMX274=3Dm<br>
<br>
Signed-off-by: Marcus Folkesson &lt;<a href=3D"mailto:marcus.folkesson@gmai=
l.com" target=3D"_blank">marcus.folkesson@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/<a href=3D"http://pkg-kconfig.mk" rel=3D"noreferrer" target=
=3D"_blank">pkg-kconfig.mk</a> | 14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
<br>
diff --git a/package/<a href=3D"http://pkg-kconfig.mk" rel=3D"noreferrer" t=
arget=3D"_blank">pkg-kconfig.mk</a> b/package/<a href=3D"http://pkg-kconfig=
.mk" rel=3D"noreferrer" target=3D"_blank">pkg-kconfig.mk</a><br>
index f4f35bf96a..ee96525c47 100644<br>
--- a/package/<a href=3D"http://pkg-kconfig.mk" rel=3D"noreferrer" target=
=3D"_blank">pkg-kconfig.mk</a><br>
+++ b/package/<a href=3D"http://pkg-kconfig.mk" rel=3D"noreferrer" target=
=3D"_blank">pkg-kconfig.mk</a><br>
@@ -309,12 +309,26 @@ $(1)-diff-config: $(1)-check-configuration-done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $$(Q)cp -a $$($(2)_DIR)/.config.dc.bak $$($(2)_=
DIR)/$$($(2)_KCONFIG_DOTCONFIG)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $$(Q)rm -f $$($(2)_DIR)/.config.dc.bak<br>
<br>
+# Target to output differences between the configuration obtained via the<=
br>
+# defconfig + fragments (if any) and the current configuration.<br>
+# Output format is suitable to be used as-is in fragment files.<br>
+# Note: it preserves the timestamp of the current configuration when movin=
g it<br>
+# around.<br>
+$(1)-show-fragment: $(1)-check-configuration-done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(Q)cp -a $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONF=
IG) $$($(2)_DIR)/.config.dc.bak<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(call kconfig-package-merge-config,$(2),$$($(=
2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG),\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$$($(2)_KCONFIG_FRA=
GMENT_FILES))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(Q)utils/diffconfig -m $$($(2)_DIR)/$$($(2)_K=
CONFIG_DOTCONFIG) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $$($(2)_DIR)/.conf=
ig.dc.bak<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(Q)cp -a $$($(2)_DIR)/.config.dc.bak $$($(2)_=
DIR)/$$($(2)_KCONFIG_DOTCONFIG)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(Q)rm -f $$($(2)_DIR)/.config.dc.bak<br>
<br>
=C2=A0endif # package enabled<br>
<br>
=C2=A0.PHONY: \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(1)-diff-config \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(1)-check-configuration-done \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(1)-show-fragment \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $$($(2)_DIR)/.kconfig_editor_% \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))<br=
>
<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div>

--00000000000062f70205f4a33678--

--===============5868932697778380358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5868932697778380358==--
