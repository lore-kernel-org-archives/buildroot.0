Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80577CAC5A7
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 09:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3219741142;
	Thu, 25 Sep 2025 09:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbPiAVBN8rQp; Thu, 25 Sep 2025 09:22:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 536AA41171
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 536AA41171;
	Thu, 25 Sep 2025 09:22:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25445199
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 09:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1755C40BAE
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 09:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MU94XaJ2SPA for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 09:22:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E09940B7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E09940B7B
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E09940B7B
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 09:22:05 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b2ebb73dab4so16300966b.0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 02:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758792123; x=1759396923;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qycCH/jSoBYGEINhP4UiOl7lIC4qitI6Z5ORJSpVgTc=;
 b=mUrGS4omc/bn4nG4eC/IURLUy0Yz5mTW06L6eu9GJzvp458PCgNxlJUs3TLAwznqbP
 X5D/WLXACkCoIfwlVTsltjOBOe+zOGMGg2/qGgYdoIccVbOYdYyNbqCHP3eWrsWDALQD
 FkxY82ghAiin8oFh47FQ07+hICFH+sNLluDLBSQhG9p6j2QiySYOWbVWa3lF7hVPa9i8
 CJZCkYhkz3KvDyTRLZr0LzN+kYpTlLNPUHa5ZXi1IBgGIwuRxu9JVGFYUPnzEteVZp0u
 D9Cm848VbXogw2n7d0/1vetTgTx5dOjp3A74UveI4Xl2nIk8Wsf0ZJhcVSBtvQjJ7lvi
 bJOw==
X-Gm-Message-State: AOJu0Yyf8o7kBNX66X7w70U2qRx7CWQnhKGpXehoeSJe+bDIDbJpTEkm
 1eQBTQo4MVg1QPZ2EHoLhn1AKNBSmtpP0fqu2Xbb6La6POtJtyPXqKz5d8m88K+x0kKnIoxEfwA
 /GtUgFzJtexhtOQUve//Nd5YDijvOVh3Uw5hvXujoL5qyxmozB0zl
X-Gm-Gg: ASbGncvWRCVGrUWL1VQug6YndDGI6julmiFrPR8voxw+/W0eLhmWeb0HmKcQazZ399M
 Ya/hH1lK2QRml61nufj7ltPFJvSHQTftfL7EXxj76ZmTTkyS/Jg/OT+tViA8XYoU4Tb1MdXlIFf
 NJEmpdvZBHN936BwTNYEM4SmLpn3wo8oAptxxl5vr9GmsuAMPa5lhAV4Mx98soOZ+N3l3X+BJ2Y
 tsaouAuLzYri02Vc7C4Mc5a80AZFAH5srePhXbuHHaXOnx+HbY=
X-Google-Smtp-Source: AGHT+IEr2ESBwsx9dytRm3q9yRSFjkXa9kVJfs0D2JQSuuBqpHm6nt2+n6ZpfKKJWOwvDvLRKGHT7ufjLPZSckLHCx0=
X-Received: by 2002:a17:907:3fa4:b0:b2d:a873:37d with SMTP id
 a640c23a62f3a-b34b16a35e3mr173021966b.0.1758792123446; Thu, 25 Sep 2025
 02:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250925091956.25697-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20250925091956.25697-1-adam.duskett@amarulasolutions.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 25 Sep 2025 11:21:52 +0200
X-Gm-Features: AS18NWBvAxZmB4Nopx0CaQwvywHrQhhCirtF2x64zdyt59KalcF4m1haJwIF8sY
Message-ID: <CAHDQB6N+Lsq6xncPZa=90_ORtHd2ifmFbwxOt4Mh418oXsGNPA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758792123; x=1759396923;
 darn=buildroot.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qycCH/jSoBYGEINhP4UiOl7lIC4qitI6Z5ORJSpVgTc=;
 b=n3jH7VU2iORs+5za3YMWIx+vgryfSJvt4Bcj2NbNuSi6eIa32kaUCpaY+fD85em4p1
 mb1kTZ/k6fKEl+BejIE682oy11lOAq9h+QieDbYGR3+/r8e7Qli3J+pwjgRXMKQiBEB7
 IbzKLB9TFMRhu15JDclrEDh+1Lb+J8QKNjcEA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=n3jH7VU2
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: Remove
 adam.duskett@amarulasolutions from sway package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6909470057588557079=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6909470057588557079==
Content-Type: multipart/alternative; boundary="000000000000c08cce063f9cb31d"

--000000000000c08cce063f9cb31d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Minor nit:

sway packages*

Adam Duskett

Senior Embedded Systems Developer

M. +31-627-966-675

adam.duskett@amarulasolutions.com

__________________________________


Amarula Solutions BV

Joop Geesinkweg 125, 1114 AB, Amsterdam, NL

T. +31 (0)85 111 9170
info@amarulasolutions.com

www.amarulasolutions.com



On Thu, Sep 25, 2025 at 11:19=E2=80=AFAM Adam Duskett <
adam.duskett@amarulasolutions.com> wrote:

> Patches submitted to update these packages have gone ignored for
> months without comment, and I no longer wish to recieve daily
> emails about them being out of date.
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  DEVELOPERS | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9094973fdf..fc561eb1ea 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -28,9 +28,6 @@
>
>  N:     Adam Duskett <adam.duskett@amarulasolutions.com>
>  F:     package/depot-tools/
> -F:     package/dmenu-wayland/
> -F:     package/fcft/
> -F:     package/foot/
>  F:     package/flutter-engine/
>  F:     package/flutter-packages/
>  F:     package/flutter-packages/flutter-adaptive-scaffold-example/
> @@ -42,9 +39,7 @@ F:    package/flutter-packages/flutter-rfw-local-exampl=
e/
>  F:     package/flutter-pi/
>  F:     package/flutter-sdk-bin/
>  F:     package/ivi-homescreen/
> -F:     package/libutempter/
>  F:     package/mender-update-modules/
> -F:     package/tllist/
>  F:     support/testing/tests/package/test_flutter.py
>
>  N:     Adam Heinrich <adam@adamh.cz>
> --
> 2.51.0
>
>

--000000000000c08cce063f9cb31d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Minor nit:</div><div><br></div><div>sway packages*</d=
iv><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><span><p dir=3D"ltr" style=3D"li=
ne-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;vertical-align:baseline;white-space:pre-wrap">Adam Dusk=
ett</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot=
;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;=
vertical-align:baseline;white-space:pre-wrap">Senior Embedded Systems Devel=
oper</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quo=
t;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent=
;vertical-align:baseline;white-space:pre-wrap">M. +</span><span style=3D"co=
lor:rgb(34,34,34)">31-627-966-675</span></p></span><span><p dir=3D"ltr" sty=
le=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;col=
or:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-sp=
ace:pre-wrap"><a href=3D"mailto:adam.duskett@amarulasolutions.com" target=
=3D"_blank">adam.duskett@amarulasolutions.com</a></span></p><p dir=3D"ltr" =
style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;=
color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white=
-space:pre-wrap">__________________________________</span></p><p dir=3D"ltr=
" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospac=
e;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;whi=
te-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubu=
ntu,sans-serif;color:rgb(0,0,0);background-color:transparent;vertical-align=
:baseline;white-space:pre-wrap">Amarula Solutions BV</span></p><p dir=3D"lt=
r" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospa=
ce;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;wh=
ite-space:pre-wrap">Joop Geesinkweg 125, 1114 AB, Amsterdam, NL</span></p><=
p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&qu=
ot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:=
baseline;white-space:pre-wrap">T. +31 (0)85 111 9170</span><span style=3D"f=
ont-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0=
);background-color:transparent;vertical-align:baseline;white-space:pre-wrap=
"><br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&qu=
ot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:=
baseline;white-space:pre-wrap"><a href=3D"mailto:info@amarulasolutions.com"=
 target=3D"_blank">info@amarulasolutions.com</a></span></p><p dir=3D"ltr" s=
tyle=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><a=
 href=3D"http://www.amarulasolutions.com/" target=3D"_blank"><span style=3D=
"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0=
,0);background-color:transparent;vertical-align:baseline;white-space:pre-wr=
ap">www.amarulasolutions.com</span></a></p><div><br></div></span></div></di=
v></div><br></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 25, 2025 at 11:19=E2=80=AFAM =
Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolutions.com">adam.=
duskett@amarulasolutions.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Patches submitted to update these packages have=
 gone ignored for<br>
months without comment, and I no longer wish to recieve daily<br>
emails about them being out of date.<br>
<br>
Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolut=
ions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
---<br>
=C2=A0DEVELOPERS | 5 -----<br>
=C2=A01 file changed, 5 deletions(-)<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 9094973fdf..fc561eb1ea 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -28,9 +28,6 @@<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Adam Duskett &lt;<a href=3D"mailto:adam.duskett=
@amarulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com<=
/a>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/depot-tools/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/dmenu-wayland/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/fcft/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/foot/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/flutter-engine/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/flutter-packages/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/flutter-packages/flutter-adaptive-scaff=
old-example/<br>
@@ -42,9 +39,7 @@ F:=C2=A0 =C2=A0 package/flutter-packages/flutter-rfw-loca=
l-example/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/flutter-pi/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/flutter-sdk-bin/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/ivi-homescreen/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/libutempter/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/mender-update-modules/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/tllist/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0support/testing/tests/package/test_flutter.py<b=
r>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Adam Heinrich &lt;<a href=3D"mailto:adam@adamh.=
cz" target=3D"_blank">adam@adamh.cz</a>&gt;<br>
-- <br>
2.51.0<br>
<br>
</blockquote></div>

--000000000000c08cce063f9cb31d--

--===============6909470057588557079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6909470057588557079==--
