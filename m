Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA3DC433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 15:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E5C611EE;
	Wed, 19 Oct 2022 15:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66E5C611EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZsqpLrORONRw; Wed, 19 Oct 2022 15:19:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ECE1611A8;
	Wed, 19 Oct 2022 15:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ECE1611A8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 938011BF983
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 15:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F0E340CFA
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 15:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F0E340CFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8fLbePJ5QD3I for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 15:19:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45B0D40469
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45B0D40469
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 15:19:32 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id n83so19571649oif.11
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 08:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mHt090jEq0PCDovXsFu0kfDSVhpLU51oJQlmGJnoBXA=;
 b=r9uw3/VZYw8QqCTQ9kQsJY/rDavE2zWHC9dPjDVPqiRNyRoZlwfijg/ib3ekeNSGXt
 k34iXYno7jM96mOKjnf0jj8DnRXzswFGyQbKXuS8bnqZc5MdDdbwMotW9dN0xWSFs19r
 UmdGLPWNYQOBp4CIeR7yCeeZ0MZj9lJr70zFBCaaxyNSCIAcAaupI51zrz5od0W4TFGX
 QTcqkfZ4X9aqEVuwixBCi0dHUAfWIIdvtWuOELf3B1StHi9UCPyTKrPqEhT0A6NPUCpA
 SIwXauY54Na+RgBy7hYpt+7O/a2mGd7ZFnB4bwvdJipS2rXUdlkIu+1NvBKM+JRqgAEy
 CBhw==
X-Gm-Message-State: ACrzQf2TyNDkklmLqmp8FMhzMXckxBQjLp/Z9R0Hdc69IWYwd3wjf/ku
 /FKOOack73WnmyFBwK1znAGdcbL9440nRRCXX9GPsvEd9iUZCg==
X-Google-Smtp-Source: AMsMyM5M6aKGYrBhkKd5iI4bHC4DThkVrtXViO8sOXg8nHDaxlSaMq8T3onNXFIiwBfDOXbvXGh0DRktMFBbguiJjww=
X-Received: by 2002:a05:6808:120c:b0:351:6d17:1845 with SMTP id
 a12-20020a056808120c00b003516d171845mr4780848oil.254.1666192769774; Wed, 19
 Oct 2022 08:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <fcf0570cac20f4a41a19816c8b5fc56c5106c457.1666168938.git.stefan@agner.ch>
In-Reply-To: <fcf0570cac20f4a41a19816c8b5fc56c5106c457.1666168938.git.stefan@agner.ch>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 19 Oct 2022 17:18:52 +0200
Message-ID: <CA+_SqVb697mH_=1E0s2TXhhHeWkRELbMUVu8kCSnUoLb2CHeCA@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mHt090jEq0PCDovXsFu0kfDSVhpLU51oJQlmGJnoBXA=;
 b=dmB01aCUDAJaNK3NIR1xSM5/fFO592ToRw6sAixqcbhIRxDYCl7Qm9W0M9LhE3Rvbr
 ESRahFIqdDQ1XAIvv5aiPMRkq6F0CFIPZzTAIpPbBDyv5sDvPZE4WSxdI0wDDTtan1Rr
 cgMHEDgTW25HbZnsxFFqRIMRcH4jE1aqFBahw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dmB01aCU
Subject: Re: [Buildroot] [PATCH] package/openvmtools: fix local privilege
 escalation vulnerability
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
Cc: giulio.benetti@benettiengineering.com, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3204009762868964154=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3204009762868964154==
Content-Type: multipart/alternative; boundary="0000000000002b89e505eb64bcf1"

--0000000000002b89e505eb64bcf1
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 19, 2022 at 10:45 AM Stefan Agner <stefan@agner.ch> wrote:

> Add a patch for CVE-2022-31676 (local privilege escalation
> vulnerability).
>

It would be nice if you could add a more complete description like this:

    Fixes the following security issues:

    - CVE-2022-36359: Potential reflected file download vulnerability in
      FileResponse (4.0.7)
      https://www.djangoproject.com/weblog/2022/aug/03/security-releases/


>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  ...uthorization-on-incoming-guestOps-re.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644
> package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
>
> diff --git
> a/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
> b/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
> new file mode 100644
> index 0000000000..cae2e82f08
> --- /dev/null
> +++
> b/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
> @@ -0,0 +1,36 @@
> +From 4f5cfc23dd3357bafc8b699dd5c558f000a534c3 Mon Sep 17 00:00:00 2001
> +From: John Wolfe <jwolfe@vmware.com>
> +Date: Wed, 10 Aug 2022 06:12:02 -0700
> +Subject: [PATCH] Properly check authorization on incoming guestOps
> requests
> +
> +Fix public pipe request checks.  Only a SessionRequest type should
> +be accepted on the public pipe.
> +---
> + open-vm-tools/vgauth/serviceImpl/proto.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/open-vm-tools/vgauth/serviceImpl/proto.c
> b/open-vm-tools/vgauth/serviceImpl/proto.c
> +index dc1dfd7..9e04991 100644
> +--- a/open-vm-tools/vgauth/serviceImpl/proto.c
> ++++ b/open-vm-tools/vgauth/serviceImpl/proto.c
> +@@ -1,5 +1,5 @@
> + /*********************************************************
> +- * Copyright (C) 2011-2016,2019 VMware, Inc. All rights reserved.
> ++ * Copyright (c) 2011-2016,2019-2022 VMware, Inc. All rights reserved.
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> it
> +  * under the terms of the GNU Lesser General Public License as published
> +@@ -1201,6 +1201,10 @@ Proto_SecurityCheckRequest(ServiceConnection *conn,
> +    VGAuthError err;
> +    gboolean isSecure = ServiceNetworkIsConnectionPrivateSuperUser(conn);
> +
> ++   if (conn->isPublic && req->reqType != PROTO_REQUEST_SESSION_REQ) {
> ++      return VGAUTH_E_PERMISSION_DENIED;
> ++   }
> ++
> +    switch (req->reqType) {
> +       /*
> +        * This comes over the public connection; alwsys let it through.
> +--
> +2.6.2
> +
> --
> 2.38.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>


-- 

Angelo Compagnucci

Software Engineer

angelo@amarulasolutions.com
__________________________________
Amarula Solutions SRL

Via le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 (0)42 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
[`as] https://www.amarulasolutions.com|

--0000000000002b89e505eb64bcf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 19, 2022 at 10:45 AM Stef=
an Agner &lt;<a href=3D"mailto:stefan@agner.ch">stefan@agner.ch</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add a patch =
for CVE-2022-31676 (local privilege escalation<br>
vulnerability).<br></blockquote><div><br></div><div>It would be nice if you=
 could add a more complete description like this:</div><div><br></div><div>=
=C2=A0 =C2=A0 Fixes the following security issues:<br>=C2=A0 =C2=A0 <br>=C2=
=A0 =C2=A0 - CVE-2022-36359: Potential reflected file download vulnerabilit=
y in<br>=C2=A0 =C2=A0 =C2=A0 FileResponse (4.0.7)<br>=C2=A0 =C2=A0 =C2=A0 <=
a href=3D"https://www.djangoproject.com/weblog/2022/aug/03/security-release=
s/">https://www.djangoproject.com/weblog/2022/aug/03/security-releases/</a>=
<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Stefan Agner &lt;<a href=3D"mailto:stefan@agner.ch" target=
=3D"_blank">stefan@agner.ch</a>&gt;<br>
---<br>
=C2=A0...uthorization-on-incoming-guestOps-re.patch | 36 ++++++++++++++++++=
+<br>
=C2=A01 file changed, 36 insertions(+)<br>
=C2=A0create mode 100644 package/openvmtools/0013-Properly-check-authorizat=
ion-on-incoming-guestOps-re.patch<br>
<br>
diff --git a/package/openvmtools/0013-Properly-check-authorization-on-incom=
ing-guestOps-re.patch b/package/openvmtools/0013-Properly-check-authorizati=
on-on-incoming-guestOps-re.patch<br>
new file mode 100644<br>
index 0000000000..cae2e82f08<br>
--- /dev/null<br>
+++ b/package/openvmtools/0013-Properly-check-authorization-on-incoming-gue=
stOps-re.patch<br>
@@ -0,0 +1,36 @@<br>
+From 4f5cfc23dd3357bafc8b699dd5c558f000a534c3 Mon Sep 17 00:00:00 2001<br>
+From: John Wolfe &lt;<a href=3D"mailto:jwolfe@vmware.com" target=3D"_blank=
">jwolfe@vmware.com</a>&gt;<br>
+Date: Wed, 10 Aug 2022 06:12:02 -0700<br>
+Subject: [PATCH] Properly check authorization on incoming guestOps request=
s<br>
+<br>
+Fix public pipe request checks.=C2=A0 Only a SessionRequest type should<br=
>
+be accepted on the public pipe.<br>
+---<br>
+ open-vm-tools/vgauth/serviceImpl/proto.c | 6 +++++-<br>
+ 1 file changed, 5 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/open-vm-tools/vgauth/serviceImpl/proto.c b/open-vm-tools/vgau=
th/serviceImpl/proto.c<br>
+index dc1dfd7..9e04991 100644<br>
+--- a/open-vm-tools/vgauth/serviceImpl/proto.c<br>
++++ b/open-vm-tools/vgauth/serviceImpl/proto.c<br>
+@@ -1,5 +1,5 @@<br>
+ /*********************************************************<br>
+- * Copyright (C) 2011-2016,2019 VMware, Inc. All rights reserved.<br>
++ * Copyright (c) 2011-2016,2019-2022 VMware, Inc. All rights reserved.<br=
>
+=C2=A0 *<br>
+=C2=A0 * This program is free software; you can redistribute it and/or mod=
ify it<br>
+=C2=A0 * under the terms of the GNU Lesser General Public License as publi=
shed<br>
+@@ -1201,6 +1201,10 @@ Proto_SecurityCheckRequest(ServiceConnection *conn,=
<br>
+=C2=A0 =C2=A0 VGAuthError err;<br>
+=C2=A0 =C2=A0 gboolean isSecure =3D ServiceNetworkIsConnectionPrivateSuper=
User(conn);<br>
+ <br>
++=C2=A0 =C2=A0if (conn-&gt;isPublic &amp;&amp; req-&gt;reqType !=3D PROTO_=
REQUEST_SESSION_REQ) {<br>
++=C2=A0 =C2=A0 =C2=A0 return VGAUTH_E_PERMISSION_DENIED;<br>
++=C2=A0 =C2=A0}<br>
++<br>
+=C2=A0 =C2=A0 switch (req-&gt;reqType) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This comes over the public connection; alwsy=
s let it through.<br>
+-- <br>
+2.6.2<br>
+<br>
-- <br>
2.38.0<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre-wrap"></span><span style=3D"font-size:10pt;font-family:Ubu=
ntu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:50=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p">Software Engineer</span></p><p dir=3D"ltr" style=3D"line-height:1.8;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:angelo@am=
arulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0=
<br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(241,194,50);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">__________________________________</span>=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubun=
tu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:500=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Amarula Solutions SRL</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Via le Canevare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">T. +39 (0)42 243 5310</span><span style=3D"font-size:10pt;font-famil=
y:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@=
amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;=
margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.co=
m/" style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">www.=
amarulasolutions.com</span></a></p><div>[`as] <a href=3D"https://www.amarul=
asolutions.com" target=3D"_blank">https://www.amarulasolutions.com</a>|</di=
v></div></div></div>

--0000000000002b89e505eb64bcf1--

--===============3204009762868964154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3204009762868964154==--
