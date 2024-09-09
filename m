Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CC9CE7AB0
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 07:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5CF54042B;
	Mon,  9 Sep 2024 07:51:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZX_affiqVke; Mon,  9 Sep 2024 07:51:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7F24402C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7F24402C7;
	Mon,  9 Sep 2024 07:51:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D30251BF3BF
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 07:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C12C480A4A
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 07:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZiSFVKL8YCS for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 07:51:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a33; helo=mail-vk1-xa33.google.com;
 envelope-from=lars@underjord.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 53CE080A50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53CE080A50
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53CE080A50
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 07:51:24 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-5012813249cso620669e0c.2
 for <buildroot@buildroot.org>; Mon, 09 Sep 2024 00:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868283; x=1726473083;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2K+LsjoroRbyG+y/35up/UBecLsN2bFyqikAoJnYtJY=;
 b=RnuerDREciWg3yZnCzyz1D5KV5UCiyIIM3rMxDqzQMbggkBAGk90aQH0Lb+V1mSC1p
 mJ0vnKE1kIUNXG3/fTrT59rAgYtCqEbLiv5H2GhoF0ThAGQtAA1jUn1ZEe2lkrln/kAD
 g5E+F8pQ1tGXPmR8ksiQ6DZtAtk33qQ9wYa2eKnOJdVtl4KRt617UjeQBO4VpkQ8XT6W
 l1ZRbv+mu6zjgxW1JxABRXeOmwzvi878MiNMu5tyvheAOPP5QyOhhCG7+Oayxb+S25xg
 V+6dbe45KQpviQahltMHrEXKFMyNP4FYPApSZd6amNLCLAYHCVGNrh4gSWFrUvuvwNE+
 YO2Q==
X-Gm-Message-State: AOJu0YzKeRkBnjAmI82KzvzVdV9yRjrj3ZiyO2NPHpkqdsAH/md0wos2
 d+1nxZXBh37qTJsCo8kQgUVt+B+EkDGkjbSg0MEy/oR3J87iUztJ8FQ3H+lF17aXuLpUumxRqG1
 30xohE2jDwd3FM8pvzB01H909wppPEqsJqnDWCPzLuF78HbJp
X-Google-Smtp-Source: AGHT+IG/EWtU7beqFeLultwqhNaMqF7sxb3UTq3cwaFLWgxLl+L6US5lezvENCurh6MQIDGryovrkNGV+xE7Zriea9w=
X-Received: by 2002:a05:6122:2808:b0:501:2960:7595 with SMTP id
 71dfb90a1353d-502143a9979mr7714752e0c.11.1725868283362; Mon, 09 Sep 2024
 00:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240903100952.3789698-1-lars@underjord.io>
 <CADqW+qk-VLMa2m510NvmTZv927DWyt8dgD6ir55ZHeHtS8AzKg@mail.gmail.com>
 <875xr56zgy.fsf@tarshish>
In-Reply-To: <875xr56zgy.fsf@tarshish>
From: Lars Wikman <lars@underjord.io>
Date: Mon, 9 Sep 2024 09:51:12 +0200
Message-ID: <CADqW+qnewS0F7-dQe1kEyE25i2qhuAV7kcOTDTXmjMornE01xA@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=underjord.io; s=google; t=1725868283; x=1726473083; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2K+LsjoroRbyG+y/35up/UBecLsN2bFyqikAoJnYtJY=;
 b=gnL1fg8Cj37Jk6+NjhzyFCn93wwvw0PqS0t0dhMw1Tv5biwcc3oH7nhIwtYEcVVKkv
 HSbRzoQIK0NhCf8j+4k8gzgYWOJf6npdQ/O0QPwXlYC24lVB2lD65qPtpbgziclhlCVA
 ijlrf+RdOubtbYH5IPs10LOStiKVxtTwqV9862mS+HLHOQIk8jimF2obCPPevNAOk8cD
 sGfTe0x80EPOm4gjJJCwCJbsvFPL3Cs/7nVyzZoN4cG9yvzawkxAgWVlrPXlj9E/JTUk
 LSCi9gJhNbDfiTH5R3Wb5lLlWSmZYKibmvOjbU7IR0w5qRrSIhW1QSc7bm8bkaz3OM/m
 0b8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=underjord.io
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=underjord.io header.i=@underjord.io header.a=rsa-sha256
 header.s=google header.b=gnL1fg8C
Subject: Re: [Buildroot] [PATCH v3] package/wpa_supplicant: add Smart card
 option
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6413167577108627209=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6413167577108627209==
Content-Type: multipart/alternative; boundary="000000000000f598390621ab057e"

--000000000000f598390621ab057e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good, thanks :)

On Mon, Sep 9, 2024 at 9:46=E2=80=AFAM Baruch Siach <baruch@tkos.co.il> wro=
te:

> Hi Lars,
>
> On Mon, Sep 09 2024, Lars Wikman wrote:
> > I submitted a v3 which I see in patchwork but I don't see it in my
> > sent email so I'm uncertain about whether it reached the list okay.
> >
> > Link in patchwork:
> https://patchwork.ozlabs.org/project/buildroot/patch/20240903100952.37896=
98-1-lars@underjord.io/
>
> Patches are tracked on patchwork. If your patch is there, maintainers
> will get to it sooner or later.
>
> Your patch is also on the list archive:
>
>   https://lore.kernel.org/all/20240903100952.3789698-1-lars@underjord.io/
>
> So all looks OK.
>
> baruch
>
> > On Tue, Sep 3, 2024 at 12:09=E2=80=AFPM Lars Wikman <lars@underjord.io>=
 wrote:
> >
> >  CONFIG_SMARTCARD was unconditionally disabled which has meant that
> >  even if OpenSSL is compiled with engine support and the supplicant
> >  is configured to use an engine it would warn that it was compiled
> >  without engine support.
> >
> >  This mechanism is used to enable the more secure forms of 802.1x
> >  networking authentication such as EAP-TLS with hardware-delegated
> >  cryptography and private keys protected in hardware.
> >
> >  It is still disabled by default in case there was an original reason.
> >
> >  Enabling the option will allow delegating private key access to TPM2,
> >  ARM TrustZone and other specialized secure hardware for establishing
> >  a network connection.
> >
> >  Signed-off-by: Lars Wikman <lars@underjord.io>
> >
> >  ---
> >  Changes v1 -> v2:
> >    - Change option name to focus on smartcard  (suggested by Sergey)
> >  Changes v2 -> v3:
> >    - Change setting disabled to match convention (suggested by Baruch)
> >
> >  Signed-off-by: Lars Wikman <lars@underjord.io>
> >  ---
> >   package/wpa_supplicant/Config.in         | 6 ++++++
> >   package/wpa_supplicant/wpa_supplicant.mk=E2=9A=A0=EF=B8=8F | 9 ++++++=
---
> >   2 files changed, 12 insertions(+), 3 deletions(-)
> >
> >  diff --git a/package/wpa_supplicant/Config.in
> b/package/wpa_supplicant/Config.in
> >  index 92953f69f0..2aee108fc1 100644
> >  --- a/package/wpa_supplicant/Config.in
> >  +++ b/package/wpa_supplicant/Config.in
> >  @@ -175,4 +175,10 @@ config
> BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
> >          help
> >            Add introspection support for the DBus control interface.
> >
> >  +config BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD
> >  +       bool "Smartcard support"
> >  +       help
> >  +         Enable the smart card support. Required for OpenSSL engines
> >  +         to work using PKCS11 and 802.1x
> >  +
> >   endif
> >  diff --git a/package/wpa_supplicant/wpa_supplicant.mk=E2=9A=A0=EF=B8=
=8F
> b/package/wpa_supplicant/wpa_supplicant.mk=E2=9A=A0=EF=B8=8F
> >  index 984959f679..6199e584d0 100644
> >  --- a/package/wpa_supplicant/wpa_supplicant.mk=E2=9A=A0=EF=B8=8F
> >  +++ b/package/wpa_supplicant/wpa_supplicant.mk=E2=9A=A0=EF=B8=8F
> >  @@ -24,9 +24,6 @@ WPA_SUPPLICANT_CONFIG_ENABLE =3D \
> >          CONFIG_INTERNAL_LIBTOMMATH \
> >          CONFIG_MATCH_IFACE
> >
> >  -WPA_SUPPLICANT_CONFIG_DISABLE =3D \
> >  -       CONFIG_SMARTCARD
> >  -
> >   # libnl-3 needs -lm (for rint) and -lpthread if linking statically
> >   # And library order matters hence stick -lnl-3 first since it's
> appended
> >   # in the wpa_supplicant Makefiles as in LIBS+=3D-lnl-3 ... thus faili=
ng
> >  @@ -180,6 +177,12 @@ WPA_SUPPLICANT_DEPENDENCIES +=3D readline
> >   WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_READLINE
> >   endif
> >
> >  +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD),y)
> >  +WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_SMARTCARD
> >  +else
> >  +WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_SMARTCARD
> >  +endif
> >  +
> >   ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),y)
> >   define WPA_SUPPLICANT_ENABLE_CTRL_IFACE
> >          sed -i '/ctrl_interface/s/^#//g'
> $(TARGET_DIR)/etc/wpa_supplicant.conf
> >  --
> >  2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =3D}------------------------------------------------ooO--U--Ooo----------=
--{=3D
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>

--000000000000f598390621ab057e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good, thanks :)</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 9, 2024 at 9:46=E2=80=AFAM Baru=
ch Siach &lt;<a href=3D"mailto:baruch@tkos.co.il">baruch@tkos.co.il</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Lars,=
<br>
<br>
On Mon, Sep 09 2024, Lars Wikman wrote:<br>
&gt; I submitted a v3 which I see in patchwork but I don&#39;t see it in my=
<br>
&gt; sent email so I&#39;m uncertain about whether it reached the list okay=
.<br>
&gt;<br>
&gt; Link in patchwork: <a href=3D"https://patchwork.ozlabs.org/project/bui=
ldroot/patch/20240903100952.3789698-1-lars@underjord.io/" rel=3D"noreferrer=
" target=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/patch/20=
240903100952.3789698-1-lars@underjord.io/</a><br>
<br>
Patches are tracked on patchwork. If your patch is there, maintainers<br>
will get to it sooner or later.<br>
<br>
Your patch is also on the list archive:<br>
<br>
=C2=A0 <a href=3D"https://lore.kernel.org/all/20240903100952.3789698-1-lars=
@underjord.io/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.or=
g/all/20240903100952.3789698-1-lars@underjord.io/</a><br>
<br>
So all looks OK.<br>
<br>
baruch<br>
<br>
&gt; On Tue, Sep 3, 2024 at 12:09=E2=80=AFPM Lars Wikman &lt;<a href=3D"mai=
lto:lars@underjord.io" target=3D"_blank">lars@underjord.io</a>&gt; wrote:<b=
r>
&gt;<br>
&gt;=C2=A0 CONFIG_SMARTCARD was unconditionally disabled which has meant th=
at<br>
&gt;=C2=A0 even if OpenSSL is compiled with engine support and the supplica=
nt<br>
&gt;=C2=A0 is configured to use an engine it would warn that it was compile=
d<br>
&gt;=C2=A0 without engine support.<br>
&gt;<br>
&gt;=C2=A0 This mechanism is used to enable the more secure forms of 802.1x=
<br>
&gt;=C2=A0 networking authentication such as EAP-TLS with hardware-delegate=
d<br>
&gt;=C2=A0 cryptography and private keys protected in hardware.<br>
&gt;<br>
&gt;=C2=A0 It is still disabled by default in case there was an original re=
ason.<br>
&gt;<br>
&gt;=C2=A0 Enabling the option will allow delegating private key access to =
TPM2,<br>
&gt;=C2=A0 ARM TrustZone and other specialized secure hardware for establis=
hing<br>
&gt;=C2=A0 a network connection.<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Lars Wikman &lt;<a href=3D"mailto:lars@underjord.=
io" target=3D"_blank">lars@underjord.io</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 Changes v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0 - Change option name to focus on smartcard=C2=A0 (suggest=
ed by Sergey)<br>
&gt;=C2=A0 Changes v2 -&gt; v3:<br>
&gt;=C2=A0 =C2=A0 - Change setting disabled to match convention (suggested =
by Baruch)<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Lars Wikman &lt;<a href=3D"mailto:lars@underjord.=
io" target=3D"_blank">lars@underjord.io</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0package/wpa_supplicant/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 6 ++++++<br>
&gt;=C2=A0 =C2=A0package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk=
" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a>=E2=9A=A0=EF=B8=
=8F | 9 ++++++---<br>
&gt;=C2=A0 =C2=A02 files changed, 12 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supp=
licant/Config.in<br>
&gt;=C2=A0 index 92953f69f0..2aee108fc1 100644<br>
&gt;=C2=A0 --- a/package/wpa_supplicant/Config.in<br>
&gt;=C2=A0 +++ b/package/wpa_supplicant/Config.in<br>
&gt;=C2=A0 @@ -175,4 +175,10 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTR=
OSPECTION<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Add introspection support for=
 the DBus control interface.<br>
&gt;<br>
&gt;=C2=A0 +config BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Smartcard support&quot;<b=
r>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enable the smart card support=
. Required for OpenSSL engines<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to work using PKCS11 and 802.=
1x<br>
&gt;=C2=A0 +<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 diff --git a/package/wpa_supplicant/<a href=3D"http://wpa_suppli=
cant.mk" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a>=E2=9A=
=A0=EF=B8=8F b/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" =
rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a>=E2=9A=A0=EF=B8=
=8F<br>
&gt;=C2=A0 index 984959f679..6199e584d0 100644<br>
&gt;=C2=A0 --- a/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk=
" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a>=E2=9A=A0=EF=B8=
=8F<br>
&gt;=C2=A0 +++ b/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk=
" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a>=E2=9A=A0=EF=B8=
=8F<br>
&gt;=C2=A0 @@ -24,9 +24,6 @@ WPA_SUPPLICANT_CONFIG_ENABLE =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CONFIG_INTERNAL_LIBTOMMATH \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CONFIG_MATCH_IFACE<br>
&gt;<br>
&gt;=C2=A0 -WPA_SUPPLICANT_CONFIG_DISABLE =3D \<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_SMARTCARD<br>
&gt;=C2=A0 -<br>
&gt;=C2=A0 =C2=A0# libnl-3 needs -lm (for rint) and -lpthread if linking st=
atically<br>
&gt;=C2=A0 =C2=A0# And library order matters hence stick -lnl-3 first since=
 it&#39;s appended<br>
&gt;=C2=A0 =C2=A0# in the wpa_supplicant Makefiles as in LIBS+=3D-lnl-3 ...=
 thus failing<br>
&gt;=C2=A0 @@ -180,6 +177,12 @@ WPA_SUPPLICANT_DEPENDENCIES +=3D readline<b=
r>
&gt;=C2=A0 =C2=A0WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_READLINE<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD),y)<br>
&gt;=C2=A0 +WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_SMARTCARD<br>
&gt;=C2=A0 +else<br>
&gt;=C2=A0 +WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_SMARTCARD<br>
&gt;=C2=A0 +endif<br>
&gt;=C2=A0 +<br>
&gt;=C2=A0 =C2=A0ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),y)<br>
&gt;=C2=A0 =C2=A0define WPA_SUPPLICANT_ENABLE_CTRL_IFACE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;/ctrl_interface/s/^#//g&=
#39; $(TARGET_DIR)/etc/wpa_supplicant.conf<br>
&gt;=C2=A0 -- <br>
&gt;=C2=A0 2.34.1<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=A0 =C2=A0Tk Open Systems<=
br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
=C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank">baruc=
h@tkos.co.il</a> - tel: +972.52.368.4656, <a href=3D"http://www.tkos.co.il"=
 rel=3D"noreferrer" target=3D"_blank">http://www.tkos.co.il</a> -<br>
</blockquote></div>

--000000000000f598390621ab057e--

--===============6413167577108627209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6413167577108627209==--
