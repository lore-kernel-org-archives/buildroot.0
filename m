Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406B9C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 09:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6A93824EE;
	Wed,  5 Feb 2025 09:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9-QWxAfDROa; Wed,  5 Feb 2025 09:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C89A182AA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C89A182AA2;
	Wed,  5 Feb 2025 09:20:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28D0B12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1899F824EE
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhBWMyxn-i4x for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 09:20:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09197824E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09197824E3
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09197824E3
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:20:41 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-71e3005916aso1651431a34.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 01:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738747241; x=1739352041;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bya53PEG1+sca8gLZNPhJSlIXRcXS1thQBW9BBfEYqg=;
 b=f3SaC3c8DGxLo97XwIxvPIVZHF9aK4+AYydofjM5b0EB2RQ11X1pJe3wWkH98c7QVC
 L0PREbGKDjHhIDAXl4/N+32VhtCQSaoW8dMDgx0fcRosf44Q3v5OfB7nkYGk+RGCHuRH
 90yIIR2FfzdLk7/1CMle7e/a62IH36XTiTlTDlYKgO4BgYNfEKTRQJ3ZbQ0vPYdZXNys
 WaV+9duA+M2vNVoUXADYM87R8Jik8ScovzLaORyAUnD3Zo/S/O/3vU0eavB/KymQjZ+M
 1Z1tesd0FXG2VxJt7uzrAza69L8/ljjPZIoBEpRtkKxyl/nygIM1M/rh8GcIDEy3lwHe
 nPWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkqxjOZntZlwWdo5o3MJ46SbnmpXpTcvyCKHFTaklb+9jQ5P2Sd3vatSJQPWifsDgBxoe8DChKJe8=@buildroot.org
X-Gm-Message-State: AOJu0YyS5Mvx44JSY3gIApoD/m1o2M0thG//LxjxB41yPo0uR01d2smZ
 elZBfmnS8ib4o0PjX028u6cz2ifEc6ZD64EBlxuBbC8m5zlh/MsLwYmMxFkX+jxw6+oxm5MyJfm
 N
X-Gm-Gg: ASbGncvWfS5Li53gceibfSrPHrs0MgwgwgkQ/ZHoYO53hZ545iVh55F86jtxrYr13NR
 621s1imNieS+hBODvlI6ru/r5fLPvYykEvRkUrNGqQ+MCI2gpVMJRt4MNkU/1eEph1UfZD1nWmt
 ggw2cLhadD3JH3qQHumEW6MVzYk2Zmi0pQLYdN2IO1wxNHsm8cgZ2PQhCRKr4kbDHQz3+6ymTzM
 XbQLdd5FAH7R02OEJX2Fly5RGTmTWaz/YP+0q+wTrx7w0/SiLs32FlTYS/OIRDP0gyTNsp3hOSA
 GkZuKlrRVuxXLbB1O3DRc11xDb9Z9GpJt4GqxZMVKMubkVOs5xfUgW8=
X-Google-Smtp-Source: AGHT+IGjgGWcrycaby6uOPisVqkILkgL1Ll5S9qDosRZkD4D3fdtQ5B1NBCzqOeEyYNDD8zBJsv3Zg==
X-Received: by 2002:a05:6830:6287:b0:71d:5043:1026 with SMTP id
 46e09a7af769-726a4170b46mr1482920a34.9.1738747240622; 
 Wed, 05 Feb 2025 01:20:40 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
 [209.85.210.53]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-726618b9ff2sm3852228a34.45.2025.02.05.01.20.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 01:20:40 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-71e3005916aso1651425a34.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 01:20:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVusH0vKeTSu3QZ/Ik4orcSt4tUiT4BiIiQqt4jrkA80fORRTmyseQiAj1ugHAuGMXUmFCpFkqiUY4=@buildroot.org
X-Received: by 2002:a05:6830:488c:b0:718:9b8b:429d with SMTP id
 46e09a7af769-726a4145dd8mr1564234a34.4.1738747239674; Wed, 05 Feb 2025
 01:20:39 -0800 (PST)
MIME-Version: 1.0
References: <20250204143227.1233163-1-fiona.klute@gmx.de>
 <CA+h8R2odWOyS=7=9LGGkBGHYENiLHtkj76_L2Zvq_PHOFYs9sA@mail.gmail.com>
 <527da78c-270f-4ec6-8a6e-1210456517a5@mind.be> <Z6MhhfrgmRrtMhrB@yd-6wlzhs3>
In-Reply-To: <Z6MhhfrgmRrtMhrB@yd-6wlzhs3>
Date: Wed, 5 Feb 2025 01:20:30 -0800
X-Gmail-Original-Message-ID: <CA+h8R2qR95DDHn45tqUG57rSCRWpfWkVU2sd2GxpCDhkkzrr_w@mail.gmail.com>
X-Gm-Features: AWEUYZlTzE3rasYu_5jL9CiiayPBIceuRP_wvI1kiiIQ-35IsSUJZBuxGHl0faw
Message-ID: <CA+h8R2qR95DDHn45tqUG57rSCRWpfWkVU2sd2GxpCDhkkzrr_w@mail.gmail.com>
To: yann.morin@orange.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738747241; x=1739352041; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bya53PEG1+sca8gLZNPhJSlIXRcXS1thQBW9BBfEYqg=;
 b=1nsSfUes43Cl1Dyky1GFSbbcea7Pir3/dL0iz97jDC4tvMj9Eb3SVzVU23tk3bt5PV
 S/6Hxz2iMyJ2i3McVX5HyGbNwZiFtRz9rEmnKirTzkubN+rwQaPQpavJUwDngExqXbQ1
 bIXwVLs2EWAiBbDmNy+fSulzRuYl7ZOfkJbp4oF/ixcgYLYpn1glurEZrrHvzN0BeGPp
 Hy/y34kfpgH3kLAg/yCol3NYf22WNESZFAiU4EUWUQHLEhmhMR8aGQ6LrjRH70eTg2SH
 DPZOhSQ0H5b9RI/pPk0crAG+dF9uKP1oIkrY0WvnKxLxFuz6n2TvzdmWFuGPPzLuHJ6P
 anxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=1nsSfUes
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: fix build with
 toolchain without Gold linker
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
Cc: Thomas Perale <thomas.perale@mind.be>, Fiona Klute <fiona.klute@gmx.de>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2092985228991887976=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2092985228991887976==
Content-Type: multipart/alternative; boundary="00000000000093435c062d61a3f1"

--00000000000093435c062d61a3f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann,

On Wed, Feb 5, 2025, 12:29=E2=80=AFAM <yann.morin@orange.com> wrote:

> >  Yes I agree - this patch (and Yann's infrastructure patch that this
> patch
> > depends on) should be in pkg-golang instead of an individual package.
>
> Not sure I entirely grok that. The change I submitted is in pkg-golang,
> as it is infra.
>
> So, I guess you only actually suggested moving setting -fuse-ld=3Dbfd and
> -Wl,--no-pie flags into pkg-golang, right?


My thinking is that we always want Go to have fuse-ld set to the correct
"ld" we are using. So it makes sense to set this in pkg-golang.

This way any new packages that have dynamic linking (cgo) will also pick up
the fix as needed.

When I initially needed -fuse-ld=3Dbfd for filebeat, I did not feel very
> confident that we should do it unconditionally. Indeed, none of the
> {host-,}golang-package packages we had at that time needed it at all. So
> I concluded that filebeat was special (it was already special in a few
> other respects, so meh).
>

It is just because it uses cgo, or am I wrong?

And since I am far from a go expert, I have no idea how impactful such a
> change would be. So I was a bit skeptical at making it part of the infra
> so that it applied to all packages.
>


> Still today, only one package (containerd) actually needs it; it is
> still an exception. Thus _I_ am still a little bit skeptical that this
> should be moved into the infra.
>
> But if Christian, our eresident go expert, says we should go for it,
> then let's do it.
>
> Still, I believe there should be a way for packages to be able to pass
> arbitrary extldflags, and thus the variable should be exposed.
>

Yes, that variable should be exposed, I agree. It's useful to be able to
pass extra ld flags as needed.

Best regards,
Christian Stewart

--00000000000093435c062d61a3f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Yann,<br><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 5, 2025, 12:=
29=E2=80=AFAM  &lt;<a href=3D"mailto:yann.morin@orange.com">yann.morin@oran=
ge.com</a>&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt;=C2=A0 Yes I agree - this patch (and Yann&#39;s infrastructure patch th=
at this patch<br>
&gt; depends on) should be in pkg-golang instead of an individual package.<=
br>
<br>
Not sure I entirely grok that. The change I submitted is in pkg-golang,<br>
as it is infra.<br>
<br>
So, I guess you only actually suggested moving setting -fuse-ld=3Dbfd and<b=
r>
-Wl,--no-pie flags into pkg-golang, right?</blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">My thinking is that we always want Go=
 to have fuse-ld set to the correct &quot;ld&quot; we are using. So it make=
s sense to set this in pkg-golang.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">This way any new packages that have dynamic linking (cgo) will a=
lso pick up the fix as needed.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_contai=
ner"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
When I initially needed -fuse-ld=3Dbfd for filebeat, I did not feel very<br=
>
confident that we should do it unconditionally. Indeed, none of the<br>
{host-,}golang-package packages we had at that time needed it at all. So<br=
>
I concluded that filebeat was special (it was already special in a few<br>
other respects, so meh).<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">It is just because it uses cgo, or am I wrong?</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gm=
ail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
And since I am far from a go expert, I have no idea how impactful such a<br=
>
change would be. So I was a bit skeptical at making it part of the infra<br=
>
so that it applied to all packages.<br></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_co=
ntainer"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
Still today, only one package (containerd) actually needs it; it is<br>
still an exception. Thus _I_ am still a little bit skeptical that this<br>
should be moved into the infra.<br>
<br>
But if Christian, our eresident go expert, says we should go for it,<br>
then let&#39;s do it.<br>
<br>
Still, I believe there should be a way for packages to be able to pass<br>
arbitrary extldflags, and thus the variable should be exposed.<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, that var=
iable should be exposed, I agree. It&#39;s useful to be able to pass extra =
ld flags as needed.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best=
 regards,</div><div dir=3D"auto">Christian Stewart</div></div>

--00000000000093435c062d61a3f1--

--===============2092985228991887976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2092985228991887976==--
