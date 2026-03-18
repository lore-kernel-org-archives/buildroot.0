Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C23BFCD0CA
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 07:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 349DC40F4B;
	Wed, 18 Mar 2026 07:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NR1j8_Kdpotn; Wed, 18 Mar 2026 07:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F18840F5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773819915;
	bh=EPc9ggqjV9E+F+wB8emuRt/atKuC8cU7tJAR3Lp/mDQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PV/xCD1fUxX77Pc0XRePhG+Hv0Fi+UCICXJNL2hCFUqMBBZy9eDgHgaaUJaIQDfIM
	 FUkpHJ1FE/WR6yBXqZcKwtF/37rIQHaFduSZ56EdokEfcSvGN3YLlqaQenk7j33LSY
	 i0I2MIc+KKsH0Hn9G2QG0fKy/ovpnKzBeWfE6C/DBb/y5jkLTbr7lwbkLem8/5Einm
	 8ju3v0HthQos5MgrIjwG3ZXocs1o3nx4+QSzhaYt5d8vV8SGBjUY1vYwnWOV8ZeQ3c
	 U62qwkBS2tr1QsaeyfnTepRcuGi2yiLkIoasd/8pS+oyVqoVxlLX6P2KeP+a19kMWp
	 8bH4dm+9PtxAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F18840F5D;
	Wed, 18 Mar 2026 07:45:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB1161B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 07:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D80094037B
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 07:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRw_w4oNqnnD for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 07:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BB8840379
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BB8840379
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BB8840379
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 07:45:12 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b97ba4c2be2so375904866b.1
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 00:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773819910; cv=none;
 d=google.com; s=arc-20240605;
 b=ESv2TYj/f1LEvmG1QWSSxGy5odK1F3YvA2CGmxc2D3SeyM00zMbYkBkfYqJNW/uCvR
 Oll/K0jkmjkNOol4CapaFimTi6WZx9JXyocJM6J2ATtkM27XbVxABQlOlqj4FijPGwKC
 N5GmvPJaDJ29fdlk9c2MPeuhHWX8NPQFIklVnkyC/RT0ZOyvfw7t6kHZLBw6O/1BrqN1
 l/d5ex+4qHYt+2a1M3FDwATX+GVNRc83wfSNUzLFLFiWqL7KsEkk3RDpsU1DDPwBz3Kk
 iLj2sGwEZxgiUshjgunWclLrEEwY06DtK+KH6fxF1ywJU9NjVuscUA8/M7FWsUk0W7gC
 94vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=I1yg416KWyfJYYeKmCYvl2x5brx6EF+wANdoA8x/mjQ=;
 fh=Wn/3JAiFSbNATwwfCzguNOB6szgqDCXNiJXNRlUZyqo=;
 b=dGlPZqC/rcHF/VgUzsTm5JeMExkxspIUSNzPxp+qsby26uBFAowUpqbfnMYA3UHKJu
 RzkCVwxAkKv5WpLB/4zXngCZiDvtNF8SNi+BRRucjFQWJxHceSjotnxbvj/+mercbL04
 aHUGjncXtlRm+pVWmaAYUp12huzmemQ1qcQzMDfeWRAOkSXe8AIPIMpvHPQ+a9GBwR7C
 BcLQsrLTGvGg7ysVoV7Bama4MDwZQS987GjzyRA7oF1fTRqMlNouhEIj+Zp9J9nCv5Uk
 R51WVTmUGQXubIBXJWfapF7STZoFFAMOaol3zHpUxAqwBplrxjwVgugEDcCUq8JSjnrP
 Ptuw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773819910; x=1774424710;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I1yg416KWyfJYYeKmCYvl2x5brx6EF+wANdoA8x/mjQ=;
 b=NhuliNWecklgPFuxIy3FQz+4dLHidQ52SeM0h4F4emVG2AOqM61y/5PHxWEYj5Ixzz
 T9gJaI6ckrnOLDYlfw/4PapBOG0gmQKEq8/uKEnnJhm+vKGI/j1VrQdaNVhfYnSseWbD
 2Q2sAbWqAZk4qFtYT20VaWJhwwxTMpnbEFUbqdIaASpU6VxNcMjXZyshgE5eg3zlyrDk
 QCdqyxSyL5lXXF63+zksUYzbfMvGsCFHOeb2+ySadv3ArRn3HVCbyVyHPmMTbaz7rD1x
 JVegfOXuXKXuOeKurEtVfUXFc1JgMyPmoeWpQd44dl3GJmUxMEwDDppl6w/sMCPPq2oB
 AMvQ==
X-Gm-Message-State: AOJu0YyAu4FpgHSx6lb1ZJPmILbGsq88WVzRc3LG2/SsK/xlo+fczDqz
 quswjpfvONCeljT6Y9VT/n/GtRmU7Ja0JzJbmh8H5Y4+FzgwRKRN/uR2gCtP4INGEUhSwKTkxsn
 9DY9NF/kPwNs7C2Y3TVDiS9sVb7v/sDEqjKEB
X-Gm-Gg: ATEYQzz4qLLmy0CeXBuMDOoSeUcWrr4Uuspe+LCU8LRSEaQoBjoSuLHZC2gRr/91S+l
 o1JzuGO+RoNJokgtjubX2JGcAuRNRhShKw0nhgPzf7y8wiCjyqrC51/GIIwvLgqM94JZuzOjZpf
 739qRsb9zm0fjH57a56wvl04fk9fUMdg2e1wFckQYB8d9pMgstVy5fivi3on4Yi57xmeO0QlA8I
 dGO/rRu6Q4ITiaLgMfpgd+XBIdOTLbNruh9iF4KPaZ4hWBsAx1GyfVnVvVTvcAAPtC3oU/8OAUe
 DcbJhISDnLUmgqtvbYQKV+AtsR9zBIUmHkFslOw5TQ==
X-Received: by 2002:a17:907:c02:b0:b96:edcd:cd04 with SMTP id
 a640c23a62f3a-b97f4b16f67mr118051066b.49.1773819909693; Wed, 18 Mar 2026
 00:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.9.1773748801.2109898.buildroot@buildroot.org>
 <56f32918983755443d8008e93fd25978@umbiko.net>
In-Reply-To: <56f32918983755443d8008e93fd25978@umbiko.net>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Wed, 18 Mar 2026 13:14:58 +0530
X-Gm-Features: AaiRm53pcxkIBVXgDIlLEAK9GC1K8lGjSuNk4RJasTPI69fhbVBkH5HdxFCSeZk
Message-ID: <CABvxksydEFh_L7ayv18HY8bk2F=bfryX62R2CV0bL_LNL3X2_A@mail.gmail.com>
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773819910; x=1774424710; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I1yg416KWyfJYYeKmCYvl2x5brx6EF+wANdoA8x/mjQ=;
 b=NuIS58w6CK4cmcxPMRBeG6Bl/l9f44M+TFU94AhYedC6M5EDQxLx5kQM0yuAPw3Fft
 N5m5SNutpWjCchjjCBp9g+LhN+LKLmCaNf+BQDjilKTyAX2zBeEW0TqRTxDC2iT8UHpd
 GrpLMPc5lq1q2CLQbuz0dgwU3dwdRwuBMb6p1ADVgfHuhr6tisuUe18EG6rqzE/SLHJL
 eT4RTDCrX00QW3GW9JdC9B8VLfG5OBstkdPBdKfAjW5wz4XbovpaHd/O6EEHkPGIQpwt
 FgN6U8OYRHOudGQvsUVJuonnB/hjH5UVN01z2msViLSLhqll3l+fBYJ2IPyelKeXW5iZ
 KCsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NuIS58w6
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: add support for
 uninstalling packages
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
Content-Type: multipart/mixed; boundary="===============3248087710014298111=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3248087710014298111==
Content-Type: multipart/alternative; boundary="0000000000009ce781064d47a1be"

--0000000000009ce781064d47a1be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas, Andreas, all,

Thank you both for the feedback.

Andreas, I'm glad to hear this approach has been working well for you
in practice. That's reassuring.

Based on the discussion, I see a few paths forward:

1. Keep the script as-is with clear documentation that it's for advanced
debugging/testing scenarios and doesn't handle reverse dependencies

2. Add the cascade uninstall feature for safety

3. Ship the script in support/scripts/ but make the make target integration
optional (as Andreas suggested)

I'm inclined toward option 1 or 3 - shipping a useful tool for developers
who understand the caveats, with clear documentation about the reverse
dependency limitation.

What do you think?

Best regards,
Shubham

On Wed, Mar 18, 2026 at 10:13=E2=80=AFAM Andreas Ziegler <br025@umbiko.net>=
 wrote:

> Hi Thomas, Shubham, ALL,
>
> On 2026-03-17 10:08, Thomas Petazzoni wrote:
> >
> > Hello,
> >
> > On Tue, Mar 17, 2026 at 01:41:25PM +0530, Shubham Chakraborty wrote:
> >
> >> I didn't consider reverse dependencies. The scenario you described
> >> (uninstalling openssl breaking ntp) is a
> >> serious problem that makes the current implementation unsafe.
> >>
> >> I see a few potential approaches to address this:
> >>
> >>  1. Add dependency checking that refuses to uninstall if reverse
> >> dependencies exist (similar to package managers like apt/dnf)
> >
> > This would make the feature useless for a significant number of
> > packages I'd say.
>
> In most cases, exactly these reverse dependencies make removal of the
> package desirable. Testing with and without sometimes needs manual
> intervention. Also I prefer clearing up the mess after testing to doing
> a full rebuild: it's less time consuming.
>
> >>  2. Implement cascade uninstall (uninstall the package and all its
> >> reverse
> >> dependencies)
> >
> > This would probably be the logical thing, I guess?
> >
>
> Nice to have, but is it worth the effort? This is not a tool for
> everyday use, and most people will know what they are doing.
>
> >>  4. Simply document this as a "use at your own risk" feature for
> >> advanced
> >> debugging scenarios
> >>
> >> I wanted to ask: would any of these approaches be acceptable for
> >> Buildroot?
> >> Or is the fundamental issue that without proper
> >> dependency tracking during uninstall, this feature is too dangerous to
> >> include regardless of warnings/checks?
> >
> > This has so far been the project's opinion on this topic. But nothing
> > is set in stone forever, so we can always revisit/rediscuss things.
>
> I used to delete files manually, until I discovered the central
> packages-file-list*.txt files, and have been using a similar Python
> script for a few years. Shubham's approach to use the package based
> lists is better.
>
> Including the script as a build target is optional.
>
> > Thomas
> > --
> > Thomas Petazzoni, co-owner and CEO, Bootlin
> > Embedded Linux and Kernel engineering and training
> > https://bootlin.com
>
> Kind regards,
> Andreas
>

--0000000000009ce781064d47a1be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas, Andreas, all,<br><br>Thank you both for the fee=
dback.<br><br>Andreas, I&#39;m glad to hear this approach has been working =
well for you <br>in practice. That&#39;s reassuring.<br><br>Based on the di=
scussion, I see a few paths forward:<br><br>1. Keep the script as-is with c=
lear documentation that it&#39;s for advanced debugging/testing scenarios a=
nd doesn&#39;t handle reverse dependencies<br><br>2. Add the cascade uninst=
all feature for safety<br><br>3. Ship the script in support/scripts/ but ma=
ke the make target integration optional (as Andreas suggested)<br><br>I&#39=
;m inclined toward option 1 or 3 - shipping a useful tool for developers wh=
o understand the caveats, with clear documentation about the reverse depend=
ency limitation.<br><br>What do you think?<br><br>Best regards,<br>Shubham<=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Mar 18, 2026 at 10:13=E2=80=AFAM Andreas Ziegl=
er &lt;<a href=3D"mailto:br025@umbiko.net">br025@umbiko.net</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Thomas, Shubh=
am, ALL,<br>
<br>
On 2026-03-17 10:08, Thomas Petazzoni wrote:<br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; On Tue, Mar 17, 2026 at 01:41:25PM +0530, Shubham Chakraborty wrote:<b=
r>
&gt; <br>
&gt;&gt; I didn&#39;t consider reverse dependencies. The scenario you descr=
ibed<br>
&gt;&gt; (uninstalling openssl breaking ntp) is a<br>
&gt;&gt; serious problem that makes the current implementation unsafe.<br>
&gt;&gt; <br>
&gt;&gt; I see a few potential approaches to address this:<br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 1. Add dependency checking that refuses to uninstall if reve=
rse<br>
&gt;&gt; dependencies exist (similar to package managers like apt/dnf)<br>
&gt; <br>
&gt; This would make the feature useless for a significant number of<br>
&gt; packages I&#39;d say.<br>
<br>
In most cases, exactly these reverse dependencies make removal of the <br>
package desirable. Testing with and without sometimes needs manual <br>
intervention. Also I prefer clearing up the mess after testing to doing <br=
>
a full rebuild: it&#39;s less time consuming.<br>
<br>
&gt;&gt;=C2=A0 2. Implement cascade uninstall (uninstall the package and al=
l its <br>
&gt;&gt; reverse<br>
&gt;&gt; dependencies)<br>
&gt; <br>
&gt; This would probably be the logical thing, I guess?<br>
&gt; <br>
<br>
Nice to have, but is it worth the effort? This is not a tool for <br>
everyday use, and most people will know what they are doing.<br>
<br>
&gt;&gt;=C2=A0 4. Simply document this as a &quot;use at your own risk&quot=
; feature for <br>
&gt;&gt; advanced<br>
&gt;&gt; debugging scenarios<br>
&gt;&gt; <br>
&gt;&gt; I wanted to ask: would any of these approaches be acceptable for <=
br>
&gt;&gt; Buildroot?<br>
&gt;&gt; Or is the fundamental issue that without proper<br>
&gt;&gt; dependency tracking during uninstall, this feature is too dangerou=
s to<br>
&gt;&gt; include regardless of warnings/checks?<br>
&gt; <br>
&gt; This has so far been the project&#39;s opinion on this topic. But noth=
ing<br>
&gt; is set in stone forever, so we can always revisit/rediscuss things.<br=
>
<br>
I used to delete files manually, until I discovered the central <br>
packages-file-list*.txt files, and have been using a similar Python <br>
script for a few years. Shubham&#39;s approach to use the package based <br=
>
lists is better.<br>
<br>
Including the script as a build target is optional.<br>
<br>
&gt; Thomas<br>
&gt; --<br>
&gt; Thomas Petazzoni, co-owner and CEO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering and training<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
<br>
Kind regards,<br>
Andreas<br>
</blockquote></div>

--0000000000009ce781064d47a1be--

--===============3248087710014298111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3248087710014298111==--
