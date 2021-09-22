Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D29C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 11:36:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 738D460EE4
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 11:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 738D460EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 351F0400AF;
	Wed, 22 Sep 2021 11:36:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5XjTfZZkJ1Kj; Wed, 22 Sep 2021 11:36:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FF87404F9;
	Wed, 22 Sep 2021 11:36:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EED201BF3BE
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 11:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFD58613C5
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 11:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k0DCAKZRsoGC for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 11:36:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92137605B0
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 11:36:32 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id v22so8545915edd.11
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 04:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x+RnGYBQwRxLrdi9yhoMOYvuJD0+rWj+EQBaUo9qyzM=;
 b=VsWzhZ3EPv0QA1zy3z2HRH6ySDtaUF6P64ytIEjS+3TYIgqXh2nPeLpJdc+bXkE0IF
 arUS7QufprhFgr0VpsBTES5DN9pgiC8aKu4SGahIEogJasXvaDpTiRwGbCYgLwQABV8W
 WX72GuEmsj7LMeWEr4zFUcLf3+/T5jQIK5ND5FlNX6sfJO64A24IEACt6X/bNrzjlMyQ
 NIJdY8k31ZzO+5CxM3Qi5kDsvMXmUrKDdW/YuBFw/uJ8neRXsXhJvqQoNXqJGFb9klt8
 +lEvj34BjGzJmrsoNR/+S71ixcFNrmfPP8FF4Ecju9ITl33K+OpMwgZKQOV2r4XYlkZj
 ru1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x+RnGYBQwRxLrdi9yhoMOYvuJD0+rWj+EQBaUo9qyzM=;
 b=Ga/aNhGNFH/DTNFSI/KnAFEV1HoHjWO1V5WfFs6c2V0TituDjGH079GaY/CKbse97w
 SmIJFxuEc7jWyViUp3a0I307e9jhpOnNhWSO/kUf+3vDDdqMe95dCidHYQ29SnDUkbqp
 EN/WzjHtRjcQmNesOMRnyylS4yX63zXCVHsGYivUIH+EjuOZdHaiSYN4wjB0qJPrw2t/
 ofjIHY1mUM9YsgjbNZq91RLTDgc1CHeH3OEdsgImck/XrJcaJzbF4P31X8Guf1OIqs+Z
 4Amxh62P3HDv7tWNdxT9pqX6MZS0tnj4JV72pgvKi0LdcS1vYXpaoNF+IS1+PnkdYE0V
 QBwA==
X-Gm-Message-State: AOAM5306/6aIlj5+Ip/HmlLc0EJuIINW5wZG3yligvgcNg484OXSjQGQ
 wLS/BMQnLn/lwf6DGcCxptNbjUpgQtKBZAIR2D6iKg==
X-Google-Smtp-Source: ABdhPJwQ3Jpm08lB2ca7fleCz0e/6Nb5qYJtDtrVw992ekyQWyh810Uu4vpCdXy6pAZ+ABGjYsj7xiqiHCfS7V3A2EI=
X-Received: by 2002:a17:906:2f94:: with SMTP id
 w20mr42296429eji.14.1632310590086; 
 Wed, 22 Sep 2021 04:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210922095216.2388856-1-jose.pekkarinen@unikie.com>
 <49c4f0bc-1d73-3718-ec68-c99ed1b79e74@green-communications.fr>
In-Reply-To: <49c4f0bc-1d73-3718-ec68-c99ed1b79e74@green-communications.fr>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Wed, 22 Sep 2021 14:36:19 +0300
Message-ID: <CAJPV9MpbaOhCKqzS_xd=ipNqB0ddr9KDpurMX5xvKvK7kLAa+Q@mail.gmail.com>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Subject: Re: [Buildroot] [PATCH] package/wpa_supplicant: Allow mesh
 configuration
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7230391643829050117=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============7230391643829050117==
Content-Type: multipart/alternative; boundary="000000000000e2bb9505cc93ecf1"

--000000000000e2bb9505cc93ecf1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 1:42 PM Nicolas Cavallari <
nicolas.cavallari@green-communications.fr> wrote:

> On 22/09/2021 11:52, Jos=C3=A9 Pekkarinen wrote:
> > wpa_supplicant defconfig doesn't enable CONFIG_MESH
> > by default, and currently there is only a path to
> > disable it in buildroot. This patch will restore
> > the logic to enable it.
> >
> > Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> > ---
> >   package/wpa_supplicant/wpa_supplicant.mk | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/wpa_supplicant/wpa_supplicant.mk
> b/package/wpa_supplicant/wpa_supplicant.mk
> > index e9078b9f89..3e632d7247 100644
> > --- a/package/wpa_supplicant/wpa_supplicant.mk
> > +++ b/package/wpa_supplicant/wpa_supplicant.mk
> > @@ -104,7 +104,9 @@ else
> >   WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_WIFI_DISPLAY
> >   endif
> >
> > -ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),)
> > +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)
> > +WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG__MESH
>
> typo ?
>

Yep, sorry, I'll resend.

Jos=C3=A9.


> > +else
> >   WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_MESH
> >   endif
> >
> >
>
>

--=20

Jos=C3=A9.

--000000000000e2bb9505cc93ecf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 22, 2021 at 1:42 PM Nicol=
as Cavallari &lt;<a href=3D"mailto:nicolas.cavallari@green-communications.f=
r">nicolas.cavallari@green-communications.fr</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On 22/09/2021 11:52, Jos=C3=A9 =
Pekkarinen wrote:<br>
&gt; wpa_supplicant defconfig doesn&#39;t enable CONFIG_MESH<br>
&gt; by default, and currently there is only a path to<br>
&gt; disable it in buildroot. This patch will restore<br>
&gt; the logic to enable it.<br>
&gt; <br>
&gt; Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkari=
nen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk=
" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a> | 4 +++-<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.m=
k" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a> b/package/wpa=
_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=3D"noreferrer" target=
=3D"_blank">wpa_supplicant.mk</a><br>
&gt; index e9078b9f89..3e632d7247 100644<br>
&gt; --- a/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=
=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a><br>
&gt; +++ b/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=
=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a><br>
&gt; @@ -104,7 +104,9 @@ else<br>
&gt;=C2=A0 =C2=A0WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_WIFI_DISPLAY<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),)<br>
&gt; +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)<br>
&gt; +WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG__MESH<br>
<br>
typo ?<br></blockquote><div><br></div></div><blockquote style=3D"margin:0 0=
 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div>Yep, sorry=
, I&#39;ll resend.</div><div><br></div></div></blockquote><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><=
div>Jos=C3=A9.</div></div></blockquote><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +else<br>
&gt;=C2=A0 =C2=A0WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_MESH<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0px=
 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></div><=
/div>

--000000000000e2bb9505cc93ecf1--

--===============7230391643829050117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7230391643829050117==--
