Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98FECD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 18:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5426B40500;
	Mon,  2 Sep 2024 18:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMFwurdfYNGj; Mon,  2 Sep 2024 18:25:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1AB94023F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1AB94023F;
	Mon,  2 Sep 2024 18:25:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DB721BF360
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 18:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 079A34023F
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 18:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KghNHti2xfB2 for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 18:25:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a32; helo=mail-vk1-xa32.google.com;
 envelope-from=lars@underjord.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0558A40026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0558A40026
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0558A40026
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 18:25:52 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-4fce700765aso1365434e0c.2
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 11:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725301551; x=1725906351;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w++BtcfexQJcTq0bpR9UZnH4vcVmpDOkQCtDdgzU/GI=;
 b=DKlqG2KoNOB5HsQgU0OkDIQSaIkE5s8ue6EJ0JP4L6TaWUEhPuG0hhxeAI0CKHbjtM
 a5l0t4jYkQ6AlRIb93mVS9N71IDbsyPMbjUS8R2lyDv6mi3SDTAv9vQTq0kNqah9bsOm
 dAyMtqrJD2RllrTMYM8SCzd9xT1T6rRC9eqyFbkl14ttH/L0RHe/lX7aR7ErfiKxE9R9
 Q4QZpr3GzxMGpQMzdJdcfthx3YwW8IwkSInPJ+5eax/TaqPawkDCbdv2FgNsKNreXwrA
 e9iGk45WlzRfZCBphhzyI2kMQj3olBCVbb8JJWXEmUxikLW4DmGsReg8Yk64zyUrnoME
 m1zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVltdrJ43UII36dTo25sVQgq+dO096UP+7of4E+43e4RZEkgE/EDYvLUY0y26RkrgCiKEWxgRsf0TY=@buildroot.org
X-Gm-Message-State: AOJu0YwBHYb9COkMrM34TEvzym3HPqJZqde9wee7UJkovX60RqQOGz8/
 k9LGSUAU1+xu31ffheZ/yW420C7hZ0IvBvWtsImdB2kF5IXn12evFcdGq5ALARWvq8TDSo3Xhyi
 gKauPGnpgFk42W5eTcHS/Auj5Xo1ola1hghH4nV/OSp4BoPBP
X-Google-Smtp-Source: AGHT+IEvMetRNeoYP71+CSXGBjHEyDQ9v0ygKFEdiB56i7yO6sLtgDIxgA6XlRugSnQ86BHx3Kch2pcBlDCN/atpcok=
X-Received: by 2002:a05:6122:925:b0:4fd:591:e30d with SMTP id
 71dfb90a1353d-5009dad7e37mr9185942e0c.2.1725301551322; Mon, 02 Sep 2024
 11:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240902074527.2908996-1-lars@underjord.io>
 <ZtX6JflghSYtxST2@curiosity>
In-Reply-To: <ZtX6JflghSYtxST2@curiosity>
From: Lars Wikman <lars@underjord.io>
Date: Mon, 2 Sep 2024 20:25:40 +0200
Message-ID: <CADqW+q=jDVF=kVWX3J9f4VTfKTSmF=eddCSmD8tSLuMSWjHQvA@mail.gmail.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=underjord.io; s=google; t=1725301551; x=1725906351; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w++BtcfexQJcTq0bpR9UZnH4vcVmpDOkQCtDdgzU/GI=;
 b=J0py5Hv1nDlv1LXO8FpKSPufSBKFKR3HwXdigFaQl22Wblf4pA4Fv9adwe2prrbCXp
 PPEYfRVvxWSqvlNBqmijXkR1ANJfC+t8PAEOXVy4fMlFcWEZ0q8VV7GsE6fbO4syzE8a
 7BCb0cNsOQvpDLK+fdv6vxvBuGXwvGU+kF6PU1ureog1sU9g5/0OocmgeHdxi/Y38asp
 95mE4a/QVbLkL5Cuw7NvCSylcnLF/5QD5cshoK8Rj3STrqXr0r6zy3dx9e9gG1/4sCOp
 iL1zA85TGX2oz6330db23TghfjiH8OZ2/g5syHmyb+9iODUYMIu58yV7Tu596D6O9L4A
 Pngw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=underjord.io
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=underjord.io header.i=@underjord.io header.a=rsa-sha256
 header.s=google header.b=J0py5Hv1
Subject: Re: [Buildroot] [PATCH 1/1] package/wpa_supplicant: add OpenSSL
 engine option
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3497300745861917314=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3497300745861917314==
Content-Type: multipart/alternative; boundary="00000000000018f3bb062127127a"

--00000000000018f3bb062127127a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello

Looking closer at other options I agree. I=E2=80=99ll change the name of th=
e
option. I was under the impression that it only actually affected the
OpenSSL engine functionality but it looks like there are EAP-SIM and other
bits of SmartCard functionality that I don=E2=80=99t know how they operate.=
 I think
the documentation string might need to mention the association to OpenSSL
engine support as unless you know the connection between PKCS11 and
SmartCard you will only find out by reading Makefiles and source.

I don=E2=80=99t know if it requires OpenSSL. The use-cases I know off will =
use
OpenSSL but there are some CONFIG_ options, such as the EAP-SIM stuff where
I don=E2=80=99t know what it entails. Maybe they work without OpenSSL. I ca=
n=E2=80=99t
exhaustively say that it only works with OpenSSL.

I will change the option name as suggested.

Thanks
Lars

On Mon, 2 Sep 2024 at 19:47, Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Hello Lars,
>
> On Mon, Sep 02, 2024 at 09:45:27AM +0200, Lars Wikman wrote:
> > CONFIG_SMARTCARD was unconditionally disabled which has meant that
> > even if OpenSSL is compiled with engine support and the supplicant
> > is configured to use an engine it would warn that it was compiled
> > without engine support.
> >
> > This mechanism is used to enable the more secure forms of 802.1x
> > networking authentication such as EAP-TLS with hardware-delegated
> > cryptography and private keys protected in hardware.
> >
> > It is still disabled by default in case there was an original reason.
> >
> > Enabling the option will allow delegating private key access to TPM2,
> > ARM TrustZone and other specialized secure hardware for establishing
> > a network connection.
> >
> > Signed-off-by: Lars Wikman <lars@underjord.io>
> > ---
> >  package/wpa_supplicant/Config.in         | 6 ++++++
> >  package/wpa_supplicant/wpa_supplicant.mk | 7 +++++--
> >  2 files changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/wpa_supplicant/Config.in
> b/package/wpa_supplicant/Config.in
> > index 92953f69f0..5ed5828bb1 100644
> > --- a/package/wpa_supplicant/Config.in
> > +++ b/package/wpa_supplicant/Config.in
> > @@ -175,4 +175,10 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTI=
ON
> >       help
> >         Add introspection support for the DBus control interface.
> >
> > +config BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL_ENGINE
> > +     bool "OpenSSL engine support"
> > +     help
> > +       Enable the smart card support which enables OpenSSL engines
> > +       using PKCS11 and 802.1x
> > +
> >  endif
>
> IIUC this option is used to enable smartcard support in wpa_supplicant,
> not to select TLS engine. So suggested name looks a bit confusing in
> this context. Maybe just 'BR2_PACKAGE_WPA_SUPPLICANT_SMART_CARD' or
> something like that ?
>
> Buildroot allows to use two TLS engines in wpa_supplicant: OpenSSL and
> internal experimental TLSv1 implementation. Does smartcard support in
> wpa_supplicant requires OpenSSL ? If so, then it should be explicitly
> selected, e.g. see WPA3 or MESH_NETWORKING options in Config.in.
>
> Regards,
> Sergey
>

--00000000000018f3bb062127127a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Looking closer at other options I agree. I=E2=80=99ll change the name of th=
e option. I was under the impression that it only actually affected the Ope=
nSSL engine functionality but it looks like there are EAP-SIM and other bit=
s of SmartCard functionality that I don=E2=80=99t know how they operate. I =
think the documentation string might need to mention the association to Ope=
nSSL engine support as unless you know the connection between PKCS11 and Sm=
artCard you will only find out by reading Makefiles and source.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">I don=E2=80=99t know if it requires=
 OpenSSL. The use-cases I know off will use OpenSSL but there are some CONF=
IG_ options, such as the EAP-SIM stuff where I don=E2=80=99t know what it e=
ntails. Maybe they work without OpenSSL. I can=E2=80=99t exhaustively say t=
hat it only works with OpenSSL.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I will change the option name as suggested.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Thanks</div><div dir=3D"auto">Lars</div><div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, 2 Sep 2024 at 19:47, Sergey Matyukevich &lt;<a href=3D"mailto:geomatsi@gm=
ail.com">geomatsi@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Hello =
Lars,<br>
<br>
On Mon, Sep 02, 2024 at 09:45:27AM +0200, Lars Wikman wrote:<br>
&gt; CONFIG_SMARTCARD was unconditionally disabled which has meant that<br>
&gt; even if OpenSSL is compiled with engine support and the supplicant<br>
&gt; is configured to use an engine it would warn that it was compiled<br>
&gt; without engine support.<br>
&gt; <br>
&gt; This mechanism is used to enable the more secure forms of 802.1x<br>
&gt; networking authentication such as EAP-TLS with hardware-delegated<br>
&gt; cryptography and private keys protected in hardware.<br>
&gt; <br>
&gt; It is still disabled by default in case there was an original reason.<=
br>
&gt; <br>
&gt; Enabling the option will allow delegating private key access to TPM2,<=
br>
&gt; ARM TrustZone and other specialized secure hardware for establishing<b=
r>
&gt; a network connection.<br>
&gt; <br>
&gt; Signed-off-by: Lars Wikman &lt;<a href=3D"mailto:lars@underjord.io" ta=
rget=3D"_blank">lars@underjord.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/wpa_supplicant/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 6 ++++++<br>
&gt;=C2=A0 package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=
=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a> | 7 +++++--<br>
&gt;=C2=A0 2 files changed, 11 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant=
/Config.in<br>
&gt; index 92953f69f0..5ed5828bb1 100644<br>
&gt; --- a/package/wpa_supplicant/Config.in<br>
&gt; +++ b/package/wpa_supplicant/Config.in<br>
&gt; @@ -175,4 +175,10 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECT=
ION<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Add introspection support for the DBu=
s control interface.<br>
&gt;=C2=A0 <br>
&gt; +config BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL_ENGINE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;OpenSSL engine support&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Enable the smart card support which enable=
s OpenSSL engines<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0using PKCS11 and 802.1x<br>
&gt; +<br>
&gt;=C2=A0 endif<br>
<br>
IIUC this option is used to enable smartcard support in wpa_supplicant,<br>
not to select TLS engine. So suggested name looks a bit confusing in<br>
this context. Maybe just &#39;BR2_PACKAGE_WPA_SUPPLICANT_SMART_CARD&#39; or=
<br>
something like that ?<br>
<br>
Buildroot allows to use two TLS engines in wpa_supplicant: OpenSSL and<br>
internal experimental TLSv1 implementation. Does smartcard support in<br>
wpa_supplicant requires OpenSSL ? If so, then it should be explicitly<br>
selected, e.g. see WPA3 or MESH_NETWORKING options in Config.in.<br>
<br>
Regards,<br>
Sergey<br>
</blockquote></div></div>

--00000000000018f3bb062127127a--

--===============3497300745861917314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3497300745861917314==--
