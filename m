Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78353C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 11:22:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3CA860EB1
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 11:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3CA860EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9B33400A4;
	Mon, 11 Oct 2021 11:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oUdSF5JkafYJ; Mon, 11 Oct 2021 11:22:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 891EA402D5;
	Mon, 11 Oct 2021 11:22:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97EE91BF20B
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 11:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 925E24043A
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 11:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OdkZETWXKx57 for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 11:22:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9039140437
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 11:22:15 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id h10so10750556ilq.3
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 04:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jh4Fe9NkWlPYfNu3uxPBG3Xo35PVG+LgPmpu8NhYQuI=;
 b=AIAjNiLI0at97qWWnEnkFeiwfvBlCMB/myGLoJnRO2pHH8xmSa8hv18DowM/+0UpoG
 /7JyxhshQR3nVms078cRdrrnJ5wZYCNmoPal/DwDHyVilAhaW+JFJgn4lyonfWpWvKJ2
 zmr2BNrmz1Nyu9iITo4Iq4Rwpq4NHo2qlcxcisu2k6R1hJGEuDb0Cb64M0tdtDg28UTd
 60yiKX2rjiRQoV7zAEVnaUHUBIS1151Nsvo0SU9khX3/hY3Ta27VxF73v3aof0w0PALn
 F8gq1//76D/8EMB9jTNtovOyyqjegnEjvalcCzRog50mzKcCZBo1IKbkrv1PTU7/9ikr
 uwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jh4Fe9NkWlPYfNu3uxPBG3Xo35PVG+LgPmpu8NhYQuI=;
 b=DgyWcxPTJO5RWnEmzd2yY+qbGPKpwdek6u/i7AFq+M/e0Q7x0Au9V358my+e87K+V0
 aeAMc7bGeLyxDZ+3ERYeu8gPGvxD44b8FyRCJ+hbAzWEnycLC1gE+K+BVGr8wgKExhGa
 ortNJdQxpGDThs4IbTf8I42/0rrsuNkvpEj3W1WYM5lmm+uLFz/nlU+GQZms/+pP96EA
 ocUinJB1EEK4J/MqVhd5ediClc4qMU22ftwFi4e8Giy/Lbjm5HCTDeLMB+9bHVmlvClx
 bD23E/Z3+D5TxqAHiqCVkAubBMXCpNNmte8h0EPoTrYBLzo/04Bmurc9WSRUyzDzHShF
 BIBg==
X-Gm-Message-State: AOAM531iBJ2/wNixB6Kt/CpzyL9A6A2PI5C5LTe6HGSRiPqdc4/lRXUh
 KMuO00F/Il2psL4Mhq5cqUMAW70MRe8NLIs7/w==
X-Google-Smtp-Source: ABdhPJwIa5K7m5hIZfRmaMiIlwQLKK5dAAu0TWWOn/CRyqaWg1GL+J5NfmccEUY3OajQtYPgqKBE00nWXCxpgRD6Kmo=
X-Received: by 2002:a92:d847:: with SMTP id h7mr8005258ilq.130.1633951334683; 
 Mon, 11 Oct 2021 04:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
 <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
 <1819f3c3-52db-7e21-8d42-f5c2ae434f33@gmail.com>
 <CA+eej5ObHKKx4x=uOYRDF1npRR4kqnucWByTtNkbS40A+1y-GA@mail.gmail.com>
 <fe8b5e30-6cb7-161d-6e6e-cdddadcbbe01@gmail.com>
In-Reply-To: <fe8b5e30-6cb7-161d-6e6e-cdddadcbbe01@gmail.com>
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Mon, 11 Oct 2021 12:20:51 +0200
Message-ID: <CA+eej5M-SbCseCpknXdMboR7Lz+A94BNHMBZd2WJkcbDD6pZAg@mail.gmail.com>
To: Joachim Wiberg <troglobit@gmail.com>
Subject: Re: [Buildroot] error when i build buidroot
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0583547173592427361=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0583547173592427361==
Content-Type: multipart/alternative; boundary="000000000000e2588305ce11f070"

--000000000000e2588305ce11f070
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i have tried
git clone git://git.buildroot.net/buildroot
make qemu_x86_64_defconfig
make

i have type it on Documents folder that has ext4 file system


still now i have the same error

Le dim. 10 oct. 2021 =C3=A0 21:57, Joachim Wiberg <troglobit@gmail.com> a =
=C3=A9crit :

> Hi,
>
> On 10/10/21 6:52 PM, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:
> > no filesystem has been configured ...
> > I'm just trying the default configuration
>
> This is fine.  I think you've got something really wrong with your
> Kali Linux host system.
>
> > should i configure file system for my buildroot ??
>
> No, we mean the file system you are using for building Buildroot on,
> in your Kali Linux install.  The rsync error looks as if your disk
> partition is a non-native Linux file system, like FAT, which does
> not support the operations rsync tries to perform.
>
> How have you set up your Kali Linux?  Do you have the buildroot git
> sources checked out to your home directory or some other directory,
> perhaps shared with Windows?  If so, I'd definitely avoid that. You
> can check the filesystem of your build directory by comparing the
> output of
>
>    pwd
>
> with the output from
>
>    findmnt
>
> On my system I have ext4 in the FSTYPE column for my home directory,
> which is in the / TARGET.
>
> I finished my install of Kali in my own VM.  It crashed badly before
> I gave it enough disk (40 GiB) and RAM (4 GiB).  That's another thing
> that might have messed up your build tree.
>
> > the error persists even if i compile it as normal user
>
> Well that's good to know, at least it's consistent.  Just beware
> that if you reuse the same source tree, having switched to another
> user, a lot of files may still have root as the owner, which may
> give you other problems.  Either `sudo chown -R user:user .` from
> inside the Buildroot source tree, or check out a new tree.
>
> Best regards
>  /Joachim
>
>

--000000000000e2588305ce11f070
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>i have tried</div><div> git clone git://<a href=3D"ht=
tp://git.buildroot.net/buildroot">git.buildroot.net/buildroot</a></div><div=
>make <span class=3D"gmail-im">qemu_x86_64_defconfig</span></div><div><span=
 class=3D"gmail-im">make</span></div><div><span class=3D"gmail-im"><br></sp=
an></div><div><span class=3D"gmail-im">i have type it on Documents folder t=
hat has ext4 file system<br></span></div><div><span class=3D"gmail-im"><br>=
</span></div><div><span class=3D"gmail-im"><br></span></div><div><span clas=
s=3D"gmail-im">still now i have the same error<br></span></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim.=
 10 oct. 2021 =C3=A0=C2=A021:57, Joachim Wiberg &lt;<a href=3D"mailto:trogl=
obit@gmail.com">troglobit@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On 10/10/21 6:52 PM, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:<br>
&gt; no filesystem has been configured ...<br>
&gt; I&#39;m just trying the default configuration<br>
<br>
This is fine.=C2=A0 I think you&#39;ve got something really wrong with your=
<br>
Kali Linux host system.<br>
<br>
&gt; should i configure file system for my buildroot ??<br>
<br>
No, we mean the file system you are using for building Buildroot on,<br>
in your Kali Linux install.=C2=A0 The rsync error looks as if your disk<br>
partition is a non-native Linux file system, like FAT, which does<br>
not support the operations rsync tries to perform.<br>
<br>
How have you set up your Kali Linux?=C2=A0 Do you have the buildroot git<br=
>
sources checked out to your home directory or some other directory,<br>
perhaps shared with Windows?=C2=A0 If so, I&#39;d definitely avoid that. Yo=
u<br>
can check the filesystem of your build directory by comparing the<br>
output of<br>
<br>
=C2=A0 =C2=A0pwd<br>
<br>
with the output from<br>
<br>
=C2=A0 =C2=A0findmnt<br>
<br>
On my system I have ext4 in the FSTYPE column for my home directory,<br>
which is in the / TARGET.<br>
<br>
I finished my install of Kali in my own VM.=C2=A0 It crashed badly before<b=
r>
I gave it enough disk (40 GiB) and RAM (4 GiB).=C2=A0 That&#39;s another th=
ing<br>
that might have messed up your build tree.<br>
<br>
&gt; the error persists even if i compile it as normal user<br>
<br>
Well that&#39;s good to know, at least it&#39;s consistent.=C2=A0 Just bewa=
re<br>
that if you reuse the same source tree, having switched to another<br>
user, a lot of files may still have root as the owner, which may<br>
give you other problems.=C2=A0 Either `sudo chown -R user:user .` from<br>
inside the Buildroot source tree, or check out a new tree.<br>
<br>
Best regards<br>
=C2=A0/Joachim<br>
<br>
</blockquote></div>

--000000000000e2588305ce11f070--

--===============0583547173592427361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0583547173592427361==--
