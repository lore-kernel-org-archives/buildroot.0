Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42235C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 17:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0B4F42C19;
	Fri,  7 Feb 2025 17:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eiGXRASqWgDO; Fri,  7 Feb 2025 17:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F2F342C28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F2F342C28;
	Fri,  7 Feb 2025 17:50:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 749691B5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63CD260819
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H381KroDHMEj for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 17:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E83C60758
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E83C60758
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E83C60758
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:50:21 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3eb9bbcc936so1457951b6e.0
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 09:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738950620; x=1739555420;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/hmQP5lrVnIZQEO5vRYLPzSVT6Bxawh1hZWkrbWS0wQ=;
 b=Uhdatbhg9HbG/nYQv+FzTdmZrSsry2hRQ3OjahOWxy2eT7nVIRAOlA4xjdK1c5geK1
 npAZhZ2C4YV4gkfRO7YHy6OG4EeayrPllNTJuSq+MNOhVmlPaVZAqrVqF/kaFKCCNRVi
 Z3v4ucJ1HPMfHG3qC+/4Te5Ti9Q5v3VCRwHVGirlDRYgXtXYl6BYe23ipfqySZ8aj/jz
 ahRrkM4KjZ4D+ACCffabL0NpfuMY832bXBBCHPA6f7blFvqLpYcCGjcQZlQq5F2u1qwf
 s9jupK7v1HbU4iMBOX8yTanctaZQuGc57DG0PkWw8hR3BEGqFnN/CAfXHTSI6cfJF+pa
 NXWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIkFQoRoWqtNAi69Rm3Z4653sR90ISAWwCj1ncrkh9O+MdcXLRBt4pyf20TbXubAWl38bkNtFGZQA=@buildroot.org
X-Gm-Message-State: AOJu0YygI+r9ha6HSCH2a+Celi89vz5V3adRrQWnfv1RNwpp73wG9nud
 a7Zlj9qTsL1FYt2EmHlo+Dg9wtkUPjRjhzoEzKNlLIGYcKPA+tUMb9DEYmMDO4veeOOx12isZSt
 H
X-Gm-Gg: ASbGncvZMNauLAg8WjItqT62H05kPCBgVJQSqAR+VxHQcGeIsg3C7RZ2/RWEB/mOMzL
 2cgWCBgY+TKC8Crf9Q0zvnWKKRd6ejsj8A1UQBnBjzZOBQmUfVLIT07l6UTgGikiVHo7OCKZ+Do
 njwaKR9Xerjn37pEKMi6VH4zYxhyfSI3/3mrrjz7G1n3uDknb3hjLnWrvO8aTMvFOev+KGWmMqf
 WNG1DfVC9T9Yjb9ZeyW0wG86wF4vLhmjfwGSMhHovE+rt3wzMMCJ3p+tN9W6hhnkdkxcJ3peK9W
 ufMUI7x0ObM7WWuN2X03pFlB5i2LqhDJPffntriIpfMdXje1D1VvnLOyIkY=
X-Google-Smtp-Source: AGHT+IGyO5jh4oDG5ZcEueK25HOCuda3XrVAUj4s7Pa6ihU8qByK7Z9iG37s0VCx434kMqkxaN8Faw==
X-Received: by 2002:a05:6808:1706:b0:3f1:b153:3112 with SMTP id
 5614622812f47-3f39225c2famr3013593b6e.13.1738950620120; 
 Fri, 07 Feb 2025 09:50:20 -0800 (PST)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com.
 [209.85.167.175]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-726afa37515sm885224a34.50.2025.02.07.09.50.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 09:50:19 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3eb9bbcc936so1457936b6e.0
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 09:50:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUnmUq+sj+I+HgMI2iYopNg1NFEFp9MZ0FV+VQIRj0oULGNIRa/gN3+LLquzxdcwCFwfy/De3+zrnE=@buildroot.org
X-Received: by 2002:a05:6871:ea86:b0:29d:cc2e:8493 with SMTP id
 586e51a60fabf-2b83ef1ad87mr2836568fac.26.1738950619241; Fri, 07 Feb 2025
 09:50:19 -0800 (PST)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
 <CA+h8R2oJWZw_S08XXhjE--_So0UJohVLWSoj30PpR9z66x8U1A@mail.gmail.com>
 <CADvTj4r5ZAFkyqMctj4fV=vnkqDn2g+oG3g2PjTHJKSkVLQNVQ@mail.gmail.com>
 <CA+h8R2pup4sse2R-6oMV0=uKL6WyV3o6fyerQeYopv57ZJWCVA@mail.gmail.com>
 <9524fc48-d637-42f9-bce1-29f0df5099a4@gmx.de>
 <CADvTj4qtBka_AVPh1rgGHkib9rxSfE7kAWBUMsz2nvYSWZvEhQ@mail.gmail.com>
In-Reply-To: <CADvTj4qtBka_AVPh1rgGHkib9rxSfE7kAWBUMsz2nvYSWZvEhQ@mail.gmail.com>
Date: Fri, 7 Feb 2025 09:50:09 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pNjKWK3nQ9sYmYQJLUD=goGEWOa6OWy36MGG=0fqh3Ww@mail.gmail.com>
X-Gm-Features: AWEUYZkO4wRquilfmhxP1Llkp35ep6-2rg4q2J1Bx5Z3xzZD--bHXJMNNSOu15E
Message-ID: <CA+h8R2pNjKWK3nQ9sYmYQJLUD=goGEWOa6OWy36MGG=0fqh3Ww@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738950620; x=1739555420; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/hmQP5lrVnIZQEO5vRYLPzSVT6Bxawh1hZWkrbWS0wQ=;
 b=qMusZzPeBQ28Voh+PVIA37oal1FvPNKonzYXpuuH0tD6y++Xy+quxCFQGC/7aMBzUy
 elFLKP3na8OPcl0Fvlqf6xaHq2KPM4jclAJcnWbbGnO7Jk+O8N8QwD6vb8OATY4ro0wk
 Q5bARV3wt3z6A0cBjbxitdYqImkibomOPs49k8dWoOkWi7AbVaYJauJIs3S2H/LzK686
 xTbE7wGiuxXW/D/X//766w62ISgFx7SjA72OCtiW/CL76PAbUl7Bpy67r6PwISp0N7ea
 KlcZIGqxUN54C1cw2pcgs6Hu86P2VtI6kTCHQgLHQJThiJJO1jzGKdKtw2nbmtfbVA00
 NMJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=qMusZzPe
Subject: Re: [Buildroot] Fwd: [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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
Content-Type: multipart/mixed; boundary="===============4576099443604421312=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4576099443604421312==
Content-Type: multipart/alternative; boundary="000000000000f12ce0062d90fdd8"

--000000000000f12ce0062d90fdd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

James,

On Fri, Feb 7, 2025, 9:35=E2=80=AFAM James Hilliard <james.hilliard1@gmail.=
com>
wrote:

> Just to clarify there are 2 different hash checks going on here
> essentially,
> there's the hashes in the go.sum file and the package hashes in buildroot=
.
>
> When we vendor the dependencies they are being validated against the
> go.sum file that's part of the package source, as long as this validates =
we
> know the correct dependencies as specified by the upstream package
> were downloaded correctly, the issue is that GOPROXY=3Ddirect disables
> the caching proxy which is designed to ensure that one can download
> the dependencies matching the hashes in the go.sum file in the event
> the original download source broke/changed for whatever reason.
>
> A direct download failing does not necessarily indicate a mistake or
> malicious action, it may simply be that the dependency download
> location no longer exists. As we have the caching proxy we should
> simply be using that by default as that's the expected way for
> golang to download dependencies as it prevents download failures
> that can happen when a direct download location disappears or
> changes. Using the proxy instead of direct downloads does not
> meaningfully reduce security due to go.sum being validated either
> way.
>

This is true but as you have identified many upstream developers are also
not checking dependencies carefully either.

If we look for build failures with GOPROXY=3Ddirect and notify upstream we
can help catch dependencies that may have malicious mismatches between the
git tag and the GOPROXY version.

Thanks,
Christian

--000000000000f12ce0062d90fdd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>James,<br><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 7, 2025, 9:35=
=E2=80=AFAM James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com"=
>james.hilliard1@gmail.com</a>&gt; wrote:</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
Just to clarify there are 2 different hash checks going on here essentially=
,<br>
there&#39;s the hashes in the go.sum file and the package hashes in buildro=
ot.<br>
<br>
When we vendor the dependencies they are being validated against the<br>
go.sum file that&#39;s part of the package source, as long as this validate=
s we<br>
know the correct dependencies as specified by the upstream package<br>
were downloaded correctly, the issue is that GOPROXY=3Ddirect disables<br>
the caching proxy which is designed to ensure that one can download<br>
the dependencies matching the hashes in the go.sum file in the event<br>
the original download source broke/changed for whatever reason.<br>
<br>
A direct download failing does not necessarily indicate a mistake or<br>
malicious action, it may simply be that the dependency download<br>
location no longer exists. As we have the caching proxy we should<br>
simply be using that by default as that&#39;s the expected way for<br>
golang to download dependencies as it prevents download failures<br>
that can happen when a direct download location disappears or<br>
changes. Using the proxy instead of direct downloads does not<br>
meaningfully reduce security due to go.sum being validated either<br>
way.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">This is true but as you have identified many upstream developers are al=
so not checking dependencies carefully either.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">If we look for build failures with GOPROXY=3Ddirect =
and notify upstream we can help catch dependencies that may have malicious =
mismatches between the git tag and the GOPROXY version.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Christian</d=
iv></div>

--000000000000f12ce0062d90fdd8--

--===============4576099443604421312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4576099443604421312==--
