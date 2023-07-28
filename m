Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB45C0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 05:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41BE34201D;
	Fri, 28 Jul 2023 05:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41BE34201D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BiAsAHbZjNHA; Fri, 28 Jul 2023 05:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E3D542027;
	Fri, 28 Jul 2023 05:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E3D542027
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25E5C1BF3ED
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 05:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F422640462
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 05:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F422640462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSj_01OPt96a for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 05:01:25 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB3A64012B
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 05:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB3A64012B
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so2946511e87.0
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 22:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690520482; x=1691125282;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bgy8+/9YP+hQLKfwfGAmyzNRSSmzEtjVX41nyFV9b8A=;
 b=P1LUR6xBw9KueBnkWM4fkSMRqtU1NLHtN83BKjcsmwJx/1rqt4/Jg6yHZZZTtgMwhp
 at471UlQ5PEaK+PJgudWgen6iRR+z10dxahldP8MwsQssZplDCIOGD+X2Sq9evahHGPx
 UtxpAHa57H8VYEB+8AH+Zzc3nt9Ir/tJIdLktNGU5M+19b6lSWDmneSpX63heZvv/j6P
 l6xSdc1P7PWx9iljmHqFpb/ZlrOnKGcR3mWh5FDcEAK+z+7XYvVfjgKRF0g9g2H2wYAy
 fnwjF3uDeM+rEWJYd/94WsGXXnC6MORtnPv7dWBcqIS+kAgfbpFbMrCBwm88sUYOQEoj
 7GsQ==
X-Gm-Message-State: ABy/qLb07hhenE7y8ktrTzbzQSyrwFr1Llbc54YSA29d5S0pWJ+VKWQJ
 WNAZfnLG3B5eYSuVsuEy2GFcrDUubEFW7g==
X-Google-Smtp-Source: APBJJlE5Cc91BhsvclkhhrceG88s5dv4TqgeM3lbgXV5VQyAQkqGTMBGezvWLiKbKqLqKMG2oD8Yag==
X-Received: by 2002:a19:ca1a:0:b0:4f8:70b8:12b1 with SMTP id
 a26-20020a19ca1a000000b004f870b812b1mr678503lfg.4.1690520481541; 
 Thu, 27 Jul 2023 22:01:21 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 r25-20020ac25a59000000b004faa2de9877sm629136lfn.286.2023.07.27.22.01.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 22:01:21 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-4fe0bb9500aso2921537e87.1
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 22:01:21 -0700 (PDT)
X-Received: by 2002:a05:6512:32bb:b0:4fd:c882:bb42 with SMTP id
 q27-20020a05651232bb00b004fdc882bb42mr721859lfe.15.1690520481151; Thu, 27 Jul
 2023 22:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230727212026.2269634-1-bernd@kuhls.net>
In-Reply-To: <20230727212026.2269634-1-bernd@kuhls.net>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Fri, 28 Jul 2023 07:01:09 +0200
X-Gmail-Original-Message-ID: <CACXRmJjOOZ0t+GU1Sarwt6FhEm8VZDoKg50DdFy6TGr1Yp2dCw@mail.gmail.com>
Message-ID: <CACXRmJjOOZ0t+GU1Sarwt6FhEm8VZDoKg50DdFy6TGr1Yp2dCw@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build without
 c++
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2383173638579982648=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2383173638579982648==
Content-Type: multipart/alternative; boundary="000000000000c3c4b5060184f8e5"

--000000000000c3c4b5060184f8e5
Content-Type: text/plain; charset="UTF-8"

Hi Bernd,


I know, I have a PR open for this upstream.
https://github.com/confluentinc/librdkafka/pull/4366

Which will then be added to fluent-bit.
https://github.com/fluent/fluent-bit/compare/master...ThomasDevoogdt:fluent-bit:bugfix/7741-librdkafka-without-cxx-support

The last one could then be applied in buildroot as a patch, or will be part
of a next fluent-bit release.

This is the issue which I originally submitted:
https://github.com/fluent/fluent-bit/issues/7741


Kr,

Thomas Devoogdt


Op do 27 jul. 2023 23:20 schreef Bernd Kuhls <bernd@kuhls.net>:

> The kafka plugin needs c++.
>
> Fixes:
>
> http://autobuild.buildroot.net/results/709/70960056479eab860e94eed993566fcb78c4dbbe/
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/fluent-bit/fluent-bit.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/
> fluent-bit.mk
> index 1185860661..245f6ecf44 100644
> --- a/package/fluent-bit/fluent-bit.mk
> +++ b/package/fluent-bit/fluent-bit.mk
> @@ -22,6 +22,16 @@ FLUENT_BIT_CONF_OPTS += \
>         -DFLB_PREFER_SYSTEM_LIBS=Yes \
>         -DFLB_BACKTRACE=No
>
> +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> +FLUENT_BIT_CONF_OPTS += \
> +       -DFLB_IN_KAFKA=Yes \
> +       -DFLB_OUT_KAFKA=Yes
> +else
> +FLUENT_BIT_CONF_OPTS += \
> +       -DFLB_IN_KAFKA=No \
> +       -DFLB_OUT_KAFKA=No
> +endif
> +
>  ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
>  FLUENT_BIT_WAMR_ARCH = $(call qstrip,$(BR2_PACKAGE_FLUENT_BIT_WASM_ARCH))
>
> --
> 2.39.2
>
>
>

--000000000000c3c4b5060184f8e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Bernd,=C2=A0<div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I know, I have a PR open for this ups=
tream.</div><div dir=3D"auto"><a href=3D"https://github.com/confluentinc/li=
brdkafka/pull/4366">https://github.com/confluentinc/librdkafka/pull/4366</a=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Which will then be add=
ed to fluent-bit.=C2=A0</div><div dir=3D"auto"><a href=3D"https://github.co=
m/fluent/fluent-bit/compare/master...ThomasDevoogdt:fluent-bit:bugfix/7741-=
librdkafka-without-cxx-support">https://github.com/fluent/fluent-bit/compar=
e/master...ThomasDevoogdt:fluent-bit:bugfix/7741-librdkafka-without-cxx-sup=
port</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">The last one co=
uld then be applied in buildroot as a patch, or will be part of a next flue=
nt-bit release.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Th=
is is the issue which I originally submitted:</div><div dir=3D"auto"><a hre=
f=3D"https://github.com/fluent/fluent-bit/issues/7741">https://github.com/f=
luent/fluent-bit/issues/7741</a></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Kr,</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Thomas Devoogdt=C2=A0</div><br><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Op do 27 jul. 2023 23:20 schreef=
 Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net">bernd@kuhls.net</a>&gt;=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">The kafka plugin needs c++.<br>
<br>
Fixes:<br>
<a href=3D"http://autobuild.buildroot.net/results/709/70960056479eab860e94e=
ed993566fcb78c4dbbe/" rel=3D"noreferrer noreferrer" target=3D"_blank">http:=
//autobuild.buildroot.net/results/709/70960056479eab860e94eed993566fcb78c4d=
bbe/</a><br>
<br>
Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" target=3D=
"_blank" rel=3D"noreferrer">bernd@kuhls.net</a>&gt;<br>
---<br>
=C2=A0package/fluent-bit/<a href=3D"http://fluent-bit.mk" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">fluent-bit.mk</a> | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/package/fluent-bit/<a href=3D"http://fluent-bit.mk" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">fluent-bit.mk</a> b/package/fluent-bi=
t/<a href=3D"http://fluent-bit.mk" rel=3D"noreferrer noreferrer" target=3D"=
_blank">fluent-bit.mk</a><br>
index 1185860661..245f6ecf44 100644<br>
--- a/package/fluent-bit/<a href=3D"http://fluent-bit.mk" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">fluent-bit.mk</a><br>
+++ b/package/fluent-bit/<a href=3D"http://fluent-bit.mk" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">fluent-bit.mk</a><br>
@@ -22,6 +22,16 @@ FLUENT_BIT_CONF_OPTS +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFLB_PREFER_SYSTEM_LIBS=3DYes \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFLB_BACKTRACE=3DNo<br>
<br>
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)<br>
+FLUENT_BIT_CONF_OPTS +=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFLB_IN_KAFKA=3DYes \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFLB_OUT_KAFKA=3DYes<br>
+else<br>
+FLUENT_BIT_CONF_OPTS +=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFLB_IN_KAFKA=3DNo \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFLB_OUT_KAFKA=3DNo<br>
+endif<br>
+<br>
=C2=A0ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)<br>
=C2=A0FLUENT_BIT_WAMR_ARCH =3D $(call qstrip,$(BR2_PACKAGE_FLUENT_BIT_WASM_=
ARCH))<br>
<br>
-- <br>
2.39.2<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000c3c4b5060184f8e5--

--===============2383173638579982648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2383173638579982648==--
