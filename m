Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461A1C369D1
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 05:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE5FD6117F;
	Fri, 25 Apr 2025 05:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eW_DysHXFrTY; Fri, 25 Apr 2025 05:23:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 083B760E73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 083B760E73;
	Fri, 25 Apr 2025 05:23:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 921C3159
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 05:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F95941574
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 05:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFcZStVHJw2i for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 05:23:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com;
 envelope-from=lars@underjord.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D6D141591
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D6D141591
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D6D141591
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 05:23:24 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-86d3907524cso771078241.0
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 22:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745558603; x=1746163403;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T7hUicNlH0eHvDppxzGPn+NIYsXXb661/Pa0wBqlWms=;
 b=nwQDZGZAAEK4b5lyzsyE2h4XAla138ixoLFnkGLPd3Rl+HProaZOebwWjtxzPPf2rh
 92dqBFKdmu9jAf0aogh+8oIvMbS6YzSePyOh6cB3Ed+3IEibMqKzJl7+hkoowUfc7AG4
 g4h/m5j5sGWAFS5HlYQFVHtPAYnKTna7GE4nnTDN2h796MWUzKN3WMGp67K7b8EdqNK/
 BRskTvtxkaMvQdc2sy1idO1abLoskwP0a9YkeKUBluR1WKuTra5Xwarkj61Ww72kMLR4
 rfOKxC1QTLhnt6Dbh+rkP0VdjtMveCizvYpOyf+AQVHZseiAijzgh4eikdfxY0OX9iW5
 aoHg==
X-Gm-Message-State: AOJu0YyXrTHQaW3yAjhanPw3hIJzVhpa8CCDATc0j8dy+xMrWGpbDyxS
 EwAPUY+3fkMGqprJ08We/TWOqpmxkuCpM5d84Gm02Se/c7+yvHxUKF35ZYeZvA4dV9oaPDNvO+5
 kxR5S138fR8AUl2WEnwjNjQRW4uOuvmzQBq5uUQ==
X-Gm-Gg: ASbGnctawmbiygxkcDUE3wFYDtnjHU4/J/2zezkjhIsnzlElSWvI9g9bHqkcqcHlbzA
 HELKv8bhQv1er2TvXUhJ1UiRmgroFa7yS55fdu0LTdtl2gFzs87it+QNFU8GglR8QuhlfvCTdJn
 X5BDNW8OE2rHxMB5ddyEPbpnojQvaPPLe9Tg==
X-Google-Smtp-Source: AGHT+IEdIws42BKR78J2WrrgiK7Vu3+1d1xj8gG4meFZ0NtM3/SUxkMUx0P9baLeCmjxH2nm641enNzr4EWNZ7WF6ko=
X-Received: by 2002:a05:6102:3c87:b0:4cb:43d4:6926 with SMTP id
 ada2fe7eead31-4d5437daa72mr291892137.7.1745558602949; Thu, 24 Apr 2025
 22:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250422072717.153123-1-lars@underjord.io>
 <20250424225655.188ed9f3@windsurf>
In-Reply-To: <20250424225655.188ed9f3@windsurf>
From: Lars Wikman <lars@underjord.io>
Date: Fri, 25 Apr 2025 07:23:12 +0200
X-Gm-Features: ATxdqUFqTcad1mjKAyg2YR3e8L-rGZubHElF_7jba2GWXFW3lQaVapWPGPS42Og
Message-ID: <CADqW+q=fzvfS4Zf5NP+5ELaS90zw4_FajL2uh3wypx-iOJQLGw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=underjord.io; s=google; t=1745558603; x=1746163403; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T7hUicNlH0eHvDppxzGPn+NIYsXXb661/Pa0wBqlWms=;
 b=OkTpxZ1gPtkxVYnr9lyV4A3Ks/luyRbWYf1MtE3HSEArZ2sGY08pamh3slostpfHHR
 dLKIYPWeK3ybIoKVtj68gldeo1yj9zOgxdGWDnnpjq4ZEnIY1IaFbk2+Ac3NGHTXTDOG
 1uHTP5B4/S9zFpaZczhvQHRY5OOJDk5vBCUjBVXjd6CaR0pGxfVNhJlQTLzvlHEMGtjO
 ytexjd/yJwl+kfD7zQh3aOeYPE57H1cQ+lXJYFnLWWAwkYewiWmTyRQPtLjVEkDAXpbf
 MdJrs76o1dtGrz96COSm9oI4CFBmCzVWQCKzc4yc+b6MImutinLT+0NROqt/OLflpASy
 +r2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=underjord.io
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=underjord.io header.i=@underjord.io header.a=rsa-sha256
 header.s=google header.b=OkTpxZ1g
Subject: Re: [Buildroot] [PATCH] package/wpa_supplicant: add Smart card
 option
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
Content-Type: multipart/mixed; boundary="===============0616982287099585204=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0616982287099585204==
Content-Type: multipart/alternative; boundary="00000000000076c20206339388b2"

--00000000000076c20206339388b2
Content-Type: text/plain; charset="UTF-8"

Thanks :)

On Thu, 24 Apr 2025 at 22:56, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> On Tue, 22 Apr 2025 09:27:17 +0200
> Lars Wikman <lars@underjord.io> wrote:
>
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
> >
> > ---
> > Changes v1 -> v2:
> >   - Change option name to focus on smartcard  (suggested by Sergey)
> > Changes v2 -> v3:
> >   - Change setting disabled to match convention (suggested by Baruch)
> > Changes v3 -> v4:
> >   - Add selecting OpenSSL for smartcard (suggested by Thomas)
> > ---
> >  package/wpa_supplicant/Config.in         | 8 ++++++++
> >  package/wpa_supplicant/wpa_supplicant.mk | 9 ++++++---
> >  2 files changed, 14 insertions(+), 3 deletions(-)
>
> Applied to master, thanks.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000076c20206339388b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks :)</div><div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 24 Apr 2025 a=
t 22:56, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.co=
m">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
On Tue, 22 Apr 2025 09:27:17 +0200<br>
Lars Wikman &lt;<a href=3D"mailto:lars@underjord.io" target=3D"_blank">lars=
@underjord.io</a>&gt; wrote:<br>
<br>
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
&gt; <br>
&gt; ---<br>
&gt; Changes v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0- Change option name to focus on smartcard=C2=A0 (suggeste=
d by Sergey)<br>
&gt; Changes v2 -&gt; v3:<br>
&gt;=C2=A0 =C2=A0- Change setting disabled to match convention (suggested b=
y Baruch)<br>
&gt; Changes v3 -&gt; v4:<br>
&gt;=C2=A0 =C2=A0- Add selecting OpenSSL for smartcard (suggested by Thomas=
)<br>
&gt; ---<br>
&gt;=C2=A0 package/wpa_supplicant/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 8 ++++++++<br>
&gt;=C2=A0 package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=
=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a> | 9 ++++++---<br>
&gt;=C2=A0 2 files changed, 14 insertions(+), 3 deletions(-)<br>
<br>
Applied to master, thanks.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--00000000000076c20206339388b2--

--===============0616982287099585204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0616982287099585204==--
