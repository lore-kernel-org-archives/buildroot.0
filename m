Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED8BC43217
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 17:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D661F81769;
	Sun,  6 Nov 2022 17:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D661F81769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oGOTKzJE4e5X; Sun,  6 Nov 2022 17:45:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB329813FB;
	Sun,  6 Nov 2022 17:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB329813FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6461B1BF27E
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 17:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E5174028C
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 17:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E5174028C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0GHqKzmnvB5P for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 17:45:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B858240260
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B858240260
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 17:45:10 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v1so13238020wrt.11
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 09:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ycKqQkYAiqlepebA/BmcRebnzMO+pn238F5V38gkP/c=;
 b=rcK0lhaWrop6C8pIWBaq4sl49e01Juk5rGUJj3Wyk5RVezs8z73OtkFgAdD8DYdHav
 4Omj1xE7wdQNFVVE1Md2w7a0Hzs1Se5YxuJbGg6Db6449Pu+2xc7RNLiv3mJEVjWIAKi
 sodNlAmpuhcEYsF3HPW/c+0AVi2DFNaM31E0NAleHhyhA7am1buJhiOtoG4ZiyisPWJm
 c7cL2ofnC2wrghcYWEFClxzPcnLkKRn0haiLYFtGY+bJDMXerh5g4M+vq2JqdheD5n/P
 /TB4xtUMGtdcol7jmm2t8THpchnNmifAHprXEgd3/MFgn5GutOA1A9iKsVDo+PPHycnT
 5bdQ==
X-Gm-Message-State: ACrzQf3Ekc6HtEwYP/1O5OWG6KoTItS5tvvD938cg/hihMX6hZEQyKm5
 xmV+P01nVTetoHqWdpfGiZtQ+p2j9Hg=
X-Google-Smtp-Source: AMsMyM6BmsOsdWfGOpVosIgvoNckRSrofZ+/ctJlY+sYcmXLhjXxlBHbYDSHYXHCDBebqDrDyuaJBw==
X-Received: by 2002:a5d:59ae:0:b0:236:6861:a89d with SMTP id
 p14-20020a5d59ae000000b002366861a89dmr29935414wrr.437.1667756708474; 
 Sun, 06 Nov 2022 09:45:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b003a84375d0d1sm9599015wmo.44.2022.11.06.09.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 09:45:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 18:45:00 +0100
Message-Id: <20221106174500.11118-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ycKqQkYAiqlepebA/BmcRebnzMO+pn238F5V38gkP/c=;
 b=GB9GJh6Fc+WDLZiKHSngg7tcWjbfKDx8Z4OJRb8Zir5AitWiCQS05GQ2pkLBGuPBAu
 Y71U0oHdPzXC8Ql7NLvJAvwVJzyNNqK5e/8aYdukx3KnJSgJaK6NQM1FXcMeiBz9EF2o
 EZIcFa3DCtETK/5t07gZ4B52wkn25fjbBfXV8EBR4yEW5nH0nwgKkgIgwo2pJyiUOSd0
 GaWGNakOGO/7yxsKyAwREgjet0Vr4BTVr57VEB7QCjmpHynyozQEeeMitTutEEg6jMeK
 SrmvF1Jf7jcaMyOMyxj+bHuIzggmEaqIRWT4ODIQIQWhil7mc5fT3QIHkXmZ/sTSTGtB
 w1iA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GB9GJh6F
Subject: [Buildroot] [PATCH 1/1] package/libkcapi: fix uclibc build
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
Cc: Tan En De <ende.tan@starfivetech.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure raised since bump to version
1.4.0 in commit 06a9dc3528847ec6c12a9b6188d4106e086eabe5 and
https://github.com/smuellerDD/libkcapi/commit/12f19b9a1dd308117f83e8cb33e28e3c040710a0:

lib/kcapi-kernel-if.c: In function '_kcapi_common_send_meta':
lib/kcapi-kernel-if.c:196:26: error: conversion to 'int' from 'size_t' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
  196 |         msg.msg_iovlen = kcapi_downcast_int(iovlen);
      |                          ^~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/eccf4b84670b5ef0fdd68b46338edf5043c7cc0d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...b-kcapi-kernel-if.c-fix-uclibc-build.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch

diff --git a/package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch b/package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch
new file mode 100644
index 0000000000..9ec8373edd
--- /dev/null
+++ b/package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch
@@ -0,0 +1,50 @@
+From b70f31982c87f51bf4984b55149f0bc7934c0e6a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 6 Nov 2022 17:05:14 +0100
+Subject: [PATCH] lib/kcapi-kernel-if.c: fix uclibc build
+
+Fix the following uclibc build failure raised since version 1.4.0 and
+https://github.com/smuellerDD/libkcapi/commit/12f19b9a1dd308117f83e8cb33e28e3c040710a0:
+
+lib/kcapi-kernel-if.c: In function '_kcapi_common_send_meta':
+lib/kcapi-kernel-if.c:196:26: error: conversion to 'int' from 'size_t' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
+  196 |         msg.msg_iovlen = kcapi_downcast_int(iovlen);
+      |                          ^~~~~~~~~~~~~~~~~~
+
+Indeed, uclibc has the same behavior than musl event if it defines
+__GLIBC__
+
+Fixes:
+ - http://autobuild.buildroot.org/results/eccf4b84670b5ef0fdd68b46338edf5043c7cc0d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/smuellerDD/libkcapi/pull/145]
+---
+ lib/kcapi-kernel-if.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/kcapi-kernel-if.c b/lib/kcapi-kernel-if.c
+index d7b10bf..a475e44 100644
+--- a/lib/kcapi-kernel-if.c
++++ b/lib/kcapi-kernel-if.c
+@@ -119,7 +119,7 @@ int _kcapi_common_accept(struct kcapi_handle *handle)
+ 	return 0;
+ }
+ 
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+ static inline size_t kcapi_downcast_int(size_t in)
+ {
+ 	return in;
+@@ -564,7 +564,7 @@ ssize_t _kcapi_common_recv_data(struct kcapi_handle *handle,
+ 	msg.msg_controllen = 0;
+ 	msg.msg_flags = 0;
+ 	msg.msg_iov = iov;
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+ 	msg.msg_iovlen = iovlen;
+ #else
+ 	msg.msg_iovlen = (int)iovlen;
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
