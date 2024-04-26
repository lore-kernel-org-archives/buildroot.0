Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A136C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 00:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3D0683BC5;
	Sat, 27 Apr 2024 00:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJMoDj0BUErH; Sat, 27 Apr 2024 00:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A690D83BC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A690D83BC7;
	Sat, 27 Apr 2024 00:00:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E21831BF20D
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 23:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC41783BC7
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 23:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QvbnF802ZA0 for <buildroot@lists.busybox.net>;
 Fri, 26 Apr 2024 23:59:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=stefano.cottafavi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 119D783BC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 119D783BC5
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 119D783BC5
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 23:59:57 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso3045918276.2
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 16:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714175996; x=1714780796;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6mCsFtw13454PFAfcHXNqOEtqoZpBh+Y5KCvfV5t5g4=;
 b=ch7Gbm0/A2UbErVQn62ACgkO/vudiR27iBuea2799smNlOPCQZ4lyqfQXX2Ptf5bw9
 wqCRHyiQQNudEDx5B2U8ZwJMhcTUMNNf1toLoHurThLdCp4+oMaM8wu7pCVmk7WrztDz
 die/smgrrBDimf8gyvOqEbIrDWvKtSHT8IS2NLCx0tFBuTQNJjMAFLvBI+gyGaLt5Mlr
 UNKx8YhPb8zEK1yoraEa8U7La/uR25XInotS570f8dDywrFdtXIM3GwF71uLwrL9/bPf
 +0HvV6P0R6ra5+Up13IhcYQGzxmh34cq1ohxeOy7HNh8l6TO5THfPB00urZE2F1Cs026
 nCYg==
X-Gm-Message-State: AOJu0Yyp+6V4839eRhKGURtucAgtzNuACl/OXJlIShO5+0IU3+Oeu+zA
 HM1I4IV+5+ef9YD+KAv+sAgtdoFnG9+JpTM1z3uhqSlbI0s+Xji9FvlR0TukYVC8jrycaY62ckz
 03dElcKlmsHjiVuKkWTl8IICpNH407w==
X-Google-Smtp-Source: AGHT+IGRhjTU213EZq9mZSAjY4xzWTpKk+ZseU+bLM7DJ2lVyyXlFRtwZ4b7kN9oE+oD/gFXt5x+oIxrxQPTSZ6rlVo=
X-Received: by 2002:a25:bfc8:0:b0:db9:9134:bb28 with SMTP id
 q8-20020a25bfc8000000b00db99134bb28mr4789396ybm.4.1714175996392; Fri, 26 Apr
 2024 16:59:56 -0700 (PDT)
MIME-Version: 1.0
From: Stefano Cottafavi <stefano.cottafavi@gmail.com>
Date: Sat, 27 Apr 2024 01:59:45 +0200
Message-ID: <CAPn86JA8TK3+uMSRCvtm5eRr+VOTL7B2BNCZWKhTm7=XqaJgvA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714175996; x=1714780796; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6mCsFtw13454PFAfcHXNqOEtqoZpBh+Y5KCvfV5t5g4=;
 b=UgtdKRYFOlUjiGTy4PjPwxhSq3j1WzOHgLrxsdj6jxvaQ0S5vzQa0T5bAaWUrYuLiH
 ntbHhdTfNUG8oxJcIt0brV6Cn6hSKRCGkecT3iXyyychZt47RUeOSZIm+pJY4uRemFPT
 lO8wN4kDHc99gLuIVIBYzrpNg7efUfUjjIxOVshMa92xHK08fD8fSKNWjSbkqGi7O20J
 UBvpkGlaRTMUipvRm/H68bzLS9gBFWti5xJ54b0suYvPCLcJG5tN1KsDXs8lja72mWTN
 wB/aRdrWP8xojOy5hTzMlYBDeDlJB0Mo8ioPs2sOzYC1qjZR5cDRL4hf7sa3FOisKw+b
 GX2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UgtdKRYF
Subject: [Buildroot] raspberrypi4 UART0 echo can't be disabled
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
Content-Type: multipart/mixed; boundary="===============5500297344313807706=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5500297344313807706==
Content-Type: multipart/alternative; boundary="00000000000059014d061708b334"

--00000000000059014d061708b334
Content-Type: text/plain; charset="UTF-8"

Hi,
I'm building the raspberrypi4_defconfig from the master branch, with the
following changes to enable UART0 on the GPIOs:

1. in config.txt I've added:
enable_uart=1
dtoverlay=uart0

2. in cmdline.txt I've removed all references to console

A character received on the RX pin of the Pi is always echoed back.
"stty -echo -F /dev/ttyAMA0" has no effect.

what's going on?

Thanks for your help. Cheers,

Stefano

--00000000000059014d061708b334
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi,</div><div class=3D"gmail_default" style=3D=
"font-family:monospace,monospace;font-size:small">I&#39;m building the rasp=
berrypi4_defconfig from the master branch, with the following changes to en=
able UART0 on the GPIOs:</div><div class=3D"gmail_default" style=3D"font-fa=
mily:monospace,monospace;font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-family:monospace,monospace;font-size:small">1. in confi=
g.txt I&#39;ve added:<br></div><div class=3D"gmail_default" style=3D"font-f=
amily:monospace,monospace;font-size:small">enable_uart=3D1</div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:small=
">dtoverlay=3Duart0</div><div class=3D"gmail_default" style=3D"font-family:=
monospace,monospace;font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-family:monospace,monospace;font-size:small">2. in cmdline.tx=
t I&#39;ve removed all references to console</div><div class=3D"gmail_defau=
lt" style=3D"font-family:monospace,monospace;font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-family:monospace,monospace;font-siz=
e:small">A character received on the RX pin of the Pi is always echoed back=
.</div><div class=3D"gmail_default" style=3D"font-family:monospace,monospac=
e;font-size:small">&quot;stty -echo -F /dev/ttyAMA0&quot; has no effect.</d=
iv><div class=3D"gmail_default" style=3D"font-family:monospace,monospace;fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-family:=
monospace,monospace;font-size:small">what&#39;s going=C2=A0on?</div><div cl=
ass=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-family:monospace,=
monospace;font-size:small">Thanks for your help. Cheers,</div><div class=3D=
"gmail_default" style=3D"font-family:monospace,monospace;font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-family:monospace,monosp=
ace;font-size:small">Stefano</div><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace;font-size:small"><br></div></div>

--00000000000059014d061708b334--

--===============5500297344313807706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5500297344313807706==--
