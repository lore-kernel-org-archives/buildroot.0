Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BDBCCD193
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 09:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AFC38230A;
	Mon, 20 Oct 2025 09:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKgIWPTsaIIm; Mon, 20 Oct 2025 09:59:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90690832C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90690832C7;
	Mon, 20 Oct 2025 09:59:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68BA043F
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 09:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FEA641293
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 09:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_zZWWcj16rT for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 09:59:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=pierre.ficheux@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0C26409B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0C26409B7
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0C26409B7
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 09:59:08 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-37777912161so42046511fa.1
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 02:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760954346; x=1761559146;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Flopo7kxcO2sqCnBAvOgORAnREt+bkzJ2oiSGjgB6oo=;
 b=kHpHWxNbBhrvtXDyDC9JWam8PazWF5cL4lpdnyHerJX6ZFxvTnE1/3LJxk3VjIIELs
 IoVFIWcXBUk7HgWJqDV+xGUdPfVa54hYRvyboJan/iPfeJY0bs6m/qRQjnwG9Og6DzpO
 Vq4GhXety9KGaaEsJufNdafbPwmBNqXPqAl6zfAHtarvBmKuMAG+Z7wFa3TSDRvWdaE+
 DI6FsIN1ZJJ1nulzq76PQmuieJOnv1G2Gw/xF/87AvdeONlBnxnu5DqmvxF/ABVeIOF5
 GOiIkZHz9INKvV6e04tVP/m8ZYBXXkv5GoUW0Dyed/OQhA2CzMHvjuA8LzeqRZl8T6hd
 Ya+w==
X-Gm-Message-State: AOJu0YzqIPH/xqXj2SRa+0I/pzqHj0SvBC5uakcu1bhNsXQLjfHAjwQB
 TtB10wb7iru8VwCKJszq0G0H6ekZn2DUVf2o4Ge2FuU4dJx84UugWTzA7yYlS3oD0aAtAuEe864
 9fb8xS7srfw1mQczEGce+l2I3OtmQxmTQwY9ve7vLBm88I3QGybPeZuM=
X-Gm-Gg: ASbGncs/GFvcJj/zDanFXgP5VwLsNNEo2Uhsj4aaQkkqALzudzcTkdhD+x6JXDI2yzu
 kBxeb7nYDs/IkIjYVP7WJFp+UMqd6CqVgIxpA1NDKRxhmeEwTkwvaajNL1yrkWz2H3gB0hQGkTT
 KukT/2vrgrK5B3Bne34SwRZB32yejKBkhyRQJ1/bcYXmkndIGiDpXBo2TZTe+LtuzaBkzHEgYLW
 oiaVvFg5EUJ5gSLJR+HS8qjY+DkUFcxfzYuulUHWj2AIM3vUUmU4ZrJz0gnX9g=
X-Google-Smtp-Source: AGHT+IHjNYbAHd878H1ZrYEumQ59ZBfyVAlbjba+/m8oSAORKE52gIjo3bA/76pfYfSXvOjCCoJHjgWECwxwtIEVOc0=
X-Received: by 2002:a2e:a912:0:b0:372:909b:b3df with SMTP id
 38308e7fff4ca-37797a473e2mr43225581fa.31.1760954345696; Mon, 20 Oct 2025
 02:59:05 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 20 Oct 2025 11:58:54 +0200
X-Gm-Features: AS18NWDqAh0JSO8MJi406G277gLWm-uaNvEIguSPAbMQP13OfF-p31QNUXZ2Txs
Message-ID: <CAFc1U0sGFiRTRX0=gt=SXUZV1Z75NMVZZgUx2dng-XAUtceSFA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1760954346; x=1761559146; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Flopo7kxcO2sqCnBAvOgORAnREt+bkzJ2oiSGjgB6oo=;
 b=FWJ4kAZqyCMXRXyATYFmMGRYtzEALH/riQZh3eCo0wyGIcPB3g9sB33csnOv4bsjIL
 vpxl4nmjlSdWttJb0Ao6vmMWqEdj1fiBbsNFIfKPlLu1lx1q7Sf3yoIbgdbkoKwyd56H
 cMmk7IyH+zHdPZ1U9+v7Ny2wtJnphkmj8hYRE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=FWJ4kAZq
Subject: [Buildroot] Request about BR documentation
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
From: Pierre FICHEUX via buildroot <buildroot@buildroot.org>
Reply-To: Pierre FICHEUX <pierre.ficheux@smile.fr>
Content-Type: multipart/mixed; boundary="===============0455423906492386805=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0455423906492386805==
Content-Type: multipart/alternative; boundary="0000000000003dc1570641942229"

--0000000000003dc1570641942229
Content-Type: text/plain; charset="UTF-8"

Hi,

When I use Yocto, the documentation provides a command you can copy/paste
to the shell, such as:

$ sudo apt-get install build-essential chrpath cpio debianutils diffstat
etc.

See
https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#build-host-packages

The Buildroot documentation simply gives a list of the needed packages, see
https://buildroot.org/downloads/manual/manual.html#requirement-mandatory

Would it be possible to change it and give the command instead (easier to
copy/paste)?

Could it be a contribution ?

Regards

-- 

Pierre FICHEUX -/- CTO Smile ECS, France -\- pierre.ficheux@smile.fr
                             http://www.smile.fr
                             https://smile.eu/fr/offres/embarque-iot
I would love to change the world, but they won't give me the source code

--0000000000003dc1570641942229
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div class=3D"gmail_default" style=3D""><span style=
=3D"font-family:arial,sans-serif"></span><font face=3D"arial, sans-serif">H=
i,</font></div><div class=3D"gmail_default" style=3D""><font face=3D"arial,=
 sans-serif"><br></font></div><div class=3D"gmail_default" style=3D""><font=
 face=3D"arial, sans-serif">When I use Yocto, the documentation provides a =
command you can copy/paste to the shell, such as:</font></div><div class=3D=
"gmail_default" style=3D""><span style=3D"color:rgb(51,51,51)"><font face=
=3D"arial, sans-serif"><br></font></span></div><div class=3D"gmail_default"=
 style=3D""><font face=3D"arial, sans-serif">$=C2=A0<span style=3D"color:rg=
b(51,51,51)">sudo</span><span class=3D"gmail-w" style=3D"box-sizing:border-=
box;color:rgb(187,187,187)"> </span><span style=3D"color:rgb(51,51,51)">apt=
-get</span><span class=3D"gmail-w" style=3D"box-sizing:border-box;color:rgb=
(187,187,187)"> </span><span style=3D"color:rgb(51,51,51)">install</span><s=
pan class=3D"gmail-w" style=3D"box-sizing:border-box;color:rgb(187,187,187)=
"> </span><span style=3D"color:rgb(51,51,51)">build-essential</span><span c=
lass=3D"gmail-w" style=3D"box-sizing:border-box;color:rgb(187,187,187)"> </=
span><span style=3D"color:rgb(51,51,51)">chrpath</span><span class=3D"gmail=
-w" style=3D"box-sizing:border-box;color:rgb(187,187,187)"> </span><span st=
yle=3D"color:rgb(51,51,51)">cpio</span><span class=3D"gmail-w" style=3D"box=
-sizing:border-box;color:rgb(187,187,187)"> </span><span style=3D"color:rgb=
(51,51,51)">debianutils</span><span class=3D"gmail-w" style=3D"box-sizing:b=
order-box;color:rgb(187,187,187)"> </span><span style=3D"color:rgb(51,51,51=
)">d</span><font color=3D"#000000">iffstat=C2=A0 etc.</font></font></div><d=
iv class=3D"gmail_default" style=3D""><font color=3D"#bbbbbb" face=3D"arial=
, sans-serif"><br></font></div><div class=3D"gmail_default" style=3D"">See =
<a href=3D"https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#bu=
ild-host-packages">https://docs.yoctoproject.org/brief-yoctoprojectqs/index=
.html#build-host-packages</a></div><div class=3D"gmail_default" style=3D"">=
<font color=3D"#bbbbbb" face=3D"arial, sans-serif"><br></font></div><div cl=
ass=3D"gmail_default" style=3D""><font face=3D"arial, sans-serif"><font col=
or=3D"#000000">The Buildroot documentation simply gives a list of the neede=
d packages, see=C2=A0</font><a href=3D"https://buildroot.org/downloads/manu=
al/manual.html#requirement-mandatory">https://buildroot.org/downloads/manua=
l/manual.html#requirement-mandatory</a>=C2=A0</font></div><div class=3D"gma=
il_default" style=3D""><font face=3D"arial, sans-serif"><br></font></div><d=
iv class=3D"gmail_default" style=3D""><font face=3D"arial, sans-serif">Woul=
d it be possible to change it and give the command instead (easier to copy/=
paste)?</font></div><div class=3D"gmail_default" style=3D""><font face=3D"a=
rial, sans-serif"><br></font></div><div class=3D"gmail_default" style=3D"">=
<font face=3D"arial, sans-serif">Could it be a contribution ?</font></div><=
div class=3D"gmail_default" style=3D""><font face=3D"arial, sans-serif"><br=
></font></div><div class=3D"gmail_default" style=3D""><font face=3D"arial, =
sans-serif">Regards</font></div></div><div class=3D"gmail_default" style=3D=
""><font face=3D"arial, sans-serif"><br></font></div><span class=3D"gmail_s=
ignature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr"><pre style=3D"margin-top=
:0px;margin-bottom:0px;padding:0px;font-size:12px;color:rgb(51,51,51);white=
-space:pre-wrap!important">Pierre FICHEUX -/- CTO Smile ECS, France -\- <a =
href=3D"mailto:pierre.ficheux@smile.fr" style=3D"color:rgb(1,134,186)" targ=
et=3D"_blank">pierre.ficheux@smile.fr</a>
                             <a href=3D"http://www.smile.fr/" style=3D"colo=
r:rgb(1,134,186)" target=3D"_blank">http://www.smile.fr</a>
                             <a href=3D"https://smile.eu/fr/offres/embarque=
-iot" style=3D"color:rgb(1,134,186)" target=3D"_blank">https://smile.eu/fr/=
offres/embarque-iot</a>
I would love to change the world, but they won&#39;t give me the source cod=
e</pre></div></div></div>

--0000000000003dc1570641942229--

--===============0455423906492386805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0455423906492386805==--
