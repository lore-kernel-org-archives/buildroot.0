Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7162C021A0
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 22:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 727AE60799;
	Fri,  7 Feb 2025 22:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXdOO5AJpI4n; Fri,  7 Feb 2025 22:37:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 829106079A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 829106079A;
	Fri,  7 Feb 2025 22:37:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B4CFE4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 22:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6041380C1D
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 22:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgieYu822RCi for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 22:37:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=bryce.schober@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E50E80BE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E50E80BE0
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E50E80BE0
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 22:37:20 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e573136107bso2286421276.3
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 14:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738967839; x=1739572639;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K4KFOIKHcTYm7CAGgm5n9OKGzcdPlFh7psjabgKI1ZA=;
 b=QLEHXK7EOu5orDENxqr8/dabynXbgSrgY44zUD1mA6SPjhqxETatZouHG9YK5lmHol
 aUMo/ImMmM4v1e4iwcFTYMz9WsLEJxnpIJpf6t00MDFkhLInOuROc059Emkh9ZjXjjBU
 lUvVm8+8hfMPxtrqpCfM7K1XoBxn75IoCmdIREzBO75ft+fkduPzZSzxsWzXmCTm2PVu
 nF1wWu19eNkmXypcaN/GzSPFTb/3FpAX97zJ19tG8B2u/w25IiB4vMO1oAIjhk0JRe2F
 htj6hgfyl9OoP6UMnu02bmuNlMXW+Oe03oHiYNc0dbNbT4dWo5QPbWbb32/qJeLkFnM0
 XdIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfKCAO1h48spG92ojLnL8J1X3yFQar4UmeRrh6/aksPD0TUox3jcRf37oA0XDtPGQT1zYDpMrg5NQ=@buildroot.org
X-Gm-Message-State: AOJu0Yz5gmgEYi1mrihEYaMdVd9edM8U7t8qAVme69QnWCcQTYmqev9W
 jVcQzgzEnOThBDa1k1iurg4npoBmEw153U+VTHqwWW+p0ei/IejiZUPgfDycX99ZuDqDqj3r3zL
 JFyRUmQhBkX6XbEFGSuIJKD4tTmc=
X-Gm-Gg: ASbGncsxhslMXOAQhoenD7PqN5inSm9WNrteAVUxLQdxi249Bfn8Y/ZBgueVKFYXsP7
 8JHU6Oy/LgHlpE6Bd1cpmRPmFSwg3bh0x+7QtoMEhBFWLDVSYxor8GYgs9xG6BPwUHWS/eg==
X-Google-Smtp-Source: AGHT+IErBl6HpLH4MX74alJR46U7q+ubRkqiaA4SK1gwELTb443Xr7D5RFxEPwBJzepzliTMCvpbIM5UMxRaWMpj3jc=
X-Received: by 2002:a05:6902:2682:b0:e4d:25c6:c398 with SMTP id
 3f1490d57ef6-e5b4616c88bmr4816891276.1.1738967839398; Fri, 07 Feb 2025
 14:37:19 -0800 (PST)
MIME-Version: 1.0
References: <20250207171458.1127620-1-fiona.klute@gmx.de>
 <20250207171458.1127620-4-fiona.klute@gmx.de>
 <da600884-960d-4deb-b776-cc78c49acce2@mind.be>
In-Reply-To: <da600884-960d-4deb-b776-cc78c49acce2@mind.be>
From: bryce.schober@gmail.com
Date: Fri, 7 Feb 2025 14:36:43 -0800
X-Gm-Features: AWEUYZk2q_8ZP5hMEQKwxvFHYX_ocWaFdnU7AihAzxcjf4_5q0uWygmH1rYyEFg
Message-ID: <CAJpxd046ZwnSh77pxciqCi8tdRhQwiKSb3AjdMkB7+qMvqQcFA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org, 
 =?UTF-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay+rtone@gmail.com>, 
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>, 
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?B?Sm9zw6kgTWVuZGVz?= <jp.baltazar.mendes@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738967839; x=1739572639; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K4KFOIKHcTYm7CAGgm5n9OKGzcdPlFh7psjabgKI1ZA=;
 b=gwVGF4WbgTgbopiUPfcAusEze4DuuibDAn/7PO0/ZQohGFTGOqYTkAlhDdTrZxB5Cl
 N/TygRZ2ETzvCbycfvCLjOYNKNkCCJ4eGV4ZXe+Btdg7lfdEoUJkIme79HeqMuLZs/nN
 2cp5S2QUG2wVwxUFdxgjD0huXmvPVsDUtea0kutXNQQsTWiPWa06trK/UAO2Jnm15cuE
 zoN7rj4KDlYxnHU1CvKaVf0mpnEDNsc9DQGLFRnyPM73JOinjhNrqJ9SLp6N2/Zn5NVt
 iUnN4Kg56jL/gZr9n0r43HBN6JpK9QhL1y5BrXRH5UTGRU7OifCHpfbbQDOV6SvRCVTg
 iN5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gwVGF4Wb
Subject: Re: [Buildroot] [PATCH v3 3/3]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
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
Content-Type: multipart/mixed; boundary="===============3705235285944876542=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3705235285944876542==
Content-Type: multipart/alternative; boundary="00000000000057e324062d950022"

--00000000000057e324062d950022
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnout,

On Fri, Feb 7, 2025 at 1:37=E2=80=AFPM Arnout Vandecappelle via buildroot <
buildroot@buildroot.org> wrote:

>   Looks good at first sight. I'm thinking though: wouldn't it be easier i=
f
> we
> convert all RPi configs (gradually) to U-Boot, and mention in the readme
> (and
> config.txt comments) how to boot without U-Boot?
>

FYI, U-Boot doesn't support the RPi PCI/NVMe interface because of a current
lack of support in the upstream kernel. So we are actually moving away from
U-Boot in a previous project toward using the rpi firmware support for
integrating with A/B update systems. I'm not saying that it has to be easy
for people like us, I'm just chiming in with the fact that U-Boot isn't
always the best answer for all use cases.

--00000000000057e324062d950022
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br clear=3D"all"></div><div><div di=
r=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Hi Arnout,</div><=
/div></div></div></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 7, 2025 at 1:37=E2=80=AF=
PM Arnout Vandecappelle via buildroot &lt;<a href=3D"mailto:buildroot@build=
root.org">buildroot@buildroot.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">=C2=A0 Looks good at first sight. I&#39;m =
thinking though: wouldn&#39;t it be easier if we <br>
convert all RPi configs (gradually) to U-Boot, and mention in the readme (a=
nd <br>
config.txt comments) how to boot without U-Boot?<br></blockquote><div><br><=
/div><div>FYI, U-Boot doesn&#39;t support the RPi PCI/NVMe interface becaus=
e=C2=A0of a current lack of support in the upstream kernel. So we are actua=
lly moving away from U-Boot=C2=A0in a previous project toward using the rpi=
 firmware support for integrating with A/B update systems. I&#39;m not sayi=
ng that it has to be easy for people like us, I&#39;m just chiming in with =
the fact that U-Boot=C2=A0isn&#39;t always the=C2=A0best answer for all use=
 cases.</div></div></div>

--00000000000057e324062d950022--

--===============3705235285944876542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3705235285944876542==--
