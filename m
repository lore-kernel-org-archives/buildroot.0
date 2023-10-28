Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C279BC27C47
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 14:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15A786112D;
	Sat, 28 Oct 2023 14:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15A786112D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_zHgnZt6vpE; Sat, 28 Oct 2023 14:41:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DE3F6110A;
	Sat, 28 Oct 2023 14:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DE3F6110A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E0A31BF5E9
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 14:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56D2241B8C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 14:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56D2241B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XYHrvVLJfjLT for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 14:41:13 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF81741B88
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 14:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF81741B88
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c523ac38fbso45400911fa.0
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 07:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698504070; x=1699108870;
 h=mime-version:user-agent:reply-to:message-id:date:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C0wJgcGiJFKclRvDcexgGvaZ94FHwKN76oKOsZt6q/A=;
 b=GMi7r38bpCQYGrbAdRIArSNSQdU/OJnLYsCqhTAVJr94v1l7ywNzoXzPXGQDRNeoIz
 N93GS5+6b8TdTPv/+/NSzpkM1e1HoTb7PIJL7e2hjDXJHPFCEN1raPHSnDoWdh8J+GLA
 LQQ46MAHw8veQPlTWBgIT/DLNijJoRDEiRcPX8JXCFXEuDlRFpMuoo+cVH5eVsUwFVNu
 9a4ulR1ssNomFqDBchF4XZ+sc+kdd8DuYP8AXxsy+XhR6WetBA5k7lmrtiPanG3cTvC7
 aNAQPoBDeFIG6ncL8Q1djvyjQs78Ea/9FFHshpakDkicWai14tL5igcFXezvidvMZFR6
 etFQ==
X-Gm-Message-State: AOJu0Yx1v57WifiGPX566ZUnAXNQVtuCiBpiKHL6keRFRl6CJx4Slg79
 4XQ+mGPcmfil0oM+zN3PIjhqTICLK8o=
X-Google-Smtp-Source: AGHT+IH0RC6hfutZTWwAyMV2DilE/PDzFXMgzTMONX3x4alaVEA/p6IFiMpXRLXu58aXnnDAMVazLQ==
X-Received: by 2002:a2e:874b:0:b0:2bc:eceb:6a4b with SMTP id
 q11-20020a2e874b000000b002bceceb6a4bmr3989970ljj.28.1698504070132; 
 Sat, 28 Oct 2023 07:41:10 -0700 (PDT)
Received: from [192.168.7.144] (epd88.neoplus.adsl.tpnet.pl. [83.20.45.88])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a2e80d2000000b002bce77e4ddfsm651187ljg.97.2023.10.28.07.41.08
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 28 Oct 2023 07:41:09 -0700 (PDT)
From: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 14:41:08 +0000
Message-Id: <em9eec97a0-87a4-4352-9e89-03948b436830@9e2fe6c2.com>
User-Agent: eM_Client/9.2.2093.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698504070; x=1699108870; darn=buildroot.org;
 h=mime-version:user-agent:reply-to:message-id:date:subject:to:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C0wJgcGiJFKclRvDcexgGvaZ94FHwKN76oKOsZt6q/A=;
 b=Ymjwm20zSvidLAidXxNUdJ8rWqBxxyFHnfSvuc4Vq6BXwbn8wLYRubmlAb07tGSgRv
 +TFamCeZEMtSLelSiSM9B3YpR+a0Kib+v2jdRgxi9rrT73f0OlLFemcM3tItGi4FG1Oz
 7EvsKgMmH+GhWtGpnyf90ny2B0FoFKjy3QdAW0UsVcy97ERvReLAVkSbuE6scKe0VjM0
 LRuCph2oSJRBQ+ZvY8YG3rpbYiy10wq9CkccZClNs+IcuEER+TCHO5E7mja+Y7bIUu9d
 OPdxLSMfx91LbIiTs0YsPqCDO9NUUC+wbx+uZ/6AjPYG3NdFC3AqsBTYkJiuZNKp6IYb
 2yFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ymjwm20z
Subject: [Buildroot] Help with DTO
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
Reply-To: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
Content-Type: multipart/mixed; boundary="===============0271169666940462878=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0271169666940462878==
Content-Type: multipart/alternative;
 boundary="------=_MB67896CEF-5DE6-41DA-9175-862719D4B592"

--------=_MB67896CEF-5DE6-41DA-9175-862719D4B592
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi guys!
In my free time I am working on this open HW/ SW project called=20
BeagleNode: https://github.com/bremenpl/BeagleNodeHW

The aim is for this device to be used in homes with Home Assistant=20
<https://www.home-assistant.io/> to control various lights, switches or=20
shades. It has 16x outputs and 16x inputs (can be 230 VAC driven), so=20
its quite versatile. My goal was for it to be a drop in for electrical=20
installations that are "Star" connected in the switchboards cabinets.

So I have the HW and virgin working Buildroot image baked thanks to this=20
tutorial=20
<https://blog.billvanleeuwen.ca/creating-a-minimal-linux-system-for-the-bea=
glebone-black-with-buildroot>.=20
What I wanted to do next is to create a device tree overlay for all=20
required GPIOs that would be compiled at kernel build time. But I am not=20
sure how to do that... I need a total of 32 GPIO outputs (2 per relay)=20
and 16 inputs controlled via both PRUs.

I would appreciate all feedback regarding some pointers and sources on=20
where I could learn this. Also, in case anyone is interested in=20
contributing to this project- please let me know!

--
=C5=81ukasz Przenios=C5=82o

--------=_MB67896CEF-5DE6-41DA-9175-862719D4B592
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head>

<style id=3D"css_styles">=20
blockquote.cite { margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc }
blockquote.cite2 {margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc; margin-top: 3px; padding=
-top: 0px; }
a img { border: 0px; }
li[style=3D'text-align: center;'], li[style=3D'text-align: center; '], li[s=
tyle=3D'text-align: right;'], li[style=3D'text-align: right; '] {  list-sty=
le-position: inside;}
body { font-family: Verdana; font-size: 12pt; }
.quote { margin-left: 1em; margin-right: 1em; border-left: 5px #ebebeb soli=
d; padding-left: 0.3em; }

 </style>
</head>
<body><div>Hi guys!</div><div>In my free time I am working on this open HW/ =
SW project called BeagleNode:=C2=A0<a href=3D"https://github.com/bremenpl/=
BeagleNodeHW" style=3D"font-size: 12pt;">https://github.com/bremenpl/Beagle=
NodeHW</a></div><div><br /></div><div>The aim is for this device to be used =
in homes with <a href=3D"https://www.home-assistant.io/">Home Assistant</a=
> to control various lights, switches or shades. It has 16x outputs and 16x =
inputs (can be 230 VAC driven), so its quite versatile. My goal was for it =
to be a drop in for electrical installations that are "Star" connected in=
 the switchboards cabinets.</div><div><br /></div><div>So I have the HW and=
 virgin working Buildroot image baked thanks to <a href=3D"https://blog.bill=
vanleeuwen.ca/creating-a-minimal-linux-system-for-the-beaglebone-black-with=
-buildroot">this tutorial</a>. What I wanted to do next is to create a devi=
ce tree overlay for all required GPIOs that would be compiled at kernel bui=
ld time. But I am not sure how to do that... I need a total of 32 GPIO outp=
uts (2 per relay) and 16 inputs controlled via both PRUs.</div><div><br /><=
/div><div>I would appreciate all feedback regarding some pointers and sourc=
es on where I could learn this. Also, in case anyone is interested in contr=
ibuting to this project- please let me know!</div>
<div><br /></div><div id=3D"signature_old" style=3D"clear:both">--<div>=C5=
=81ukasz Przenios=C5=82o</div></div><div><br /></div>
</body></html>
--------=_MB67896CEF-5DE6-41DA-9175-862719D4B592--


--===============0271169666940462878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0271169666940462878==--

