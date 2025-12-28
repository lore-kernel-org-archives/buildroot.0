Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98D0D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 16:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC42040581;
	Sun, 28 Dec 2025 16:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7WY0b9riSot; Sun, 28 Dec 2025 16:10:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4348040583
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766938218;
	bh=0G71Mj5THPkj4JR5EejtffFlPppvUHTzmoGY4V+vJAQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PoE8pO0vzTmOpioW1ITdTg0gHEDjc9khJohA8MXyXImW4BU/CowhC6QwBqySHwr5h
	 7HFDVaEd/tX8spvuitVnBSdNw2SE7YShBYWbi6+O6gQH71wnnJI8gkp6VcpatZr+i0
	 IaoBdGhd+OpqbgA7TGjEI3/e6UOPPHw/SdMMOVoI6keK8WRJi8G8UKAyEILMBuFKdc
	 FvGD+WzvhQcT62KOato1D4tMLzTaVAqr5ef0LfR/EUaZuVyWiaKZLlcPhZ3HQzYkew
	 pv64CL0DR/lcYhRSEMgm+PWGTjATw010o8m0oXpzvgYTwl+KmLdE6CNZSi030afAxX
	 nPfzYABmeMW9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4348040583;
	Sun, 28 Dec 2025 16:10:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BBBA1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 16:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6474781101
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 16:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6T2Kdknjbn9N for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 16:10:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=rustamabd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10078810EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10078810EA
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10078810EA
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 16:10:15 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-4510974a6bbso2516433b6e.3
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 08:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766938215; x=1767543015;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3iG7Lw/puV2Ok5qH5NhjKLvH5g8Mp0viij1HP4sMsqE=;
 b=ZsAvmKjMciPu5RGWp2MpUocQSu0+/iPH36d7/LT23E9G/E6gsuJrnA+ph8WCSNYP7k
 UhLSUF7GkWmd0U9HBYXsJpKMCpy18UkTMU4UI+MBHN8e50De9oHoh8BVvvsxOd3PYwu0
 0L6Y9Of6WAjHCsskQpIsC6GL42uBQo3HkUrCP3AUbiU93MVXpcXNVBAGbah7XPXDebE2
 e77ZdmzhG5JAuSlQ4r+bZGuqCiQwF09DIvNbzA8Dpi0Eh7kHvpwUtepQInp95xUU/05z
 buJ1/pU83ptMHgajKqRBFrHF4bfip4eC5/fxFOfTG+MoVEX0Sgh1cKc6ZJKT8kaBwhDY
 mBEg==
X-Gm-Message-State: AOJu0YzyR/mxllFYkTLleCGjYuats+Rt/Lh9NuM2pbby/MDDVJOn+isw
 n1/Oif6ZAbnSr/0XpM51LrEX5dAgBzdwBoKnNG66QZh3/FoMHVB3t8mKoDlolpe6sQdZdfwWmYw
 EM6sCOGR0CFriam9nugt2VTdF26NXF+U=
X-Gm-Gg: AY/fxX66PdsuS4+ia0CZdnk2vRCNu9Otf0SUxJDpMHmRnxfzEb1BfbQd1+ztNn+LuNU
 7pAzmfGeSERjUNQsFDeOHiyvuN/2/+mniMZMlk8rpyHD84NOva96LJMSr7Hq7zGGYSqYOqRji+f
 o9NM0hEXUlKf72Q4sGJNg2OMSrTcV5hN45cIBBQ4EyWnlkcLUNqkTHJ4Qe/Dp/tccDDPSvxWY+q
 pXVXhNKUQsb2FPcxBR9baverv0CXeewpJ87STOe8l7ebIc04sSKHMl8lnK2PZnXbBt6UeEO9s2v
 nv7tt7tgsgUdvfzduG/8fe49NsPp3u66zCQ86jORs5avNQ3+PtjmETLdsK3+MRjH88IXWA9jtxL
 w6FZuXQOZYYVtvkFBQSys8Ae/zZTzDUUg3dHKUw==
X-Google-Smtp-Source: AGHT+IFE/NZQqgtAaONPoFT7R2CfZa8Pi5+pMf9vTRcvn9Hia7/LB8ofJ/xQPZ8KmUtHwXOp1UIdZ+wvYDa0RNaxbPw=
X-Received: by 2002:a05:6808:1a01:b0:453:ee6:12b3 with SMTP id
 5614622812f47-457b21e1efemr14711248b6e.58.1766938214604; Sun, 28 Dec 2025
 08:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20251227211415.2269024-1-rustamabd@gmail.com>
 <20251227232420.1644a29f@windsurf>
In-Reply-To: <20251227232420.1644a29f@windsurf>
From: Rustam <rustamabd@gmail.com>
Date: Sun, 28 Dec 2025 17:10:03 +0100
X-Gm-Features: AQt7F2pvSh1OPspac_S9IIOZAP3JMrcM9jjjamxkPZZdX8nIoC2RtOydkFPjQRI
Message-ID: <CAPzS6u_1RaVGk3gaD0jk1pP0e_azWxPFSX42G_ejqR-sWAOJKA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766938215; x=1767543015; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3iG7Lw/puV2Ok5qH5NhjKLvH5g8Mp0viij1HP4sMsqE=;
 b=FWimDiKFpzkqKh3UBeNhsybWpbcLbItZ+7vsrAaQIHEW14gbSe7ftGi/di+VJAc7Wm
 Ozwpb5IRRThtEaxwXCBthUQq22zubQUjeonJfgV25i2LGxKq+u5+1Wm1w4JMshM1gB3j
 9WaIyKWuJR3OCzqYD1igIZLrAlNEnrKiJg8Mlyd8ruNVD2yi6xGWR6yE4d4xwVXpjiF6
 TRAiU0QrmrcLNpDYVbL1SQ5RCC7HeHb8R1HbDLdyyD3TpHEZ/SHqyRq6M5QyAkO/ONGz
 NUS45zjQelQYhkBwZD4Fsc4HnoNdViWNWbdyLXjGJ6U/YycFG+F7WPO0+Wq+O8ftBuAw
 qhQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FWimDiKF
Subject: Re: [Buildroot] [PATCH v2 1/1] toolchain/toolchain-external:
 introduce BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
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
Content-Type: multipart/mixed; boundary="===============1156268961566596162=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1156268961566596162==
Content-Type: multipart/alternative; boundary="0000000000009f21de0647055ca2"

--0000000000009f21de0647055ca2
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Dec 2025 at 23:24, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Rustam,
>
Hi Thomas,

>
> Thanks for your patch!
>
> On Sat, 27 Dec 2025 21:14:15 +0000
> Rustam Abdullaev <rustamabd@gmail.com> wrote:
>
> > It is important to have matching kernel headers when building packages
> > that make use of kernel features such as seccomp, as they depend on
> > system call definitions in linux/unistd.h. A typical example of this is
> > openssh - building it with the official ARM GNU toolchain and kernel 6.x
> > results in a non-working sshd.
>
> Do you have more details on this? Which version of the ARM GNU
> toolchain? Which kernel header version do they use? Which kernel
> version are you running?
>
This applies to the official ARM GNU toolchain up to and including 14.3:
https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
They come with kernel headers 4.20.
I'm running kernel 6.12. Though that doesn't matter, what matters is that
it's virtually guaranteed that the actual kernel is going to be newer than
4.20.

>
> Indeed, there are two cases:
>
> - The kernel headers in the toolchain are newer than the kernel you're
>   running => you are doing it wrong, and updating the headers in the
>   toolchain are not going to fix the fact that your C library is built
>   with headers that are too recent for your kernel (even though I admit
>   glibc has some tolerance on this)
>
Yes, this wouldn't work at all, we're not planning to downgrade linux
headers, only upgrade.

>
> - The kernel headers in the toolchain are older than the kernel you're
>   running and you're seeing breakage => this is a kernel bug as it
>   shouldn't happen.
>
I think you're referring to the fact that linux kernel is
backward-compatible. That is only true in theory. In practice not matching
the actual kernel version can lead to various issues, among others,
security issues with seccomp.

In both cases, your proposed patch should therefore not be needed.
>
> Could you clarify which situation you're in, so that we can
> understand better whether the use-case/issue you're having warrants
> this additional complexity?
>
To give a concrete example, 64-bit time system calls that were added in 5.1
are automatically used by glibc (even if it was built against 4.20 kernel
which didn't have these). Applications that set up a seccomp sandbox (e.g.
sshd) won't be able to whitelist the needed system calls  correctly because
they don't exist in linux/unistd.h.

Here's a minimal repro:

cat <<EOM >>configs/qemu_arm_vexpress_defconfig
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_OPENSSH=y
EOM

make distclean
make qemu_arm_vexpress_defconfig
make -j$(nproc)

output/images/start-qemu.sh

. . .
Welcome to Buildroot
buildroot login: root

#
# ssh localhost
Connection reset by 127.0.0.1 port 22
#

^ notice sshd not working at all.
This is just an example, we had more issues elsewhere in our codebase.
Another downside is performance as application are unable to use the latest
kernel features for better efficiency and security (cgroups v2, new bpf
features, etc).
So it's quite important to match the kernel headers to the actual kernel
being used.

Regarding the complexity, I would say it's quite low - it's a fairly small
addition that re-uses most of the existing mechanisms and simply installs
the kernel headers into the external toolchain.

> Currently restricted to glibc-based toolchains as glibc is backward- and
> > forward-compatible with different kernel versions while uClibc and musl
> > are not.
>
> Not sure why this matters here though. Could you clarify?
>
This is just a safeguard to prevent issues. From personal experience,
uClibc and musl sometimes run into issues unless they are compiled for the
specific linux version on which they run.
So this feature is only usable in combination with glibc.


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Hope this clarifies,
Regards,
Rustam

--0000000000009f21de0647055ca2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>On Sat, 27 Dec 2025=
 at 23:24, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.=
com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt; wrote:</div></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hello Rustam,<br></blockquote><div>Hi Thomas,=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
Thanks for your patch!<br>
<br>
On Sat, 27 Dec 2025 21:14:15 +0000<br>
Rustam Abdullaev &lt;<a href=3D"mailto:rustamabd@gmail.com" target=3D"_blan=
k">rustamabd@gmail.com</a>&gt; wrote:<br>
<br>
&gt; It is important to have matching kernel headers when building packages=
<br>
&gt; that make use of kernel features such as seccomp, as they depend on<br=
>
&gt; system call definitions in linux/unistd.h. A typical example of this i=
s<br>
&gt; openssh - building it with the official ARM GNU toolchain and kernel 6=
.x<br>
&gt; results in a non-working sshd.<br>
<br>
Do you have more details on this? Which version of the ARM GNU<br>
toolchain? Which kernel header version do they use? Which kernel<br>
version are you running?<br></blockquote><div>This applies to the official =
ARM GNU toolchain up to and including 14.3:</div><div><a href=3D"https://de=
veloper.arm.com/downloads/-/arm-gnu-toolchain-downloads" target=3D"_blank">=
https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads</a></div>=
<div>They come with kernel headers=C2=A04.20.</div><div>I&#39;m running ker=
nel 6.12. Though that doesn&#39;t matter, what matters is that it&#39;s vir=
tually guaranteed that the actual kernel is going to be newer than 4.20.</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Indeed, there are two cases:<br>
<br>
- The kernel headers in the toolchain are newer than the kernel you&#39;re<=
br>
=C2=A0 running =3D&gt; you are doing it wrong, and updating the headers in =
the<br>
=C2=A0 toolchain are not going to fix the fact that your C library is built=
<br>
=C2=A0 with headers that are too recent for your kernel (even though I admi=
t<br>
=C2=A0 glibc has some tolerance on this)<br></blockquote><div>Yes, this wou=
ldn&#39;t work at all, we&#39;re not planning to downgrade linux headers, o=
nly upgrade.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
- The kernel headers in the toolchain are older than the kernel you&#39;re<=
br>
=C2=A0 running and you&#39;re seeing breakage =3D&gt; this is a kernel bug =
as it<br>
=C2=A0 shouldn&#39;t happen.<br></blockquote><div>I think you&#39;re referr=
ing to the fact that linux kernel is backward-compatible. That is only true=
 in theory. In practice not matching the actual kernel version can lead to =
various issues, among others, security issues with seccomp.</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
In both cases, your proposed patch should therefore not be needed.<br>
<br>
Could you clarify which situation you&#39;re in, so that we can<br>
understand better whether the use-case/issue you&#39;re having warrants<br>
this additional complexity?<br></blockquote><div>To give a concrete example=
, 64-bit time system calls that were added in 5.1 are automatically used by=
 glibc (even if it was built against 4.20 kernel which didn&#39;t have thes=
e). Applications that set up a seccomp sandbox (e.g. sshd) won&#39;t be abl=
e to whitelist the needed system calls=C2=A0 correctly because they don&#39=
;t exist in linux/unistd.h.<div><br></div><div>Here&#39;s a minimal repro:<=
br><br>cat &lt;&lt;EOM &gt;&gt;configs/qemu_arm_vexpress_defconfig<br>BR2_T=
OOLCHAIN_EXTERNAL=3Dy<br>BR2_PACKAGE_OPENSSH=3Dy<br>EOM<br><br>make distcle=
an<br>make qemu_arm_vexpress_defconfig<br>make -j$(nproc)<br><br>output/ima=
ges/start-qemu.sh<br><br>. . .<br>Welcome to Buildroot<br>buildroot login: =
root<br><br>#<br># ssh localhost<br>Connection reset by 127.0.0.1 port 22<b=
r>#<br><br>^ notice sshd not working at all.</div></div><div>This is just a=
n example, we had more issues elsewhere in our codebase.</div><div>Another =
downside is performance as application are unable to use the latest kernel =
features for better efficiency and security (cgroups v2, new bpf features, =
etc).<br></div><div>So it&#39;s quite important to match the kernel headers=
 to the actual kernel being used.</div><div><br></div><div>Regarding the co=
mplexity, I would say it&#39;s quite low - it&#39;s a fairly small addition=
 that re-uses most of the existing mechanisms and simply installs the kerne=
l headers into the external toolchain.</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt; Currently restricted to glibc-based toolchains as glibc is backward- a=
nd<br>
&gt; forward-compatible with different kernel versions while uClibc and mus=
l<br>
&gt; are not.<br>
<br>
Not sure why this matters here though. Could you clarify?<br></blockquote><=
div>This is just a safeguard to prevent issues. From personal experience, u=
Clibc and musl sometimes run into issues unless they are compiled for the s=
pecific linux version on which they run.</div><div>So this feature is only =
usable in combination with glibc.</div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote><div>Hope this clarifies,</div><div>Regards,<=
/div><div>Rustam=C2=A0</div></div></div>
</div>

--0000000000009f21de0647055ca2--

--===============1156268961566596162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1156268961566596162==--
