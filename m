Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C803C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 22:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDAAB402A8;
	Thu, 20 Jun 2024 22:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hY_RF1vIFnsD; Thu, 20 Jun 2024 22:10:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB4D140513
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB4D140513;
	Thu, 20 Jun 2024 22:10:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3E41BF397
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 22:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2807140513
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 22:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtDKXCUPaxm0 for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 22:10:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2d; helo=mail-vk1-xa2d.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DEB9C402A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEB9C402A8
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEB9C402A8
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 22:10:12 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-4ecf00ea4fbso400039e0c.3
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 15:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718921411; x=1719526211;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SOwGV3v2OJc+y+DLHSnMe8QHumqQBaqdJsLbvD+p0ME=;
 b=FpSGzQBhaz8h4Yn2od6LtTZKzJHs+ZNJEt41ufQNDR5BIcFJvB/1O3LlxP8QKQDUAX
 zzB1AgMWdAM31A9pQRUv/9EDLYys+qhZ5pQZDMMkSY0JCOuRN6kxcHGTDMTIBjDiMIHf
 +uSXyCMqUtfN4GWgXCGdCgDkny6I7DwnRqm/xeGnRLty9BIx/vZQT8la0aASokqXh5m8
 bEIYafNdIYybaIPVO7RRPtvUar8Tami9Gnz3grhLUM2IgXPnXa0+PFFikSL+6KtnhUre
 AYyE/rp87Au52wTdWf+R0yTyxtpgjXg62o4cfrtaX4aZzTA3mjkAhAfX5URahZubaGL4
 cUeA==
X-Gm-Message-State: AOJu0YzzDc+UsTLTvf7DyYGZcAVXDgQpNXdnFiRC82FD9EDV3a2SEhzG
 SNYg4govpEG5kn3fKpPW6JRjGPl/Gd48lOQLQm232jK6Kdr7FmOtOslcKUHH9KLtehCQwEYjtm1
 R/1suz5rpIW1hdSF1ocyXC+EeY36cUP1pHtxYR2p0eafafpjbHPc=
X-Google-Smtp-Source: AGHT+IHaifzMyxz/q1TAgp4hL4bMfLQUTorZdC8D1WNLxltUdvcJlvkRqKfMCgCb0QCW4ps/77MtVWcZrVjz7lbGWzY=
X-Received: by 2002:a05:6122:8d0:b0:4ed:145:3489 with SMTP id
 71dfb90a1353d-4ef277db851mr7689995e0c.13.1718921411306; Thu, 20 Jun 2024
 15:10:11 -0700 (PDT)
MIME-Version: 1.0
From: Patricia Holden <pholden@nklabs.com>
Date: Thu, 20 Jun 2024 18:10:00 -0400
Message-ID: <CAJ6EmCeX=u4vfeueqyZWUh9wRWuEbq5on41QavM6NhYtR6PpeQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1718921411; x=1719526211; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SOwGV3v2OJc+y+DLHSnMe8QHumqQBaqdJsLbvD+p0ME=;
 b=ZiY+p8oFItJ4KZt/KjKo7GwYgEzNY9qNyLIoqp7fLoCz+wc23LaLRdZkOC43nInGQi
 lL2R55hgjB7Bo/qyFr79q44hziq/1oCTzJIZIrN8EgQEgPFhcBJf4ixgpJDK+7nuj0Nf
 OtquMC1o10EKzxTS0ariC5bN+OagBnL21AslP2I2DQuvxPih7YlW5G7cZbM0akwhV9P0
 A9Xv7VfkEmitJAFa68ufTZ3blC8OO1yoXkLEoC+7AJ0Z2AN79xri4iiz/6OlWtjqo6hI
 MmQSytvzQ+1BgucWGeFrjFMyUQgsK/RT8nTYezbY5TYfxFe92wz7C4q7ZusjbKdFSYJv
 Wk7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=ZiY+p8oF
Subject: [Buildroot] general questions
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
Content-Type: multipart/mixed; boundary="===============9104880513865187297=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9104880513865187297==
Content-Type: multipart/alternative; boundary="0000000000001e3df9061b599453"

--0000000000001e3df9061b599453
Content-Type: text/plain; charset="UTF-8"

Where are all buildroot patches that are available for inclusion located on
the buildroot download site?

On reporting issues, what is the "new" reporting system site?

Thanks!

--0000000000001e3df9061b599453
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Where are all buildroot patches that are available=C2=A0fo=
r inclusion located on the buildroot download site?<div><br></div><div>On r=
eporting issues, what is the &quot;new&quot; reporting system site?</div><d=
iv><br></div><div>Thanks!</div></div>

--0000000000001e3df9061b599453--

--===============9104880513865187297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9104880513865187297==--
