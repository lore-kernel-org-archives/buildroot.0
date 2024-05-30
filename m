Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACD4C25B74
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 10:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27088820C3;
	Thu, 30 May 2024 10:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anBtgNqYn26H; Thu, 30 May 2024 10:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B16482B34
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B16482B34;
	Thu, 30 May 2024 10:01:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B27C1D450F
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 10:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5655E414B7
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 10:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDEJahs7hDbU for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 10:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=mohammed.ebrahim@vvdntech.in; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACAED409F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACAED409F5
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACAED409F5
 for <buildroot@buildroot.org>; Thu, 30 May 2024 10:01:27 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52b7d180542so725159e87.3
 for <buildroot@buildroot.org>; Thu, 30 May 2024 03:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717063285; x=1717668085;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ukZL95pHDKtCEcTe0dJzyCJGSmXV6ACac/rqh2TEppY=;
 b=OI/vnz9CQh/Y4e6/wmsoho29H/LNN9H8WT89nLpirHRgWIzraZLWnrUqsKM1DC0jfT
 yjFrH+brwUDSy/UbkCgOOSf6Ze4Gtu8Ft+3opBNWXiRGGfGpArhLZM7kX/v3/LFUdNHw
 brBnblJBTx2ql6cRwjqBAXZBhj1aSFmyax0LpPwHg4m1FTxlHTwYSNBCv+p9gq9pwUaM
 qx05MlKQKK5pkT+HwaOjpWVgssdzbXwyyoyo/O0yJWEDW8pSL5TuBFbF3GldlVhUv9Sz
 d+QYR/j73Fq6ql3osE6vsAYcndIRo1p+O4pbvsjoQwsmQvnGOuSYyf84MohZHs64NGHO
 G1Sw==
X-Gm-Message-State: AOJu0Yx1Q6kEo6EoWmBdxL9GYXpzvlpx5vlv8IG3qmfirLLIlWdDB9s5
 pAohEN133YSBjr92YYrt/s7YFjJVZdq4aSx8VUqvoXVWu2yZKDBdisouGGHgS3jddvO/UEjaqWq
 yognGVu7ymP1HEhQjM5Emw5ASYCFNcHy6L8IUG/8rgKIHel7UEZfvlZNghrK1kkU4ymflHd0/po
 ugU9wwS/oL2LqiZvkfijQEt1dX09blkqpVIbnZ
X-Google-Smtp-Source: AGHT+IFyf3yW0GpabqoQQg9WqEcJ9gEH8ysqqSw4nAbIHS62IKe/9wBX5Wp40FZF6sZW1rbfGpIiKmO1qiBx7deWaZY=
X-Received: by 2002:ac2:5147:0:b0:51a:ca75:9ffe with SMTP id
 2adb3069b0e04-52b7d47a4f4mr1190085e87.42.1717063285052; Thu, 30 May 2024
 03:01:25 -0700 (PDT)
MIME-Version: 1.0
From: Mohammed Sha Ebrahim <mohammed.ebrahim@vvdntech.in>
Date: Thu, 30 May 2024 15:31:14 +0530
Message-ID: <CAKceVNgUjEXmpCJSkt=2EkUOq3MmErFkjBmGS4NkKMZgqyyQdg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vvdntech.in; s=google; t=1717063285; x=1717668085; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ukZL95pHDKtCEcTe0dJzyCJGSmXV6ACac/rqh2TEppY=;
 b=Mp35G5Qshy/d4ZWEBEenF6LEPI9WqdaXH93wKwxZUpir/iVDVl4lJW96bjzrgs9N4J
 AHDJqBKRk+CJladMzj3eIP1q/zRpyg0FJzNkLKldP5P3Im5Ll3wiWnKmGUMDSyjA34sK
 3cs3swRI24fkUnGlxyTLDlCDIt66Xi2XshwOI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=vvdntech.in
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vvdntech.in header.i=@vvdntech.in header.a=rsa-sha256
 header.s=google header.b=Mp35G5Qs
Subject: [Buildroot] Query regarding changing the interpreter
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
Content-Type: multipart/mixed; boundary="===============6578282739650164870=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6578282739650164870==
Content-Type: multipart/alternative; boundary="00000000000029b06b0619a8f351"

--00000000000029b06b0619a8f351
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Buildroot team.

I have compiled the Buildroot for our SoC and encountered an issue when
using the custom cross-compiler. The compiled binary  interpreter is set to
/lib/ld.so.1 when we compile it using buildroot, but our SoC cross-compiler
does not have this library (/lib/ld.so.1) linked to ld-linux-mipsn8.so.1,
Instead, we have lib/ld-2.29.so in the cross-compiler folder, which
eventually points to ld-linux-mipsn8.so.1. We tried creating a symbolic
link named ld.so.1 to ld-linux-mipsn8.so.1, but the binary did not execute
successfully. How can we modify Buildroot to link the interpreter to
ld-linux-mipsn8.so.1?

please find the sample file output shown below
directly compiled using cross compiler
------------------------------------------

> helloworld: ELF 32-bit LSB executable, MIPS, MIPS32 rel2 version 1 (SYSV)=
,
> dynamically linked, interpreter /lib/ld-linux-mipsn8.so.1, for GNU/Linux
> 3.10.14, not stripped

compiled using buildroot
---------------------------

> hello_buildroot: ELF 32-bit LSB executable, MIPS, MIPS32 rel2 version 1
> (SYSV), dynamically linked, interpreter /lib/ld.so.1, for GNU/Linux 3.2.0=
,
> not stripped


Could someone help me with this?

--=20
_Disclaimer:=C2=A0_=C2=A9 2024 VVDN Technologies Pvt. Ltd. This e-mail cont=
ains=20
PRIVILEGED AND CONFIDENTIAL INFORMATION intended solely for the use of the=
=20
addressee(s). If you are not the intended recipient, please notify the=20
sender by e-mail and delete the original message. Further, you are not to=
=20
copy, disclose, or distribute this e-mail or its contents to any other=20
person and any such actions are unlawful.
__
_
_
_
_

--00000000000029b06b0619a8f351
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div>Hi Buildroot team.<div><br></div><d=
iv>I have compiled the Buildroot for our SoC and encountered an issue when =
using the custom cross-compiler. The compiled binary=C2=A0 interpreter is s=
et to /lib/ld.so.1 when we compile it using buildroot, but our SoC cross-co=
mpiler does not have this library (/lib/ld.so.1) linked to ld-linux-mipsn8.=
so.1, Instead, we have lib/<a href=3D"http://ld-2.29.so/" target=3D"_blank"=
>ld-2.29.so</a>=C2=A0in the cross-compiler folder, which eventually points =
to ld-linux-mipsn8.so.1. We tried creating a symbolic link named ld.so.1 to=
 ld-linux-mipsn8.so.1, but the binary did not execute successfully. How can=
 we modify Buildroot to link the interpreter to ld-linux-mipsn8.so.1?</div>=
<div><br></div><div>please find the sample file output shown below</div><di=
v>directly compiled using cross compiler</div><div>------------------------=
------------------</div><div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">helloworld: ELF 32-bit LSB executable, MIPS, MIPS32 rel2 version 1 (SYS=
V), dynamically linked, interpreter /lib/ld-linux-mipsn8.so.1, for GNU/Linu=
x 3.10.14, not stripped</blockquote><div>compiled using buildroot</div><div=
>---------------------------</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">hello_buildroot: ELF 32-bit LSB executable, MIPS, MIPS32 rel2 ve=
rsion 1 (SYSV), dynamically linked, interpreter /lib/ld.so.1, for GNU/Linux=
 3.2.0, not stripped</blockquote><div><br></div><div>Could someone help me =
with this?</div></div></div></div>

<br>
<div style=3D"text-align:left"><i style=3D"font-family:georgia,serif;font-s=
ize:small;color:rgb(80,0,80)">Disclaimer:=C2=A0</i><i style=3D"font-family:=
georgia,serif;color:rgb(80,0,80);font-size:12px;text-align:justify">=C2=A9 =
2024 VVDN Technologies Pvt. Ltd. This e-mail contains PRIVILEGED AND CONFID=
ENTIAL INFORMATION intended solely for the use of the addressee(s). If you =
are not the intended recipient, please notify the sender by e-mail and dele=
te the original message. Further, you are not to copy, disclose, or distrib=
ute this e-mail or its contents to any other person and any such actions ar=
e unlawful.</i><br></div><div><i style=3D"font-family:georgia,serif;backgro=
und-color:rgb(255,255,255);color:rgb(80,0,80);font-size:12px;text-align:jus=
tify"><br></i></div><div><i style=3D"font-family:georgia,serif;background-c=
olor:rgb(255,255,255);color:rgb(80,0,80);font-size:12px;text-align:justify"=
><br></i></div>
--00000000000029b06b0619a8f351--

--===============6578282739650164870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6578282739650164870==--
