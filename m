Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97244C433FE
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 12:49:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB7C560EFE
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 12:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB7C560EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80A02400D2;
	Wed, 17 Nov 2021 12:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yHo1vIQV74FV; Wed, 17 Nov 2021 12:49:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83227400F7;
	Wed, 17 Nov 2021 12:49:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D79A1BF283
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 12:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18456405AD
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 12:49:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LgLiYzA4b51b for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 12:49:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 166D6405AA
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 12:49:03 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id y13so10440326edd.13
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 04:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yffLkaT9JfdfJif9Fkkp9lD4VY5os0XXYCxPyb6+6s4=;
 b=AzJAZYO6hcv06E58R6jBwTqt4o8iD9bpTARtLaSG6mJcV+J5RpxVMnP7tES6OjyoG0
 30no9YiAJvpvOjsZn8OSLBW3l7Xr0F6P4FfZWbxKj+xu153AmQVMgizke9PuBpEjAR/B
 77L21tW5hh94zyBKCcIJO/kEvekms2efHNUzDL+nlUAswn2AWencmf359RQU+lOuicMT
 1/V/AKMVd2Xg8hAp0WR3f95U4SRk+gUUuR3tTXuHn4x7XXYhCtCNBeJlF9KqXf26oKH/
 QbWQjYELk4k+/6efKUAhQbHUZmri/0KDaEOse0EFUdzLpoGz7skA8XBP7gUCZ7+cgn1J
 RVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yffLkaT9JfdfJif9Fkkp9lD4VY5os0XXYCxPyb6+6s4=;
 b=p9V+/prtZWwkTBev2nPiVZ5XAV2dFOjMH4qdLR24IHPgKXiFxEE+8qG6+lOxTGEhPu
 42qcLJIUswfZ2THUsJotNnmi1wm0wUWhXLwTYKGKFj4yxxQWCrTSbk/jj9RbsUf/lKrG
 FWHq3D5AQ6H5DVSzh+d1f1oYBJNtI3HBDio2bAY2AJVQcBVGu6KoUX6iE4661FP8SvbR
 sRPBU9ea7ibJnLlBO/i0WBJPHAxH4zzCUd/t4QYmjiWrDbbRXDv32vzVKRAk4ORypXuY
 QZv99K98wsyha7tobKy0B961XoJCz6jVy9/zl+2GMhvWDsG6EDnUKehMs9L3+fR6E7l2
 tJWA==
X-Gm-Message-State: AOAM533wFuuLd9Abh+cEimDdMRL2zUj3NYTzC8vdmpqX06GRkcqNEtez
 5fbSCByqXoelS25PyTONODX+NRmqR+XAE9b+7O6XRg==
X-Google-Smtp-Source: ABdhPJy42ODO2HvU3PBtkFQUyYj8O3J3jxDEEcbVyl7hVKc2SftEVBqB97o2XX4o/XcE6it6nGT+samk+lHVA+JlgTY=
X-Received: by 2002:a17:906:2b12:: with SMTP id
 a18mr21521707ejg.254.1637153341974; 
 Wed, 17 Nov 2021 04:49:01 -0800 (PST)
MIME-Version: 1.0
References: <CAJPV9MpFEQJk5otMfJkC0D2YNjLnanijNhHWSYT3ymtLYd2yeg@mail.gmail.com>
 <20211116152552.0a9e32da@windsurf>
In-Reply-To: <20211116152552.0a9e32da@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Wed, 17 Nov 2021 14:48:51 +0200
Message-ID: <CAJPV9MpMc6t5uty1VGHQm7KsABg7yKqRaXDQqGxyuFiG91DfLw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] Running script after init
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
Content-Type: multipart/mixed; boundary="===============5633551380769090093=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5633551380769090093==
Content-Type: multipart/alternative; boundary="00000000000064482f05d0fb7717"

--00000000000064482f05d0fb7717
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 16, 2021 at 4:25 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Jos=C3=A9,
>
> On Tue, 16 Nov 2021 14:08:02 +0200
> Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com> wrote:
>
> > Any hint what would be the right place in buildroot
> >
> > userspace to put an script after the init process is over?
>
> The init process by itself is never over, it continues to run until you
> reboot your system.
>
> Could you clarify your question? You want a service to be started after
> all other services?
>

Hi,

I want to run a script after the TTYs are up and running.

Currently I run the script as S99myscript, and put a call in the
start, and it fails. If I later logging as root and manually run the
S99myscript start, it runs well.

Thanks!

Jos=C3=A9.

--00000000000064482f05d0fb7717
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 16, 2021 at 4:25 PM Thoma=
s Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.peta=
zzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hello Jos=C3=A9,<br>
<br>
On Tue, 16 Nov 2021 14:08:02 +0200<br>
Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@unikie.com" targ=
et=3D"_blank">jose.pekkarinen@unikie.com</a>&gt; wrote:<br>
<br>
&gt; Any hint what would be the right place in buildroot<br>
&gt; <br>
&gt; userspace to put an script after the init process is over?<br>
<br>
The init process by itself is never over, it continues to run until you<br>
reboot your system.<br>
<br>
Could you clarify your question? You want a service to be started after<br>
all other services?<br></blockquote><div><br></div></div><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><=
div>Hi,</div><div><br></div></div></blockquote><blockquote style=3D"margin:=
0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div>I want =
to run a script after the TTYs are up and running.</div></div></blockquote>=
Currently I run the script as S99myscript, and put a call in the<div>start,=
 and it fails. If I later logging as root and manually run the</div><div>S9=
9myscript start, it runs well.</div><div><br></div><blockquote style=3D"mar=
gin:0 0 0 40px;border:none;padding:0px">Thanks!<br><br></blockquote><div><d=
iv dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=
=3D"margin:0px 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote=
></div></div></div></div>

--00000000000064482f05d0fb7717--

--===============5633551380769090093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5633551380769090093==--
