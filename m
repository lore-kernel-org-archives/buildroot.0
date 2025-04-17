Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C985C369C7
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 04:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0210981F75;
	Thu, 17 Apr 2025 04:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTncfz7Tupdk; Thu, 17 Apr 2025 04:39:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A28B82D04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A28B82D04;
	Thu, 17 Apr 2025 04:39:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3D2FB01
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 04:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EBBD82D04
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 04:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fx_el37FHBXc for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 04:39:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C46F483103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C46F483103
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C46F483103
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 04:39:05 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-736b350a22cso259769b3a.1
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744864745; x=1745469545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+iI8Rg37L3jnIEHrmNzkiwi/vml0QCejrhOHKaEU3+w=;
 b=vdLy486WNhf0MrF7Me4fFZcvoRJdWYGokKM4WA6sgbTqfmL8LleEwSeXJHeuUIddq5
 R5Q5fjQrUjdCegW/U8ndOpPR2onM2eaPSfiTUSId54BIQziBcgr5TNGotSW3HkoS0eyI
 abXCA75NQQaxE3xX5GpQJHwCx6V+ZAGk5vBAXOl7b4yV0hEI+7yFrqyi2abbFA8i8zEa
 LrhaJ2ej8ojcvl9He9HdoTxhVhhU56hTErKlnB7v1q3HvsJbIwY0nbkWHqX2SBa2L9iS
 PS8r2ORZlAba8hFAzyp/85xZVriMKpCsuJGMg57DR+jy9OEjI12fuF5hqASRp8YcbsMP
 8VQQ==
X-Gm-Message-State: AOJu0YzcxcTjYIHjKNO+JOjftbwf5kg8t69z2gqxiajIBC+hy7g7bI3H
 kwMghvrtyWKqxRTaFDjrwfDLtl3ZafPyH2tY6HmzJUvkv7Up9V41ZvA3PA==
X-Gm-Gg: ASbGncvNj/2M/BHEP3iZXRK83NS1OWgiq81PACTdraLNLJrbhFYm0U5EYujMA3xUfA7
 fOhzrjK/C7D5twwh5ey364LhpJCoj30GbVPwDqYVD31E727B5PNjVwQZecQZ6K86DEgXiSqJxrc
 TUpaMDOLCyvQkjMrAD+Hx7BVWf6hmPgpmp6eCnlGwjeZdk+I+/fCwDZky7DH7Ksc2fM0aEICea3
 y57lK/fFKtiurEXSiQ5TJei3vYMo0BW2TjSbNo1zBuD5HlG2d8WgOxLeeak0gurOo7wWneYipx1
 F4EKAKrEeBo4NJg36rrbXyFAMmxIPQFE
X-Google-Smtp-Source: AGHT+IFeNTS7nKNLS+mJWsEZn1Xh10Os+CW4KPFNTxl+4cl4oLiT3xaareV/fPtpyYUcA8fj8bvJ0g==
X-Received: by 2002:a05:6a00:e15:b0:736:3c6a:be02 with SMTP id
 d2e1a72fcca58-73c26716c0dmr5774071b3a.11.1744864744780; 
 Wed, 16 Apr 2025 21:39:04 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd22f0ffcsm11299205b3a.117.2025.04.16.21.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 21:39:04 -0700 (PDT)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 22:38:42 -0600
Message-Id: <20250417043845.2171938-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744864745; x=1745469545; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+iI8Rg37L3jnIEHrmNzkiwi/vml0QCejrhOHKaEU3+w=;
 b=V6tB+E53hLyTr0VajLyWpNYw12Sxdjdl8ASFxQ7hTAoSPWSjbqxfPDb92jc2E3uw2m
 9gj9L0Dw2toZ0IP/k8B0LaP9bFaSyNqVe4bpMRY80bdsd953+fZCwz5TnVKF/Q1FYTgx
 ybSHezcdt9MdF5Fb3rWx20oE/a+Dtyn1SW8Z1/4Z/Baz+mfJmyNEfVF0KDMLd8VpcxVX
 nQ+a6DSmPlgMsMa3zekp4Wk86QRoLExsk/UIaHyypKc1gs1bq7eINxAKcY62JTMcDDcl
 OzRpYxoYqXMAFydZJ+i/H8QAkjCr5JQ/hjp9ox6ykD9+L+hnuxBtvKNB3bb6tmuLwBCh
 w4ew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=V6tB+E53
Subject: [Buildroot] [PATCH 1/3] package/libubox: bump version to 3868f47
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
Cc: Lance Fredrickson <lancethepants@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lance Fredrickson <lancethepants@gmail.com>

Changelog:

 - 3868f47 blob: constify attr argument to blob_memdup
 - eb9bcb6 ustream: prevent recursive calls to the read callback
 - 12bda4b CI: add CodeQL workflow tests
 - a2fce00 CI: add build test run
 - c1be505 udebug: fix crash in udebug_entry_vprintf with longer strings
 - 6339204 CMakeLists.txt: bump minimum cmake version
 - ca3f6d0 udebug: fix file descriptor initialization for __udebug_buf_map
 - df5b714 udebug: add mips specific quirk
 - d27acfe udebug: add more checks for uninitialized buffers
 - 40acbe3 udebug: wait for response after buffer add/remove
 - e84c000 udebug: add inline helper function to test if a buffer is allocated
 - 325fea5 udebug: add functions for manipulating entry length
 - e80dc00 link librt if needed for shm_open
 - 260ad5b udebug: add ulog support
 - b77f2a4 uloop: fix build using C++ compilers
 - d4c3066 udebug: add udebug library code
 - b3fa3d9 uloop: reset flags after __uloop_fd_delete call
 - 8a5a431 uloop: fix typo in signal handling rework
 - f7d1569 uloop: properly initialize signal handler mask
 - 13d9b04 uloop: add support for user defined signal handlers
 - 82fa648 uloop: add support for interval timers

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
---
 package/libubox/libubox.hash | 2 +-
 package/libubox/libubox.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
index 7738caf223..eb37d33230 100644
--- a/package/libubox/libubox.hash
+++ b/package/libubox/libubox.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  918acc85199117ef109f2a204020f6fe4d5a1724a09888f45b70b6474345d6fe  libubox-75a3b870cace1171faf57bd55e5a9a2f1564f757-git4.tar.gz
+sha256  df6e1350fd11016ef30242a279cec195d91e6748c11c40e0991593718c46fa52  libubox-3868f47c8f6c6570e62a3cdf8a7f26ffb1a67e6a-git4.tar.gz
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index d6da078c7b..00ae2b0595 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = 75a3b870cace1171faf57bd55e5a9a2f1564f757
+LIBUBOX_VERSION = 3868f47c8f6c6570e62a3cdf8a7f26ffb1a67e6a
 LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
 LIBUBOX_SITE_METHOD = git
 LIBUBOX_LICENSE = ISC, BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
