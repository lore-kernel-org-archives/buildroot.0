Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6B7CF58ED
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 13:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47BD8401CB;
	Wed, 25 Sep 2024 13:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Il8MOcVR9eFC; Wed, 25 Sep 2024 13:37:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0208401C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0208401C6;
	Wed, 25 Sep 2024 13:37:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 584801BF3C0
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5532C84827
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhX8cwJ-uLaO for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 13:37:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0650A847AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0650A847AA
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0650A847AA
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 13:37:40 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42cde6b5094so63083265e9.3
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 06:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271459; x=1727876259;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uXVvTV6/ITaj6Kd0u2C7PNAgTh4fgpCFcsIKSo00WZg=;
 b=qHUwQ7ZnDev27hbWnGoiTDK4breiQnZiHN3Mq06ij014fYzhgjmqXVR3u36boG/Q7Z
 3rinSJtmwzYCHy+wofC3K/XSX+2jhelpj8qUi616mX91WClpbQrJ4ZZoipU4LiiiS1YN
 lqrohZBqp2MyDrwO6FpaTsUQLeeUPjXTRc6qy/rfx1VgT+X5+ef0iNBvsjKzR7PbY5B4
 S1FciMHF9sR7tZYlWYFfCjKkHNeJ/6OyoVn4wZisSn1rQkIuF5lBOkyCAK1yDX0L1JTR
 kfhvVT7C+99rqUsQojht8+DAs1iKzJDtTnBI3Y5uEg2d/LAL7LdJIsmc2R6osyazpnps
 CPng==
X-Gm-Message-State: AOJu0YzkHtsZWmvHWHgNIQrkUKm9c06i2Fqp8RQTeRTdBwGrVn0v1D0u
 UZqM5Z2+tFOMLH1fnnN5GT/ehXWBZgfK/y+2Y1doN1rUWaqlHzK69OyYWbLdc3f+3R+ybthJOW9
 zrg==
X-Google-Smtp-Source: AGHT+IHIeoTNuzDG3tSopaf31zgtTBZsH2SCnl9Sd+CTfEgLJ33G/Xr3DmUSaycupsSUwuT+1oSZPQ==
X-Received: by 2002:a05:600c:5493:b0:42c:c401:6d86 with SMTP id
 5b1f17b1804b1-42e961469f9mr19559715e9.27.1727271458937; 
 Wed, 25 Sep 2024 06:37:38 -0700 (PDT)
Received: from vm-2404.. (55.6.65.37.rev.sfr.net. [37.65.6.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a1697dsm18919785e9.38.2024.09.25.06.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:37:37 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 25 Sep 2024 15:37:34 +0200
Message-ID: <20240925133735.3899867-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1727271459; x=1727876259; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uXVvTV6/ITaj6Kd0u2C7PNAgTh4fgpCFcsIKSo00WZg=;
 b=gpFD3sMXv+WRrKv7orrkAn/kKLOF0S6IfY4qslgKzqTP66QAbkrBrG7t6raBDTIHIk
 ouuuak6jPajz3nIikOok8zXFyPGghraRzC96ZFjgHyyC4xW46SmUGGa0iRe/uZ45F5An
 EAKizkuVWslHVobaxr6yPN4U/NqLRrtDhMZWGkMsrZFtdUaR5W58j/SaJNzM3xW3oAWd
 HG6Y3mvzv2LUfaz1NMAwO2wPPLHd+4X/srjXpih8OZ3MyVN482ZzssiE/YSrsj9OdzV7
 +9rXCoQ4DH6aq+iyeThaS82uN5rTQoJxUQYzFVcyiKm6/EaC57weUvBP71AMkRg57rNA
 eNSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=gpFD3sMX
Subject: [Buildroot] [PATCH] package/libarchive: bump to version 3.7.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...1-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch | 2 +-
 .../0002-autotools-do-not-add-iconv-for-Requires.private.patch  | 2 +-
 package/libarchive/libarchive.hash                              | 2 +-
 package/libarchive/libarchive.mk                                | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch b/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
index a4dd7dad5..e630c51fe 100644
--- a/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
+++ b/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
@@ -15,7 +15,7 @@ diff --git a/configure.ac b/configure.ac
 index 93f7af94..204a4e69 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -434,9 +434,7 @@ if test "x$with_iconv" != "xno"; then
+@@ -449,9 +449,7 @@ if test "x$with_iconv" != "xno"; then
      AC_CHECK_HEADERS([localcharset.h])
      am_save_LIBS="$LIBS"
      LIBS="${LIBS} ${LIBICONV}"
diff --git a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
index 3cbd30410..aca2dab9d 100644
--- a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
+++ b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
@@ -17,7 +17,7 @@ diff --git a/configure.ac b/configure.ac
 index 99bff20d1..f245d0c55 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -434,7 +434,6 @@ if test "x$with_iconv" != "xno"; then
+@@ -449,7 +449,6 @@ if test "x$with_iconv" != "xno"; then
      AC_CHECK_HEADERS([localcharset.h])
      am_save_LIBS="$LIBS"
      LIBS="${LIBS} ${LIBICONV}"
diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index a2c648873..08920b61c 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  f887755c434a736a609cbd28d87ddbfbe9d6a3bb5b703c22c02f6af80a802735  libarchive-3.7.4.tar.xz
+sha256  0a2efdcb185da2eb1e7cd8421434cb9a6119f72417a13335cca378d476fd3ba0  libarchive-3.7.6.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 7d58b5c69..d3a447552 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.7.4
+LIBARCHIVE_VERSION = 3.7.6
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
