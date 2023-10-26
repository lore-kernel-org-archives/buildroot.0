Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2E5C25B6F
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 10:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BFB2415E3;
	Thu, 26 Oct 2023 10:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BFB2415E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ifCUpXqkWA9; Thu, 26 Oct 2023 10:26:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5969E4095B;
	Thu, 26 Oct 2023 10:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5969E4095B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F2F81BF3F3
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 10:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0986F61230
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 10:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0986F61230
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qig2jS_QtWSk for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 10:26:26 +0000 (UTC)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC928611A8
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 10:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC928611A8
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5a7c95b8d14so5479337b3.3
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 03:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698315985; x=1698920785;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b9Bx0RDE7FiBCO8xHqgMWj2PdkabDIvY9wI/zPFW9jY=;
 b=hsplUSY5DaHjabweVbYIhsJzzMAtutE12lXhkSocqRhD9tYiqz2PVEvi9AzBWXGT8r
 BLoQjpOfYJbZI0hLYEFOxM2hxUk08G0ibFhNrLSYKNdPOgmZCNWZGlZ/uRW4BhNxF88B
 jgTV41c5oMEaKzWhQsgBWIJlNtU0shOcgkKGb1owx6uFwXh7z+RI8i5DO132avHxYCx8
 9dMtmOVoZ1ifqNLnCpY0TSuA4HYJIpEqrE5/DHKdpKaWFiqtaNREVyB1yc+J0fqi00S2
 tXhDfxaRooSozk1cPBst4JxBrF0DotV+8Sl3fPqSj4UOVeovsTQvqQ/rlR80QzT9IMOY
 7eBg==
X-Gm-Message-State: AOJu0YztyYYH8snOP8E6agiZ/vw6Za6mN8LQB7Wp5n4zLXhWIxiqszLk
 CUgHjt7CMAUYKN/UrBP03QToamkHmiXpUZirBE8=
X-Google-Smtp-Source: AGHT+IGKqhnT0Jwd7Q1hJtYm+mRP2r3ASs47XZ7y8lPCZvnsbq5K7KZC5KRGUcw61dL7kRd7CykkD0ZYTvWC19FdIGY=
X-Received: by 2002:a81:65c2:0:b0:583:3c54:6d89 with SMTP id
 z185-20020a8165c2000000b005833c546d89mr16744079ywb.44.1698315984686; Thu, 26
 Oct 2023 03:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231020082703.1610281-1-adam.duskett@amarulasolutions.com>
 <875y2uphio.fsf@48ers.dk>
In-Reply-To: <875y2uphio.fsf@48ers.dk>
From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 26 Oct 2023 12:26:13 +0200
Message-ID: <CAFSsvmqCL1sd1tqjyX8MWBLkUv3kHP97cDHNjkzr01QfgyfSGQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698315985; x=1698920785; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b9Bx0RDE7FiBCO8xHqgMWj2PdkabDIvY9wI/zPFW9jY=;
 b=eNwJYPKDAF7MSpb1qIsuIeKnWqeEYG2d8UPbn6YmNrxpS1qbAM0ihBH9/V0OywXWDI
 AAZcIsVSqPjI/xgZjdcA9pRTMHQGGqLqg1YOjlH2zL6GpfxdihEG/+UUVwxg1G+WiM6M
 lal0k5dZ9GGmIcH4qPtiW/JrbX9VZUXbF7mqFNez43BI23JXLgNNXl3Ts/i5bTXTEc55
 oO2J+VlgR4j/ZD9TOmcxS0P6nLozX94+KBHJL5xB7hdnVEosqhBnW6dZGz0aVdpGrHd/
 gyHMtSOhEq+UQh/MnOgynHDHKI1g0D7I1iIa43BAq52XDcCDyZTjPTLhLp3zT5+61Sll
 Yppg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eNwJYPKD
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: bump version to
 4.2.6
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: multipart/mixed; boundary="===============5473698222971827671=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5473698222971827671==
Content-Type: multipart/alternative; boundary="000000000000fbd68a06089c0011"

--000000000000fbd68a06089c0011
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure Peter; I can update to 4.2.7 when it's released!

Adam

On Wed, Oct 25, 2023 at 10:36=E2=80=AFPM Peter Korsgaard <peter@korsgaard.c=
om>
wrote:

> >>>>> "Adam" =3D=3D Adam Duskett <adam.duskett@amarulasolutions.com> writ=
es:
>
>  > Tested with
> tests.package.test_python_django.TestPythonPy3Django.test_run in
>  > Fedora 38 and Debian 11
>
>  > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>
> Looking at
> https://www.djangoproject.com/weblog/2023/oct/04/security-releases/,
> Django 4.2.6 was a security release, so it should have been marked as
> such (and ideally we would first have bumped to 4.1.12 for easier
> backporting).
>
> 4.2.6 apparently also introduced a regression, so it would be good if
> you could send a bump to 4.2.7:
>
> https://docs.djangoproject.com/en/dev/releases/4.2.7/
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000fbd68a06089c0011
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure Peter; I can update to 4.2.7 when it&#39;s released!<=
div><br></div><div>Adam</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Oct 25, 2023 at 10:36=E2=80=AFPM Pete=
r Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&=
gt;&gt;&gt;&gt;&gt; &quot;Adam&quot; =3D=3D Adam Duskett &lt;<a href=3D"mai=
lto:adam.duskett@amarulasolutions.com" target=3D"_blank">adam.duskett@amaru=
lasolutions.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; Tested with tests.package.test_python_django.TestPythonPy3Django=
.test_run in<br>
=C2=A0&gt; Fedora 38 and Debian 11<br>
<br>
=C2=A0&gt; Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@a=
marulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a=
>&gt;<br>
<br>
Looking at<br>
<a href=3D"https://www.djangoproject.com/weblog/2023/oct/04/security-releas=
es/" rel=3D"noreferrer" target=3D"_blank">https://www.djangoproject.com/web=
log/2023/oct/04/security-releases/</a>,<br>
Django 4.2.6 was a security release, so it should have been marked as<br>
such (and ideally we would first have bumped to 4.1.12 for easier<br>
backporting).<br>
<br>
4.2.6 apparently also introduced a regression, so it would be good if<br>
you could send a bump to 4.2.7:<br>
<br>
<a href=3D"https://docs.djangoproject.com/en/dev/releases/4.2.7/" rel=3D"no=
referrer" target=3D"_blank">https://docs.djangoproject.com/en/dev/releases/=
4.2.7/</a><br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--000000000000fbd68a06089c0011--

--===============5473698222971827671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5473698222971827671==--
