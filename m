Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ED8CF34B0
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 17:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 705E082039;
	Thu,  3 Oct 2024 17:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t19XmRzRl4zu; Thu,  3 Oct 2024 17:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 292A08203B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 292A08203B;
	Thu,  3 Oct 2024 17:00:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3A71BF285
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 17:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C17D404FF
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 17:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIVkWUxjaez7 for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 17:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a36; helo=mail-vk1-xa36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC1D540065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC1D540065
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC1D540065
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 17:00:32 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-505a9e521b8so358212e0c.0
 for <buildroot@buildroot.org>; Thu, 03 Oct 2024 10:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727974831; x=1728579631;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sKBMF5tr3KaBNns9T9wG1rIzmCoywmZQGkFXqe/wtjg=;
 b=LPPcP9MHoNEqRaUg2lA4PbBasRT5NkJY28fDC0FFKBA5U5cFDfTP1uRNfo6lg+DX6B
 nuRTQRk9vb7+g4ohazG9xUhQ4VOSwTwOEWwLLxmeMbzW0HuQhDAnCuR9wHayki5jBS7d
 yxpjdI1HZTkZ6qouaEOBcBOmolYvHyyYYdHOHH8nNooUxMQPikvWickGl8hLiWzwQWXO
 zgbgugKI8OT1tcWxApMhKl80LecTK4PIauNzb5THxSpNzQYe2/fEjK2YvFmC4QKXQAB4
 JjwKsKsfeFss6X1IjNxTaEjum9V7X8p6KRypty2qof6G5D+FvEoGY4X4QSuOMbzzW4ux
 MoHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK3Bp353Rg1gTqpi7a7bAhiHvS/UZF5o5hhSdVvhyk3J2LV93X23J5m7pMfFpV6lPkmktXwi2eBtY=@buildroot.org
X-Gm-Message-State: AOJu0YzQy7h6dSXWUQAjap+YXuIg5P89Zq0Dw7xNmunjIzctTRPmI92K
 bU9GCbpXdYBqRWMYd88XAhDGBjitkeIgRZtvu7cqKD+QAWKyRvKW5WQsheVY2eUZ6zZYJXJxYY5
 XFYELiUaqMKS3tdAvaB27GuHbW8IRhAA3
X-Google-Smtp-Source: AGHT+IGdT5cz4cESiEz6jPnwRnn0eGgtJVU3icorCoeutiO3D15Mj5k2H4q1IOUK34wned3uO8NSjIVAC0FfuboOEuw=
X-Received: by 2002:a05:6122:4597:b0:4f5:c90:2556 with SMTP id
 71dfb90a1353d-50c5817081cmr6644510e0c.4.1727974830329; Thu, 03 Oct 2024
 10:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240914125406.3026002-1-parthiban@linumiz.com>
 <ZvG4oyq23JORDojj@landeda>
In-Reply-To: <ZvG4oyq23JORDojj@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 3 Oct 2024 11:00:18 -0600
Message-ID: <CADvTj4q5EaXeAmRpHtQJBUtb3an5DwGUkqLTMpAxsb1K5dJf3A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727974831; x=1728579631; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sKBMF5tr3KaBNns9T9wG1rIzmCoywmZQGkFXqe/wtjg=;
 b=LYCsrJqR1vFqMTv02tFtILZAQGzf/HqaopxeA4TDToJlJHHRAtmNLqNGaK94epaLrS
 sFDVgsBT5BOEDlpcTP4hBIDcXw6HZjLkViqd27Z6+k9Mas0mPWBhbWHMWv/RVjFQli4Q
 d5gN5DVIBQhQb+fVwaeWqrj7+KfUyUgbNIE1BZhLzExzNLP+VeJwEm+A3+msrtdlxSZI
 +eztl9tq9tisgfxSLMErwvMF4yew8R8eEabakjATzFZI46zxkzm2LBUCprXKDojLQSJj
 +8qpYnOh82bXzdl14YORVW3P8LRv953PSh98d5YQG6KkuicsWdgBxbwbwSR1R1RTlLBF
 um9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LYCsrJqR
Subject: Re: [Buildroot] [PATCH] bluez5_utils: disable asha profile
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
Cc: Parthiban Nallathambi <parthiban@linumiz.com>, buildroot@buildroot.org,
 marcin@bis.org.pl
Content-Type: multipart/mixed; boundary="===============0535103923204664390=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0535103923204664390==
Content-Type: multipart/alternative; boundary="000000000000f15d260623957d4c"

--000000000000f15d260623957d4c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 12:51=E2=80=AFPM Yann E. MORIN <yann.morin.1998@fre=
e.fr>
wrote:

> Parthiban, Marcin, All,
>
> On 2024-09-14 18:24 +0530, Parthiban Nallathambi spake thusly:
> > asha profile as it depends on audio profile which isn't selected
> > by default (BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO), results in
> > below linking failure.
> >
> > ld: profiles/audio/bluetoothd-asha.o: in function `get_transport':
> > asha.c:(.text.get_transport+0x2c): undefined reference to
> `media_transport_get_path'
>
> We still get a lot of similar failures:
>
>
> https://autobuild.buildroot.org/results/730/730310de50273c503eca42e03c7ff=
263a3cc12b5/build-end.log
>
> https://autobuild.buildroot.org/results/6f3/6f3a1dbd722286ae6a9e826ea21e9=
ca57d258ff3/build-end.log
>
> Could you have a look, please?
>

We need to enable asha when a2dp is enabled:
https://patchwork.ozlabs.org/project/buildroot/patch/20241003165926.849456-=
1-james.hilliard1@gmail.com/


>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> > ---
> >  package/bluez5_utils/bluez5_utils.mk | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/bluez5_utils/bluez5_utils.mk
> b/package/bluez5_utils/bluez5_utils.mk
> > index b1caef5cc5..59eb68de61 100644
> > --- a/package/bluez5_utils/bluez5_utils.mk
> > +++ b/package/bluez5_utils/bluez5_utils.mk
> > @@ -28,6 +28,7 @@ BLUEZ5_UTILS_CONF_OPTS =3D \
> >       --disable-lsan \
> >       --disable-ubsan \
> >       --disable-pie \
> > +     --disable-asha \
> >       --with-dbusconfdir=3D/etc
> >
> >  ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
> > --
> > 2.39.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000f15d260623957d4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Sep 23, 2024 at 12:51=E2=80=AFPM =
Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.199=
8@free.fr</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Parthiban, Marcin, All,<br>
<br>
On 2024-09-14 18:24 +0530, Parthiban Nallathambi spake thusly:<br>
&gt; asha profile as it depends on audio profile which isn&#39;t selected<b=
r>
&gt; by default (BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO), results in<br>
&gt; below linking failure.<br>
&gt; <br>
&gt; ld: profiles/audio/bluetoothd-asha.o: in function `get_transport&#39;:=
<br>
&gt; asha.c:(.text.get_transport+0x2c): undefined reference to `media_trans=
port_get_path&#39;<br>
<br>
We still get a lot of similar failures:<br>
<br>
<a href=3D"https://autobuild.buildroot.org/results/730/730310de50273c503eca=
42e03c7ff263a3cc12b5/build-end.log" rel=3D"noreferrer" target=3D"_blank">ht=
tps://autobuild.buildroot.org/results/730/730310de50273c503eca42e03c7ff263a=
3cc12b5/build-end.log</a><br>
<a href=3D"https://autobuild.buildroot.org/results/6f3/6f3a1dbd722286ae6a9e=
826ea21e9ca57d258ff3/build-end.log" rel=3D"noreferrer" target=3D"_blank">ht=
tps://autobuild.buildroot.org/results/6f3/6f3a1dbd722286ae6a9e826ea21e9ca57=
d258ff3/build-end.log</a><br>
<br>
Could you have a look, please?<br></blockquote><div><br></div><div>We need =
to enable asha when a2dp is enabled:</div><div><a href=3D"https://patchwork=
.ozlabs.org/project/buildroot/patch/20241003165926.849456-1-james.hilliard1=
@gmail.com/">https://patchwork.ozlabs.org/project/buildroot/patch/202410031=
65926.849456-1-james.hilliard1@gmail.com/</a></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; Signed-off-by: Parthiban Nallathambi &lt;<a href=3D"mailto:parthiban@l=
inumiz.com" target=3D"_blank">parthiban@linumiz.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/bluez5_utils/<a href=3D"http://bluez5_utils.mk" rel=3D"n=
oreferrer" target=3D"_blank">bluez5_utils.mk</a> | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/package/bluez5_utils/<a href=3D"http://bluez5_utils.mk" r=
el=3D"noreferrer" target=3D"_blank">bluez5_utils.mk</a> b/package/bluez5_ut=
ils/<a href=3D"http://bluez5_utils.mk" rel=3D"noreferrer" target=3D"_blank"=
>bluez5_utils.mk</a><br>
&gt; index b1caef5cc5..59eb68de61 100644<br>
&gt; --- a/package/bluez5_utils/<a href=3D"http://bluez5_utils.mk" rel=3D"n=
oreferrer" target=3D"_blank">bluez5_utils.mk</a><br>
&gt; +++ b/package/bluez5_utils/<a href=3D"http://bluez5_utils.mk" rel=3D"n=
oreferrer" target=3D"_blank">bluez5_utils.mk</a><br>
&gt; @@ -28,6 +28,7 @@ BLUEZ5_UTILS_CONF_OPTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-lsan \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-ubsan \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-pie \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--disable-asha \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--with-dbusconfdir=3D/etc<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)<br>
&gt; -- <br>
&gt; 2.39.2<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000f15d260623957d4c--

--===============0535103923204664390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0535103923204664390==--
