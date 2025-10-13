Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C112CCD185
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 06:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE571611A9;
	Mon, 13 Oct 2025 06:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q31I2_lRBEvw; Mon, 13 Oct 2025 06:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35BF5611A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35BF5611A1;
	Mon, 13 Oct 2025 06:07:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0FE32A8
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 06:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2F7A40F4F
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 06:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23XRhwCvk-6Y for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 06:07:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=pierre.ficheux@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B515F40F4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B515F40F4E
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B515F40F4E
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 06:07:16 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-36453927ffaso34445401fa.2
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 23:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760335634; x=1760940434;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SEfE4jJhY521oBp1AxjKhHMZ2KKYcwioKORotK1QCWI=;
 b=xSXINcmF0kAMIIAuVBYXYnJtaCQShEwAh7pDm8RKjSaE2X0nOSDDGnGDZ+0gPZ921A
 E9A2z1LBlBiOYwsByp/ml3rRNtagt2vmrT+GbFEPQTe9t9+7QskEdGqNGUvhK5eYQIXj
 HOYTXg1lC07bqTKdZ3RhbMkPZp85w2XPXM/3Ghspclq+T4yJokuEuJe7Us87mDPPEVke
 J/rV43BNz1U2B2dfQ/V3u9SC6YpmiVZzHDSNvL9bMPTEBUbq2ygo33NRcvF8vgKSlFYB
 u6egFtQF/6nSeFvCYjvdlfxD63u/qgHhpLFKVXJOpBG3236vWCp6W8o4uEif2Vj7ff9i
 7KEQ==
X-Gm-Message-State: AOJu0Yzxl19RwJAVSCED3f5FP5IBDB57o1pNN/UM6w/3XLwOfmTHPWKW
 xCmOIejaTVIcrHTvY/5tzrTK8qzjQ+8Fu4yIoRCLos7apBfwarWIZ7oU+H1lmppF9xwKK/vbxKU
 4og41I9pi+MG6lQ24nRzTNG8UhuGzYnXH/ZYKsO5gezEyfRZLhoaba/0=
X-Gm-Gg: ASbGncs69YDUnp9RpkeABDdtxq+GwZkBuHe/u2dRp/BpdDRYsBU8VeNzB35wqOlA9Al
 ydudlKSZ1dXBc87jXRv+W3gg32pT/OAS41/2uVRnxd3RH2CLPwYYC0uM+dldh3DsyHcv7+li1IP
 hmmsne/hL2T+Ph2Ekodp4o99zQKCsFoS6KJfcFYK3HkQGF70ueSy4XwqONm4WZaO7uk8FjKDxfG
 zAKx0J/HF5VyZetbSWx+95MZnyv/wUysidnR/sQTRA6iNthTAny9pKmEs8=
X-Google-Smtp-Source: AGHT+IFOqzUEqg28WeK6zG7H7nwetKcC0mHQENDdojcjdFzFQJYdo0hwvpVJDPJJo7oDyORj6sgVSSFxII0ed2a3Qrw=
X-Received: by 2002:a05:651c:1b8d:b0:376:2802:84c5 with SMTP id
 38308e7fff4ca-37628028b6dmr25500981fa.46.1760335633283; Sun, 12 Oct 2025
 23:07:13 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 13 Oct 2025 08:07:02 +0200
X-Gm-Features: AS18NWDeLOZbSHXYSY0THUqQ2im2VuMB_A7_pmhaku2S5YYr-YYfRIlmb-HnlGo
Message-ID: <CAFc1U0tQYsSWe1=EtduNZogzNTtJHGr4eX3pjnYro5zJeArniA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1760335634; x=1760940434; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SEfE4jJhY521oBp1AxjKhHMZ2KKYcwioKORotK1QCWI=;
 b=Cd/ZLTD6nnQxNiAoMASmFrYv5Pv4fZyluF57XCx9h9veVLHdI3jR4kl2Tl+cN52H1r
 03GlPPn+/vS4jxcL1B/ibj6nSnIhE23zmADTZQ19k+q61Yduew/Yu7TuPVN82XKWGKxI
 Szj3ywF29kiHAKO5K5se3s+Zh1Fvl/E9URIog=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Cd/ZLTD6
Subject: [Buildroot] PocketBeagle2 support
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
Content-Type: multipart/mixed; boundary="===============0368870395823042094=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0368870395823042094==
Content-Type: multipart/alternative; boundary="0000000000001b906706410414b3"

--0000000000001b906706410414b3
Content-Type: text/plain; charset="UTF-8"

Hi all,

Are you considering any BR support for PB2 ? I saw the following link but
it's old:

https://github.com/mixaz/buildroot-pocketbeagle


Thx


-- 

Pierre FICHEUX -/- CTO Smile ECS, France -\- pierre.ficheux@smile.fr
                             http://www.smile.fr
                             https://smile.eu/fr/offres/embarque-iot
I would love to change the world, but they won't give me the source code

--0000000000001b906706410414b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div class=3D"gmail_default" style=3D"font-family:ari=
al,sans-serif">Hi all,</div><div class=3D"gmail_default" style=3D"font-fami=
ly:arial,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-f=
amily:arial,sans-serif">Are you considering any BR support for PB2 ? I saw =
the following link but it&#39;s old:=C2=A0</div><div class=3D"gmail_default=
" style=3D"font-family:arial,sans-serif"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,sans-serif"><a href=3D"https://github.com/m=
ixaz/buildroot-pocketbeagle">https://github.com/mixaz/buildroot-pocketbeagl=
e</a></div><div class=3D"gmail_default" style=3D"font-family:arial,sans-ser=
if"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,sans-=
serif"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,sa=
ns-serif">Thx</div><br clear=3D"all"></div><div><br></div><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><pre style=3D"margi=
n-top:0px;margin-bottom:0px;padding:0px;font-size:12px;color:rgb(51,51,51);=
white-space:pre-wrap!important">Pierre FICHEUX -/- CTO Smile ECS, France -\=
- <a href=3D"mailto:pierre.ficheux@smile.fr" style=3D"color:rgb(1,134,186)"=
 target=3D"_blank">pierre.ficheux@smile.fr</a>
                             <a href=3D"http://www.smile.fr/" style=3D"colo=
r:rgb(1,134,186)" target=3D"_blank">http://www.smile.fr</a>
                             <a href=3D"https://smile.eu/fr/offres/embarque=
-iot" style=3D"color:rgb(1,134,186)" target=3D"_blank">https://smile.eu/fr/=
offres/embarque-iot</a>
I would love to change the world, but they won&#39;t give me the source cod=
e</pre></div></div></div>

--0000000000001b906706410414b3--

--===============0368870395823042094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0368870395823042094==--
