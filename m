Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563D6C28B2B
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 17:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB9FE405CE;
	Fri, 19 Aug 2022 17:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB9FE405CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bu6g_kbJyU4W; Fri, 19 Aug 2022 17:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D590C405CD;
	Fri, 19 Aug 2022 17:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D590C405CD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAB4D1BF366
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 17:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5A8D60C17
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 17:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5A8D60C17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5xNAZYl4qlH for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 17:51:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 967AA60B32
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 967AA60B32
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 17:51:02 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a4so5999800wrq.1
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 10:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=1Rc/eFpylo0c5bIj/yzypb29+hDXuh84yucXpe3d3NI=;
 b=wd3QyqsqgpKbJKhlLJ25YbqwoJ9iZ/C+eb59da+K5g7bLy/UX05raFZ4btlybOzdYn
 N4c813lnYM3HswSVhXZ1HVukkFAXHzCV4mSBRpnUxTedKEIbCR0zOJJHjfVPYs/yIH00
 cbPHNZa7gFHuvH+FiflmcNP/H7buvvlFYpfxNoRwLgnzDX+1rNwz5ZgzFcjybUVG70KK
 y4dJKCZz1uQ6qvBnjZUGhmajM+MwzvMfhQET2mWyGeYwFUKUzx739j4zM+oRCU+Yclyx
 DNeGyAA3z++WNmb7+EpDhcg2+rikQSNdCsFCiUYouzK/bWC+OhPW06qpY/hYx6qBcfDs
 2bMA==
X-Gm-Message-State: ACgBeo3Sraf5mEIxBa3qABT6wEKb+bj3D9cC+1e6QRcPqa51+YQWhh2/
 9M4zUKLMEvNrYtDZbVpJj2bc59DTic8=
X-Google-Smtp-Source: AA6agR4Gd9BNAL7ZIsiQuGHGCrp3JykPrVWXo52MAsr+v/p21FPI3f+gjkMhuuUBOiiTIS22LAoIgw==
X-Received: by 2002:a5d:5a0c:0:b0:220:6cd2:33fb with SMTP id
 bq12-20020a5d5a0c000000b002206cd233fbmr4596811wrb.560.1660931460490; 
 Fri, 19 Aug 2022 10:51:00 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:54a5:9a99:1f8c:15e1])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a7bcb01000000b003a502c23f2asm9533012wmj.16.2022.08.19.10.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 10:51:00 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 19 Aug 2022 19:50:59 +0200
Message-Id: <cover.1660931225.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=1Rc/eFpylo0c5bIj/yzypb29+hDXuh84yucXpe3d3NI=;
 b=lqntXxuNdaYdzUEYh1aknPIO3UDRZpM0QZWQYVqGOa4udSNl54d9cJfCnQwYrGKOUB
 OlXUD86aU6FZtFXPv5w9H+P4U5H9VCXGAHqJznJrwKK1V2k6h8JotWGhXKy1aRIfZ3T4
 wVf1TrEQD0pBlb8uPDYit57LotmKm4nZIUSVc7LbJ2+ILl4tX3hzP7xLomSNf7IlD+sC
 xgd3IeCLqPZ/Um7xdYyx7rJX0T2ThQvZ0xRuQw/7R32XLDbzfE2pqsnOISWPReSBJRQR
 tvJNRfG//GPAMytGLrYjE/4xsac8wg1fgD4jMIBPWvsOtXACXCg909qZf0n5IDJ86pEy
 5hXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lqntXxuN
Subject: [Buildroot] [PATCH 0/4] dracut: extend support and tests (branch
 yem/dracut)
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Adam Duskett <aduskett@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

Starting with a discussion with Arnout about adding the last item in
the list, this small series extends or dracut support in three ways:
  - allow user to easily provide custom dracut modules
  - allow user to use more than one dracut config file
  - extend run-time tests to check DT_NEEDED are included, by
    exercising the above

Additionally, the existing run-time test about the presence of pv is
redundant, so the series starts by cleaning it up.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (4):
      support/test/cpio: test for pv already done by listing the cpio archive
      package/dracut: allow users to provide their own modules
      fs/cpio: accept a list of dracut.conf files
      support/tests/cpio: extend runtime tests

 fs/cpio/Config.in                                     | 12 +++++++-----
 fs/cpio/cpio.mk                                       | 19 ++++++++++++++-----
 package/dracut/Config.in.host                         | 11 +++++++++++
 package/dracut/dracut.mk                              |  9 +++++++++
 support/testing/tests/fs/test_cpio.py                 | 15 ++++++++++-----
 support/testing/tests/fs/test_cpio/dracut-cramfs.conf |  7 +++++++
 .../fs/test_cpio/modules/99cramfs/module-setup.sh     | 11 +++++++++++
 7 files changed, 69 insertions(+), 15 deletions(-)
 create mode 100644 support/testing/tests/fs/test_cpio/dracut-cramfs.conf
 create mode 100755 support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh

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
