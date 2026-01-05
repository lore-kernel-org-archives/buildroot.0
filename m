Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C11CC79FBC
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 19:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3BBA807A3;
	Mon,  5 Jan 2026 19:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9KVkc8jGX5-e; Mon,  5 Jan 2026 19:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EBDF807C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767642067;
	bh=kavZTgy3FAYMFTdS8DyIQphgRI9yQhDViND1V8qKD6k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lFhm8Wd6njhotJBqzMAEbxxe5R5N95ZVECCye4JTcak0Bsc1KVFVCrciOW90GwmY0
	 tsImH/iKSxsSoh3h40w2lHCkz4jbMpanK4BYjXuUQyzak71aCt61wUA5cw3RRsXydO
	 Ca6mmEjChOSijYDcTMDMwFc6DlD208K/6qQhsHhcfihxVs/3Uuo8NQ2PCSjotujHwN
	 bTy46QKtVz0Z0lHxdkIvlc+FQA9xb9L7NAxE/rs529ioSaQiUt4n7tpueutAqJC5wK
	 1gjdid2vfL/IPkyCKD5ARVOQpG/ukn0DYEa9xPWezf94aR8f1qmZWMY0pXFwLzFN57
	 oJ9KbDpJwkE6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EBDF807C6;
	Mon,  5 Jan 2026 19:41:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D366E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 233D26073F
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpIOQDr_qI5I for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 19:41:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5586C6071A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5586C6071A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5586C6071A
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:40:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9FECAA4C233B
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:40:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vcqRk-0000000057p-1DVd
 for buildroot@buildroot.org; Mon, 05 Jan 2026 19:40:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 20:40:54 +0100
Message-ID: <20260105194056.2156773-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767642056;
 bh=gzQuwGL+KfCnwpj9ctdmOYioNJuO7irXEyl6PT/IMCM=;
 h=From:To:Subject:Date:From;
 b=tT7k/yQB2zAQhDtI3hoGbyq9jazk2XTeI1Q4/b0nnkI8Ryepg1Y27ollK/fQnLuvH
 wzWo17R4Ld4s5nVuV69pFOys6QOzU/rWKxAl6O2xKWgxAflF6vjRDZfdv5yzd9cTvM
 u68jzx7qnz7rXvq7U7xbbvhySn0k9nCaN1Ot3nCaf92WK5enjIOWWd62X6yLWOE6mF
 hhB1yAw57sWZtVzGc6+tBDZrB4hgmZ21mYPqsBvoe+Z4Xz+kPZ9jXb60MaEabgKTJ+
 kFfrLDmCWY/Ji+Lnur59EpitE8pf+v0aG28Op3fdfbWGHRYtRool8J/GcKyx4POUI5
 psuEOBM50hLIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=tT7k/yQB
Subject: [Buildroot] [PATCH 1/3] package/dc3dd: fix build with gcc-15.x
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
https://autobuild.buildroot.net/results/257/2575202e9a5164a4068a943fb36445cd63e61f0c/

The build error does not occur with gcc-14.x, tested using this
defconfig:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_DC3DD=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dc3dd/0005-gcc15.patch | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/dc3dd/0005-gcc15.patch

diff --git a/package/dc3dd/0005-gcc15.patch b/package/dc3dd/0005-gcc15.patch
new file mode 100644
index 0000000000..a2133cec4a
--- /dev/null
+++ b/package/dc3dd/0005-gcc15.patch
@@ -0,0 +1,39 @@
+Description: Fix FTBFS with GCC-15
+Origin: backport, https://build.opensuse.org/projects/security:forensics/packages/dc3dd/files/dc3dd-gcc15.patch
+Bug: https://sourceforge.net/p/dc3dd/bugs/24/
+Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1096508
+Forwarded: not-needed
+Reviewed-by: Sven Geuer <sge@debian.org>
+Last-Update: 2025-09-25
+
+Upstream: https://sourceforge.net/p/dc3dd/bugs/24/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+Index: dc3dd-7.3.1/lib/posixtm.c
+===================================================================
+--- dc3dd-7.3.1.orig/lib/posixtm.c
++++ dc3dd-7.3.1/lib/posixtm.c
+@@ -41,7 +41,7 @@
+    of `digit' even when the host does not conform to POSIX.  */
+ #define ISDIGIT(c) ((unsigned int) (c) - '0' <= 9)
+ 
+-time_t mktime ();
++time_t mktime (struct tm *tm);
+ 
+ /*
+   POSIX requires:
+Index: dc3dd-7.3.1/m4/jm-macros.m4
+===================================================================
+--- dc3dd-7.3.1.orig/m4/jm-macros.m4
++++ dc3dd-7.3.1/m4/jm-macros.m4
+@@ -38,7 +38,7 @@ AC_DEFUN([coreutils_MACROS],
+   # By default, argmatch should fail calling usage (1).
+   AC_DEFINE(ARGMATCH_DIE, [usage (1)],
+ 	    [Define to the function xargmatch calls on failures.])
+-  AC_DEFINE(ARGMATCH_DIE_DECL, [void usage ()],
++  AC_DEFINE(ARGMATCH_DIE_DECL, [void usage (int)],
+ 	    [Define to the declaration of the xargmatch failure function.])
+ 
+   # used by ls
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
