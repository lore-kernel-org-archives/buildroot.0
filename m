Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CE7C02193
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 19:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DAB341291;
	Mon,  3 Feb 2025 19:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWa-3SqBby6e; Mon,  3 Feb 2025 19:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5862410CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5862410CA;
	Mon,  3 Feb 2025 19:48:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B07812A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 19:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FEE581B35
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 19:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wWjapNXkgUd for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 19:48:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E4C0881F14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4C0881F14
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4C0881F14
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 19:48:07 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5f2e370bb3aso1150555eaf.0
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 11:48:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738612087; x=1739216887;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T8KxwwKRikOoLVV9jYxVMquPLO34MwsH371EcN4BYbI=;
 b=s8lPiEHAmn1ylhcnDCgFlmNbd2ckslozQoJVtE7qQ8utDENYm2hhB7nUqYHIQRHEWG
 TqEWW8uaFam1XWNe+CEHo65AG4n1QsdzM40ebWRLtFN3+IVjZ7cqISMnyFmki4yw4lmW
 uhq2Ev/MKg01MGc5DgSURLsxQUOMQSe2VY67MFMvCWEeG0qVLHN+qj3b9hrXsc9XL0yh
 4gaBs3C7TiY8+Vyeiy+msvCUfaEA09KZKvXKPtf+WHpqbj9ksyUQCvsIp+AJhvTWsE0Q
 iPcezN44v5vsoI0g1HCa2Pin/eDJ4QRV7ZFg3+oaxS3WQO1VD8/lNcFjJGD//CjBztHv
 HNIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHA4LVkcumWjpsDmR/Q7WyU3weuTdzCvTw0kPJkSrb6+oEB9ThT+21btPOAe6Ly2xoD+kQW/X6y6U=@buildroot.org
X-Gm-Message-State: AOJu0YxzAQ9EsHdnrgm2W6eFd+Vu9EKJF81ndgJfWF7D9AOEbDwKadxZ
 /XB6HYn66iO7SCPs8ZvqNvEfS6bK3tN3PqpNd4lEhbIGCSf9a6GZeWlOFHee62O2McFCI4OSFj7
 n
X-Gm-Gg: ASbGncsn/0At34XjGYx4dCqKH9rm5Ga40rI10vH2q75kQRVbCc4LE+5SmdI20fWcQ9Q
 cK/LcjKzDj6KyeY3mX6PC/NurbHkP2JI/IaxYi5AFSUv3DIecdOSQngCSqqd3lWT/vk5mGGHDtN
 bi047p1FsHdGIU8OG4rv2asfNtWXDOVbVTK/E5wLn3ZyfXEcKj5Ck0TVQrNySMmkcSyMzhuQeCv
 Z+LB2Y4ZLp9Ai3oJ5nydHxE7CaWOuDgrL0mSoNWrz+6QVT5OK3ZWCZhGXhwN45Groqbg9ZpTg86
 PmOuMQU68QG2fZR0vx42XLTctDfasmIR336xmXlNrpbb1BTrFKMZr18=
X-Google-Smtp-Source: AGHT+IFhM24MGcaiXiQLEGDsvHaKNnFPnHN+2KPWRm1N3ftgNI6RJm3UCyqMZvG26qoDMGc/T9+uuQ==
X-Received: by 2002:a05:6820:4b08:b0:5f6:3ac9:929b with SMTP id
 006d021491bc7-5fc00337b23mr14474204eaf.4.1738612086575; 
 Mon, 03 Feb 2025 11:48:06 -0800 (PST)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com.
 [209.85.161.42]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-726618c8a8bsm2912499a34.58.2025.02.03.11.48.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 11:48:06 -0800 (PST)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5f31d3b4f8cso1041241eaf.2
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 11:48:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVamJjRxt7auw1ATJ7PD6INU6R2L/te4fUXB+GpbtpvFoo/s3CCY9MvAnI/RGPlpShFx7PA3doVuF8=@buildroot.org
X-Received: by 2002:a05:6870:ff43:b0:296:c0ef:e8a5 with SMTP id
 586e51a60fabf-2b32ef988c8mr14499293fac.5.1738612085615; Mon, 03 Feb 2025
 11:48:05 -0800 (PST)
MIME-Version: 1.0
References: <20250131212420.5956C8678A@busybox.osuosl.org>
 <536f4074-7be7-4c4a-aadf-4d9bf0a028f6@gmx.de>
 <38f38c04-5983-4f05-9045-31d5e86eccc2@mind.be>
 <782533c1-7da0-4d66-9a9c-0dbfa1d009db@gmx.de>
 <CA+h8R2rrLXajnCW0WoOxB-=5dw_3VpsLHWjvLFYvnVEdyFqziw@mail.gmail.com>
 <f2a5d443-ecd7-43dc-a0bf-493294749e7e@gmx.de>
In-Reply-To: <f2a5d443-ecd7-43dc-a0bf-493294749e7e@gmx.de>
Date: Mon, 3 Feb 2025 11:47:56 -0800
X-Gmail-Original-Message-ID: <CA+h8R2oW9nr3nYD2VFUbzAMWLVc97e1AC9jS4EWjgMr7N7kaeg@mail.gmail.com>
X-Gm-Features: AWEUYZkM-r_LefWRYAxv3Jn8hZeJm6zkZRamTtsmbr12mHe8GO1R0sfmL0_asSQ
Message-ID: <CA+h8R2oW9nr3nYD2VFUbzAMWLVc97e1AC9jS4EWjgMr7N7kaeg@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738612087; x=1739216887; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T8KxwwKRikOoLVV9jYxVMquPLO34MwsH371EcN4BYbI=;
 b=OfLXrtymAAyIv1yjxcHXwXPHOk/uTiQs7dxoRE63P/XacW3DgcJQPf8T9tDLViTYf8
 KAX+YcCvBwsx9G2zliEe1IJ+GSSoXzc1tu5U+4jTgKQGqAGivWUM8LOF3YPK7YNVf844
 l2tB5dIGdk6IB+Ee2I2ZcmSWqvfc+eZfCRdwc7Li/1Gl5RH2HJSbEGGAAT2wN4nlH0Ge
 Lj2GdmEjIswRGcVYPagsPXOZ2Nc43+Cu00DI0g7ftHJvv4GuOUmnrP4QxOgwaBmYMNue
 NZQjEdxOTnLLRO5bseHewMqLIqXOyF+8YEDV0X8aPiNFT9wpLHAEV1pIjfJ4K2w8P+Jy
 8Hjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=OfLXrtym
Subject: Re: [Buildroot] [git commit] package/containerd: bump to version
 v2.0.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6055615457079240937=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6055615457079240937==
Content-Type: multipart/alternative; boundary="000000000000c3f90b062d422b3b"

--000000000000c3f90b062d422b3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fiona, all,



On Mon, Feb 3, 2025, 9:56=E2=80=AFAM Fiona Klute <fiona.klute@gmx.de> wrote=
:

> Am 03.02.25 um 18:38 schrieb Christian Stewart:
> > Hi all,
> >
> >
> > On Mon, Feb 3, 2025 at 3:44=E2=80=AFAM Fiona Klute <fiona.klute@gmx.de>=
 wrote:
> >>
> >> Hi Arnout!
> >>
> >> Am 03.02.25 um 11:57 schrieb Arnout Vandecappelle:
> >>> On 03/02/2025 11:38, Fiona Klute via buildroot wrote:
> >>>> Hi,
> >>>>
> >>>> containerd fails to build for me after this update, with the error
> >>>> message saying "ld" cannot be found, log below. I notice that
> >>>> host/aarch64-buildroot-linux-musl/bin/ is absent from the configured
> >>>> path, and CC and CXX are set in environment, but not LD.
> >>> [snip]
> >>
> >> It looks like Go actually forces that flag, because *old* Binutils
> >> versions had a bug in the BFD linker:
> >> https://github.com/golang/go/issues/22040
> >>
> >> There is a pending upstream patch to drop that:
> >> https://go-review.googlesource.com/c/go/+/391115
> >>
> >> I'm testing a build with that patch right now, I'll send a patch for
> >> package/go/go-src if it fixes the problem.
> >
> >
> > Thanks for looking into this. I did not see this build issue on my end.
> >
> > I have gold installed on my system, which is probably why it works for
> me.
> >
> > When I applied the patch that you sent me I get this:
> >
> > ERROR: Your system uses bfd.LD 2.40 or older which has issues with
> > dynamic linking on aarch64
> > Consider upgrading or switching to binutils-gold.
> That is expected if you use a toolchain with old Binutils, where the bug
> that was the reason for Go forcing the Gold linker isn't fixed yet. All
> the versions in package/binutils are new enough (>=3D 2.41).
>
> I'm not sure if there's a way to make all external toolchains work: Some
> (like the one Arnout reproduced the bug with) don't have Gold, others
> (like yours) still use old Binutils. I guess we'd reach the best
> possible compatibility if we check
>
> * if Binutils version >=3D 2.41: apply patch
> * elif Gold is available: disable patch
> * else: exit with error.
>
> That'd add some complexity though, or are there already mechanisms to
> set/check requirements for external toolchains?


We could unconditionally apply the patch and then pass the build flag
conditionally.

Best,
Christian

--000000000000c3f90b062d422b3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Fiona, all,<div dir=3D"auto"><br></div><br><br><div =
class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Feb 3, 2025, 9:56=E2=80=AFAM Fiona Klute &lt;<a href=3D"mail=
to:fiona.klute@gmx.de">fiona.klute@gmx.de</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Am 03.02.25 um 18:38 schrieb Christian Stewart:<br>
&gt; Hi all,<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Feb 3, 2025 at 3:44=E2=80=AFAM Fiona Klute &lt;<a href=3D"mail=
to:fiona.klute@gmx.de" target=3D"_blank" rel=3D"noreferrer">fiona.klute@gmx=
.de</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Arnout!<br>
&gt;&gt;<br>
&gt;&gt; Am 03.02.25 um 11:57 schrieb Arnout Vandecappelle:<br>
&gt;&gt;&gt; On 03/02/2025 11:38, Fiona Klute via buildroot wrote:<br>
&gt;&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; containerd fails to build for me after this update, with t=
he error<br>
&gt;&gt;&gt;&gt; message saying &quot;ld&quot; cannot be found, log below. =
I notice that<br>
&gt;&gt;&gt;&gt; host/aarch64-buildroot-linux-musl/bin/ is absent from the =
configured<br>
&gt;&gt;&gt;&gt; path, and CC and CXX are set in environment, but not LD.<b=
r>
&gt;&gt;&gt; [snip]<br>
&gt;&gt;<br>
&gt;&gt; It looks like Go actually forces that flag, because *old* Binutils=
<br>
&gt;&gt; versions had a bug in the BFD linker:<br>
&gt;&gt; <a href=3D"https://github.com/golang/go/issues/22040" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://github.com/golang/go/issues/220=
40</a><br>
&gt;&gt;<br>
&gt;&gt; There is a pending upstream patch to drop that:<br>
&gt;&gt; <a href=3D"https://go-review.googlesource.com/c/go/+/391115" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://go-review.googlesource=
.com/c/go/+/391115</a><br>
&gt;&gt;<br>
&gt;&gt; I&#39;m testing a build with that patch right now, I&#39;ll send a=
 patch for<br>
&gt;&gt; package/go/go-src if it fixes the problem.<br>
&gt;<br>
&gt;<br>
&gt; Thanks for looking into this. I did not see this build issue on my end=
.<br>
&gt;<br>
&gt; I have gold installed on my system, which is probably why it works for=
 me.<br>
&gt;<br>
&gt; When I applied the patch that you sent me I get this:<br>
&gt;<br>
&gt; ERROR: Your system uses bfd.LD 2.40 or older which has issues with<br>
&gt; dynamic linking on aarch64<br>
&gt; Consider upgrading or switching to binutils-gold.<br>
That is expected if you use a toolchain with old Binutils, where the bug<br=
>
that was the reason for Go forcing the Gold linker isn&#39;t fixed yet. All=
<br>
the versions in package/binutils are new enough (&gt;=3D 2.41).<br>
<br>
I&#39;m not sure if there&#39;s a way to make all external toolchains work:=
 Some<br>
(like the one Arnout reproduced the bug with) don&#39;t have Gold, others<b=
r>
(like yours) still use old Binutils. I guess we&#39;d reach the best<br>
possible compatibility if we check<br>
<br>
* if Binutils version &gt;=3D 2.41: apply patch<br>
* elif Gold is available: disable patch<br>
* else: exit with error.<br>
<br>
That&#39;d add some complexity though, or are there already mechanisms to<b=
r>
set/check requirements for external toolchains?</blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">We could unconditionally apply t=
he patch and then pass the build flag conditionally.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Best,</div><div dir=3D"auto">Christian=C2=A0</=
div></div>

--000000000000c3f90b062d422b3b--

--===============6055615457079240937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6055615457079240937==--
