Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADDBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:53:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729E360F22
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 729E360F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 231F44022C;
	Sun, 10 Oct 2021 17:53:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id el5leefx_8gb; Sun, 10 Oct 2021 17:53:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 678F040140;
	Sun, 10 Oct 2021 17:53:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60E591BF3C2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BB3C6065C
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VjRJ3fRiODfT for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 17:53:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5118C6060A
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 17:53:31 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id i11so14715434ila.12
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 10:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AHIKHAvZ0VM6JQeFv7sQS1A0kJmDNFxBoiqeguiVkwg=;
 b=N2YLQJClzvYo7Gjkvv9AWa5Yep6BttlXhRs/EsAYVizSYvlHcmoAwFZQsdDHarrNfP
 qh3M4MzM6seusSv9H7dSZn4XW70iV9RaqyzRX7anSAObbzoJKr1hHmgjB3uvXv7KI30A
 YKmmVEkH5hgToWJ8ncTb4Hnypa2JVvZqndPFtKxSLGSoswv9dRX90XTnW3SFyqZq6uBH
 ChRDhEpgkfuvHyOOzDx6rpp91ojuA8XLB/sNEbT3ej7uG4YxWNdYq6/vcyp4guxTGw3a
 5R65vHRUB/Hz/0G8dk9RSwKOuXXXlrQIpCXuVaCAypYWaTevp07AEBw0xHe8GuxBwMXW
 tJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AHIKHAvZ0VM6JQeFv7sQS1A0kJmDNFxBoiqeguiVkwg=;
 b=ckvo63Fttf+N8yuC3Pz2h1KBwyin/eGh3kv/c1QSKAb7GRtLPXMW9gFSNkeF5xW8ix
 a/IA50pkYRLyH6pt8pK3/LRP6xkp5mgHg3OU4iWUbq/W7kXRwLHpBjNw3Gf9UDyhkhIT
 H2Cd85qyCEkC508cLnEphNd3pgDSIuiNp0Jrb6t3lEGMZdcxgjlr5QBNbcijV+7dGHLs
 YGeIZbuTjovfon/8RYzA1Jjm23TkLxy5Iz+0wN9N9U5dHbSHwSYLZLDOQrr4hRJcW+Ik
 qR5Rf/cntAuMNi0W9iUpim2ZWA/uY6to0UR5D2IbQEQ195CD1P4Zm33CXill14kGSUQG
 b6pQ==
X-Gm-Message-State: AOAM530R5+iSP0//TEa0ol2M+dursR86k8G8CR2FnaQZj3QPAa4JPjti
 VXVtlpCgmrybDBmlWSa8SspX0XS/rB1YSIR2Az2b83ZyXA==
X-Google-Smtp-Source: ABdhPJyGdSowtP58OQIenNv9ducVlRFJFdMM4Jx07PjHrxB4aplW8KEH2vw2rTIkB/q3zGqcNtF89HOhEz3MdBOZ9aA=
X-Received: by 2002:a05:6e02:1564:: with SMTP id
 k4mr16755606ilu.269.1633888410388; 
 Sun, 10 Oct 2021 10:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
 <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
 <1819f3c3-52db-7e21-8d42-f5c2ae434f33@gmail.com>
In-Reply-To: <1819f3c3-52db-7e21-8d42-f5c2ae434f33@gmail.com>
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Sun, 10 Oct 2021 18:52:05 +0200
Message-ID: <CA+eej5ObHKKx4x=uOYRDF1npRR4kqnucWByTtNkbS40A+1y-GA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7707048116564485389=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7707048116564485389==
Content-Type: multipart/alternative; boundary="0000000000004dcafc05ce034a99"

--0000000000004dcafc05ce034a99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

no filesystem has been configured ...
I'm just trying the default configuration
should i configure file system for my buildroot ??

Le dim. 10 oct. 2021 =C3=A0 19:27, Joachim Wiberg <troglobit@gmail.com> a =
=C3=A9crit :

> Hi!
>
> Kali Linux is a Debian derivative, so it should work fine as build host.
> I've not used it myself, but I'm installing it in a VM now to check the
> build steps to see if I can reproduce your problem.
>
> On 10/10/21 5:48 PM, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:
> > Le dim. 10 oct. 2021 =C3=A0 14:01, Edgar Bonet <bonet@grenoble.cnrs.fr
> > <mailto:bonet@grenoble.cnrs.fr>> a =C3=A9crit :
> > > Esa=C3=AFe Ledoux Njongssi Kouam wrote:
> > > > build for qemu_x86_64 by typing "qemu_x86_64_defconfig"
> > > I guess you mean =E2=80=9Cmake qemu_x86_64_defconfig=E2=80=9D.
> > > > rsync [...] system/skeleton/ /root/buildroot/[...]
> > > You are doing this as root?
> > yes , i'm doing this as root
>
> I think you might want to browse through the manual again, in particular
> Chapter 4, https://buildroot.org/downloads/manual/manual.html:
>
> | Important: you can and should build everything as a normal user. There
> | is no need to be root to configure and use Buildroot. By running all
> | commands as a regular user, you protect your system against packages
> | behaving badly during compilation and installation.
>
> I'll retry the steps as a regular user in my efforts.
>
> > > > rsync: [generator] failed to set permissions on "[...]":
> > > > Function not implemented (38)
> > > This sounds like you are using a filesystem that doesn't support
> > > Unix-type permissions.[1] Is this the case? What kind of FS is this?
> > So the file system that i'm using is ext4
>
> Just to double-check, because "Function not implemented 38)" is really
> not expected on a build host with Ext4.  Did you mean the file system
> you configured for your Buildroot image, or your build system?
>
> Best regards
>  /Joachim
>
>

--0000000000004dcafc05ce034a99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>no filesystem has been configured ...</div><div>I&#39=
;m just trying the default configuration<br></div><div>should i configure f=
ile system for my buildroot ??<br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 10 oct. 2021 =C3=A0=C2=
=A019:27, Joachim Wiberg &lt;<a href=3D"mailto:troglobit@gmail.com">troglob=
it@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi!<br>
<br>
Kali Linux is a Debian derivative, so it should work fine as build host.<br=
>
I&#39;ve not used it myself, but I&#39;m installing it in a VM now to check=
 the<br>
build steps to see if I can reproduce your problem.<br>
<br>
On 10/10/21 5:48 PM, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:<br>
&gt; Le=C2=A0dim. 10 oct. 2021 =C3=A0=C2=A014:01, Edgar Bonet &lt;<a href=
=3D"mailto:bonet@grenoble.cnrs.fr" target=3D"_blank">bonet@grenoble.cnrs.fr=
</a><br>
&gt; &lt;mailto:<a href=3D"mailto:bonet@grenoble.cnrs.fr" target=3D"_blank"=
>bonet@grenoble.cnrs.fr</a>&gt;&gt; a =C3=A9crit=C2=A0:<br>
&gt; &gt; Esa=C3=AFe Ledoux Njongssi Kouam wrote:<br>
&gt; &gt; &gt; build for qemu_x86_64 by typing &quot;qemu_x86_64_defconfig&=
quot;<br>
&gt; &gt; I guess you mean =E2=80=9Cmake qemu_x86_64_defconfig=E2=80=9D.<br=
>
&gt; &gt; &gt; rsync [...] system/skeleton/ /root/buildroot/[...]<br>
&gt; &gt; You are doing this as root?<br>
&gt; yes , i&#39;m doing this as root<br>
<br>
I think you might want to browse through the manual again, in particular<br=
>
Chapter 4, <a href=3D"https://buildroot.org/downloads/manual/manual.html" r=
el=3D"noreferrer" target=3D"_blank">https://buildroot.org/downloads/manual/=
manual.html</a>:<br>
<br>
| Important: you can and should build everything as a normal user. There<br=
>
| is no need to be root to configure and use Buildroot. By running all<br>
| commands as a regular user, you protect your system against packages<br>
| behaving badly during compilation and installation.<br>
<br>
I&#39;ll retry the steps as a regular user in my efforts.<br>
<br>
&gt; &gt; &gt; rsync: [generator] failed to set permissions on &quot;[...]&=
quot;:<br>
&gt; &gt; &gt; Function not implemented (38)<br>
&gt; &gt; This sounds like you are using a filesystem that doesn&#39;t supp=
ort<br>
&gt; &gt; Unix-type permissions.[1] Is this the case? What kind of FS is th=
is?<br>
&gt; So the file system that i&#39;m using is ext4<br>
<br>
Just to double-check, because &quot;Function not implemented 38)&quot; is r=
eally<br>
not expected on a build host with Ext4.=C2=A0 Did you mean the file system<=
br>
you configured for your Buildroot image, or your build system?<br>
<br>
Best regards<br>
=C2=A0/Joachim<br>
<br>
</blockquote></div>

--0000000000004dcafc05ce034a99--

--===============7707048116564485389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7707048116564485389==--
