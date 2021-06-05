Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF76C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:56:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5871C604AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5871C604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 336E241630;
	Tue,  3 Aug 2021 22:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xz--CpXVW5oj; Tue,  3 Aug 2021 22:56:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D69641637;
	Tue,  3 Aug 2021 22:56:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2062F1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60D0140609
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MXdtft9n3VFh for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C64564060C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1C827843F5; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 5 Jun 2021 22:12:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e93eaf7248d62e5e79a3b0e46de7483094a276d8
X-Git-Newrev: 128901c80a58924c9e7a16465e30474eaa9fe3b0
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.1C827843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5/qt5base: fix build
 with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=128901c80a58924c9e7a16465e30474eaa9fe3b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure with gcc 11:

/data/buildroot-autobuilder/instance-0/output-1/build/qt5base-5.15.2/include/QtCore/../../src/corelib/global/qfloat16.h:300:7: error: 'numeric_limits' is not a class template
  300 | class numeric_limits<QT_PREPEND_NAMESPACE(qfloat16)> : public numeric_limits<float>
      |       ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/9a7a987af40b8408ccdfcae4890008c7090b41a1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0006-Fix-build-with-GCC-11-include-limits.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/qt5/qt5base/0006-Fix-build-with-GCC-11-include-limits.patch b/package/qt5/qt5base/0006-Fix-build-with-GCC-11-include-limits.patch
new file mode 100644
index 0000000000..f014a160d5
--- /dev/null
+++ b/package/qt5/qt5base/0006-Fix-build-with-GCC-11-include-limits.patch
@@ -0,0 +1,53 @@
+From 9c56d4da2ff631a8c1c30475bd792f6c86bda53c Mon Sep 17 00:00:00 2001
+From: Thiago Macieira <thiago.macieira@intel.com>
+Date: Mon, 18 Jan 2021 07:40:54 -0800
+Subject: [PATCH] Fix build with GCC 11: include <limits>
+
+Fixes: QTBUG-90395
+Pick-to: 6.0
+Change-Id: Iecc74d2000eb40dfbe7bfffd165b5dd3708b7a40
+Reviewed-by: Edward Welbourne <edward.welbourne@qt.io>
+
+[Retrieved (and backported) from:
+https://github.com/qt/qtbase/commit/9c56d4da2ff631a8c1c30475bd792f6c86bda53c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/corelib/global/qendian.h  | 6 ++++--
+ src/corelib/global/qfloat16.h | 1 +
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/corelib/global/qendian.h b/src/corelib/global/qendian.h
+index 99b529f17cd..c874c5e47ab 100644
+--- a/src/corelib/global/qendian.h
++++ b/src/corelib/global/qendian.h
+@@ -1,7 +1,7 @@
+ /****************************************************************************
+ **
+-** Copyright (C) 2016 The Qt Company Ltd.
+-** Copyright (C) 2016 Intel Corporation.
++** Copyright (C) 2021 The Qt Company Ltd.
++** Copyright (C) 2021 Intel Corporation.
+ ** Contact: https://www.qt.io/licensing/
+ **
+ ** This file is part of the QtCore module of the Qt Toolkit.
+@@ -44,6 +44,8 @@
+ #include <QtCore/qfloat16.h>
+ #include <QtCore/qglobal.h>
+ 
++#include <limits>
++
+ // include stdlib.h and hope that it defines __GLIBC__ for glibc-based systems
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/src/corelib/global/qfloat16.h b/src/corelib/global/qfloat16.h
+index e9477d2ecec..a25fac28862 100644
+--- a/src/corelib/global/qfloat16.h
++++ b/src/corelib/global/qfloat16.h
+@@ -44,6 +44,7 @@
+
+ #include <QtCore/qglobal.h>
+ #include <QtCore/qmetatype.h>
++#include <limits>
+ #include <string.h>
+ 
+ #if defined(QT_COMPILER_SUPPORTS_F16C) && defined(__AVX2__) && !defined(__F16C__)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
