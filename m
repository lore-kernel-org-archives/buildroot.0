Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC3EC02196
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 09:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D49360667;
	Mon,  3 Feb 2025 09:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnbQk-yXi-MN; Mon,  3 Feb 2025 09:34:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AE9E60673
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AE9E60673;
	Mon,  3 Feb 2025 09:34:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 388441A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 09:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26C6A40BEF
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 09:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcDNxNp-ABj5 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 09:34:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DA8240B97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DA8240B97
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DA8240B97
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 09:34:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso30402645e9.0
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 01:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738575249; x=1739180049;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+FBiRUj2fBcRHzjlI/A/9wlxkF8ZA4UBib9t+iMuII=;
 b=Y64SzNDKxofIXkm4aZL3kJjx/mm0nd+bR3tJilSI6ZopRIakjLUVfPaEQk/R5x0W9h
 hW39JFRVF/IoaacMlvwaAkJ0Tl/YwYLBJTPyDoxfcJYJ1hgcv39op9MQAtQyKbxPUKqo
 6c3YP2QbfNONJIn5v16YxB4+oo8XWTRQ60ITC3ad2imRvnizTazvtmVteefNO64hej2O
 n1O6gGKkUcOxnQkGVj/lAfZuYIRMILT7GBJBuInHkxfsxoyUKCzyjI1138quaoswf8aR
 QKgUdy2X3KYZ9oBDdpeIyAyEHUJHM1kXueEy5OvRoh/O3yS7Vtbfx8oN/wceokFNXqYt
 Yvjg==
X-Gm-Message-State: AOJu0YwYIMlfCksE4FOzGUKAb572myKC6ZURt5fn8KNY5FxF2xDaYTXz
 EG/h/3Bey9IRk4UUsgw0gIi6wU88iIbr1kyEL9J2a5MQ7Ywo6tb87XnVzbHrEBI=
X-Gm-Gg: ASbGnctiFUF5JedoycerBpuDQ9DWVcSPa92Az65FqInLRGR8jlc44fVyhJ70HlFKdRe
 iKM4GyH8d14fzkEsmt6rLRMVSeZPKSqscgBfqm/eIeb6b1dR/P4sdFur8OqabR+/aSSVvaXGoFY
 cFodZoFkAdrJelq91qH6HKYgeoC8v9FKYyqBWWXbCi2Dpl63HaZpPfUsyfzqqYRLQQSgdedWSuy
 PgXoj8FX8hdC0i/Gn/pvalQaga2co5wQ6p4W+Qh4U5D2t6P74Yi8orjoflf8bJwnWguxjiMZc3t
 Npcqbhg7eESqjXCyjyZhNhVSbgUNyXR/9yIHQ6eG2C3pwN6B6oUa
X-Google-Smtp-Source: AGHT+IFdcfLpSXnTZgW4e6X5IyoK2ZErdBpYbFMlJxsMT5rRlgH6B2sclb3q6iblmCQVs3iDa1jGGw==
X-Received: by 2002:a05:600c:3508:b0:435:194:3cdf with SMTP id
 5b1f17b1804b1-438dc40c43emr170785655e9.19.1738575247749; 
 Mon, 03 Feb 2025 01:34:07 -0800 (PST)
Received: from landeda.. (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc8a59dsm187848275e9.40.2025.02.03.01.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 01:34:07 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: Paul Cercueil <paul@crapouillou.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Mon,  3 Feb 2025 10:34:06 +0100
Message-ID: <cover.1738575233.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738575249; x=1739180049; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=m+FBiRUj2fBcRHzjlI/A/9wlxkF8ZA4UBib9t+iMuII=;
 b=DAKr5OWjRA4z9lOYAZBzppjnIqXx1ku2S7eA39yJ5V9mUEOgNpE1MrglzRiy9vi7wO
 PQIi7ttfmugkej3fYU/r6L4Y4ybP+LWBHo/1m5e3Hu3qB3qHI2vOvtVchfJeeOWkspi9
 ckbSlnPfsF1aMTMbIyjRcKopyTYA0pouclyHj2uQ5RgJiO1QMuo9Vqsg6w+4FKhX09dH
 XvwAOSojpBlHcT479+89xiVv1amWIaD71YffgQqDJzKITEazM/FSZ1MW2JcsgOShnBoP
 p4l99vx6J4U8SOymWP4V8TIqWNlZ4EFpNYZOYkvSCCdg8f85k67MXt1QQhmx2FulMVP8
 Jxvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DAKr5OWj
Subject: [Buildroot] [PATCH 0/3] package/sigrok: update and udev rules
 (branch yem/sigrok)
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

Hello All!

This small series bumps the libserialport package, and installs the
libsigrok udev rules to allow non-root users to upload firmware blobs
to the devices.

Ths sigrok.org server has both AAAA and A records, but there is nothing
behind the IPv6, which causes huge delays when downloading file from
there. This is addressed in the first patch.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      Config.in: timeout earlier when connecting to download servers
      package/libserialport: update to 0.1.2
      package/libsigrok: install udev rules

 .checkpackageignore                                |  1 -
 Config.in                                          | 10 ++++-----
 package/libserialport/0001-uclinux-detection.patch | 26 ----------------------
 package/libserialport/libserialport.hash           |  2 +-
 package/libserialport/libserialport.mk             |  3 +--
 package/libsigrok/libsigrok.mk                     | 16 +++++++++++++
 6 files changed, 23 insertions(+), 35 deletions(-)
 delete mode 100644 package/libserialport/0001-uclinux-detection.patch

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
