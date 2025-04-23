Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82128C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 12:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F2C6410CF;
	Wed, 23 Apr 2025 12:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCOcU3xpClap; Wed, 23 Apr 2025 12:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3074F410CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3074F410CB;
	Wed, 23 Apr 2025 12:06:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E53161BC
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 12:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D68B882108
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 12:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ohNdPOFpkrS for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 12:06:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=ct.clmsn@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10C6982107
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C6982107
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10C6982107
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 12:06:22 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-603fd257386so1315160eaf.1
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 05:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745409981; x=1746014781;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hJReO8Owrb3GV1spkeW41PpVlUsdFVzS9IyZM4+atjk=;
 b=RZyvioaCOVKcIeh8OLFUu4ZOvgTNLEcro/cMVj5jziUchCkHL3PlXDeay72q9VtsYD
 crwsoablxop6KPcnI5diNNFkumjJkayY8zhRKfHMp4wdDt3e+uFqmpL73rG3/a6wWPPR
 mBiKumoI2tawiMIwSJqnIi2PS6tEWv2tm7iG3tuKD35u8D3bSCm23rKvW+ZlU0p63j7V
 vFsJolIb0an/L5m2XDPQznnAxxmFAlpgTNjcnHUI2EQFPo7tXOs4crshhuJSC1OsIGik
 BIL8jkx7FkaOdKSx49TZH2VWKzWLaRmnCoHpiMnoOjc+3tmzhHMEaHKf0zc6lZpDympj
 n+gg==
X-Gm-Message-State: AOJu0YyuBh/7mgEtABEai3JhTi40MrFOqj8PeLlyMU1I36sODsjHeoXk
 JvI0qmsorJetoCx44vh2PI/JpMGbo2PZxdrNgNRHBP1ws/pxRCcr+lBaZGD6zLnPPX2AHecoP2M
 yVR/p9IlrZU5aZgRLBT67uHGAymkYvg==
X-Gm-Gg: ASbGncsDoS/aENWDUOE8NaXytwyFiQ8qJW3Gir4h6FcVtt82LBaLvz15QUxhKHsnVvS
 zDWNjf36pqkRMuf9L54C/z8jMUYU5F89TwkcDKoBy43xVD0inWiUJ8EoF5RLaTpblWStj3F22DL
 vqSEh+hLFnu+Qd005t+fp7LZ/QLzlC89Z8BCid5C9fs0YaCoIEJPveLg==
X-Google-Smtp-Source: AGHT+IF4Ou+vr8m35HP0DVOovwj3UNG+HFkRXttAyKVGVZYq9oGrJDf0QDKfbpoplFOXPIMRKX83GFMcR+Mfr1FBRek=
X-Received: by 2002:a05:6870:e998:b0:2d4:e101:13eb with SMTP id
 586e51a60fabf-2d526e67af7mr13077144fac.28.1745409981530; Wed, 23 Apr 2025
 05:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.3.1745064001.375107.buildroot@buildroot.org>
 <6c0f8202ef17cd38940edb4e518a218d@umbiko.net>
 <CAN4Cwatp=c58JzpGD3SZS8692m0TtYd879jON2B7D_vn=PqJcA@mail.gmail.com>
 <cf10fd11d7fe76e4614eb2a6d401fd4c@umbiko.net>
In-Reply-To: <cf10fd11d7fe76e4614eb2a6d401fd4c@umbiko.net>
From: ct clmsn <ct.clmsn@gmail.com>
Date: Wed, 23 Apr 2025 08:06:10 -0400
X-Gm-Features: ATxdqUGnLM4hZAHZjuQZg3m0rm-ouISbX2_hfhGKqkY69coA9N8ohXzAgKJ06xk
Message-ID: <CAN4CwasnPJg0uViXFxAuZembvx-HPJVEG-f9q7aD8QLM6A8SOw@mail.gmail.com>
To: Andreas Ziegler <br015@umbiko.net>
Cc: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745409981; x=1746014781; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hJReO8Owrb3GV1spkeW41PpVlUsdFVzS9IyZM4+atjk=;
 b=j8r6jbsIktoMqPzfzAxpxptoIn6qHt3K9BVI4hN5EAaKttVVisqFYLRHd0qbds5vP2
 K06xuI5mvEAU7Pk2VPKp4jI0t/qqICJzYcUQiygMm6X2MSdqIvlmimTRJ3grPxG2nUMD
 r6XqmDOFlBfhKQhqIAbCUVIxmTnN875oxMpuZ67IirzB9wKI6f/nUxVcSVnX49rk5wH8
 jJJNCVc18P7mfgXgV4VVedUX23ojvmZwIsNYZL/4sZycVg40uVCnOeWD4g2SA8R5WQLd
 XAZiWfnngHpd+XWy9POMGai5C0l1feIk9cbvIKPvwEhNwzXl+8590Ztr/ocgoGU4nhwo
 150A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j8r6jbsI
Subject: Re: [Buildroot] kernel install from buildroot
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
Content-Type: multipart/mixed; boundary="===============6454532252882955297=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6454532252882955297==
Content-Type: multipart/alternative; boundary="000000000000efc736063370edd7"

--000000000000efc736063370edd7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Excellent, just like the standard routine I'm familiar with - thanks!

ct

On Wed, Apr 23, 2025, 1:15 AM Andreas Ziegler <br015@umbiko.net> wrote:

> Hi Chris,
>
> [re-added the mailing list]
>
> On 2025-04-22 14:07, ct clmsn wrote:
> > Andreas,
> >
> > Thanks for the prompt response; looks like I miscommunicated the
> > situation.
> > I've build the kernel on the nvme-ssd that is running the kernel I'm
> > hoping
> > to replace with the buildroot compiled kernel. I'm expecting to just
> > copy
> > the portions from /boot, /lib/modules, and /lib/firmware from the
> > `buildroot/output/target` directory into the appropriate places in the
> > nvme-sdd's '/' (root) directory. Hope this clarifies the situation.
>
> lib/firmware is nice-to-have, but not mandatory; you can update
> linux-firmware independently of the kernel.
>
> For a new kernel, you need bzImage and lib/modules/$(uname -r). The
> location of lib/modules is on the root partition. Depending on the boot
> configuration, bzImage may reside in /boot or on a separate boot
> partition. Check your grub.cfg.
>
> If you keep the old kernel and create an additional boot entry for the
> new one, you have a fallback solution.
>
> Kind regards,
> Andreas
>
> > v/r,
> > Chris
> >
> > On Sat, Apr 19, 2025 at 11:26=E2=80=AFAM Andreas Ziegler <br015@umbiko.=
net>
> > wrote:
> >
> >> Hi ct,
> >>
> >> On 2025-04-18 16:03, ct clmsn wrote:
> >> >
> >> > Hello,
> >> >
> >> > This should be a pretty trivial question mostly asking to make sure =
my
> >> > assumptions are correct.
> >> >
> >> > I'm doing hardware testing with an SBC. I have an SBC that is
> >> > configured to
> >> > boot from an NVME-SSD. A vendor encouraged me to use buildroot to
> >> > compile a
> >> > new kernel. My preference would be to just update the existing
> >> > environment
> >> > on my SBC's NVME-SSD.
> >> >
> >> > Given `buildroot/output/target` contains the compiled linux kernel
> with
> >> > firmware, which directories or files should I be concerned with
> copying
> >> > over on the NVME-SSD?
> >>
> >> Buildroot copies the final kernel image to output/images. In addition
> >> you need the content of output/target/lib/modules.
> >>
> >> Kind regards,
> >> Andreas
> >>
> >> > Thanks in advance for the assistance and confirming my
> >> > back-of-the-envelope
> >> > verification.
> >> >
> >> > v/r,
> >> > ct
> >>
>

--000000000000efc736063370edd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Excellent, just like the standard routine I&#39;m familia=
r with - thanks!<div dir=3D"auto"><br></div><div dir=3D"auto">ct</div></div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Wed, Apr 23, 2025, 1:15 AM Andreas Ziegler &lt;<a href=
=3D"mailto:br015@umbiko.net">br015@umbiko.net</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Hi Chris,<br>
<br>
[re-added the mailing list]<br>
<br>
On 2025-04-22 14:07, ct clmsn wrote:<br>
&gt; Andreas,<br>
&gt; <br>
&gt; Thanks for the prompt response; looks like I miscommunicated the <br>
&gt; situation.<br>
&gt; I&#39;ve build the kernel on the nvme-ssd that is running the kernel I=
&#39;m <br>
&gt; hoping<br>
&gt; to replace with the buildroot compiled kernel. I&#39;m expecting to ju=
st <br>
&gt; copy<br>
&gt; the portions from /boot, /lib/modules, and /lib/firmware from the<br>
&gt; `buildroot/output/target` directory into the appropriate places in the=
<br>
&gt; nvme-sdd&#39;s &#39;/&#39; (root) directory. Hope this clarifies the s=
ituation.<br>
<br>
lib/firmware is nice-to-have, but not mandatory; you can update <br>
linux-firmware independently of the kernel.<br>
<br>
For a new kernel, you need bzImage and lib/modules/$(uname -r). The <br>
location of lib/modules is on the root partition. Depending on the boot <br=
>
configuration, bzImage may reside in /boot or on a separate boot <br>
partition. Check your grub.cfg.<br>
<br>
If you keep the old kernel and create an additional boot entry for the <br>
new one, you have a fallback solution.<br>
<br>
Kind regards,<br>
Andreas<br>
<br>
&gt; v/r,<br>
&gt; Chris<br>
&gt; <br>
&gt; On Sat, Apr 19, 2025 at 11:26=E2=80=AFAM Andreas Ziegler &lt;<a href=
=3D"mailto:br015@umbiko.net" target=3D"_blank" rel=3D"noreferrer">br015@umb=
iko.net</a>&gt; <br>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; Hi ct,<br>
&gt;&gt; <br>
&gt;&gt; On 2025-04-18 16:03, ct clmsn wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hello,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This should be a pretty trivial question mostly asking to mak=
e sure my<br>
&gt;&gt; &gt; assumptions are correct.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;m doing hardware testing with an SBC. I have an SBC tha=
t is<br>
&gt;&gt; &gt; configured to<br>
&gt;&gt; &gt; boot from an NVME-SSD. A vendor encouraged me to use buildroo=
t to<br>
&gt;&gt; &gt; compile a<br>
&gt;&gt; &gt; new kernel. My preference would be to just update the existin=
g<br>
&gt;&gt; &gt; environment<br>
&gt;&gt; &gt; on my SBC&#39;s NVME-SSD.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Given `buildroot/output/target` contains the compiled linux k=
ernel with<br>
&gt;&gt; &gt; firmware, which directories or files should I be concerned wi=
th copying<br>
&gt;&gt; &gt; over on the NVME-SSD?<br>
&gt;&gt; <br>
&gt;&gt; Buildroot copies the final kernel image to output/images. In addit=
ion<br>
&gt;&gt; you need the content of output/target/lib/modules.<br>
&gt;&gt; <br>
&gt;&gt; Kind regards,<br>
&gt;&gt; Andreas<br>
&gt;&gt; <br>
&gt;&gt; &gt; Thanks in advance for the assistance and confirming my<br>
&gt;&gt; &gt; back-of-the-envelope<br>
&gt;&gt; &gt; verification.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; v/r,<br>
&gt;&gt; &gt; ct<br>
&gt;&gt; <br>
</blockquote></div>

--000000000000efc736063370edd7--

--===============6454532252882955297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6454532252882955297==--
