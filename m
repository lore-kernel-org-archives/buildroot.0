Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC3AEB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 06:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F405481BD9;
	Tue,  4 Jul 2023 06:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F405481BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIDx7fbMplQS; Tue,  4 Jul 2023 06:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E82481494;
	Tue,  4 Jul 2023 06:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E82481494
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DEBE1BF286
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 06:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 778AD40182
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 06:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 778AD40182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ksc3ofRNNKKd for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 06:19:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 222B3400BF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 222B3400BF
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 06:19:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EC314A4C00CE;
 Tue,  4 Jul 2023 08:19:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41740)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qGZO4-0002kN-25;
 Tue, 04 Jul 2023 08:19:44 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  4 Jul 2023 08:19:44 +0200
Message-Id: <20230704061944.496211-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688451584;
 bh=9+qjadvdDH8L8MPcdVDE/YwWSaD8XvR/J9YOGLTewH8=;
 h=From:To:Cc:Subject:Date:From;
 b=v0jBPMBY/cb3wZnv+GN8c9n/qnnM5tUUTUdmeGH4lFSUHHaiuep7vb0HnPFkg4iLO
 ebG3oA+U+1s7tyRCblvK8GFzytkQLD0VCQinVfphYQejCGea63mZHettwpwcpX3uIK
 cjrHKka3kSMHbJxIMLBCe0NKFqi3T2h86+MqWH33XDgXzcxOD5GS3zF/Yi5tTnjQ4j
 HCBHBch5OBIcQynl/d6Xh0YXEBsusR8F7JqYa3ywFP7FgYtsoYDUpcrLacN+MsLiz4
 NP+H9cJF+LxAhIoRKvSYl34Ai+XfH7pRxZ9qwI5Cnod1mlfSn6ZYjtF7ZMfPxoFmEP
 Vh/1dQWS1Qt6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=v0jBPMBY
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix cross build
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
Cc: Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix build error introduced by bumping bluez5_utils to 5.68 with buildroot
commit 7cac499ec46655a491e59b5bbc2a83a2137099bd due to upstream commit
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/configure.ac?id=1106b28be85ac9586d1758839226e163e9030ee2

Fixes:
http://autobuild.buildroot.net/results/564/564952e0f9c7f69ef266d7df455ca033fb52d9f7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-configure-Check-ell-path.patch       | 35 +++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk          |  2 ++
 2 files changed, 37 insertions(+)
 create mode 100644 package/bluez5_utils/0001-configure-Check-ell-path.patch

diff --git a/package/bluez5_utils/0001-configure-Check-ell-path.patch b/package/bluez5_utils/0001-configure-Check-ell-path.patch
new file mode 100644
index 0000000000..3e5f7c6516
--- /dev/null
+++ b/package/bluez5_utils/0001-configure-Check-ell-path.patch
@@ -0,0 +1,35 @@
+From 124187ef9abed60a7c40f751153e9c4516cd1f91 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sat, 1 Jul 2023 01:31:20 +0000
+Subject: [PATCH] configure: Check ell path
+
+Use of AC_CHECK_FILE prevents cross compilation.
+Instead use test to support cross compiling.
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+
+Upstream: https://github.com/bluez/bluez/pull/546
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index eff297960..bc7edfcd3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -298,9 +298,10 @@ if (test "${enable_external_ell}" = "yes"); then
+ 	AC_SUBST(ELL_LIBS)
+ fi
+ if (test "${enable_external_ell}" != "yes"); then
+-	AC_CHECK_FILE(${srcdir}/ell/ell.h, dummy=yes,
+-			AC_CHECK_FILE(${srcdir}/../ell/ell/ell.h, dummy=yes,
+-				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)))
++	if (test ! -f ${srcdir}/ell/ell.h) &&
++			(test ! -f ${srcdir}/../ell/ell/ell.h); then
++				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)
++	fi
+ fi
+ AM_CONDITIONAL(EXTERNAL_ELL, test "${enable_external_ell}" = "yes" ||
+ 				(test "${enable_btpclient}" != "yes" &&
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 1e87041610..82800c0430 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -9,6 +9,8 @@ BLUEZ5_UTILS_VERSION = 5.68
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
+# 0001-configure-Check-ell-path.patch
+BLUEZ5_UTILS_AUTORECONF = YES
 BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 BLUEZ5_UTILS_CPE_ID_VENDOR = bluez
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
