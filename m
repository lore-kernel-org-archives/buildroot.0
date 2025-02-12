Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D95C02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 22:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32973814B1;
	Wed, 12 Feb 2025 22:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvuavTB9hxdj; Wed, 12 Feb 2025 22:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27C148143E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27C148143E;
	Wed, 12 Feb 2025 22:10:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51F441A3
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35EBE404DB
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJfoYnn2Yp16 for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 22:10:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07153410CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07153410CC
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07153410CC
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:10:28 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-726f84bd6b5so171086a34.2
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 14:10:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739398227; x=1740003027;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PvZrwpUNT7vvRQjgTL8kVBoZYfX7JazjYtqgs+elKQ0=;
 b=IIrVxQ8I5zRIzLFViPg8XJGH9OFXF6OVa3RVSdzAqTbs1dtHAWVVlGT/BNjz3/SN2x
 U0bSfqfK82j9nPXMKkILU+TpuRtdWADLmsSFOyVa4yeWQzbJap8oyZBetGoMYN4tVADx
 zcnVbAZIqf4UTgBJKYm02o7899Y7TeMczCJPm8KX89hCm0cIoPMEJZBMWZ4TLHsnDJA7
 XAdE+of/llWJu2vJwNjsq8etRuG44FeoTOMeBo+xChMgMB38gqNHFuHhiMDeu2vz7l/1
 VPgXLfcqIO/XQqaymrZsvUVrSXfnNjiqompXlN6eiTsMmXCPUSEQ7TijCKljfigfTU5U
 dJQQ==
X-Gm-Message-State: AOJu0YyhXxqyJ916qxYQaMqFJfhcZDtI3UMA+ZMh+IpP/i639VmJU2eV
 CR+4R2xceAmg8q+7EU4PhyTq8Lxlfh995o5rLhtIHNlK/St+D9aIQ0KeTKw/MGQOSOWQbRxmye9
 L
X-Gm-Gg: ASbGncv2ysDjRVzLbIKLiMzvdjEwLl2XDpL1rglYPEIhDk8gqZP4t4lqNbpYEcuN7Q6
 ex5hNaq44ntcjc9JZDlyZNYsfiqhPt1MeDiG3hujnKlpbzBULBFsBTu04m7WzQLIw6CMrCemeCb
 G0nzwe4xps18kHqPuV9xSeQ3jKdn6mhSpZhPMLMhHGgcHBoX8Ox/1oBDY6aKvZn/tUVz4XfLoKc
 Om5o4HSlpRB7JYKXmQroYqX7p6iJjD+1JtJe1c1qqZkgggAzZJJx2uz5Xgxg1wZrbhNWG+mfEkD
 alQZz1n8C6JJCfyoOz1FUSsy9Dqq1qSOSAtk28+FuPJQuWNSKcNEa5U/VR4=
X-Google-Smtp-Source: AGHT+IGPKJkeXWx4RDZ0TnEiqFmWIn6DzLAgQCwrScrUihXOyBQrA+BYRfqUBnznEOOMHHNXCVwZIQ==
X-Received: by 2002:a05:6830:3787:b0:71d:54cd:5289 with SMTP id
 46e09a7af769-726f1d467f5mr4016767a34.21.1739398227137; 
 Wed, 12 Feb 2025 14:10:27 -0800 (PST)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com.
 [209.85.167.169]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-727002581bcsm45678a34.52.2025.02.12.14.10.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 14:10:26 -0800 (PST)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3f3bac262f9so117041b6e.1
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 14:10:26 -0800 (PST)
X-Received: by 2002:a05:6808:30aa:b0:3f3:b6af:7481 with SMTP id
 5614622812f47-3f3cd71eb06mr3884355b6e.30.1739398226400; Wed, 12 Feb 2025
 14:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20250131054001.74407-1-christian@aperture.us>
 <87zfj7721n.fsf@tarshish> <8734gy2bjw.fsf@dell.be.48ers.dk>
In-Reply-To: <8734gy2bjw.fsf@dell.be.48ers.dk>
Date: Wed, 12 Feb 2025 14:10:14 -0800
X-Gmail-Original-Message-ID: <CA+h8R2r+RgPiZJmpg_RBhEVhs1WJ9iRhobKv1YCG1zSJWwYcdQ@mail.gmail.com>
X-Gm-Features: AWEUYZnkp5jOaThGcAgMEnTgNsJ8TBrVYABIscVv4MzOvUnCJBzQ0K35XCDwStw
Message-ID: <CA+h8R2r+RgPiZJmpg_RBhEVhs1WJ9iRhobKv1YCG1zSJWwYcdQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1739398227; x=1740003027; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PvZrwpUNT7vvRQjgTL8kVBoZYfX7JazjYtqgs+elKQ0=;
 b=YbvS7QPrxVdhF/OerOhTHzFsmAtBD56N78RBVkeb1zPnS85Stx82QQ715psvy9+9OI
 10ip2XPzD+CAbYCM4Yb7qMRKgA5lhrPYDLTM0gasws4bjV85dO3bcoqpK3HbV7Ey0jhQ
 +thAX3vD/XaUwFfeMgfMq2S+3u9rUgHR3QZAJU1aBBoZfwGcGJjmkpoZ/u3aUq5npnHj
 6+VKAESh4I+c+xXf8dDjPC1It4QTSYOqD/w3L8l5pnaA1GzCCEUWRBlPxp9l7CP3Sla/
 59UzY9O/SNCxzpXERBUERQ5j+kjCviiBb90p5GKEZZ22XrNYwGZS9PuBkVQ1eiFawkOv
 ixYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=YbvS7QPr
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump to version
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Baruch Siach via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1322562095599601763=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1322562095599601763==
Content-Type: multipart/alternative; boundary="0000000000006866de062df935d2"

--0000000000006866de062df935d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Sat, Feb 1, 2025 at 2:40=E2=80=AFAM Peter Korsgaard <peter@korsgaard.com=
> wrote:

> >>>>> "Baruch" =3D=3D Baruch Siach via buildroot <buildroot@buildroot.org=
>
> writes:
>
>  > Hi Christian,
>  > On Thu, Jan 30 2025, Christian Stewart via buildroot wrote:
>  >> Major release v1 -> v2.
>  >>
>  >> Dropped patch as it is no longer necessary:
>  >> https://github.com/containerd/containerd/pull/8924
>
>  > Which patch is dropped? I don't see any below.
>
> Ups, I didn't notice this line or your comment before committing. It
> indeed looks to be wrong.
>

Indeed, I had that patch in my skiffos fork, my apologies for the mistake.

Best regards,
Christian Stewart

--0000000000006866de062df935d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Peter,</div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Fe=
b 1, 2025 at 2:40=E2=80=AFAM Peter Korsgaard &lt;<a href=3D"mailto:peter@ko=
rsgaard.com">peter@korsgaard.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Baruch&quot; =
=3D=3D Baruch Siach via buildroot &lt;<a href=3D"mailto:buildroot@buildroot=
.org" target=3D"_blank">buildroot@buildroot.org</a>&gt; writes:<br>
<br>
=C2=A0&gt; Hi Christian,<br>
=C2=A0&gt; On Thu, Jan 30 2025, Christian Stewart via buildroot wrote:<br>
=C2=A0&gt;&gt; Major release v1 -&gt; v2.<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; Dropped patch as it is no longer necessary:<br>
=C2=A0&gt;&gt; <a href=3D"https://github.com/containerd/containerd/pull/892=
4" rel=3D"noreferrer" target=3D"_blank">https://github.com/containerd/conta=
inerd/pull/8924</a><br>
<br>
=C2=A0&gt; Which patch is dropped? I don&#39;t see any below.<br>
<br>
Ups, I didn&#39;t notice this line or your comment before committing. It<br=
>
indeed looks to be wrong.<br></blockquote><div><br></div><div>Indeed, I had=
 that patch in my skiffos fork, my apologies for the mistake.</div><div><br=
></div><div>Best regards,</div><div>Christian Stewart</div></div></div>

--0000000000006866de062df935d2--

--===============1322562095599601763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1322562095599601763==--
