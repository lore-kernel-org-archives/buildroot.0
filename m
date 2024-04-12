Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B068C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 16:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1EB28236A;
	Fri, 12 Apr 2024 16:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXV1B0eWoKIh; Fri, 12 Apr 2024 16:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 980CC8236B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 980CC8236B;
	Fri, 12 Apr 2024 16:02:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D31B91BF42E
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 16:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF7E140645
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxfP7HHkBsm8 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 16:02:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.41;
 helo=mail-lf1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76CCC405DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76CCC405DD
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76CCC405DD
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 16:02:24 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-516d4d80d00so1417512e87.0
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 09:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712937742; x=1713542542;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/r4yjiv+VlJ9Kjo07vcaMUrRM1EkqldPMXP7V7bqjxo=;
 b=KVPUHbIpyDfrycPHZoWZ1OdlrjZ0p6Ph2DFA/XicZ6SlDexJRGmm9txoAdcWjj7VM0
 VLg9iNiX2LnMzOG15OJ6q5KlULUBL4EkB82jvhDYVkDVsTN4m0dejZ3YKLnWATkAgHrh
 QbNlRntsUDhs/fg/tQ3UF+GXJKuK410yHSoyewFNboTgQIPt/ntHO7KGLkqpL5UwtoXS
 82zt0qDxjf3QnaoSJQ2G+fVIFfljhNcxoYEkOOqR087KxIkVIXOoBtAR1FDkYL77ysQ8
 yYc/gs6ezDc0P/V+eMYlmz+L6I1SAAfd/ZOdFYwvgLP3NrRg5yFYJ90HPooJsRFVCW3y
 9hiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUFcG1JTNv++9ykbXI5Frkz9OLgEs3OO9agD7vue/4zII2OuHNzVNq2D7hhcYRtN9Y/gKUBDuruQE29PsF8Xm1hGoyQ/oNPA==
X-Gm-Message-State: AOJu0YzShP6/GrxY514pbA8rrgeQWSozv7EGqfd/ve2/l7k39QrOWXZT
 iB2Smo8ycVEgkidhTjfYf+k0spcVPbE55/s27cNZA+bueRbUEMBUfHnmz78l
X-Google-Smtp-Source: AGHT+IEh6dJ05BeSfwySBt8T7Q0Urez+JyzPSgYtNIJaQqpYNGmpWKGO1W3kvM/vJVzkwM7YI79Owg==
X-Received: by 2002:ac2:4282:0:b0:513:ec2a:8fd1 with SMTP id
 m2-20020ac24282000000b00513ec2a8fd1mr1869787lfh.47.1712937741364; 
 Fri, 12 Apr 2024 09:02:21 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b005186d6a6923sm396760lff.50.2024.04.12.09.02.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 09:02:20 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-516d1c8dc79so1405379e87.1
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 09:02:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX7RG3TWWzAQJi15X4mlhY6ubpEeAlF/iQ9M6ivBmdpIprNpfDOs0HVHoVHz3GNqONDNX9bdLtpKCMVW+MJIyRjlwbW7IE/qg==
X-Received: by 2002:a19:f01a:0:b0:518:6ee8:3e2 with SMTP id
 p26-20020a19f01a000000b005186ee803e2mr2131125lfc.24.1712937740678; Fri, 12
 Apr 2024 09:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240401183930.2557159-2-thomas@devoogdt.com>
 <20240403171424.44580-1-thomas@devoogdt.com>
 <20240403171424.44580-2-thomas@devoogdt.com>
 <20240404013345.GB2557385@igalia.com>
 <20240412104510.GB1350651@igalia.com>
In-Reply-To: <20240412104510.GB1350651@igalia.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Fri, 12 Apr 2024 18:02:08 +0200
X-Gmail-Original-Message-ID: <CACXRmJhRXXUUGFz=P9gOhVkqtAMePE4xgDg8rMNafuPMDWU3nQ@mail.gmail.com>
Message-ID: <CACXRmJhRXXUUGFz=P9gOhVkqtAMePE4xgDg8rMNafuPMDWU3nQ@mail.gmail.com>
To: Adrian Perez de Castro <aperez@igalia.com>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v2 2/2] package/webkitgtk: bump to 2.44.0
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2804584187593368739=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2804584187593368739==
Content-Type: multipart/alternative; boundary="0000000000008e47b00615e865d5"

--0000000000008e47b00615e865d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


I will push a new patch set if I'm back home.
Currently on the ski slopes ;-)


Kr,

Thomas

Op vr 12 apr. 2024 09:45 schreef Adrian Perez de Castro <aperez@igalia.com>=
:

> Hello again,
>
> On Thu, 04 Apr 2024 01:33:45 +0300 Adrian Perez de Castro <
> aperez@igalia.com> wrote:
>
> > You beat me to this update, thanks for submitting the patch, this one
> LGTM.
> >
> > On Wed, 03 Apr 2024 19:14:24 +0200 Thomas Devoogdt <thomas@devoogdt.com=
>
> wrote:
> > > A lot has been changed, please consult the announcement [1], what's
> new [2],
> > > and the security advisory [3] for more details.
>
> Quick heads up... We have released 2.44.1 a few days ago:
>
>   https://webkitgtk.org/2024/04/09/webkitgtk2.44.1-released.html
>
> Just in case you feel like doing a v3 that takes the version bump to 2.44=
.1
> directly. There is no WSA but there's a few build fixes that would be goo=
d
> to
> have in Buildroot (specially the one that makes it buildable in 32-bit
> arches
> again).
>
> Cheers,
> =E2=80=94Adri=C3=A1n
>

--0000000000008e47b00615e865d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">I will push a new patch set if I&#39;m back home.</div>=
<div dir=3D"auto">Currently on the ski slopes ;-)</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><br></div><div dir=3D"auto">Kr,=C2=A0</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Thomas=C2=A0</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Op vr 12 apr. 202=
4 09:45 schreef Adrian Perez de Castro &lt;<a href=3D"mailto:aperez@igalia.=
com">aperez@igalia.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hel=
lo again,<br>
<br>
On Thu, 04 Apr 2024 01:33:45 +0300 Adrian Perez de Castro &lt;<a href=3D"ma=
ilto:aperez@igalia.com" target=3D"_blank" rel=3D"noreferrer">aperez@igalia.=
com</a>&gt; wrote:<br>
<br>
&gt; You beat me to this update, thanks for submitting the patch, this one =
LGTM.<br>
&gt; <br>
&gt; On Wed, 03 Apr 2024 19:14:24 +0200 Thomas Devoogdt &lt;<a href=3D"mail=
to:thomas@devoogdt.com" target=3D"_blank" rel=3D"noreferrer">thomas@devoogd=
t.com</a>&gt; wrote:<br>
&gt; &gt; A lot has been changed, please consult the announcement [1], what=
&#39;s new [2],<br>
&gt; &gt; and the security advisory [3] for more details.<br>
<br>
Quick heads up... We have released 2.44.1 a few days ago:<br>
<br>
=C2=A0 <a href=3D"https://webkitgtk.org/2024/04/09/webkitgtk2.44.1-released=
.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://webkitgtk.or=
g/2024/04/09/webkitgtk2.44.1-released.html</a><br>
<br>
Just in case you feel like doing a v3 that takes the version bump to 2.44.1=
<br>
directly. There is no WSA but there&#39;s a few build fixes that would be g=
ood to<br>
have in Buildroot (specially the one that makes it buildable in 32-bit arch=
es<br>
again).<br>
<br>
Cheers,<br>
=E2=80=94Adri=C3=A1n<br>
</blockquote></div>

--0000000000008e47b00615e865d5--

--===============2804584187593368739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2804584187593368739==--
