Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF279C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 12:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FB5540912;
	Tue, 18 Jun 2024 12:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YthZ36Dzx3hd; Tue, 18 Jun 2024 12:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BB424091E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BB424091E;
	Tue, 18 Jun 2024 12:44:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF4011BF309
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 12:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA40D606DF
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 12:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82to7opr9XCJ for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 12:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=jp.baltazar.mendes@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 32CB2606D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32CB2606D3
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32CB2606D3
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 12:44:38 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e02b605bca2so295330276.1
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 05:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718714677; x=1719319477;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8a4ouBMmQfxx5CQQHfUn4hY8pjZcf4/VNS8FExBPYts=;
 b=OCbNCaJxvIWbdRpU0VMRphTcuGC+CDFv0Qomg11rYZCWLG6l4Y7b22h84PP1mWrQyX
 eIaaUguNQLsE1YiJrbvSo9wtTvYbU1WknJXoXZbePxp3LLCIm9/7+DrTmnly7TRVmvpb
 d1blAE2XYU4/nISwzGGrUcFVe3LmIkJoU1ztgyCQjhZ8YZsIzg09t0rgpFuPjNbLHHcD
 aqA3YDkVrneLvSS0dpTgkV2DTsczTwUOE7FAMfkA0qrAg7sUdw7JyWOZOQrLXdENzLBk
 +R45NOu4aN/cA4EW9r39T7FXOLFbRq0qJ7BUnPcnb5yWOUpa/YtlRGYsBGBVPz8TJXOg
 4MBQ==
X-Gm-Message-State: AOJu0YxYroVMj974yb+6lNkPsPx+tnZYpuJRCJhWBwwrHggNz6y5SkZH
 /RKGcmNbs6oTIU5KjhNUIjLZLnKWWHxh6F2XV8SL7TvE0r9jFtXfUGLco6KsmSU8cCYuwAGnB5d
 NPxW16VZUWpYAJcveEni5xnYossgV
X-Google-Smtp-Source: AGHT+IHB/a+V7jXkPH7IwdNo2cTFrcF9fMu03kaSJifbtSVtQTOsbJRHwOqyTR+QPxWXIMGOBBjqJ/wyymNhr/tbPwk=
X-Received: by 2002:a25:9181:0:b0:dfb:b27:adaf with SMTP id
 3f1490d57ef6-e0222082e74mr1593285276.5.1718714676524; Tue, 18 Jun 2024
 05:44:36 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Sm9zw6kgTWVuZGVz?= <jp.baltazar.mendes@gmail.com>
Date: Tue, 18 Jun 2024 14:44:00 +0200
Message-ID: <CAFAK9+dyXdn6RBLLm=Dw2+7rxxoiAPx0_kBJGn1dR6+SweOCiQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718714677; x=1719319477; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8a4ouBMmQfxx5CQQHfUn4hY8pjZcf4/VNS8FExBPYts=;
 b=SAgjwI9UWOJ10GDKyxtWCflLTY6MGkmL4d+syC61KgkrPqIfcmYQcRJj8OgZkuHMRh
 /XSIgHSBpK78ZXd3Jd9NrnJ0zl8qaB77Diige1Rj10XSfDPCZCfWRFJzeWtKHxMbDsOm
 T1YYuP5RviE03QsOYqKxt69zFMg25RA3j73uThVYKJMgKsrCo7ni2lr7dGnKNRQ1EE7f
 y9i1GXX6z61uU8hbcpuWi++Ur7cpA+TNZ9g1u7212E2TWof75ETEJAO/TQLeUNJQC+kS
 UpEJbOv3SZe4KJfzHj8CK/EArvJ8uBZK3wdU5h60TUUJ6c5uLjSd5+8gIP0Nqb6Npjku
 lyRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SAgjwI9U
Subject: [Buildroot] U-Boot for RaspberryPi CM4IO
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
Content-Type: multipart/mixed; boundary="===============4377829829978884459=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4377829829978884459==
Content-Type: multipart/alternative; boundary="000000000000c3beaa061b29715c"

--000000000000c3beaa061b29715c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

I'm relatively new to Buildroot and very new to U-Boot.

My goal is to make a system with redundant bootable partitions onto which
OTA updates will be applied (swupdate). The redundant part I absolutely
need is the rootfs but if the bootloader could also be updatable that would
be great.

I haven't had much progress with U-Boot as it seems to require a defconfig
and when I provide raspberrypicm4io_64_defconfig from the defaults, it
seems to complain that it either does not exist or several parameters are
missing.

 Any tips on how to proceed / what to do?

Best regards,

Jos=C3=A9 Mendes

--000000000000c3beaa061b29715c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<div><br></div><div>I&#39;m relatively new to Bu=
ildroot and very new to U-Boot.</div><div><br></div><div>My goal is to make=
 a system with redundant bootable partitions onto which OTA updates will be=
 applied (swupdate). The redundant part I absolutely need is the rootfs but=
 if the bootloader could also be updatable that would be great.</div><div><=
br></div><div>I haven&#39;t had much progress with U-Boot as it seems to re=
quire a defconfig and when I provide raspberrypicm4io_64_defconfig from the=
 defaults, it seems to complain that it either does not exist or several pa=
rameters are missing.</div><div><br></div><div>=C2=A0Any tips on how to pro=
ceed / what to do?</div><div><br></div><div>Best regards,</div><div><br></d=
iv><div>Jos=C3=A9 Mendes</div></div>

--000000000000c3beaa061b29715c--

--===============4377829829978884459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4377829829978884459==--
