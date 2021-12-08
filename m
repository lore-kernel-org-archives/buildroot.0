Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE6FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 10:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B8241DC0;
	Wed,  8 Dec 2021 10:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7GY7_q2lXPD6; Wed,  8 Dec 2021 10:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4874C41DBE;
	Wed,  8 Dec 2021 10:37:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED1CE1BF362
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 10:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB44484C3E
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 10:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCGscmcLsbCE for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 10:37:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3B1F84C3D
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 10:37:15 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id c32so4744004lfv.4
 for <buildroot@buildroot.org>; Wed, 08 Dec 2021 02:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C27aPpZdHq57WMEEI8RJ8MMd/G7pt121lia4lBq6O54=;
 b=dxFyvtPTkyiI7wQd+iJOizJunHisgNUt+gGIA2rqBNaPCIAp9mb9tQNMhQZmYgaOJk
 XgMOHT7K9fVgfQ9l4uIJWteiCDcrnZHkuw/65ytut4daGrCyGM/R1s45f4vqYpvaPUNb
 7I9hhOBw5xkCquPLg+qUWWHnsy5f5bAMjetVU8aql1KRd0gv79+mkqorqAjwsj5zIEiN
 Z2vzF72Y1Ykr4LTfx6tViWTT8zcbppYEovSkTs96uzWBKtUd3GoeITO8Ix55UOWrHIke
 jA9U/3S9Z0OrBjG8Ne6ROowrcRbRsazqQxhjPdWYkwydev6JSEJm0WVCuGgwRxH8HJqL
 25lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C27aPpZdHq57WMEEI8RJ8MMd/G7pt121lia4lBq6O54=;
 b=KxsuqQOf8tw+i2zAhCJuNXM4UTOtnkGILPX+tYnwm/fcVAbLfw/9c+kvreRq8FIfnL
 2RMPleQ+Iv94Wx2W2eGWqVSksOIRtcDR9AoSV/BbR/maJ2aSSKhblkhe4rPJ1wIFSgaM
 KZFbx+jhwQdaE6o+AHcEHEgyLcQJK2R3zRmSIvojxmHr0pApyEy8ibL1AR2eIq6oyIVB
 33sjWuYwTKFxOJ370dTN8wv7CkUiPT97DX+q/mWu1ZAmGC2D8BWUE0V5oGMZnJR02myy
 95j/tfDeRlBv5qCZ3r4ZKJ/qYtnzWhTCX5k+6VVdc64y/fMSeS4s4TaZ164Rm3lNk9ME
 SBOw==
X-Gm-Message-State: AOAM531KGpYFlWtL+ohw9NrLdsoG4C3NojydTkRYAG7iDGKfUQ2S9bIx
 fCVhszyq9KfYcvyGMa+zhQ1xM5JoWbvv/cZOf6S9VQ==
X-Google-Smtp-Source: ABdhPJyWmlArL7UtbQSsBHw9ybuoMPOGv74FVD/w7MJLLESXu/b9Z9GA0E0sRq7gopew2D7nHusEZgcL0MGVKTXB40E=
X-Received: by 2002:a05:6512:2603:: with SMTP id
 bt3mr44447582lfb.202.1638959833454; 
 Wed, 08 Dec 2021 02:37:13 -0800 (PST)
MIME-Version: 1.0
References: <CAJPV9MqnSviULFaVRO6m00bF-bfysMQ_Z9qWQiwzx+E1u-iLqg@mail.gmail.com>
 <48949c5e-6a37-13c5-bad9-cb555d344cf8@mind.be>
In-Reply-To: <48949c5e-6a37-13c5-bad9-cb555d344cf8@mind.be>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Wed, 8 Dec 2021 12:37:02 +0200
Message-ID: <CAJPV9MpVMTdZ=m6+0Oa42VNwdkDhBo8OdLerB2tZG169rKFxmw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] Arm opcodes support
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7579077523572498838=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7579077523572498838==
Content-Type: multipart/alternative; boundary="000000000000ad953805d2a01210"

--000000000000ad953805d2a01210
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 8, 2021 at 12:30 PM Arnout Vandecappelle <arnout@mind.be> wrote=
:

>
>
> On 07/12/2021 12:27, Jos=C3=A9 Pekkarinen wrote:
> >
> >     Hi,
> >
> >     I hit the following issue making a
> >
> > package for avocado framework. I wonder
> > what other packages do when this is hit.
> >
> > ../src/arm/sysv.S: Assembler messages:
> > ../src/arm/sysv.S:104: Error: selected processor does not support ARM
> opcodes
>
>   This means that the package doesn't support the specific ARM
> architecture you
> are building for. If you're lucky, there's some kind of configure option
> to
> specify the (sub)architecture and the package behaves correctly with that=
.
> If
> you're not lucky, you need to put architecture exceptions for the package=
.
>
>   It's very annoying because we of course test only a very limited subset
> of all
> the possible subarchitectures, so anything that falls out of test-pkg
> range is
> likely to be wrong...
>

Fortunately for my case it turns out the packages

required dynamic libraries so this platform got out of the
equation, but I was curious how to do so.

Thanks!

Jos=C3=A9.

--000000000000ad953805d2a01210
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 8, 2021 at 12:30 PM Arnou=
t Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 07/12/2021 12:27, Jos=C3=A9 Pekkarinen wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I hit the following issue making a<br>
&gt; <br>
&gt; package for avocado framework. I wonder<br>
&gt; what other packages do when this is hit.<br>
&gt; <br>
&gt; ../src/arm/sysv.S: Assembler messages:<br>
&gt; ../src/arm/sysv.S:104: Error: selected processor does not support ARM =
opcodes<br>
<br>
=C2=A0 This means that the package doesn&#39;t support the specific ARM arc=
hitecture you <br>
are building for. If you&#39;re lucky, there&#39;s some kind of configure o=
ption to <br>
specify the (sub)architecture and the package behaves correctly with that. =
If <br>
you&#39;re not lucky, you need to put architecture exceptions for the packa=
ge.<br>
<br>
=C2=A0 It&#39;s very annoying because we of course test only a very limited=
 subset of all <br>
the possible subarchitectures, so anything that falls out of test-pkg range=
 is <br>
likely to be wrong...<br></blockquote><div><br></div></div><blockquote styl=
e=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote">=
<div>Fortunately for my case it turns out the packages</div></div></blockqu=
ote>required dynamic libraries so this platform got out of the<div>equation=
, but I was curious how to do so.</div><div><br></div><blockquote style=3D"=
margin:0 0 0 40px;border:none;padding:0px"><div>Thanks!</div><div><br></div=
></blockquote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0p=
x"><div>Jos=C3=A9.=C2=A0</div></blockquote></div>

--000000000000ad953805d2a01210--

--===============7579077523572498838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7579077523572498838==--
