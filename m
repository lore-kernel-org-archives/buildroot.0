Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B0CC021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 17:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07D8440747;
	Sat, 22 Feb 2025 17:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FE3X5gveQxNe; Sat, 22 Feb 2025 17:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A92274074C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A92274074C;
	Sat, 22 Feb 2025 17:50:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CDD06B
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80E6360661
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2p92M7iztCC for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 17:50:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76CC9606B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76CC9606B3
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76CC9606B3
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:50:44 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-727118c4f9aso844280a34.1
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 09:50:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740246643; x=1740851443;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iDGQtn1L0GwEuxRourwdfZGAEGpxL2zKI8iN2zKO1YI=;
 b=P1iDNdmIpttNvzJKQwpO8ZiBXQ6hVN0htwHTSAs/2vBn0m4byfdlGQhEoClRTJP+uP
 3atx65ALjeOl1oawM9TXDnTDVr+Z5mzmPgBGgcsfMtjjUSya6ibpb4njMfgVemqzQXAR
 1RIaAbVQIk0A8Qc1uXAdHYw/MGQ/S9bIP5pW5otHbBMC6G8xWpv3CvxUgdkloi7GjBG5
 tO8iyG9OzOpKa2PWKtRHweHtefBw12+kzV7IQby42v35SSJZCF+r4CklOqzBZ5YpVJeg
 yTnHUS2Jo+1l/p/0dE6oKyGx1j5dh50gYlZh/XSOHlRCiwjfQpsy4/OJ5jKvnptLcpmv
 +Vuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0yne8GmiXColmlnRC0Tvbrme5UlM91lAmm5I6zi+C7Ogq8dzovAo/iudOcB+ueTTSG2ggH1IG5ao=@buildroot.org
X-Gm-Message-State: AOJu0YxVVwvN//odBzlWeuvueISQiA6gpQWprXUdo8tr9Ty3BHetoPUw
 IyhyKy0FBwDya1waTL1u6pOkop1pnJ/owlDDIjqbbb0fyhtk49B2D1sjUjA1Nb/QSZUM7x0ELMV
 K
X-Gm-Gg: ASbGncsZS/mCE042nao4ujIovtP9nz8ZZ+fY9Fz8rPaBHVMOUTctYIsnu2BIwlSfVCI
 sjqlLzrGOrolwAGW4/he8JRrQEGCRaQJAh6JZvsFwso9b4BOqBFt5a8tD11mxj39pIRW5ceC1X7
 64SaWDuayg/h3JDRdRvxYbudB00sJKkYpoUXFlOztUwFI/XfZGWFLcko9qiTH5ooNJU5qFSySVW
 AexOalOfoIoE81UExx1TPYt9GNas7exF0CNZxntJBkJ+f3OXz+JSkXzN2tcKl58ZI8F6TRmAJT2
 PtX2w+kAYJx3+giKoQPZebkKIOzVNbmGubAK8wINaAptEPVlG5PHgHSHTY8USMwcOXPw+g==
X-Google-Smtp-Source: AGHT+IFVub83RWDr2462dllMWC8jpcnKIp03unc7u/AjyA83eampsLBNXGoTGEmUC7Pi01jmcA+r7A==
X-Received: by 2002:a05:6830:2652:b0:727:423c:95ea with SMTP id
 46e09a7af769-7274c25a636mr5682731a34.19.1740246643236; 
 Sat, 22 Feb 2025 09:50:43 -0800 (PST)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com.
 [209.85.167.171]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-72739ef6e2bsm1756645a34.10.2025.02.22.09.50.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Feb 2025 09:50:42 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3f410506043so843045b6e.0
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 09:50:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU6GZntISZrZ2xD4AD8ZB08XnySqcERDDN5DqpNo9WVA6A7b3lf9RTJtM/puyaN3daEeFNiiChml48=@buildroot.org
X-Received: by 2002:a05:6808:2205:b0:3f4:9c5:8809 with SMTP id
 5614622812f47-3f4247a945fmr5378063b6e.33.1740246642276; Sat, 22 Feb 2025
 09:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20250205135825.2310972-1-fiona.klute@gmx.de>
 <20250205135825.2310972-2-fiona.klute@gmx.de>
 <Z7nf_jNmDVM-N6WI@landeda>
In-Reply-To: <Z7nf_jNmDVM-N6WI@landeda>
Date: Sat, 22 Feb 2025 09:50:31 -0800
X-Gmail-Original-Message-ID: <CA+h8R2p90D+sS3C3OU6iN+0k_icWd1GB=zj0zgq0aWRrOkX4BA@mail.gmail.com>
X-Gm-Features: AWEUYZm2Uuyqa01DwCaYRAEkv5O4vH5IbCko_gYuUJFUF9Lqi4ByKzSNzfJ77S0
Message-ID: <CA+h8R2p90D+sS3C3OU6iN+0k_icWd1GB=zj0zgq0aWRrOkX4BA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org,
 yann.morin@orange.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1740246643; x=1740851443; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iDGQtn1L0GwEuxRourwdfZGAEGpxL2zKI8iN2zKO1YI=;
 b=GnBHaxQs+o/H/u1JjUjJwsunMYu2roJNNVzHXnspBc+ngsJBSOobPtDPEAlE/mJUWc
 NGEC5ItGsA9txWEvQ2uy358UE7v1IZLgUO5CSLUEuxLIszrmHDC5j2hD/0/U5QyWpHCy
 GOfrR3hbiPPVQPJb2bBOcBxjfcEcmbzYtWG+TNb8Sh6GulV1JPQnXRVfavn0Nge3HKvn
 Ep2QxkyzDNrtLuNbQmq5RMNGwZOdndh1pHay9xXBX2F62oE36LdKgv7lEB5Oee2VDQs0
 6pEOIS+aK0zLoR8OIxxjbiaftlQVLoZhnVEGRn44iRhvY7EjyPBfTJzAjjTYYz2dAq5D
 7osw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=GnBHaxQs
Subject: Re: [Buildroot] [PATCH v3 2/3] package/pkg-golang: use ld.bfd
 instead of ld.gold on aarch64
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
Content-Type: multipart/mixed; boundary="===============7177405631422989338=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7177405631422989338==
Content-Type: multipart/alternative; boundary="000000000000ef4fd0062ebebe62"

--000000000000ef4fd0062ebebe62
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All,

On Sat, Feb 22, 2025 at 6:32=E2=80=AFAM Yann E. MORIN <yann.morin.1998@free=
.fr>
wrote:

> Fiona, All,
>
> On 2025-02-05 14:58 +0100, Fiona Klute via buildroot spake thusly:
> > From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> >
> > Go forces use of the Gold linker on aarch64 due to a bug in BFD that
> > is fixed in Binutils >=3D 2.41 (that includes all versions provided by
> > Buildroot). Forcing Gold will break with toolchains that don't provide
> > it (like the Buildroot toolchains), so override the flag and use BFD.
> >
> > This override should be removed if Go stops forcing Gold, and may have
> > to be adapted if the set of available linkers changes (e.g. with a
> > future Binutils update).
>
> This patch would fix issues also related to containerd, that we also
> see in the autobuilders, e.g.:
>
>
> http://autobuild.buildroot.org/results/a59/a59bc999e9620ff6b9d97138a2de89=
8aadc07529/build-end.log
>
>     [...]/host/bin/aarch64-buildroot-linux-gnu-gcc [...] -fuse-ld=3Dgold
> [...]
>     collect2: fatal error: cannot find 'ld'
>     compilation terminated.
>
> Regards,
> Yann E. MORIN.
>

I am seeing these build failures on my end as well and recommend merging
this series.

Best regards,
Christian Stewart

--000000000000ef4fd0062ebebe62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">All,</div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 22,=
 2025 at 6:32=E2=80=AFAM Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.199=
8@free.fr">yann.morin.1998@free.fr</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Fiona, All,<br>
<br>
On 2025-02-05 14:58 +0100, Fiona Klute via buildroot spake thusly:<br>
&gt; From: &quot;Fiona Klute (WIWA)&quot; &lt;<a href=3D"mailto:fiona.klute=
@gmx.de" target=3D"_blank">fiona.klute@gmx.de</a>&gt;<br>
&gt; <br>
&gt; Go forces use of the Gold linker on aarch64 due to a bug in BFD that<b=
r>
&gt; is fixed in Binutils &gt;=3D 2.41 (that includes all versions provided=
 by<br>
&gt; Buildroot). Forcing Gold will break with toolchains that don&#39;t pro=
vide<br>
&gt; it (like the Buildroot toolchains), so override the flag and use BFD.<=
br>
&gt; <br>
&gt; This override should be removed if Go stops forcing Gold, and may have=
<br>
&gt; to be adapted if the set of available linkers changes (e.g. with a<br>
&gt; future Binutils update).<br>
<br>
This patch would fix issues also related to containerd, that we also<br>
see in the autobuilders, e.g.:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"http://autobuild.buildroot.org/results/a59/a59bc99=
9e9620ff6b9d97138a2de898aadc07529/build-end.log" rel=3D"noreferrer" target=
=3D"_blank">http://autobuild.buildroot.org/results/a59/a59bc999e9620ff6b9d9=
7138a2de898aadc07529/build-end.log</a><br>
<br>
=C2=A0 =C2=A0 [...]/host/bin/aarch64-buildroot-linux-gnu-gcc [...] -fuse-ld=
=3Dgold [...]<br>
=C2=A0 =C2=A0 collect2: fatal error: cannot find &#39;ld&#39;<br>
=C2=A0 =C2=A0 compilation terminated.<br>
<br>
Regards,<br>
Yann E. MORIN.<br></blockquote><div><br></div><div>I am seeing these build =
failures on my end as well and recommend merging this series.</div><div><br=
></div><div>Best regards,</div><div>Christian Stewart</div></div></div>

--000000000000ef4fd0062ebebe62--

--===============7177405631422989338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7177405631422989338==--
