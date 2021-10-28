Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D4DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 21:27:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C4B1610A4
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 21:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C4B1610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4E8940595;
	Thu, 28 Oct 2021 21:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wpdtj6ivGMB6; Thu, 28 Oct 2021 21:27:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52C7140557;
	Thu, 28 Oct 2021 21:27:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E9E41BF317
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 21:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B29082741
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 21:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1nh9u0UfmPpe for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 21:27:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 989318272D
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 21:27:31 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id o83so10267283oif.4
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 14:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=mE9agtrCYZa0oYWMvtksDFbwccdeAkJSKMtyANidn48=;
 b=h584LjfzWwPWnhJrA9A5NHbqRBAPTCzA1iYNbz3WLH2ocR4VsdZl8ceCWp1mf2LrO2
 PUdIrQ5UZ7AGvKgubyZr2d4b28pe9zxOPy3olKhBFF6qJ7ebdSUSrcGrm6FNl3PwCy8C
 PZhgYyunGsp3h7W2NMxM8jqyB3Be+m3BjUM7SaUZ4DoF5ENCexF6OTLfdVxqdH0P9NKJ
 ZQA64tyDUsYBfOA2jfqcm3CI1FtVSdVdI72ngTtuTitq3PFsutAQh/e6GtxgPNW/qkdA
 IC0aQjqkFwK/oT0rotxoFBrUKhbohM7WClktOwbcriMl4pwuE/Cwr8JaSew992x0DKjf
 4Xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mE9agtrCYZa0oYWMvtksDFbwccdeAkJSKMtyANidn48=;
 b=ees5+FhwEvWuW/3NQycIf7XFbhMAK7IHbIGXOzDb2QMKvMAcMEDQXQYKZzYdvrhO43
 i7CAHDPZ42JFcCLeCgouuwzx2hA2Xrg11N9WKF54k6dC2FXOps72jmhRDzn5MbjV9Jj1
 1mV1oKfDueeNZvIB4iJWT4j95WqRdASz7bG9tKrP66VbuJjMWjUf+uaqHLreSSwyQuNl
 GJA7cIY8iRvZO0mEzJ3N9bLUKzwXLKHbDfvB8uDDd1gZw4psO++MMvddbJikak0ldIaX
 fJb1dW7xTT90DUA/KZnzbpHIe/IyxPDUIucpIam3+/9fQ9pn+ATKluNxMoQATv1k1KkH
 MA/A==
X-Gm-Message-State: AOAM530aQaqTrYH9i05mZArUN6d2Ba+gcNLuvrv2N0MMJz3A8KNZnzdV
 GWT+ZVxbylAxxH4h/iHrLRdlKEwxNGlBc7o5s2wuAZEr
X-Google-Smtp-Source: ABdhPJw6W8/iXLExdIVE2K2VIMFpoMFRQDipdWq3aSkQ680hhou6daiYGWCu/J4+MQ1Ew7RK+1sKxERTc7bLdCZ4eWc=
X-Received: by 2002:a54:4688:: with SMTP id k8mr10641502oic.70.1635456450770; 
 Thu, 28 Oct 2021 14:27:30 -0700 (PDT)
MIME-Version: 1.0
From: Nikos Mouzakitis <mzktsn@gmail.com>
Date: Fri, 29 Oct 2021 00:27:19 +0300
Message-ID: <CAJ+0ANuxaQEALo8wFWkZNwAjkwvzC5h8jkLj2mYMRhQfo3UX=w@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Qemu doesn't read ACPI tables with EDK2 firmware.
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
Content-Type: multipart/mixed; boundary="===============1774228021743473863=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1774228021743473863==
Content-Type: multipart/alternative; boundary="000000000000cb3a4605cf706078"

--000000000000cb3a4605cf706078
Content-Type: text/plain; charset="UTF-8"

Hello Buildroot community.
I have successfully compiled buildroot and  booted in linux in an emulation
using QEMU on x86_64.(I used -smp 4, and I verified reading /proc/cpuinfo
that there are 4 cpus).

However, when I tried to use EDK2 ovmf firmware instead of the predefined
SeaBios that comes with QEMU, I am booting to Linux, but only with one
core..

Trying to find the issue of this, it lead me into finding out that kernel,
is not able to read/detect the ACPI table provided from EDK2 I guess.


Does anyone have encountered this before?
And do we know what could be a possible solution to it?

Thanks in advance,
Niko.

--000000000000cb3a4605cf706078
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"color:rgb(80,0,80);font-size:12.8px;font-f=
amily:sans-serif">Hello Buildroot community.</span><div dir=3D"auto" style=
=3D"color:rgb(80,0,80);font-size:12.8px;font-family:sans-serif">I have succ=
essfully compiled buildroot and=C2=A0 booted in linux in an emulation using=
 QEMU on x86_64.(I used -smp 4, and I verified reading /proc/cpuinfo that t=
here are 4 cpus).</div><div dir=3D"auto" style=3D"color:rgb(80,0,80);font-s=
ize:12.8px;font-family:sans-serif"><br></div><div dir=3D"auto" style=3D"col=
or:rgb(80,0,80);font-size:12.8px;font-family:sans-serif">However, when I tr=
ied to use EDK2 ovmf firmware instead of the predefined SeaBios that comes =
with QEMU, I am booting to Linux, but only with one core..</div><div dir=3D=
"auto" style=3D"color:rgb(80,0,80);font-size:12.8px;font-family:sans-serif"=
><br></div><div dir=3D"auto" style=3D"color:rgb(80,0,80);font-size:12.8px;f=
ont-family:sans-serif">Trying to find the issue of this, it lead me into fi=
nding out that kernel, is not able to read/detect the ACPI table provided f=
rom EDK2 I guess.</div><div dir=3D"auto" style=3D"color:rgb(80,0,80);font-s=
ize:12.8px;font-family:sans-serif"><br></div><div dir=3D"auto" style=3D"col=
or:rgb(80,0,80);font-size:12.8px;font-family:sans-serif"><br></div><div dir=
=3D"auto" style=3D"color:rgb(80,0,80);font-size:12.8px;font-family:sans-ser=
if">Does anyone have encountered this before?=C2=A0</div><div dir=3D"auto" =
style=3D"color:rgb(80,0,80);font-size:12.8px;font-family:sans-serif">And do=
 we know what could be a possible solution to it?</div><div dir=3D"auto" st=
yle=3D"color:rgb(80,0,80);font-size:12.8px;font-family:sans-serif"><br></di=
v><div dir=3D"auto" style=3D"color:rgb(80,0,80);font-size:12.8px;font-famil=
y:sans-serif">Thanks in advance,</div><div dir=3D"auto" style=3D"color:rgb(=
80,0,80);font-size:12.8px;font-family:sans-serif">Niko.</div></div>

--000000000000cb3a4605cf706078--

--===============1774228021743473863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1774228021743473863==--
