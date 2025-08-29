Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF797C8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 08:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 804CD40D6A;
	Fri, 29 Aug 2025 08:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Szjquhv8Ullm; Fri, 29 Aug 2025 08:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87CBF40D4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87CBF40D4B;
	Fri, 29 Aug 2025 08:26:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EEBAD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7409E614BF
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeAtRXsCGkqZ for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 08:26:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DCEC614A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DCEC614A7
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DCEC614A7
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:26:25 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-248cb0b37dfso17584495ad.3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 01:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756455985; x=1757060785;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eKujpF8uOqn63U8AXg7284Z8KSMApYykORE/8xnrS0o=;
 b=RQ46+afZNK2sZuFRbLlRvW7KpysfNdFffL1jqH+mLU5c1niMsI7bYL8r+EQaz687tu
 nh4eia5l3f/XyHmCl48lVWIngtg3ZU2az7T9ElCJ+uXkZ3Iw3gjevOBP9Ez8qqnDAu8D
 C7I1tuZSHw/LV8jIjtxiakEXr+I/WDEQWXlqQ9zFur4CHa3wMjq0KpOa+189h8lRDadz
 m9l5ZD+S46zV60A8XGrzSlKzxWt0g1RbfJKmt/DwX81za1P44jWYClMWhV/GXYXUASY6
 KQZlkPi2Ijq8mYbp+9MgddmSrN1Eo7TJff6BHIx0u8Pn84KpPG6tbIf6EUMmNGodBWvf
 2dTQ==
X-Gm-Message-State: AOJu0YwbX0xmIgXCvNicp3X1i521enKjTq2kVcACboor1NkTlqM4pgDf
 /GPLOkzrtXDkkS0SmRAWju+vhI92v9JoPnqxp5BCa4ZwUQMoeODNcUOZv2unnw2jN7ud2EuQSMt
 h7mezg0cEU2QfMk4db/zVWFZfrvEscyt4uhLs7jjUc37bertI2lwN/lE=
X-Gm-Gg: ASbGncvxU7PA/wdBXtht7+GlTnK6vyUVNiPU3K9pBgRGVxAnSi6ebQDwh7pVca8Vz4K
 bqRpfJ+J93zMrY1Lx50jcs/rr3mak2bG4M7BXuHUqDHNVBR30fFSVm+9qp61h3rKb1TTcxnBSUd
 pcrkAZ1SqhKCK3iMjc0dGG8/W1MIDtRl2bnhIDOed9xTFJBLhwYnncjiWdDaF+a6DlejtzUAYdQ
 CKuuOMnvXAD7lZ+
X-Google-Smtp-Source: AGHT+IFzAIWCZ1+nFtrcjpJ2ho6A9Sy6Ru1EpxvK9psUe4SLQwQGh4Vt7nUh7kFwDNWBYr96M4nrnINQ6sL47zDe3yY=
X-Received: by 2002:a17:903:120a:b0:248:6d1a:4304 with SMTP id
 d9443c01a7336-2486d1a46c1mr172310405ad.38.1756455984504; Fri, 29 Aug 2025
 01:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250819181451.3012126-1-michael@amarulasolutions.com>
 <20250819181451.3012126-3-michael@amarulasolutions.com>
 <20250819222524.5682cbc2@windsurf>
 <CAOf5uwmXu97UQHFLY0wwXhS57FFHWtwkpxSm48oWKbvOeANUbA@mail.gmail.com>
In-Reply-To: <CAOf5uwmXu97UQHFLY0wwXhS57FFHWtwkpxSm48oWKbvOeANUbA@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 29 Aug 2025 10:26:10 +0200
X-Gm-Features: Ac12FXwHpz14S9Tw32QDKhqo5bSOIAUADrf873Qv-AarrHbp7hkoDBkNTAZ5paM
Message-ID: <CAOf5uw=Uay4hwNVqZnqVMbkBJcu8GcaAwCZApGAECne95au+QA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot Mailing List <buildroot@buildroot.org>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 linux-amarula <linux-amarula@amarulasolutions.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756455985; x=1757060785;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eKujpF8uOqn63U8AXg7284Z8KSMApYykORE/8xnrS0o=;
 b=SCEsRlyVi7S2D6BlmZqSg3hJM3smcKNxVIfJtOWpqKKL+bdEO2lSSd5pvmerkQxxui
 Som3uEevSiQtUgSDnpSB0+KQjSuFBOhOK8gNVLGGzcf2qEH4FVlKESkq7YickUTwYj+7
 2vyrOKfqnbcA+/iI5VchNQce70/SO1G1dkYL0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=SCEsRlyV
Subject: Re: [Buildroot] [PATCH 2/6]
 configs/engicam_imx6qdl_icore_defconfig: bump Linux to 6.12.36 and U-Boot
 to 2025.07
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
Content-Type: multipart/mixed; boundary="===============0690801299590364111=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0690801299590364111==
Content-Type: multipart/alternative; boundary="0000000000000535e3063d7cc778"

--0000000000000535e3063d7cc778
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all

Please drop for now them. I get them building but they are not booting and
I need personally collect the boards and fix them up

Michael

Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

Il mar 19 ago 2025, 22:42 Michael Nazzareno Trimarchi <
michael@amarulasolutions.com> ha scritto:

> Hi Thomas
>
> On Tue, Aug 19, 2025 at 10:25=E2=80=AFPM Thomas Petazzoni <
> thomas.petazzoni@bootlin.com> wrote:
>
>> Hello Michael,
>>
>> On Tue, 19 Aug 2025 20:14:47 +0200
>> Michael Trimarchi <michael@amarulasolutions.com> wrote:
>>
>> > +BR2_PACKAGE_HOST_E2FSPROGS=3Dy
>>
>> What do you need this?
>>
>> > +BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=3Dy
>>
>> Please do not add this package, we try to keep our defconfigs minimal.
>>
>> (Comment applies to other patches of course)
>>
>
> Fix all of them in the second round.
>
> Michael
>
>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
>>
>
>
> --
> Michael Nazzareno Trimarchi
> Co-Founder & Chief Executive Officer
> M. +39 347 913 2170
> michael@amarulasolutions.com
> __________________________________
>
> Amarula Solutions BV
> Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
> T. +31 (0)85 111 9172
> info@amarulasolutions.com
> www.amarulasolutions.com
>

--0000000000000535e3063d7cc778
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi all</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Please drop for now them. I get them building but they are not bootin=
g and I need personally collect the boards and fix them up=C2=A0</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Michael=C2=A0</div><div><br></div>=
<div data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Michael Nazzareno =
Trimarchi<br>Co-Founder &amp; Chief Executive Officer<br>M. +39 347 913 217=
0<br><a href=3D"mailto:michael@amarulasolutions.com" target=3D"_blank">mich=
ael@amarulasolutions.com</a><br>__________________________________<br><div>=
<br></div><div>Amarula Solutions BV</div>Joop Geesinkweg 125, 1114 AB, Amst=
erdam, NL<br>T. +31 (0)85 111 9172<br><a href=3D"mailto:info@amarulasolutio=
ns.com" target=3D"_blank">info@amarulasolutions.com</a><br><a href=3D"http:=
//www.amarulasolutions.com" target=3D"_blank">www.amarulasolutions.com</a><=
br></div></div></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">Il mar 19 ago 2025, 22:42 Michael Nazz=
areno Trimarchi &lt;<a href=3D"mailto:michael@amarulasolutions.com">michael=
@amarulasolutions.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi Thomas</div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 19, 20=
25 at 10:25=E2=80=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazz=
oni@bootlin.com" target=3D"_blank" rel=3D"noreferrer">thomas.petazzoni@boot=
lin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hello Michael,<br>
<br>
On Tue, 19 Aug 2025 20:14:47 +0200<br>
Michael Trimarchi &lt;<a href=3D"mailto:michael@amarulasolutions.com" targe=
t=3D"_blank" rel=3D"noreferrer">michael@amarulasolutions.com</a>&gt; wrote:=
<br>
<br>
&gt; +BR2_PACKAGE_HOST_E2FSPROGS=3Dy<br>
<br>
What do you need this?<br>
<br>
&gt; +BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=3Dy<br>
<br>
Please do not add this package, we try to keep our defconfigs minimal.<br>
<br>
(Comment applies to other patches of course)<br></blockquote><div><br></div=
><div>Fix all of them in the second round.=C2=A0</div><div><br></div><div>M=
ichael</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Michael Nazzareno Trimarchi<br>Co-Founder &amp; =
Chief Executive Officer<br>M. +39 347 913 2170<br><a href=3D"mailto:michael=
@amarulasolutions.com" target=3D"_blank" rel=3D"noreferrer">michael@amarula=
solutions.com</a><br>__________________________________<br><div><br></div><=
div>Amarula Solutions BV</div>Joop Geesinkweg 125, 1114 AB, Amsterdam, NL<b=
r>T. +31 (0)85 111 9172<br><a href=3D"mailto:info@amarulasolutions.com" tar=
get=3D"_blank" rel=3D"noreferrer">info@amarulasolutions.com</a><br><a href=
=3D"http://www.amarulasolutions.com" target=3D"_blank" rel=3D"noreferrer">w=
ww.amarulasolutions.com</a><br></div></div></div>
</blockquote></div>

--0000000000000535e3063d7cc778--

--===============0690801299590364111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0690801299590364111==--
