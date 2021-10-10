Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AC4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 16:49:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 812AC6109E
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 16:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 812AC6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A72E403F8;
	Sun, 10 Oct 2021 16:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tDfr-RjNmJZP; Sun, 10 Oct 2021 16:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A164403EC;
	Sun, 10 Oct 2021 16:49:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12B781BF424
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 16:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB37A400EF
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 16:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hZY716KspXF for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 16:49:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEDEB400DE
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 16:49:45 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id x1so13031960iof.7
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 09:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o8iPfcBYuEhlKgfbZOTQLLf9VKIdasy4+M6iy5Aou+Y=;
 b=WZ0YUNT/suFopZQi22PJoiQGkqrihfQOBnsIZvkWUpWK6tSS2oXGo8dgtUWiDbeaqV
 eXP66G27sdNNiLWL1Vx4ZlnLHto5MW5htKt5GP6d1GZwavRZju6fflQz95necPji+ION
 jyGF7TWbJ2KoJNceDyvwo9dxyWzMwclpJAr0nzzB5Vh6x0W7jGrvCu/5ZN91iP0Tc6qP
 1KAb7CrxtMWGwdulzt8OGuiXn7XRCdxtiVkUQH4gRqQ9Ctkrz42S6NcZrGeBWsmweAVD
 j8z/Yo+MFp8gOe0PtxumpR7pYrS+HfzVZNIZfhBJTFhUcYFyrarO0vnhrchGsYm7L4jb
 LtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o8iPfcBYuEhlKgfbZOTQLLf9VKIdasy4+M6iy5Aou+Y=;
 b=3w47vpDXBsmKe/3GrRCtCoFqyO7G00laB8hG16bI7dxh4P6VUabIP2fQmd6Zjfe703
 1+J8K9Y/yreLfFyIPz5H+pspWOUNwH2mDmOE/7skVE152QaUmmVJnbI7hiAE8C2+OjiL
 Wb9Udd9RMjSIP8Vx8DXHf1TfQGFg7g5qIZHbdHrWdWPbdRJcVt4X8qWnSxzwsoqPIRrv
 IbOGc4XS640oSmjZKcbyVwHoGCtwEEUtX3vPyTzSoOtlq56uIHrIgD0bzJrL1kaL51fn
 E/ApudtComQB1NUPE5jBp9bg4vTUfdvBhIFaYN3V/AVjV1IlwVZXgEEqKYXudfS+Y5fZ
 1Z7A==
X-Gm-Message-State: AOAM532g74yY3qQu0W1Vg9ravQ/5FONwDVyovACbQHR7gk0GwnRDntEq
 oTT8DNgzlt8G1ObQYFhz6trCkQndhQzJqK0Jcg==
X-Google-Smtp-Source: ABdhPJyXEYP1YJDF+ugcqcDMB7wG49MKDacGD6R5NNxjRGuGQ4ndRxBAKGM5QHBjib1A59PGeqI3+2Imbum4MhylTUM=
X-Received: by 2002:a02:9609:: with SMTP id c9mr15834527jai.118.1633884584980; 
 Sun, 10 Oct 2021 09:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
In-Reply-To: <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Sun, 10 Oct 2021 17:48:21 +0200
Message-ID: <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5862922686318621662=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5862922686318621662==
Content-Type: multipart/alternative; boundary="0000000000004ab5ee05ce026626"

--0000000000004ab5ee05ce026626
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yes , i'm doing this as root

So the file system that i'm using is ext4

Le dim. 10 oct. 2021 =C3=A0 14:01, Edgar Bonet <bonet@grenoble.cnrs.fr> a =
=C3=A9crit :

> Hello!
>
> Esa=C3=AFe Ledoux Njongssi Kouam wrote:
> > build for qemu_x86_64 by typing "qemu_x86_64_defconfig"
>
> I guess you mean =E2=80=9Cmake qemu_x86_64_defconfig=E2=80=9D.
>
> > rsync [...] system/skeleton/ /root/buildroot/[...]
>
> You are doing this as root?
>
> > rsync: [generator] failed to set permissions on "[...]":
> > Function not implemented (38)
>
> This sounds like you are using a filesystem that doesn't support
> Unix-type permissions.[1] Is this the case? What kind of FS is this?
> Could you try on a Unixish filesystem?
>
> Regards,
>
> Edgar Bonet.
>
> [1] https://unix.stackexchange.com/questions/12203
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000004ab5ee05ce026626
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>yes , i&#39;m doing this as root</div><div><br></div>=
<div>So the file system that i&#39;m using is ext4<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 10=
 oct. 2021 =C3=A0=C2=A014:01, Edgar Bonet &lt;<a href=3D"mailto:bonet@greno=
ble.cnrs.fr">bonet@grenoble.cnrs.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hello!<br>
<br>
Esa=C3=AFe Ledoux Njongssi Kouam wrote:<br>
&gt; build for qemu_x86_64 by typing &quot;qemu_x86_64_defconfig&quot;<br>
<br>
I guess you mean =E2=80=9Cmake qemu_x86_64_defconfig=E2=80=9D.<br>
<br>
&gt; rsync [...] system/skeleton/ /root/buildroot/[...]<br>
<br>
You are doing this as root?<br>
<br>
&gt; rsync: [generator] failed to set permissions on &quot;[...]&quot;:<br>
&gt; Function not implemented (38)<br>
<br>
This sounds like you are using a filesystem that doesn&#39;t support<br>
Unix-type permissions.[1] Is this the case? What kind of FS is this?<br>
Could you try on a Unixish filesystem?<br>
<br>
Regards,<br>
<br>
Edgar Bonet.<br>
<br>
[1] <a href=3D"https://unix.stackexchange.com/questions/12203" rel=3D"noref=
errer" target=3D"_blank">https://unix.stackexchange.com/questions/12203</a>=
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--0000000000004ab5ee05ce026626--

--===============5862922686318621662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5862922686318621662==--
