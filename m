Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013FFC4167D
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 17:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74B9D611EF;
	Mon,  6 Nov 2023 17:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74B9D611EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9u-2ZYLTkbRJ; Mon,  6 Nov 2023 17:16:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6734611E6;
	Mon,  6 Nov 2023 17:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6734611E6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 297CB1BF215
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 17:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 070D8611E6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 17:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 070D8611E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xuargWn1-Soy for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 17:16:28 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D183611CD
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 17:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D183611CD
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507d1cc0538so6321256e87.2
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 09:16:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699290986; x=1699895786;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JXNQSj2bedO0n8i1TFJZjTqMr3HZUqcWy7LmPq/Zdko=;
 b=oxdcdMuQlDUZGZImhl0A3fuwgkiohZXEIsFqNEqa2EBlS5PToucI1fmsYiiOuPN4WP
 uajNXC1V4GzXhci3MGQmQKUZmtMnxQigQGfdTsbo5vpcLfGvkNBzubopJ+f9jzvXXt3y
 LeeM8ooigvMQ4txkB73EgyZf44VgFmInHJmpJYQ6aBlFQLnFxB8GhBYC0hkGJpQ8By+6
 6V45ZHZ5FiFScIhzSmI+EwUUHcVVE/2VE8Rfx6tpcDi5fZpQ0mJq73tkvQuGurCRxssh
 wEvB2bczLSUb663Tv7F4d7IPFS1PCE7RpjXXRflE/bRa89X/8X0UgjTtiiCnomM7dFnk
 wzTQ==
X-Gm-Message-State: AOJu0YzJMsGRn4mFGDL89i4PgdxFlOD4mzI7jyp1eBMxjx1Xk7SuDpgz
 RRysVyuFGavxDNb0SC93Y4HV/FbDfUw=
X-Google-Smtp-Source: AGHT+IHY+8NfdlBA/B21XE+iVtApb7yKxDs0R5Yql2nB55es033D9l9rVGzltPJT4hKcoCPzCIwrFw==
X-Received: by 2002:ac2:4555:0:b0:509:4a55:f189 with SMTP id
 j21-20020ac24555000000b005094a55f189mr9772704lfm.11.1699290985485; 
 Mon, 06 Nov 2023 09:16:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o15-20020adfcf0f000000b003296b488961sm124048wrj.31.2023.11.06.09.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 09:16:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 18:16:16 +0100
Message-ID: <20231106171616.495795-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699290986; x=1699895786; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JXNQSj2bedO0n8i1TFJZjTqMr3HZUqcWy7LmPq/Zdko=;
 b=Yc4w5TtSBju2bBnQaYdtwnGyVyuxhOchW+VJkliD3lkeddpSz2EQw9LBHBf6eqqViz
 aVBHN4CWgKPjcLM2kU+I64AveZib0oCyMfzFwfAkAPQbcGHlH/7R0JyGXEEuIVhUmDEB
 3eQUoogciYofPLAmRrnXTkqSGc3SIy/8pA+vfIRGa9VTbRh71Ydqme2bXBgTSeRbNOJr
 QNjDXQWXhcFsIA2TUaVmCW6Djjnup/haZQRXbGewHOxbvPX+po+zE5B6penT7C/rghjK
 HUN6kIVOCLf6TZhvUyHnuwU0uDNuNGEiPfhQ/OSPIMxp+CFKqWBlLKnrHKiRXYjLJBnz
 d+fQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Yc4w5TtS
Subject: [Buildroot] [PATCH 1/1] package/libpam-tacplus: fix --disable-werror
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

-Werror is unconditionally set since version 1.6.2 and
https://github.com/kravietz/pam_tacplus/commit/649e6f2efb2f3278c55d4c9704bb48cb9f74cb73
resulting in the following build failure since bump to version 1.7.0 in
commit 160f0e4b5f161d1966a70ad36679a9f5e9dfa9d3:

In file included from /home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
                 from /home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/stdlib.h:26,
                 from ./lib/stdlib.h:36,
                 from ./libtac/include/libtac.h:35,
                 from support.h:25,
                 from support.c:28:
/home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:413:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
  413 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
      |    ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/9b5ece5d01eac8a760ed9ca331a902d1c47387a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-fix-disable-werror.patch             | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/libpam-tacplus/0002-fix-disable-werror.patch

diff --git a/package/libpam-tacplus/0002-fix-disable-werror.patch b/package/libpam-tacplus/0002-fix-disable-werror.patch
new file mode 100644
index 0000000000..0f42fafc64
--- /dev/null
+++ b/package/libpam-tacplus/0002-fix-disable-werror.patch
@@ -0,0 +1,62 @@
+From d6c6f043a08483b32bddcbc8cadec1d8edbe092d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 6 Nov 2023 18:09:20 +0100
+Subject: [PATCH] fix --disable-werror
+
+-Werror is unconditionally set since version 1.6.2 and
+https://github.com/kravietz/pam_tacplus/commit/649e6f2efb2f3278c55d4c9704bb48cb9f74cb73
+resulting in the following build failure:
+
+In file included from /home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
+                 from /home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/stdlib.h:26,
+                 from ./lib/stdlib.h:36,
+                 from ./libtac/include/libtac.h:35,
+                 from support.h:25,
+                 from support.c:28:
+/home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:413:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
+  413 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
+      |    ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9b5ece5d01eac8a760ed9ca331a902d1c47387a7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/kravietz/pam_tacplus/pull/204
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 2 +-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 04417e7..1255a9b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -9,7 +9,11 @@
+ ACLOCAL_AMFLAGS = -I config -I m4
+ SUBDIRS = lib
+ AUTOMAKE_OPTIONS = subdir-objects
+-AM_CFLAGS = -Wall -Wextra -Werror
++AM_CFLAGS = -Wall -Wextra
++
++if ENABLE_WERROR
++AM_CFLAGS += -Werror
++endif
+ 
+ bin_PROGRAMS = tacc
+ tacc_SOURCES = tacc.c
+diff --git a/configure.ac b/configure.ac
+index 6914561..5cadca2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -16,7 +16,7 @@ See the included file: LICENSE for copyright information.
+ ])
+ AC_INIT([pam_tacplus],[1.7.0],[https://github.com/kravietz/pam_tacplus/issues/],[pam_tacplus],[https://github.com/kravietz/pam_tacplus/])
+ AC_CONFIG_AUX_DIR(config)
+-AM_INIT_AUTOMAKE([foreign -Wall -Werror])
++AM_INIT_AUTOMAKE([foreign -Wall])
+ AC_CONFIG_SRCDIR([pam_tacplus.c])
+ AC_CONFIG_HEADERS([config.h])
+ AC_CONFIG_MACRO_DIR([config])
+-- 
+2.42.0
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
