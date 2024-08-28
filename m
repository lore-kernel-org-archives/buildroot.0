Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEE4C5B54A
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 15:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF79F406EC;
	Wed, 28 Aug 2024 15:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXW8OLVgOF5t; Wed, 28 Aug 2024 15:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87455404D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87455404D3;
	Wed, 28 Aug 2024 15:45:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AB541BF2AA
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 15:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7465D80CBA
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 15:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDb9Ez_eNXiu for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 15:45:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=jp.baltazar.mendes@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A071780EA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A071780EA6
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A071780EA6
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 15:45:45 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7093c94435bso3767448a34.0
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 08:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724859944; x=1725464744;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QpV7vTl5kFDE/9KPB17lZ+JQNmqYp7+xW79Xj4oEXXI=;
 b=YFkGtDaYWKJU8gnTfwNGmoFJsSdFHXqGXNdzMUml2MmWc+a7aaZW3cGErGFNaL4qVE
 SzlDIguex1c4C1i8948JRSqD4eTs3iAyS6gbF8u5cXw8F0W0lJt89fbM8A2NwEUPk70v
 2qTQ24wTZnQMyI23bOR2/2p6ht0bGPO/nEYrq/gj1QAegoXT6wIprFd64YKdPaQcXadc
 H+gTwWlHuCIK99sN3LEbPE952ks58Xc4fTC91JSE2ArMFlQdzXbqYj5swiS2uAPE6oT6
 Jk2yRqzH7eTDRQEDUs6RopJQU8ib5zFRLitYzDO5hjlAUCLWpF8JRL/gvmqgk/q0GtWr
 XT+g==
X-Gm-Message-State: AOJu0YxgWeGQlggG/hEQEYhdOMU1cMnOKf4pTWLPCcx0UKEARsWM4tI7
 iMYoBHd17nIoCeq+DKLZFTlZalQPMSspWNV3MdXlJg5jJ00OWPAihG/kmsYJPz27ziRjFph8Tfp
 kyzLzu2MSRHrMz73jkHoTxDLksl4S
X-Google-Smtp-Source: AGHT+IEADcm8GN6bQkGwWkzJyKotpHa+3RHZC2Lp6l2XYQB5kFD56ZZqxm27hj131zmIFvBFzgRe0ka+cxkkuE8RBGU=
X-Received: by 2002:a05:6830:6995:b0:709:3772:8c31 with SMTP id
 46e09a7af769-70e0ec8f028mr16102737a34.31.1724859944396; Wed, 28 Aug 2024
 08:45:44 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Sm9zw6kgTWVuZGVz?= <jp.baltazar.mendes@gmail.com>
Date: Wed, 28 Aug 2024 17:45:08 +0200
Message-ID: <CAFAK9+d_UCVZ1+V+Msd3jk5rJg_H7v33fteAORNuNvt1PdJu4g@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724859944; x=1725464744; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QpV7vTl5kFDE/9KPB17lZ+JQNmqYp7+xW79Xj4oEXXI=;
 b=PLnPZAwkjtIljUtuG00jmY7F/tsRHx1f6NhFngfSn3jbKL/jR4bBKMh26IV/WSWd7p
 an15pSsLvR8h2MS8MpkFqU6YUJGVNDVLa46PRxbdAk+KX3GcDP64Z1SvSPNzl8R7yuBY
 tpA/P4KD2D1KuyNi9u8ptixq1pdZcVefOCUNNECwIBX7SLSYArfrH62+gcmQwFCgeRaK
 1o70t5xhlrqjYTV+GQc6Lu5cjDAeHpgJCT04rQC/YYrJ6WUM5e+dHdDYzIFOdwrCBsUj
 OubNtxXcGvw/onSHqycKW2CYwN0Duf4z+WY2S0CVXl/sBvepC4VOk9+DMUrhoRAorfdr
 FJWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PLnPZAwk
Subject: [Buildroot] Building U-Boot FIT
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
Content-Type: multipart/mixed; boundary="===============0294318292078852281=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0294318292078852281==
Content-Type: multipart/alternative; boundary="00000000000045f2580620c040c6"

--00000000000045f2580620c040c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm trying to build a raspberry pi CM4 system with UBoot that has
redundancies on the kernel and the rootfs.

As per some other suggestions I'm trying to move the RPI kernel and the
rootfs into a single partition by building it as a FIT image.

I've seen on the configs that building it as FIT is not directly selectable
so I'm not sure on how to proceed.

Best regards,

Jos=C3=A9 Mendes

--00000000000045f2580620c040c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br>I&#39;m trying to build a raspberry pi CM4 =
system with UBoot that has redundancies on the kernel and the rootfs.<br><b=
r>As per some other=C2=A0suggestions I&#39;m trying to move the RPI kernel =
and the rootfs into a single partition by building=C2=A0it as a FIT image.<=
br><br>I&#39;ve seen on the configs that building=C2=A0it as FIT is not dir=
ectly selectable so I&#39;m not sure on how to proceed.<br><br>Best regards=
,<br><br>Jos=C3=A9 Mendes</div>

--00000000000045f2580620c040c6--

--===============0294318292078852281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0294318292078852281==--
