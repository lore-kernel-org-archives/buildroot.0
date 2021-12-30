Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D9EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 23:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DCFC82741;
	Thu, 30 Dec 2021 23:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yyn8O_gVTza2; Thu, 30 Dec 2021 23:07:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9205828D1;
	Thu, 30 Dec 2021 23:07:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB64D1BF35B
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 23:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A899A40178
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 23:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-JdfzQIRr4F for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 23:07:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6133F40438
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 23:07:48 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v7so52929647wrv.12
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+8rVWCsWFMZPZAJsULnJLcDT20q5nisYw5zPQL7CenU=;
 b=Ofk/XG9ggroW+mqMKBxmau8qgIMvlMNxD8ZCYGhS98ZTNxySTCUuH7c0s+jGoAF50J
 boZ/kihf4uJtvlO4Pba8HBnNQ/J9WjyFr+K4DzTfarPuiLunf9OzxTsV1qbiZRBn8f0r
 d6KHRAMNv/JXjccBboDh6jezvxJ8z/FzwhIGxCPe1Bp+yewFduI2QevVqi7PsPe0DGQX
 nYDdw9oI2nBcrodNgo7UWuMbej81gsOuKJAtKHZD6oOM9xbbHoLvscONhjn8ZiCme6mT
 6G/pSQBgZOlvfsLUc7tLYm+fDWiT6rXjxKgxZ52uMUq/7JXA89sikqzBniHm/ZIPxKpS
 btcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+8rVWCsWFMZPZAJsULnJLcDT20q5nisYw5zPQL7CenU=;
 b=tG7jCLh1NJEqgx/mJxf5x+5Fq4sKwnIO9KA7V6wRuqyoAf1oH1gyTJAIyj6WNZDa8E
 yI7luBnMZ7BwdRQQX4CsB2EDk1Y5rzGUPAFU4zuXBeBFoGmkrJ8dR2k0aaSXG1D+mWSb
 P5Wqqty9+vLQnQbUdKHy2he04YQQzRR5ht+3V/zmmKXUccY5hXuPvfHyJQx6j/CmyKQm
 AGXiu+TI1xQRZKTfqiPRnfn0ABp6S0ZUfQjZv1HjB45zSsY7g7xiXedzndQbplaw87zG
 fZiHu5Uo/UFLPRlkV+6GpV/nQ7v8CSHmJU2/q3Sm5LSmY+pCWkPMmF/6dDwiIOqsxG8G
 fXgA==
X-Gm-Message-State: AOAM530+mNtbgNdW0YNQn/fTX+ZjCUgSw8uIglancVDDhgzOpcsy6R5h
 2LYhtNjL1sWZB7NBEz+HXVazM6nfWLk=
X-Google-Smtp-Source: ABdhPJxJGffOhuJXTQdVoRJz+QHwGuMD13nKmhAMR0lVgKRFz4es3b1ZmOWYSOMdgKWCrkWAKtcUxA==
X-Received: by 2002:a5d:6d49:: with SMTP id k9mr18766770wri.530.1640905666622; 
 Thu, 30 Dec 2021 15:07:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id c13sm24534717wrt.114.2021.12.30.15.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 15:07:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 00:07:01 +0100
Message-Id: <20211230230701.3177447-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: bump to version
 3.3.9
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop second patch (already in version)

https://github.com/mikebrady/shairport-sync/releases/tag/3.3.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...re.ac-fix-build-with-automake-1.16.5.patch | 48 -------------------
 package/shairport-sync/shairport-sync.hash    |  2 +-
 package/shairport-sync/shairport-sync.mk      |  2 +-
 3 files changed, 2 insertions(+), 50 deletions(-)
 delete mode 100644 package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch

diff --git a/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch b/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch
deleted file mode 100644
index 2ee8f59fee..0000000000
--- a/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ad22edb303a470b6f9eda9fd9d3f588bb2eff8cb Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 15 Oct 2021 08:02:23 +0200
-Subject: [PATCH] configure.ac: fix build with automake 1.16.5
-
-Fix the following build failure with convolution raised since automake
-1.16.5 and
-https://git.savannah.gnu.org/cgit/automake.git/commit/?id=f4a3a70f69e1dbccb6578f39ef47835098a04624:
-
-configure.ac:305: error: AM_INIT_AUTOMAKE expanded multiple times
-/home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
-configure.ac:6: the top level
-/home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
-configure.ac:305: the top level
-
-Fixes:
- - http://autobuild.buildroot.org/results/464148bdccb705d8992dc860262bfdeb01b7e2a1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mikebrady/shairport-sync/pull/1314]
----
- configure.ac | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f77087c5..aa533a2d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,7 +3,7 @@
- 
- AC_PREREQ([2.50])
- AC_INIT([shairport-sync], [3.3.8], [4265913+mikebrady@users.noreply.github.com])
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([subdir-objects])
- AC_CONFIG_SRCDIR([shairport.c])
- AC_CONFIG_HEADERS([config.h])
- AC_PROG_RANLIB
-@@ -302,7 +302,6 @@ AM_CONDITIONAL([USE_PA], [test "x$with_pa" = "xyes"])
- # Look for Convolution flag
- AC_ARG_WITH(convolution, [AS_HELP_STRING([--with-convolution],[choose audio DSP convolution support])])
- if test "x$with_convolution" = "xyes" ; then
--  AM_INIT_AUTOMAKE([subdir-objects])
-   AC_DEFINE([CONFIG_CONVOLUTION], 1, [Include audio DSP convolution support.])
-   AC_CHECK_LIB([sndfile], [sf_open], , AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
- fi
--- 
-2.33.0
-
diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index ebc81dedc1..331866a379 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c92f9a2d86dd1138673abc66e0010c94412ad6a46da8f36c3d538f4fa6b9faca  shairport-sync-3.3.8.tar.gz
+sha256  17990cb2620551caa07a1c3b371889e55803071eaada04e958c356547a7e1795  shairport-sync-3.3.9.tar.gz
 sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index ba8b44a621..cf49f2b2ed 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.3.8
+SHAIRPORT_SYNC_VERSION = 3.3.9
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
