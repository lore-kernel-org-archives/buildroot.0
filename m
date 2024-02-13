Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA56C4829D
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 02:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F00B64051E;
	Tue, 13 Feb 2024 02:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUavpU5mq1Y9; Tue, 13 Feb 2024 02:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E651840521
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E651840521;
	Tue, 13 Feb 2024 02:06:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0381E1BF343
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 02:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E480F40521
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 02:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OJjZd7Aern8I for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 02:06:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD89F4051E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD89F4051E
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD89F4051E
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 02:06:27 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-219122781a3so2516121fac.0
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 18:06:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707789986; x=1708394786;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kd9bKMaA0Cc5IqyB2BV6jlc9d5zwXBY+unnXEQKx6Pw=;
 b=QlhKb0b4gu1yjc+7lGK1uswfUdG/E69LhlDnilYt76u5xX0L7PhgIdxZrwWu3XQaVe
 QxNS5e50FJ+DRSR9nXpAKAwAK7e0UrfsFjtV2/dm4gbnfzY5rKwNm0fTM21L4WoPUJTg
 mKc/Rr6m39E2OaZNvoN6HfwTiDpP6C9zwDPhiqU3K5i9bcsXekI2n3mNb+OP2m/MSdMV
 HiWqSdwsUwWBjaw88LOk68aB4ay2HuAKumqkdIDBN5Op0+Nu+CuCsgaQUPe8Vdy/qcyF
 SC+k/esDj00VZKhUDlEbBwQ2x0PG5zm74LwdptnlPN9m9pzjK/lmoRj1C0Vbh87S7RoD
 WK6g==
X-Gm-Message-State: AOJu0YwKy1tSFwZjGEO2AaVeAn28uvoW7W6Og4obvbh3tmDJ61MW7+DG
 ObPf6qusdokVvtjIfCloA/cC7nAg9m2Kp3uQDkTyYSlbbQ7yZBTRYJsQAQu2OPg=
X-Google-Smtp-Source: AGHT+IFyRAU2GpPqsvILpFB2x1GBnNWJhdGvfSGLGSR6F0lr0kA1SHrDsGeYY2AZ8QX8YYSWR+w40w==
X-Received: by 2002:a05:6871:888:b0:219:eeb6:2ebc with SMTP id
 r8-20020a056871088800b00219eeb62ebcmr10389858oaq.51.1707789986071; 
 Mon, 12 Feb 2024 18:06:26 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 q23-20020a638c57000000b005d6a0b2efb3sm1137738pgn.21.2024.02.12.18.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 18:06:25 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 18:04:20 -0800
Message-Id: <20240213020420.1339668-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707789986; x=1708394786; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kd9bKMaA0Cc5IqyB2BV6jlc9d5zwXBY+unnXEQKx6Pw=;
 b=YEE13daJV/Ax3CvIvIOMg1wHtkU0wB4CH/IEXH1fJd6NDO1fW2gDFL16XHvoOrrryf
 HT5gwtU3VDzee8+yhYymg5TXyX37BaF67X0+abH71pFYTnhMNeEvelPQqGMPLLrjdIYZ
 l9Seg3tbjhrgne0Mx1dqnt8HZWOKyxBODhUtO6NiYYsMuSRJfyHmFOh0+nZe2DdPAXGo
 y6CmUL2tWfOutM7VPhPnFzA49LbowupGQ5jZrIR+4j4Vy+zvWsfU6ETFtJBbRQcupguo
 egYjJCkm4hImAxFIteaPZtAgLQnRiP27Vpkav4b3Y38r1SvzRKNwLih6dsWAppEf+kCu
 N6wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YEE13daJ
Subject: [Buildroot] [PATCH 1/1] package/xz: bump version to 5.4.6
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change Log - https://github.com/tukaani-project/xz/commit/0ef8192e8d5af4e6200d5d4aee22d1f177f7a2df
Updated hash of the COPYING.

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/xz/xz.hash | 6 +++---
 package/xz/xz.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 3d93ad6b5e..e8025a8065 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,9 +1,9 @@
 # Locally calculated after checking pgp signature
-# https://tukaani.org/xz/xz-5.4.5.tar.bz2.sig
-sha256  8ccf5fff868c006f29522e386fb4c6a1b66463fbca65a4cfc3c4bd596e895e79  xz-5.4.5.tar.bz2
+# https://github.com/tukaani-project/xz/releases/download/v5.4.6/xz-5.4.6.tar.bz2.sig
+sha256  913851b274e8e1d31781ec949f1c23e8dbcf0ecf6e73a2436dc21769dd3e6f49  xz-5.4.6.tar.bz2
 
 # Hash for license files
-sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
+sha256  29a1e305b2e34eefe5d4602d00cde1d528b71c5d9f2eec5106972cf6ddb6f73f  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 547959c743..40fa59ca7c 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.4.5
+XZ_VERSION = 5.4.6
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
-XZ_SITE = https://tukaani.org/xz
+XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
