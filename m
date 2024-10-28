Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBAFD5B845
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8405660E63;
	Mon, 28 Oct 2024 22:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YI1_P6fUOs2j; Mon, 28 Oct 2024 22:21:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EF2E60EFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EF2E60EFA;
	Mon, 28 Oct 2024 22:21:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73BFBAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53C1440154
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BET7I7LHlOBa for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71C8940148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71C8940148
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71C8940148
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:21:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 91ADEA4C0CC4
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 23:21:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33474)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t5Y6e-0000000046G-3OyR
 for buildroot@buildroot.org; Mon, 28 Oct 2024 22:21:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 23:21:01 +0100
Message-Id: <20241028222101.2184759-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730154061;
 bh=VCjMaElIuYoZVxGhlFh2YUaj7nOFVru+bd+LDIT8ask=;
 h=From:To:Subject:Date:From;
 b=W0hVZOWtO4hpCM6GoSIhPG5XHyZPgo23XE7bV2tC5Gz7H548aFuB03pO3OG1qGA3B
 Y0dY79GQLAjlFGKuKSTs+D2mnsRzxJaxFJtVTJ0MAHwJOehHOGpharHmX117V/YMld
 DFiXa/t6ijh0L1No7RcRD7Dn/vIXpTZ1PGkb/mD5O7QFj0SaWa/ffRFieRWJo16NOz
 JJf50zkBFGisSUogNFXAoejrQrmkEMtL8Gu1rEjSbRFmPEuQsO5ieel7CrMc4C7rRM
 3M1anxE/B2O1oqPFlRiL/2Ds9wBNyUOor2aI65On8JfTyETMlAUV+D8Q1XNNnIN4kc
 VdJKo/uyDme0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=W0hVZOWt
Subject: [Buildroot] [PATCH v2 1/1] package/apache: Include ap_config_auto.h
 to define _GNU_SOURCE
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

Fixes:
http://autobuild.buildroot.net/results/2f6/2f6b7bbb4c97e4c91b3abd6bb205e237e57045fa/
and many more.

The bug was introduced by bumping apache to 2.4.59 with buildroot commit
e0bbfaea0e983c1ce42a9c3085f3ca3dd796852f which includes
https://github.com/apache/httpd/commit/008e6afcfdae36bce1b5f3fc0cb9519375fd99cf

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Fixed missing _GNU_SOURCE define (Thomas)

 ...lude-ap_config_auto.h-to-define-_GNU.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch

diff --git a/package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch b/package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
new file mode 100644
index 0000000000..40386147cf
--- /dev/null
+++ b/package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
@@ -0,0 +1,40 @@
+From f7a85d0d2b76db75dc976e8dfa1101c954ea1a74 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 28 Oct 2024 23:13:05 +0100
+Subject: [PATCH] ap_log_error: Include ap_config_auto.h to define
+ _GNU_SOURCE
+
+gettid() needs _GNU_SOURCE defined which is provided by ap_config_auto.h
+
+Fixes buildroot error:
+http://autobuild.buildroot.net/results/2f6/2f6b7bbb4c97e4c91b3abd6bb205e237e57045fa//build-end.log
+
+log.c: In function 'log_tid':
+log.c:637:21: error: implicit declaration of function 'gettid'; did you mean 'getgid'? [-Wimplicit-function-declaration]
+  637 |         pid_t tid = gettid();
+
+Upstream: https://github.com/apache/httpd/pull/496
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ server/log.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/server/log.c b/server/log.c
+index 91dcf2c3eb..e709288858 100644
+--- a/server/log.c
++++ b/server/log.c
+@@ -21,6 +21,10 @@
+  *
+  */
+ 
++#if !defined(WIN32) && !defined(NETWARE)
++#include "ap_config_auto.h"
++#endif
++
+ #include "apr.h"
+ #include "apr_general.h"        /* for signal stuff */
+ #include "apr_strings.h"
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
