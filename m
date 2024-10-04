Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F20FCF8840
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 17:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C27E340438;
	Fri,  4 Oct 2024 17:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGujlN_MS3yt; Fri,  4 Oct 2024 17:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ADA7413B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ADA7413B3;
	Fri,  4 Oct 2024 17:56:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C7B81BF982
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 17:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BBA56117B
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 17:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52w0T8n0X2ld for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 17:55:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a31; helo=mail-vk1-xa31.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 614E16117E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 614E16117E
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 614E16117E
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 17:55:58 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-50c937b92d9so226041e0c.2
 for <buildroot@buildroot.org>; Fri, 04 Oct 2024 10:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728064557; x=1728669357;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bd1kGUtsI9DiYIq48hemKEoctkytY9A697COxNiQylE=;
 b=Yssjo7Mszjh/3KijaLvOLtWB6fT5XYJAG33rngcyQUvjl376kCIbnU3UoG2FSv3rxU
 YjYiGD/mqxzujUY5YzaodoYQXIgp2Bc0Z2a3j3C/ECKySJJrNrkYfoSA9uJE3C5ypAkq
 5hPCNamAC4AJRKmEPSd/Axy7Arb28HD0Rl3AWFmZz2l9vOmLnugthaUjiW4ugSnI5vSd
 RIeZepAaxgy+Aa/Wbpx2IsUF6cX6KpBV3FALexJaKH4s5PGGLf/V3IeKaCGdR1mGP3qN
 +3R4tPM2dnhdqOGcgZdFtXIIEsWwyxpQoa7N8CmcZ0bCWYAsEYGSwmHc/sEOYk5MYfdo
 D31Q==
X-Gm-Message-State: AOJu0YzHmldNLTesXzf2AvbiVIBmjFdhcmGD3MLwwBXOnAWSAiGnXgiW
 8NXXpgSw20XmOluvsyc1nHW+OSQc56kXzhPMwv9fW72eqL177Qgq7SNQUOcSNJYYS2BO5SO0gaI
 vx2BRLFDJ8L1GeI0poPpfgpPzU8SyGLlwbsQncfiwFggCp/K1VGY=
X-Google-Smtp-Source: AGHT+IEdsW4OMpTCwVz0Emf/gwHR1Fbp9aC0Zwus1NkmfmW7i3+orEBWhLQsvGE1hIcU0BV9jqatNF4qq8HNWiR7oa4=
X-Received: by 2002:a05:6122:459a:b0:50a:d1e3:82f7 with SMTP id
 71dfb90a1353d-50c8557deb1mr4510737e0c.8.1728064556753; Fri, 04 Oct 2024
 10:55:56 -0700 (PDT)
MIME-Version: 1.0
From: Patricia Holden <pholden@nklabs.com>
Date: Fri, 4 Oct 2024 13:55:46 -0400
Message-ID: <CAJ6EmCfKm3W5yFiTTnMO48n75YRKr2kPFHUttwfwvCn8tbSeaA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1728064557; x=1728669357; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Bd1kGUtsI9DiYIq48hemKEoctkytY9A697COxNiQylE=;
 b=RpGu3pZb1a9wBrCRIm7B8BzDRrAFHpWf1pjJ5lZXnLQ58scaNi+gexJOreF935/juJ
 BOs6JuCV8UMDqX41UNnMdmVum03MgEtNYEchfRHp5Q/xOE3xIFrsRrkV99rpBy2xO/Tt
 oSLeEzwVRwTxkalw7ouztpm5uTyQi3iK0Lw0wPtICbvy0es0BIU6UwObwxebWryCaHqM
 +bXbiCUp88FWZAYP3i8G7/GeJg48wF3IxIVJmwnNQOaTyjddM6d9tVq/0e0PMkOW63Co
 DRqlXkJtEodl7vfR9S8uuQ2kVgEfK2U0eTcWlNYhmQw1zr1NZIz+3Mm8VmhpzZg0Dg/1
 gJhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=RpGu3pZb
Subject: [Buildroot] Qt6Charts support in 2024.02
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
Content-Type: multipart/mixed; boundary="===============0642135316933117473=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0642135316933117473==
Content-Type: multipart/alternative; boundary="0000000000000dfe5f0623aa6200"

--0000000000000dfe5f0623aa6200
Content-Type: text/plain; charset="UTF-8"

I am working on a TI AM62x project which will feature a QT based UI.  We
need Qt6Charts support for some of the screens for this UI.  Is there a
patch available to enable Qt6Charts?

Thanks!

--0000000000000dfe5f0623aa6200
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am working on a TI AM62x project which will feature a QT=
 based UI.=C2=A0 We need Qt6Charts=C2=A0support for some of the screens for=
 this UI.=C2=A0 Is there a patch available to enable Qt6Charts?<div><br></d=
iv><div>Thanks!</div></div>

--0000000000000dfe5f0623aa6200--

--===============0642135316933117473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0642135316933117473==--
