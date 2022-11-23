Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9FDC4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28CA6610A0;
	Wed, 23 Nov 2022 21:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28CA6610A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZPZT6lSm-s7; Wed, 23 Nov 2022 21:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D82460BC2;
	Wed, 23 Nov 2022 21:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D82460BC2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B32591BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E95181DFE
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E95181DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQgcROZ-NVy2 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:42:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F200581DE8
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F200581DE8
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:42:24 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id v7so11657wmn.0
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 13:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F//nJA6rfOi9uu3MMMpyoDfNPOetRJ6nM/78IfQbzIY=;
 b=gl/E48bjqFADhtkmL3kxad/aWqwQAQP6xbwhxuPZ567MHGkR/iOexWq1VDeP4vWYKx
 RvzNshudWX/6Yc3khvw7HEv9NchhMOi9dmjbjVyvfOF341lJ6eD0kYqMoXWVfnWWGcIX
 ZYkUwtqqIRpRbveufu0+jmOux/B35/Tc0SpqBgETDg2IwRUu7uV6wNOHljsfKVKPghhM
 YYu6KcTmd1kFIyiF3MHl1CBxCDE2K0Tf1gAB3YhuAfeaYYmwKYUpmjXBEbRYHwQoEETY
 URoJJ5hf8BExIqrnbNxuC42BE1WDrkK+dNmJB+WH4uVce/mi1T1lT+2htZ1gOpTIcREA
 geDw==
X-Gm-Message-State: ANoB5pnViZzD2DxetQNoIBF4qI1vz3SShrK4dov9tCoTVPngM5m+BABY
 q87mxbmHC7OvQhYn3aRUzTTwY1LHv2xCJkFVbfvAMvO2QPawWA==
X-Google-Smtp-Source: AA0mqf4jmf6acEPbNEBk4M15K/vemxK4Sv66VQuoAMmmKapDSjn/eDKSxgZAr3kUQusZwjAgAccp4hwOp10SLpqduOI=
X-Received: by 2002:a05:600c:538d:b0:3d0:47c:9fe9 with SMTP id
 hg13-20020a05600c538d00b003d0047c9fe9mr7854549wmb.40.1669239743124; Wed, 23
 Nov 2022 13:42:23 -0800 (PST)
MIME-Version: 1.0
References: <CAP_a2zr1FbRNYf12d+42tPZ3xQrthddMc7pajaMC7ZA94aP5qQ@mail.gmail.com>
 <20221123151413.655df990@windsurf>
In-Reply-To: <20221123151413.655df990@windsurf>
From: Michael Despault <mike@wewearmanyhats.com>
Date: Wed, 23 Nov 2022 13:42:11 -0800
Message-ID: <CAP_a2zr1LQtsGPG+Qoy41LT-VreK7=Jon4OsjNO2jgSoEDA1DQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wewearmanyhats-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F//nJA6rfOi9uu3MMMpyoDfNPOetRJ6nM/78IfQbzIY=;
 b=ESziXdfkvAPjYQiXNEns8iZblDAjQ0zWs7N+nAWIJCZR1CphA7VFc1hNuq1EOLvzFt
 /W4mYrYgao66wcXwCoLjWHELu0rS/Rw0sMdhifjhA71RVikP9H7NJtdyyVm8N44nelR8
 3+xG9xWxpotbLBdF/7bNTfrt1a9SSqF3+GCVeU/huRY8LLh5W9JDBjo+eBlhATFCfE5D
 PVKM5+p7rH9pvNnwtyi6HMQZ18QBBFZktHcx0fz6rWXeTej9RP81r88J+p34/SlGaCGq
 9o2Dzjk7yfyFe4MeermRjQqvhq6lo/K8SpE8v7CYQkl+avslVFZSsRj+e97XOpPacM4b
 x/jQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wewearmanyhats-com.20210112.gappssmtp.com
 header.i=@wewearmanyhats-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ESziXdfk
Subject: Re: [Buildroot] defconfig with wayland support?
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
Content-Type: multipart/mixed; boundary="===============5178552225023208482=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5178552225023208482==
Content-Type: multipart/alternative; boundary="000000000000ef2a9905ee2a29d7"

--000000000000ef2a9905ee2a29d7
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

My goal is to get Wayland running on the rk3399 SoC, which is an AArch64
architecture.  The GPU is a Mali-T860.  It seems this is indeed possible,
based on this article:
https://www.collabora.com/news-and-blog/blog/2019/08/06/rockpi-panfrost-wayland/

So I'd be using Panfrost I suppose.

*Mike Despault*
*CEO*
https://wewearmanyhats.com/


On Wed, 23 Nov 2022 at 06:14, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Michael,
>
> On Tue, 22 Nov 2022 16:46:54 -0800
> Michael Despault <mike@wewearmanyhats.com> wrote:
>
> > I'm struggling to get a buildroot generated system up and running that
> has
> > working wayland support.  My primary goal is simply to be able to get an
> > embedded system that can run and display wayland applications, using the
> > buildroot system.  I've found examples of other configs that claim to
> have
> > X11 support, but nothing on wayland.  Poking around in "make menuconfig"
> > I've done what I can to enable any wayland/weston related options, but
> > currently I'm hitting this build error:
> >
> > Run-time dependency libdrm found: NO (tried pkgconfig and cmake)
> > output/build/wlroots-0.14.1/meson.build:99:0: ERROR: Dependency "libdrm"
> > not found, tried pkgconfig and cmake
> >
> > This happens when I try and build meson.  Has anyone had success getting
> an
> > embedded system (via buildroot) going with wayland working out of the
> box?
> > Hoping someone would be able to share their defconfig file with the
> > appropriate options, or at least share the essential components to enable
> > in make menuconfig.  Barebones is fine and not concerned so much about
> > architecture right now, but currently testing on X86_64 with the intent
> to
> > target aarch64 eventually.
>
> There is one critical piece of information that you forgot to provide:
> what is your HW platform. Indeed, depending on which GPU it has, the
> Buildroot configuration will have to be different to provide the right
> OpenGL implementation. It's not possible to provide a "Wayland
> configuration" that works everywhere.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000ef2a9905ee2a29d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas,<div><br></div><div>My goal is to get Wayland ru=
nning on the rk3399 SoC, which is an AArch64 architecture.=C2=A0 The GPU is=
 a Mali-T860.=C2=A0 It seems this is indeed possible, based on this article=
:=C2=A0<a href=3D"https://www.collabora.com/news-and-blog/blog/2019/08/06/r=
ockpi-panfrost-wayland/">https://www.collabora.com/news-and-blog/blog/2019/=
08/06/rockpi-panfrost-wayland/</a></div><div><br></div><div>So I&#39;d be u=
sing Panfrost I suppose.</div><div><br clear=3D"all"><div><div dir=3D"ltr" =
class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"lt=
r"><div style=3D"color:rgb(0,0,0);font-family:&quot;helvetica neue&quot;,he=
lvetica,arial,sans-serif;line-height:19.5px"><b>Mike Despault</b></div><div=
 style=3D"color:rgb(0,0,0);font-family:&quot;helvetica neue&quot;,helvetica=
,arial,sans-serif;line-height:19.5px"><i>CEO</i></div><div style=3D"color:r=
gb(0,0,0);font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif=
;line-height:19.5px"><a href=3D"https://wewearmanyhats.com/" target=3D"_bla=
nk">https://wewearmanyhats.com/</a><br></div></div></div></div><br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, 23 Nov 2022 at 06:14, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.p=
etazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hello Michael,<br>
<br>
On Tue, 22 Nov 2022 16:46:54 -0800<br>
Michael Despault &lt;<a href=3D"mailto:mike@wewearmanyhats.com" target=3D"_=
blank">mike@wewearmanyhats.com</a>&gt; wrote:<br>
<br>
&gt; I&#39;m struggling to get a buildroot generated system up and running =
that has<br>
&gt; working wayland support.=C2=A0 My primary goal is simply to be able to=
 get an<br>
&gt; embedded system that can run and display wayland applications, using t=
he<br>
&gt; buildroot system.=C2=A0 I&#39;ve found examples of other configs that =
claim to have<br>
&gt; X11 support, but nothing on wayland.=C2=A0 Poking around in &quot;make=
 menuconfig&quot;<br>
&gt; I&#39;ve done what I can to enable any wayland/weston related options,=
 but<br>
&gt; currently I&#39;m hitting this build error:<br>
&gt; <br>
&gt; Run-time dependency libdrm found: NO (tried pkgconfig and cmake)<br>
&gt; output/build/wlroots-0.14.1/meson.build:99:0: ERROR: Dependency &quot;=
libdrm&quot;<br>
&gt; not found, tried pkgconfig and cmake<br>
&gt; <br>
&gt; This happens when I try and build meson.=C2=A0 Has anyone had success =
getting an<br>
&gt; embedded system (via buildroot) going with wayland working out of the =
box?<br>
&gt; Hoping someone would be able to share their defconfig file with the<br=
>
&gt; appropriate options, or at least share the essential components to ena=
ble<br>
&gt; in make menuconfig.=C2=A0 Barebones is fine and not concerned so much =
about<br>
&gt; architecture right now, but currently testing on X86_64 with the inten=
t to<br>
&gt; target aarch64 eventually.<br>
<br>
There is one critical piece of information that you forgot to provide:<br>
what is your HW platform. Indeed, depending on which GPU it has, the<br>
Buildroot configuration will have to be different to provide the right<br>
OpenGL implementation. It&#39;s not possible to provide a &quot;Wayland<br>
configuration&quot; that works everywhere.<br>
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

--000000000000ef2a9905ee2a29d7--

--===============5178552225023208482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5178552225023208482==--
