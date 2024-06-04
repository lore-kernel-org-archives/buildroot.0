Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653C9C25B74
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 05:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01991408EF;
	Tue,  4 Jun 2024 05:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mM-RGqaep9R; Tue,  4 Jun 2024 05:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B4C5408FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B4C5408FE;
	Tue,  4 Jun 2024 05:30:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC2311BF33B
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 05:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8E424026F
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 05:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQmZkLOSIpTP for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 05:30:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB6C540106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB6C540106
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB6C540106
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 05:30:05 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-35e0eb3efd0so582288f8f.0
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 22:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717479003; x=1718083803;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZfLnuXRDLoenNolJiMnPMVtjtrQxTTSNf68pzRj8rYo=;
 b=FOHuku6HLRt/HerJOhcxOrv/G6QEBaTnaMP9t4gsTqaalkTZiSYj9pWyintBvMAWYq
 jhtaT7qscESv3gbS3dUgmRCYO6qTnvqy4rze6YgXkTlG2tlUwL6qwFq3bTBEPd+QIyZK
 8M0Ii0B8Hs0z0y0DDqvuiN+u7nrz6ccs0OHUju9yuOPgftNW2EIqyZl/4XR2Q59ADiS8
 in/2hD/rXP5vP8PPL9qBQV/K60SAYmrnYt4k7NTXxybblKdrcEs50FxJC6y3T2Y6UOBO
 On+zqlFmnaeWlg49FDeX3KArCdFmHUACjtzOZPoSemsCpi77NsXdopE/w5o430AKZD5i
 E0Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWAUIpTpzDJHLME2goOBh4+QA91fYpLyWsECuC+Ngm8So9O8iLdfwHiABblvGOj7/SFlPmturC7tZkvTZQQi4AtT41fg4NyQ==
X-Gm-Message-State: AOJu0YyuyCLHzR6LtQDXGUBGpUh/722fCxzwj1lQPkvSmpS4T14O0RmC
 +MEwv/sWQW44hWWcmiDr9LevcYpeQujv/m2NokFKfeIleNljHjx0u3nRVkoyuxdCwOcuGjqvjVe
 hhSMJcab9ydA9fXYd2QegPtNZYrFgKw==
X-Google-Smtp-Source: AGHT+IFXMpskqxK5VesCoIVnHAnab9xig/9jfok1z261spOtbPLf2RzeyB4AqQumbIG65ii0ZEw17i8VpcPbsOnRbkY=
X-Received: by 2002:adf:b319:0:b0:354:f9f0:a7ed with SMTP id
 ffacd0b85a97d-35e0f30bd3amr6903008f8f.47.1717479003225; Mon, 03 Jun 2024
 22:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240131-kernel_dir-v2-1-555eeeee1722@microchip.com>
 <20240212225953.79488771@windsurf>
 <f9583858-aa22-491a-adc3-c951892277a9@mind.be>
In-Reply-To: <f9583858-aa22-491a-adc3-c951892277a9@mind.be>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 4 Jun 2024 07:29:51 +0200
Message-ID: <CA+TH9V=QhNiJFB-vRCo+TV8JLzhYwQPxuT89xJDLLdFajO6KOg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717479003; x=1718083803; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZfLnuXRDLoenNolJiMnPMVtjtrQxTTSNf68pzRj8rYo=;
 b=DH+xnXyVCu9PHJ7ksmpwqGWNdgSqAjh2PbCNyPfQ/rI0HwVBl7Ic01n3az2JiM/p0e
 QygZrNBsEQoSRNZ0cAVPU4XJKzKlHWMvBZkaFDm9q2tGFoBC1YUBSBLX/IQRmxStWOYR
 eiJDJjyZjUe0M+KwUKllZJYlAyyYqEV6qvYzjQhhYja+nQCjqZTO6GoPbYa+ThsjbE0c
 DAqHUj262cjOlIhZv94a7ilugjgC5puQfTlOsInmGaDyL5GvQ78dm04WqtSlGo9raxim
 W4gT1qeOBH+3x+efrgM8OuwHPbO+AmP53uOF7PWj9GNKGkBMb8yWY+sg662ztuK5bCd0
 RnIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DH+xnXyV
Subject: Re: [Buildroot] [PATCH v2] package/environment-setup: add variable
 KERNEL_DIR alongside KERNELDIR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Nayab Sayed <nayabbasha.sayed@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nayab Sayed via buildroot <buildroot@buildroot.org>,
 Romain Naour <romain.naour@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============2736593852181530686=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2736593852181530686==
Content-Type: multipart/alternative; boundary="000000000000e585b5061a09bd0c"

--000000000000e585b5061a09bd0c
Content-Type: text/plain; charset="UTF-8"

Il mar 13 feb 2024, 09:23 Arnout Vandecappelle <arnout@mind.be> ha scritto:

>
>
> On 12/02/2024 22:59, Thomas Petazzoni wrote:
> > Hello Nayab,
> >
> > On Wed, 31 Jan 2024 23:48:28 +0530
> > Nayab Sayed via buildroot <buildroot@buildroot.org> wrote:
> >
> >> Update host environment setup helper script to incorporate the variable
> >> KENREL_DIR alongside the existing KERNELDIR. This adjustment ensures
> >> consistency, as some projects utilize KERNELDIR while others use
> KERNEL_DIR.
> >>
> >> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
> >
> > Thanks for this new iteration, but on my side, I'm tempted to reject
> > this patch, and actually to remove the support for KERNELDIR as well.
> >
> > Indeed, even Angelo, who added the environment-setup script was not
> > able to provide a solid reason for exporting KERNELDIR in the first
> > place. I don't think there is any standard, or somewhat standard
> > variable to point to the Linux kernel source directory.
> >
> > I'm fine with environment-setup exposing CC, LD, CFLAGS, LDFLAGS, or
> > even CROSS_COMPILE as these are reasonably standardized by various
> > build systems. But KERNELDIR or KERNEL_DIR are not, and the simple fact
> > that both would be needed/useful is a clear hint of that. The whole
> > thing I didn't like in the first place with environment-setup is the
> > fact that it exports a mixed bag of somewhat random environment
> > variables, and exposing both KERNELDIR and KERNEL_DIR clearly goes
> > further into this direction in my opinion.
>
>   Well, without an exported KERNELDIR, it will be very hard to build
> kernel
> modules outside of buildroot (and the whole point of this
> environment-setup
> thing is to make it easier to build stuff outside of buildroot). Indeed,
> output/build/linux-* will match stuff like linux-pam as well.
>

Exactly. I also think the main idea here is to have a simple way to
externally compile something or test if it cross compiles under buildroot.

  That said, I agree that exporting both KERNELDIR and KERNEL_DIR sounds a
> bit
> over the top.
>

I do not agree here: those two variables are almost the standard and we are
not exactly polluting the environment with a variable more.

A user can opt-in to use the environment-setup script, so he will be ok
having it exporting some variable to his current environment.

I think it will make the script only a little bit more useful!


>   Regards,
>   Arnout
>

--000000000000e585b5061a09bd0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 13 feb 2024, 09:23 Arnout Vandecappelle &lt;<a =
href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt; ha scritto:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
<br>
On 12/02/2024 22:59, Thomas Petazzoni wrote:<br>
&gt; Hello Nayab,<br>
&gt; <br>
&gt; On Wed, 31 Jan 2024 23:48:28 +0530<br>
&gt; Nayab Sayed via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.or=
g" target=3D"_blank" rel=3D"noreferrer">buildroot@buildroot.org</a>&gt; wro=
te:<br>
&gt; <br>
&gt;&gt; Update host environment setup helper script to incorporate the var=
iable<br>
&gt;&gt; KENREL_DIR alongside the existing KERNELDIR. This adjustment ensur=
es<br>
&gt;&gt; consistency, as some projects utilize KERNELDIR while others use K=
ERNEL_DIR.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Nayab Sayed &lt;<a href=3D"mailto:nayabbasha.sayed@=
microchip.com" target=3D"_blank" rel=3D"noreferrer">nayabbasha.sayed@microc=
hip.com</a>&gt;<br>
&gt; <br>
&gt; Thanks for this new iteration, but on my side, I&#39;m tempted to reje=
ct<br>
&gt; this patch, and actually to remove the support for KERNELDIR as well.<=
br>
&gt; <br>
&gt; Indeed, even Angelo, who added the environment-setup script was not<br=
>
&gt; able to provide a solid reason for exporting KERNELDIR in the first<br=
>
&gt; place. I don&#39;t think there is any standard, or somewhat standard<b=
r>
&gt; variable to point to the Linux kernel source directory.<br>
&gt; <br>
&gt; I&#39;m fine with environment-setup exposing CC, LD, CFLAGS, LDFLAGS, =
or<br>
&gt; even CROSS_COMPILE as these are reasonably standardized by various<br>
&gt; build systems. But KERNELDIR or KERNEL_DIR are not, and the simple fac=
t<br>
&gt; that both would be needed/useful is a clear hint of that. The whole<br=
>
&gt; thing I didn&#39;t like in the first place with environment-setup is t=
he<br>
&gt; fact that it exports a mixed bag of somewhat random environment<br>
&gt; variables, and exposing both KERNELDIR and KERNEL_DIR clearly goes<br>
&gt; further into this direction in my opinion.<br>
<br>
=C2=A0 Well, without an exported KERNELDIR, it will be very hard to build k=
ernel <br>
modules outside of buildroot (and the whole point of this environment-setup=
 <br>
thing is to make it easier to build stuff outside of buildroot). Indeed, <b=
r>
output/build/linux-* will match stuff like linux-pam as well.<br></blockquo=
te></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Exactly. I als=
o think the main idea here is to have a simple way to externally compile so=
mething or test if it cross compiles under buildroot.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
=C2=A0 That said, I agree that exporting both KERNELDIR and KERNEL_DIR soun=
ds a bit <br>
over the top.<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I do not agree here: those two variables are almost the standa=
rd and we are not exactly polluting the environment with a variable more.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">A user can opt-in to use =
the environment-setup script, so he will be ok having it exporting some var=
iable to his current environment.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I think it will make the script only a little bit more useful!</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
</blockquote></div></div></div>

--000000000000e585b5061a09bd0c--

--===============2736593852181530686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2736593852181530686==--
