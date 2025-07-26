Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF57C83F17
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 07:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C3A3413D3;
	Sat, 26 Jul 2025 07:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7luXyNiJJEq; Sat, 26 Jul 2025 07:05:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC1B8413B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC1B8413B1;
	Sat, 26 Jul 2025 07:05:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C39C177
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 07:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 715B840024
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 07:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WX3MS7-vpT0j for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 07:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A1E840025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A1E840025
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A1E840025
 for <buildroot@uclibc.org>; Sat, 26 Jul 2025 07:05:46 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-4e7fb730078so954368137.1
 for <buildroot@uclibc.org>; Sat, 26 Jul 2025 00:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753513545; x=1754118345;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AZv3KI1Q3k5Ptsq0CZWCmKcoQU9qcXxA+ckRY37XeUA=;
 b=pqGpgerXHfnnOmTFCOCvNVAb5I+fm8h2U/POB3Nm74r47juFHIo3HVqdM59/HW5aox
 h7T5J1q/o5k3QZWXdKU63UqG3yVfhGPaqXtUojbUiHAxZWq+8BWZSsyl+JEDYGfZaQvi
 y5Zzh86V2msbMZg9rBHcSHeg+paZ3dYqVINX3hTovv2i6W0ektEN3jBtqRLXN6HNsM+6
 gn/yoMoGsaDCd6Wm32/XSVjDyKANi16uOzhzlFFzc8QXImwdHWfogOOcPDkjkKMVHD/q
 KCeyLnOI9tpAzkr2sB02tQzLGSDbU1EkBy+6Cd/yVHB85BPpBY14hTQeJ0c5fGVuidAr
 UNPQ==
X-Gm-Message-State: AOJu0Yz2cmOYHTxe/uO0Ledr6mGRODjXTgrA9CAC6jNhNHhO5eHzS4E+
 YbiOCh8H+hKpozBhSDJD4vvbXgB1Zbn0PpR0BEUc5twW0/WUWnH8/wPlXn4xL1U+o7X7xz83XJK
 6Aa0HG2vMWcqK8gvcfBWIXKNvm/lYreXVOutOrHk=
X-Gm-Gg: ASbGncvhF3x7xFlBGOnRNmK26/F1vG/Q5BHCrrojJafLOjA9pxWSd9VVBBAjlKOXNCX
 t4f24QQiPUWACztCeZ82+vXN0tQmk99ydorYcxSod7OY2mEqdPE4YG4U0PDmiLuFiSRkH8fzjeR
 xcmLce/fk8FniaBDq5f2+iul7TrITdDBUAUdS57xNXcK13gHDsqJsyo+l5CL8SE7B02i0mFZSO6
 za7pX3t
X-Google-Smtp-Source: AGHT+IFV+W+hM1kZjRnmsFFAhgMtqoWljbjwO6Vomo/5vgtH2GmdjnQz/ZfzikSFpEKtDKo60Yoshb1q2/AdnC13ViM=
X-Received: by 2002:a05:6102:5799:b0:4e9:bae0:7f9a with SMTP id
 ada2fe7eead31-4fa3feaef69mr2062111137.12.1753513544692; Sat, 26 Jul 2025
 00:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250706123343.1582116-1-bernd@kuhls.net>
 <CADvTj4rzNNW65V0ktjf=ccaqyFJTLn-xKO49o0K7imBcTXbH-Q__39433.439953585$1752615950$gmane$org@mail.gmail.com>
 <pan$a2bc3$3b96028b$b6ff87ce$1957a0a9@ID-313208.user.individual.net>
In-Reply-To: <pan$a2bc3$3b96028b$b6ff87ce$1957a0a9@ID-313208.user.individual.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Jul 2025 01:05:33 -0600
X-Gm-Features: Ac12FXwuLqRbAPJ2o1LrGtAsVZIPZaLxSDSsEhxWax5_mFvpySuUqknVYrNxcNI
Message-ID: <CADvTj4rtSQ=zW_c2SK5QSLwMXef7Br8yHC0Ve7uwt=hkXcVOnQ@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@uclibc.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753513545; x=1754118345; darn=uclibc.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AZv3KI1Q3k5Ptsq0CZWCmKcoQU9qcXxA+ckRY37XeUA=;
 b=fISenXFlhOMtLmM0j8tG48FEmDaaXQGEMw3+yBFARRH3aOSStTE6+UJp7nJSPbHo11
 fES/8wxSaMCV4D+qVeEs/VNUcj9Jx9X2wpqD8wZJGsW9+kFl5xACInkt8LaQvs24Kj0Z
 5no2rkEQsEXLNgQI2gYiHKTI8uYAK19ujkrhjCycag7rSmTQYPrdywbKonOPMEzyPtJC
 vVJi2mbixpJ7Kaq0h11ISmosOVPIVRjkD9ze+oQLnz0EnWur1ShBnYKs5OIwfsN9Qxjq
 1ihFmtdUdKYBaGCKC9JRP/SR1NH0e701MHdwGUzL3gCS5WJJHdwTthfAOvb8rq4vp2Ed
 2Omg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fISenXFl
Subject: Re: [Buildroot] [PATCH] package/libva: fix build error
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
Content-Type: multipart/mixed; boundary="===============5724292013337061440=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5724292013337061440==
Content-Type: multipart/alternative; boundary="000000000000f0b917063acfafcc"

--000000000000f0b917063acfafcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 12:46=E2=80=AFAM Bernd Kuhls <bernd@kuhls.net> wrot=
e:

> Am Tue, 15 Jul 2025 15:45:19 -0600 schrieb James Hilliard:
>
> > This appears to have broken gst1-vaapi:
>
> Hi James,
>
> upstream removed this project:
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/
> 82a71a7739fea9d48e9c64f44bce879b86bd3df7
>
> so I guess we should not expect any updates from them.
>

Hmm, well this PR patch was never merged and appears to be
broken: https://github.com/intel/libva/pull/812

So I don't think it would be expected that gstreamer would
need to do something to fix an error caused by an unmerged
libva patch. Maybe the libva PR is not the best approach.

I see it's mentioned here that the PR is an ABI break:
https://github.com/intel/libva/pull/812#issuecomment-2148310511


>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000f0b917063acfafcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Jul 26, 2025 at 12:46=E2=80=AFAM =
Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net">bernd@kuhls.net</a>&gt; =
wrote:</div><div class=3D"gmail_quote gmail_quote_container"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Am Tue, 15 Jul 2025 15:45:19 -0600 schr=
ieb James Hilliard:<br>
<br>
&gt; This appears to have broken gst1-vaapi:<br>
<br>
Hi James,<br>
<br>
upstream removed this project:<br>
<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer=
/gstreamer/-/commit/</a><br>
82a71a7739fea9d48e9c64f44bce879b86bd3df7<br>
<br>
so I guess we should not expect any updates from them.<br></blockquote><div=
><br></div><div>Hmm, well this PR patch was never merged and appears to be<=
/div><div>broken:=C2=A0<a href=3D"https://github.com/intel/libva/pull/812">=
https://github.com/intel/libva/pull/812</a></div><div><br></div><div>So I d=
on&#39;t think it would be expected that gstreamer would</div><div>need to =
do something to fix an error caused by an unmerged</div><div>libva patch. M=
aybe the libva PR is not the best approach.</div><div><br></div><div>I see =
it&#39;s mentioned here that the PR is an ABI break:<br><a href=3D"https://=
github.com/intel/libva/pull/812#issuecomment-2148310511">https://github.com=
/intel/libva/pull/812#issuecomment-2148310511</a></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards, Bernd<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000f0b917063acfafcc--

--===============5724292013337061440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5724292013337061440==--
