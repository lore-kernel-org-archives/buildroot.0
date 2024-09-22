Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2D8CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 14:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C581D81398;
	Sun, 22 Sep 2024 14:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D73NS3pOumwR; Sun, 22 Sep 2024 14:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 152D081091
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 152D081091;
	Sun, 22 Sep 2024 14:30:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E92391BF8A8
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 14:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E35C5405E7
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 14:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtbQs3KVnhz1 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 14:30:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=baxiche@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A51574049F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A51574049F
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A51574049F
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 14:30:09 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e1d06c728b8so3255445276.0
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 07:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727015408; x=1727620208;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n3VMx3Ll7I5cWMkpTVD30L2GkRuYPH7PWdXH6bgDdYU=;
 b=RevMik90mJ+EmvUpuNTNdeI0OFWiXk4NgHp4jSQhsFZ6CGuw5M6cOziutrag7XcbiX
 +/jL3eFn6g5SHdj2P0gBZn054aXAKLV52wyEAt5yXfsCJq6U44VWv6ttLsEpD9ssMCPK
 SDZwxKIiQmwGFu+IUKBcp/O0v9hEJA1LpteEMVK99pIPFAu4hD9MytNPlp46s6Vfp9e/
 yiIHQsBWYI0XasKfERKWE1KYtubLJ1EvgF8qxvxVU0/qM540nl8/9lCcqgtKGq3tRK3n
 LNMLS0QgEx7Yav1n675TfiqluxbC1AHh0KEIscA/CjUWRzSlVSmZ7OZ5MtFIFMiYWbKL
 kOrA==
X-Gm-Message-State: AOJu0Yyy7Kxaug2aTua0WI+FmNnj4f0D91TH+6PPGpfEhsZaUnCxN6cy
 rc4dHlDZmg9IAgUoAm58x2xqF2g86dIBUeVYLxOzgq/VwWKkMXnt38E2CpKs99ecoLzxqLk8/Y5
 GD6fiSQ4O7sy1JNE6Izvg6iJUbkJuAw==
X-Google-Smtp-Source: AGHT+IF2zE1NCV3N7KXPvon8C1kZWpct0AhPOG03DK0TZPr2hN6HPy76eMMZP812LfIB7a7j3wjfZ79tD1j5duvAJEs=
X-Received: by 2002:a05:6902:f89:b0:e1a:9336:8b54 with SMTP id
 3f1490d57ef6-e2250c47987mr7918273276.32.1727015408389; Sun, 22 Sep 2024
 07:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240920160500.18551-1-baxiche@gmail.com>
 <CA+R_derRe3Pf0BdL3Y8ykcWjAZewrFJ2KjihXQ3C1axbAwvi2A@mail.gmail.com>
In-Reply-To: <CA+R_derRe3Pf0BdL3Y8ykcWjAZewrFJ2KjihXQ3C1axbAwvi2A@mail.gmail.com>
From: baxiche su <baxiche@gmail.com>
Date: Sun, 22 Sep 2024 22:29:32 +0800
Message-ID: <CAE3sgKjDQaG1R4L-FPQ3e0FVbcxNBir_DZQfeOu-FcxUPKJWMQ@mail.gmail.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727015408; x=1727620208; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n3VMx3Ll7I5cWMkpTVD30L2GkRuYPH7PWdXH6bgDdYU=;
 b=FGPAJGEevSZtQ0Fb2GgkidcfTi8977WSC5nc3nLj0ZZ+k/w/8O/x0AiY+wEuoKRCoG
 w7fm8tuiubGh49GW4aU92OSbUopcCRqXFywSVKNrlVc8Gk0FFWY9annXBqVTINA8P9Uo
 aK/hoyxubZSX+ct4EFa9lblbx2zNlHTlwAeMVGO7KwmKMT72+3aVHP6+8a+s2IF/Vd6d
 bof2Y1hZZkOhzWJvixEQKku5MH2hRUEsxWESpr/qifoJ47prbJqsbxCqAkCgHYtwkZ6B
 Zf/0agMNa6xZ2xYnaHLi/tVka7D4J++tPWGzEHeJA0IDyoWLfJG6PXVgPVeDeG38qqR5
 /+dA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FGPAJGEe
Subject: Re: [Buildroot] [PATCH v3 1/1] package/qt6: add qt6 multimedia
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2895526500516960690=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2895526500516960690==
Content-Type: multipart/alternative; boundary="000000000000f0562c0622b61bfa"

--000000000000f0562c0622b61bfa
Content-Type: text/plain; charset="UTF-8"

Hi Roy,

I'm sorry for the formatting issue with DEVELOPERS and the Config.in file.
I will fix them in the next commit.

Regarding the qt6multimedia.mk file:

1. The reason I don't make FFmpeg/GStreamer a choice, is because
qt6-multimedia can be built with these two packages, and the media backend
can be chosen at runtime, or even built without these packages.

2. The reason I don't make ALSA/PulseAudio a choice is that qt6-multimedia
can be built without these packages.

3. I personally prefer to set all qt6-multimedia FEATURE to OFF at the
beginning of the .mk file and set it to ON if the option is chosen. I have
seen other qt6 packages do this. If you prefer to gather all the code
related to one option in one place, I will make that change in the next
commit as well.
Thanks for reviewing my work.

Baxiche

--000000000000f0562c0622b61bfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi Roy,</p><p>I&#39;m sorry for the formatting issue wi=
th DEVELOPERS and the Config.in file. I will fix them in the next commit. <=
br><br>Regarding the <code><font face=3D"arial, sans-serif"><a href=3D"http=
://qt6multimedia.mk">qt6multimedia.mk</a></font></code> file:</p><p>1. The =
reason I don&#39;t make FFmpeg/GStreamer a choice, is because <code><font f=
ace=3D"arial, sans-serif">qt6-multimedia</font></code> can be built with th=
ese two packages, and the media backend can be chosen at runtime, or even b=
uilt without these packages.</p><p>2. The reason I don&#39;t make ALSA/Puls=
eAudio a choice is that <code><font face=3D"arial, sans-serif">qt6-multimed=
ia</font></code> can be built without these packages.</p><p>3. I personally=
 prefer to set all <code><font face=3D"arial, sans-serif">qt6-multimedia=C2=
=A0</font><font face=3D"arial, sans-serif">FEATURE</font></code><font face=
=3D"arial, sans-serif">=C2=A0to OFF at the beginning=C2=A0of the .mk file=
=C2=A0and set it to ON if the option is chosen. I have seen other <code><fo=
nt face=3D"arial, sans-serif">qt6</font></code> packages</font> do this. If=
 you prefer to gather all the code related to one option in one place, I wi=
ll make that change in the next commit as well.</p><div>Thanks for reviewin=
g my work.</div><div><br></div><div>Baxiche</div></div>

--000000000000f0562c0622b61bfa--

--===============2895526500516960690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2895526500516960690==--
