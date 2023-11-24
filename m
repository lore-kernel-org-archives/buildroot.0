Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E51EC61DF4
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 14:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F015615A7;
	Fri, 24 Nov 2023 14:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F015615A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dT_KJVxFVf8T; Fri, 24 Nov 2023 14:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF54F615A3;
	Fri, 24 Nov 2023 14:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF54F615A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD16A1BF271
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 14:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A078F8213C
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 14:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A078F8213C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OkWBI1VCWIYm for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 14:40:50 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5048F82143
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 14:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5048F82143
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5079f6efd64so2584360e87.2
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 06:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700836848; x=1701441648;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FFygtIS/zPdZnEFuq0jawKihszAmuvvPOqB0tCOhfyk=;
 b=SQGirZIX1vksPaeIFC3Lf/LwJ2wYjCvWagY0v+Szfc47ZHo6xPxGv2B2Wxsx4ZGa2l
 LlD2LTEr3gBt/8Zak7cfeK66q4H4tFPVNtiLf5/ftqEWO4JxH7g3watyUGuvyyYGCDW2
 wTjuXCKHxDD4dFTkvY1/L7agwmOQQ3G2HBoKZviHOSIkgHGmVEkDpQ8lpNhdmUsALUWQ
 va+EN4X4sImjyV7+CZ2DoslXfdMtR/CRZn52v2UJZFwMphA2GsQS8m3FhqZRQT8WWwnf
 u/bbezFLKajclKNthPOhk37Ce1wAeGungfxv3F4dTFWXH94osMFOec3+p1xQzs5ZRBqX
 6ycQ==
X-Gm-Message-State: AOJu0YxvQ+oCfHAMStmxhNaDMS2VYIl8hFsURlUL2bG8kDr9sYJZbRM7
 6FPuSgtgYMLrikF4gP6M78mnugIEeAVjYPjYT7A=
X-Google-Smtp-Source: AGHT+IHUjRyfm8t4jFG6U9ziHl+NcvicRvigHFccl7rtrX7H1xNVpIWSMwLpRiChZ+IggW//HOOIW3b29BoZCnpnGA0=
X-Received: by 2002:a05:6512:b9c:b0:50a:756d:4105 with SMTP id
 b28-20020a0565120b9c00b0050a756d4105mr3029273lfv.12.1700836847832; Fri, 24
 Nov 2023 06:40:47 -0800 (PST)
MIME-Version: 1.0
References: <CAPH1yshB_JnFEZQNTTmA5hbYOiX0YfsDvnUbdmy7H6TbT_T3Ag@mail.gmail.com>
 <20231124101935.2c6c9726@windsurf>
In-Reply-To: <20231124101935.2c6c9726@windsurf>
From: Dave Rathnow <drathnow@gmail.com>
Date: Fri, 24 Nov 2023 07:40:36 -0700
Message-ID: <CAPH1ysiTy2NOJoKjSp3Opuyu5YdeSOWUra9m78LXtnHOp-jRLg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700836848; x=1701441648; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FFygtIS/zPdZnEFuq0jawKihszAmuvvPOqB0tCOhfyk=;
 b=HKGU7eDxtZxXv1IFvVD6CfddGaK2lKCywda0/E8sQHtDBSDH/ksB7UHW9LcZ0okwVz
 zsDbVvJsgspoQg4h0/vHo20vuAdAPP5LoNWAWKwOjmDxlR27Lt2IvZDy/zR2OGYSwZXb
 B51OnkiGdpEyQ62eft0tLhBZUIXNXs+qi7FBD9tpohtPLaYFQmtJOjBlB/ggdLR92Inq
 s/xUVReZENlx4RDa7oNSivN0oUpAimOOCaefA21mxNfnd0F6Z67LZtuJ0sCRXFxJLOfp
 WTRmgrQ9PvFkQYvGyKTibhvKOLsRHUn/8ycCV+r4lXkb/73wMaDyDuCAKXQH5rfYimzR
 20Xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HKGU7eDx
Subject: Re: [Buildroot] Broken build
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3924790211204834836=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3924790211204834836==
Content-Type: multipart/alternative; boundary="00000000000022d0e7060ae6f006"

--00000000000022d0e7060ae6f006
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Thomas,

Thanks for the reply, I really appreciate it.  After reading Edgar's reply,
it tweaked something in my memory.  I remember pulling all the source code
from Bootlin and adding it to our local repo, so I'm almost certain it's
there. I must have forgotten to set some variable(s) that tells Buildroot
where to find it. For now, I'll leave it as is and check the build scripts
so I can make sure I set things up correctly.  If I have any problems, I'll
let you know and pull whatever I need from your repo.

Cheers,
Dave.

On Fri, Nov 24, 2023 at 2:19=E2=80=AFAM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Dave,
>
> On Thu, 23 Nov 2023 12:14:57 -0700
> Dave Rathnow <drathnow@gmail.com> wrote:
>
> > A couple of years ago, Bootln built us a kernel using Buildroot.  I too=
k
>
> And we're still around :-)
>
> > all the build scripts and source code required to build that kernel and
> > moved them to our own local git repository.  At the time everything
> > built fine, and the last time I tried--about a year ago--it was working
> but
> > I recently tried to build it and I'm getting the error below.  I don't
> have
> > the deep knowledge of Buildroot and how it obtains all its sources
> > and packages but I thought I had moved everything we needed to our loca=
l
> > repository.  Can anyone tell me if I've missed something?
> >
> > Thanks,
> > Dave.
> >
> > arget/etc/lighttpd/conf.d/mime.conf
> > >>> linux-tools  Extracting
> > >>> linux f593d9e1e347488358872bc8618180db7aca685c Downloading
>
> I can see this commit at the tip of the Linux kernel branch that we
> delivered to you many years ago. The repository still exists in our
> server, and is still accessible to you if you still have the public SSH
> key that you gave to us years ago. If not, please contact us (Bootlin)
> separately so that we can put your public SSH key and make sure you
> still have access.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000022d0e7060ae6f006
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Thomas,<div><br></div><div>Thanks for the reply, I rea=
lly appreciate it.=C2=A0 After reading Edgar&#39;s reply, it tweaked someth=
ing in my memory.=C2=A0 I remember pulling all the source code from Bootlin=
 and adding it to our local repo, so I&#39;m almost certain it&#39;s there.=
 I must have forgotten to set some variable(s) that tells Buildroot where t=
o find it. For now, I&#39;ll leave it as is and check the build scripts so =
I can make sure I set things up correctly.=C2=A0 If I have any problems, I&=
#39;ll let you know and pull whatever I need from your repo.</div><div><br>=
</div><div>Cheers,</div><div>Dave.</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 24, 2023 at 2:19=E2=80=
=AFAM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Hello Dave,<br>
<br>
On Thu, 23 Nov 2023 12:14:57 -0700<br>
Dave Rathnow &lt;<a href=3D"mailto:drathnow@gmail.com" target=3D"_blank">dr=
athnow@gmail.com</a>&gt; wrote:<br>
<br>
&gt; A couple of years ago, Bootln built us a kernel using Buildroot.=C2=A0=
 I took<br>
<br>
And we&#39;re still around :-)<br>
<br>
&gt; all the build scripts and source code required to build that kernel an=
d<br>
&gt; moved them to our own local git repository.=C2=A0 At the time everythi=
ng<br>
&gt; built fine, and the last time I tried--about a year ago--it was workin=
g but<br>
&gt; I recently tried to build it and I&#39;m getting the error below.=C2=
=A0 I don&#39;t have<br>
&gt; the deep knowledge of Buildroot and how it obtains all its sources<br>
&gt; and packages but I thought I had moved everything we needed to our loc=
al<br>
&gt; repository.=C2=A0 Can anyone tell me if I&#39;ve missed something?<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Dave.<br>
&gt; <br>
&gt; arget/etc/lighttpd/conf.d/mime.conf<br>
&gt; &gt;&gt;&gt; linux-tools=C2=A0 Extracting<br>
&gt; &gt;&gt;&gt; linux f593d9e1e347488358872bc8618180db7aca685c Downloadin=
g=C2=A0 <br>
<br>
I can see this commit at the tip of the Linux kernel branch that we<br>
delivered to you many years ago. The repository still exists in our<br>
server, and is still accessible to you if you still have the public SSH<br>
key that you gave to us years ago. If not, please contact us (Bootlin)<br>
separately so that we can put your public SSH key and make sure you<br>
still have access.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000022d0e7060ae6f006--

--===============3924790211204834836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3924790211204834836==--
