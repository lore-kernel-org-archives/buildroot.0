Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07034E71D4F
	for <buildroot@archiver.kernel.org>; Thu,  5 Oct 2023 16:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8274642849;
	Thu,  5 Oct 2023 16:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8274642849
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CqknJHV4CDiW; Thu,  5 Oct 2023 16:17:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BE9F4284C;
	Thu,  5 Oct 2023 16:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BE9F4284C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C21FA1BF40E
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 16:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B3FD8338B
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 16:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B3FD8338B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8VjNn4-_tYA for <buildroot@lists.busybox.net>;
 Thu,  5 Oct 2023 16:17:42 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 510E883386
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 16:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 510E883386
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3248e90f032so1196710f8f.1
 for <buildroot@buildroot.org>; Thu, 05 Oct 2023 09:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696522660; x=1697127460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BvSEUqT0sIVD8XWSW8PxOj2rp5VoAqQWzt51Yo1lXVY=;
 b=iKlZZ3Avl9tFVrGy9EgrII1hPkgNyPZuPgGdwByXTah7k2CCw0zaXTa4pj2r4SpI1t
 bYIDRRyYbZ0QupnNg1d1aD448alZlmTIKUQ9xk3+QgmgTFTVvo4+RjRrFtUWBgXYSaeV
 Qmxp/h4DHQbxUO7ydH77HpiArgk/WkztzN4OQDqkhZXgdFvVRgaqD/ZatFob/FypUTAH
 9b5x65nAYWA23aVeD81CD92R3x58P0uqH1mwdLUF38Zq9R/wxBNSafA0uk4Kt0F8QF4O
 5znDVpO0PkLydcdjEIEKXeNYsyzM/fHkZs7O85wqxyzRH7XKUoBFsPzbzBBCcT32utM7
 HG6w==
X-Gm-Message-State: AOJu0YyQeZuo+aHfNQHSgoeUnYc8qP0zriSkLQa1fGt7ikqb46LrCKct
 vFf/oYjPM4mrxhrcTagTywTa7wn7wMc=
X-Google-Smtp-Source: AGHT+IG+SzoFGcMXMMkCJf6Pp4tUSnmloMm4nZg8K7YXhnJxfqSnZ+Y4YtnjRB2zmUGAS1GRbR4v/A==
X-Received: by 2002:a5d:4d02:0:b0:317:6fb5:bafc with SMTP id
 z2-20020a5d4d02000000b003176fb5bafcmr4766962wrt.65.1696522659988; 
 Thu, 05 Oct 2023 09:17:39 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:c5c9:a1ea:cbf9:9051])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a5d510a000000b00324887a13f7sm2133890wrt.0.2023.10.05.09.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 09:17:39 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu,  5 Oct 2023 18:17:38 +0200
Message-Id: <cover.1696522656.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696522660; x=1697127460; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=BvSEUqT0sIVD8XWSW8PxOj2rp5VoAqQWzt51Yo1lXVY=;
 b=nZVxei6AdSvYngvsJh18202OyjIRrS1SPdufSQXh+qC6nsljfG4I8qlJMHszC/wCX3
 BLNuvU4iiRByML62ryor/yoRcG4RaPbSnVE9I0Sw50AwbJaHAKFhL6vErxGdUslmK7Wd
 ro1YWd7QkYDnVZUPSW9DXN5Lz3UUUWyxuEoe+BWm7/iEnoCRkBq2WThCw1eyqn+BWoEC
 fr6ZQnsKTu5cDwe8SRfUDcPumkrdJa7HAxJqRPlzFIfM53JrvKG6k1fSCpYjuvSYnnyp
 5zigfIGnaot6IBc00fnMizPpsME1IqLxh/lPmmx5LfTDU3oHTmeDBWSg6GaGjKq65Gpq
 u0hQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nZVxei6A
Subject: [Buildroot] [PATCH 0/2 v2] support/runtime-test: extend graphic
 testing for weston + flutter (branch yem/flutter)
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This little two-patch series extends the runtime tests with a helper to
allow easily testing that a graphical application properly renders
something, and converts the weston test to use it, and finally extends
the flutter test to use it.

Canges v1 -> v2:
  - fix flutter test

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      support/runtime-test: add helper to test graphics rendering
      suport/runtime-test: extend flutter test to check rendering is happening

 support/testing/tests/graphics_base.py             | 39 ++++++++++++++
 support/testing/tests/package/test_flutter.py      | 35 ++++++++++---
 .../flutter-gallery.service                        |  1 -
 support/testing/tests/package/test_weston.py       | 61 ++++------------------
 4 files changed, 78 insertions(+), 58 deletions(-)
 create mode 100644 support/testing/tests/graphics_base.py
 delete mode 120000 support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service

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
