Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368ECD64076
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 00:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB23E41C2C;
	Sat,  9 Nov 2024 00:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCxawPvg5AQk; Sat,  9 Nov 2024 00:23:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A826D4248E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A826D4248E;
	Sat,  9 Nov 2024 00:23:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7F78978
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 00:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C90642497
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 00:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajc30QmwDOh1 for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 00:23:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B679F41C2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B679F41C2C
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B679F41C2C
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 00:23:47 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-83ab21c26e5so105156439f.1
 for <buildroot@buildroot.org>; Fri, 08 Nov 2024 16:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731111826; x=1731716626;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=47n1T4CR/VCgaR/KKwzvfx6MrjIMdY4MQNqU6MURubc=;
 b=sdaYOh91Ks5C/NuafuN1HLrHLTm2nf4QcBGQt4W2pUJfUuSFRhi4XS3MbG9vVtVgZc
 YwCY0yXJETYlhnpxF9mBJtwi5exTgXTQAvziNQM2VBXKcZh46WZCzoVr0nguLrpKe3f6
 BjEknKhT4BlqR4w8JanNm1GuePfgWYFmxxEfTfogukVVvjfN9aVcjSsp+j+3AsYS3jT+
 4bHIDX0HisvEFJq3LbuBr7d68woRiMINK8v9b/FeWwNRppIYaoWBTvmGcNHe4CQsvtSV
 S9TYMRKK+hB7QEw177wNJNWAYfxf8uVR2aHLVNBnpk9EjaCp7/h6Qd1Cu8aVjM8aGw1h
 t+Mw==
X-Gm-Message-State: AOJu0Yw5LrclJcDctokXbtsd+NOGW10A1q5FQ5kfte7PpCZGouXsXa6S
 FR2WEb6UuO+y122zymytp88p7s9hCONoTSdwWabciWGPZDrvf1Pg
X-Google-Smtp-Source: AGHT+IHTbR4ypU/4NQollmeodNsk3DWnItk2Wc3HPc/zZqT3HEI+8zwKarVqeiJCO1/7EAdfrBAWow==
X-Received: by 2002:a05:6602:3fd0:b0:83a:c242:82aa with SMTP id
 ca18e2360f4ac-83e03360ef8mr625374039f.13.1731111826429; 
 Fri, 08 Nov 2024 16:23:46 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83e13256349sm6014739f.13.2024.11.08.16.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 16:23:45 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Fri, 08 Nov 2024 18:23:39 -0600
Message-Id: <20241108-dtc-1-7-2-v1-0-1141a7b163e9@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIurLmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQwML3ZSSZF1DXXNdI90k4zQjCyNzAxNLMxMloPqCotS0zAqwWdGxtbU
 AU1WGblsAAAA=
X-Change-ID: 20241108-dtc-1-7-2-b3f282704964
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, 
 Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731111826; x=1731716626; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=47n1T4CR/VCgaR/KKwzvfx6MrjIMdY4MQNqU6MURubc=;
 b=YkyFKmaxsRyJUcAysocpX5Zc13DMul3G6cgNLOKxtLmCCRBS9EVTjmEayQYPBSzWBr
 EgIH3D6uBsG6fzmNbaBVWUPdRFq7fjqq8vXuk0E8JDSwsNkTLzM7DyEpkZ224JX+E2HA
 PBOseZ+jDzbSHPoQe+zy9Uoc2OyDXoUXaNTNiXi8zayCHOgQqco6MG0aJ18S1hN/fv4l
 RDN2QXeNmnqKK/u0smkCQ0zXg6/rgJnWqls9PNxn7E7e680g7anJPVrKXEqcIW7UW8YG
 dIOX2rjkXlGa3rZ5IrB1aPUhWlJ0We4UC19wZSfs61oUSshFuVOpmYKoR1BI2JcihozF
 h3Xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YkyFKmax
Subject: [Buildroot] [PATCH 0/2] package/dtc: update to dtc 1.7.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
Brandon Maier (2):
      package/dtc: update to dtc 1.7.2
      DEVELOPERS: add myself to dtc

 DEVELOPERS           | 4 ++++
 package/dtc/dtc.hash | 2 +-
 package/dtc/dtc.mk   | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)
---
base-commit: c31c13a280bab270fe74674ecfe669365871cbad
change-id: 20241108-dtc-1-7-2-b3f282704964

Best regards,
-- 
Brandon Maier <brandon.maier@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
