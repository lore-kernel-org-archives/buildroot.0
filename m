Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7E0FC6179
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 10:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A090B60AC4;
	Sat,  3 Jan 2026 10:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcA08-Ghxo7m; Sat,  3 Jan 2026 10:52:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AE4D60AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767437525;
	bh=f7ivuZyTjrRzGM9295NcFDgp6Q0+PokpdDpAXdNUXE8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ld7FrDs4wgGIZl5pum/3k2L/9BVwI34EbFYiUlS1lcoiOhwhVJyDav0L3D3ixhld7
	 6gZm4CJUjSfddnixtGemx6+k7BGOAcTZWSIO5yWjwTYaiwcyiXitU55a1mYiTLfgFb
	 LKe4H7IL+NKUo/xgsbW8+xMAP9YJY21YXI3XIgZre+EAq2fF6XPuoMSs1hzTeCCfIT
	 7uLb0iwLFl83ujBFT9vnIE5wY/CkrxqYHhDgjd2uGGpwiXoBpPHZDmdDPtXhWoAODa
	 tnpmV66VNBiivPBi/Ia4cWlO/fltACOcsDpX/YX3FNR2ZZnE9SIJmUZ4rKcoxel1E0
	 jfd6dsdgN1Cnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AE4D60AA8;
	Sat,  3 Jan 2026 10:52:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA0FA351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 10:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0B584041D
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 10:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pw1w2A2p7TxQ for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 10:52:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.222.177;
 helo=mail-qk1-f177.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9FE7340131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FE7340131
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FE7340131
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 10:52:02 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-8b21fc25ae1so1277788885a.1
 for <buildroot@buildroot.org>; Sat, 03 Jan 2026 02:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767437521; x=1768042321;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TOwhhRodtrMLaFQ2XWqGB75XXFM+qwgiTqCqjdkELxI=;
 b=pQEcMop/NtUSfNf6+UE6MfuYdDvIM7WPxWJLRLjdSpcJQh/NFFuR977pjk8I0Do6XX
 bH0Q0GcPBn7+qOLEZDWespYp7AQaQ9Yi+Aud7qTyjtkyoKwMgD0vqOWIw8BKIeKqvjO5
 3HkhETcEEB1EkCKXBsKQz/drH+YBaKC/Nhdy6/CiW/MNAwyBBNLRypeb9guEdoQyw4wU
 maYuC879qyfttkdKCtxRnZth8twWYI+OVauqVTf3AI296p6dETCGVS1T+6dE+5pib4+5
 Zo8Hvvb0AcP6sIJnLZkbgCBmG8n4aQBU/t8bJXwHPiY1D2YbhIf9iiWT78+TzDkITjy1
 lDNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzPJCKSC7VIE16qZLhYTJ1d4BXEgibPtSPtSlrltfgPKi2QqObEjniv2/+OiiE8CHrYA+jcQOQxpM=@buildroot.org
X-Gm-Message-State: AOJu0YwxL1OXglA5HeJSkOQBeadpHVadI9m9mED4WBeI3ZBozIHbSiLg
 YCLrJWTDM8zxzrng+SGsm+u00vB84pdA9QGMNvsJXuK/ZqkwYZF0bmdVQjGBac5Z
X-Gm-Gg: AY/fxX5kYuVUnGWmeS1FGKHksCdpUfX/Yk+RUmi8N8rNPFAZPR3ZX0WaNPmfHW7A25W
 O5l/RTpCmSWCN9/+pZZr9sstM3ChUUCW7GDS3ZcICeS07hnG/ZbLfo9is5T0tvz5P2ahw0ekMZ+
 hQuCqHxWLyIu1j6T/RvBdfdzTzUg8lUBO7F1PQY5efD+lgTAegHYbpI9os4mX2Dd7jlCQHwKROc
 DcmqtR0rTOyMF1e/h4XkkfTfgFJMjX3779mshguqA5D4/fKbdICDiBgkF/J8bx6NlWmwmp/qQGF
 klOAmM9oX8S86VTzvO3or+wuZVICaddG5nDV6n+qaDca7uKE4crkpt3VqgD18SrgxODTigVIpg3
 8ZBdtb+7TiR82RS5p+1bNwRQ5d6sPA4nPkaw/eH6IymKS5DZOu8r/6yXz+5x0yRAqY8FpG6uIFZ
 TnRJ+UuXd/+hUU8ShWjIEbn+ZR99f/HOJBfQiUKW1789zKl5jaManoG6ESA+E8qSfWAx+PPQAmy
 6cZDl0=
X-Google-Smtp-Source: AGHT+IF8IW7AIXWwjhaI3ktBD7GyiMei2ZsfQ9D0w8lmJ9arzS+YN+a090x9glIHHO/1a+YNPm/E3Q==
X-Received: by 2002:a05:620a:691a:b0:8b2:eae0:bbf4 with SMTP id
 af79cd13be357-8c08f666fc0mr6701179685a.19.1767437521134; 
 Sat, 03 Jan 2026 02:52:01 -0800 (PST)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com.
 [209.85.219.48]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c0971ee182sm3325358585a.33.2026.01.03.02.52.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jan 2026 02:52:00 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-88a3bba9fd4so146353776d6.2
 for <buildroot@buildroot.org>; Sat, 03 Jan 2026 02:52:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXWYnRsO/7G9C6w4nwRG4QrXWl+bws8Sk6SzFzpGzc+ZKLD3m6ojafH/fPJwrLKj4GHi8Wf6//xUck=@buildroot.org
X-Received: by 2002:ad4:53ac:0:b0:78d:be82:fffa with SMTP id
 6a1803df08f44-88d84538d2cmr466498976d6.33.1767437520377; Sat, 03 Jan 2026
 02:52:00 -0800 (PST)
MIME-Version: 1.0
References: <20251226101445.2b29f439@windsurf>
 <31717e07-e32d-43c5-9a78-e2e6b7b3f3b5@kuhls.net>
In-Reply-To: <31717e07-e32d-43c5-9a78-e2e6b7b3f3b5@kuhls.net>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 3 Jan 2026 11:51:49 +0100
X-Gmail-Original-Message-ID: <CACXRmJjfwKTg8=BeHNN6_NN=n47PER1V+3nst3GdiJsN8vP7BA@mail.gmail.com>
X-Gm-Features: AQt7F2r5uj7NdpBLhcL8vkZx6ht8HJTUK6R4gF5Sc0btJLJS2WpuQwkAQ90UMgs
Message-ID: <CACXRmJjfwKTg8=BeHNN6_NN=n47PER1V+3nst3GdiJsN8vP7BA@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: thomas@devoogdt.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v2 1/2] package/mesa3d: explicitly enable
 llvm for
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
Content-Type: multipart/mixed; boundary="===============6390956817181413637=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6390956817181413637==
Content-Type: multipart/alternative; boundary="000000000000909a280647799daa"

--000000000000909a280647799daa
Content-Type: text/plain; charset="UTF-8"

Hi Bernd,

You are effectively conforming to what I was thinking, CLC is required for
the host-mesa3d selection.
Which means that LLVM is required. And therein lies the issue.
The host-mesa3d package is not able to properly select the
right llvm-config, see my second patch
for the full explanation:
https://lore.kernel.org/buildroot/20260103084002.2045193-2-thomas@devoogdt.com/
.

So to conclude, this patch series is twofold, first I explicitly
enabled LLVM for the host-mesa3d package as
it is required for CLC. Secondly, it fixes the llvm-config resolving, to
avoid mixed use with the system version
and the buildroot shipped version.

Kr,

Thomas Devoogdt

Op za 3 jan 2026 om 10:44 schreef Bernd Kuhls <bernd@kuhls.net>:

> [This mail was also posted to gmane.comp.lib.uclibc.buildroot.]
>
> Am Sat,  3 Jan 2026 09:40:01 +0100 schrieb Thomas Devoogdt:
>
> >     @bkuhls, I can see that CLC support is needed to compile the
> >     intel-iris driver, (commit 317260f "package/{mesa3d,
> >     mesa3d-headers}: bump version to 25.0.6") but can you elaborate why
> >     this is required for the generic host-mesa3d? Perhaps some llvm
> >     related logic should be added for the host.
>
> Hi Thomas,
>
> the sole purpose of host-mesa3d is to provide the host-binaries mesa_clc
> and vtn_bindgen2 which are needed by some drivers. The dependency to host-
> mesa3d is only used when the blind option
> BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER was enabled by the respective
> drivers which in turn all depend on BR2_PACKAGE_MESA3D_LLVM=y.
>
> But not all llvm-depending drivers need these host binaries, like
> llvmpipe, radeonsi or vulkan-swrast, therefore the different Config.in
> options. But yes, mesa3d was always a messy package because of the many
> build options possible ;)
>
> Do you need the host-mesa3d for other purposes than providing the
> forementioned binaries? In other words: Which problem do you want to solve?
>
> Regards, Bernd
>
>

--000000000000909a280647799daa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bernd,<div><br></div><div>You are effectively=C2=A0conf=
orming to what I was thinking, CLC is required for the host-mesa3d selectio=
n.</div><div>Which means that LLVM is required. And therein lies the issue.=
</div><div>The host-mesa3d package is not able to properly select the right=
=C2=A0llvm-config, see my second patch</div><div>for the full explanation: =
<a href=3D"https://lore.kernel.org/buildroot/20260103084002.2045193-2-thoma=
s@devoogdt.com/">https://lore.kernel.org/buildroot/20260103084002.2045193-2=
-thomas@devoogdt.com/</a>.</div><div><br></div><div>So to conclude, this pa=
tch series is twofold, first I explicitly enabled=C2=A0LLVM for the host-me=
sa3d package as</div><div>it is required=C2=A0for CLC. Secondly, it fixes=
=C2=A0the=C2=A0llvm-config resolving, to avoid mixed use with the system ve=
rsion</div><div>and the buildroot shipped version.</div><div><br></div><div=
>Kr,</div><div><br></div><div>Thomas Devoogdt</div></div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Op=
 za 3 jan 2026 om 10:44 schreef Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuh=
ls.net">bernd@kuhls.net</a>&gt;:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">[This mail was also posted to gmane.comp.lib.uclibc.buildr=
oot.]<br>
<br>
Am Sat,=C2=A0 3 Jan 2026 09:40:01 +0100 schrieb Thomas Devoogdt:<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0@bkuhls, I can see that CLC support is needed to co=
mpile the<br>
&gt;=C2=A0 =C2=A0 =C2=A0intel-iris driver, (commit 317260f &quot;package/{m=
esa3d,<br>
&gt;=C2=A0 =C2=A0 =C2=A0mesa3d-headers}: bump version to 25.0.6&quot;) but =
can you elaborate why<br>
&gt;=C2=A0 =C2=A0 =C2=A0this is required for the generic host-mesa3d? Perha=
ps some llvm<br>
&gt;=C2=A0 =C2=A0 =C2=A0related logic should be added for the host.<br>
<br>
Hi Thomas,<br>
<br>
the sole purpose of host-mesa3d is to provide the host-binaries mesa_clc <b=
r>
and vtn_bindgen2 which are needed by some drivers. The dependency to host-<=
br>
mesa3d is only used when the blind option <br>
BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER was enabled by the respective <br=
>
drivers which in turn all depend on BR2_PACKAGE_MESA3D_LLVM=3Dy.<br>
<br>
But not all llvm-depending drivers need these host binaries, like <br>
llvmpipe, radeonsi or vulkan-swrast, therefore the different Config.in <br>
options. But yes, mesa3d was always a messy package because of the many <br=
>
build options possible ;)<br>
<br>
Do you need the host-mesa3d for other purposes than providing the <br>
forementioned binaries? In other words: Which problem do you want to solve?=
<br>
<br>
Regards, Bernd<br>
<br>
</blockquote></div>

--000000000000909a280647799daa--

--===============6390956817181413637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6390956817181413637==--
