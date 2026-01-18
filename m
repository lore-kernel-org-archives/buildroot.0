Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D68C9832F
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 16:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D49E86F64E;
	Sun, 18 Jan 2026 16:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1ztesRTdJwm; Sun, 18 Jan 2026 16:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E74256F681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768754325;
	bh=p7MiRUaKSSefZUXYuZpDPuwZRbSrmPjPItQUaI91Vno=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FlpC22iUcap0KsUuQvaFTQcngIY9XRabNv7KPNVr2mi8Vu4ntAOUKpIDKPiGbWCCC
	 hKGrp2o2jyaEyVVrweailOjrjHmxxzaVfn34rA/4nFTTDk1DVxJIKklVrRqvgI9iGr
	 25lUfdp7jMOmu9P/HMGu/U9gcujWuhfGof+fCKw4t1KeIqA1F+4SNFkEinQUGnxoFE
	 MZMWykHVEMqye4IlZgj8vwLDq8onQ+hEKkKlOe/UzQzY/DmFwllqkAXli3yGi3B1Cs
	 xudSkMtIme+G9qMLsLzXXul1o2/K1GM2vBE5o4nXCC2czFO+3ITuywIlh8Cdj+axLa
	 7wpiQ2rmjdM8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E74256F681;
	Sun, 18 Jan 2026 16:38:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7C662CE
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 16:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3AF84ADA3
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 16:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GA06smcyt2Ef for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 16:38:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E7F84AD93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E7F84AD93
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E7F84AD93
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 16:38:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09ef.dip0.t-ipconnect.de [91.58.9.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F2B6A4C2AF2;
 Sun, 18 Jan 2026 17:38:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35120)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhVnD-000000003lF-24pi;
 Sun, 18 Jan 2026 16:38:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Jan 2026 17:38:22 +0100
Message-ID: <20260118163823.2922833-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768754304;
 bh=h+me/PXXzISu8ukBvaBAlx29Veh9xUOUNIBhPMcjiAc=;
 h=From:To:Cc:Subject:Date:From;
 b=XEwNr3IghUs+Jipxq4mLG/i+LznS2qLf1OVdaVBg85inYrAXqOD9mOokGWufwmhsi
 JiUuO2PkL6u+/oxY3lXWqicyYa2XxLsCPmRSXpAlwEGCCNv8RSIvws+kxKl3ofI/Gx
 PgSq4SMjmBrS5Oh23B0qVP24OOI4/tQKHE29BEmQZvdbW+6HCDQ9jvlgscoyIOg0OD
 NrwBF+J76IW/8pk63tiaYFYL6V247ATOmN6j2Ao6+N0CYaj/aPWgwZ9kEcYmTAf6GP
 WXe2+qKoRtWCn2hoIi1hhZcoGxHgqyAe4cdRmfO86nGw4f4Du6thgkWFwUxW1w+MnG
 6t2BZSkwUU7WQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=XEwNr3Ig
Subject: [Buildroot] [PATCH 1/2] package/libcdio-paranoia: fix build with
 gcc >= 15.x
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
https://autobuild.buildroot.net/results/dbd/dbdb4f386a417f7467b66036e661e77d04b82431/
https://autobuild.buildroot.net/results/042/042185a8d32765a52986cc0060d3d296a24c662b/
https://autobuild.buildroot.net/results/fc5/fc5be5e78852f6f66cd631f12a02ac10eb846e97/

The build error can be reproduced by this gcc 15-based defconfig:
BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE=y
BR2_PACKAGE_LIBCDIO_PARANOIA=y

while this gcc 14-based defconfig builds without errors:
BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE=y
BR2_PACKAGE_LIBCDIO_PARANOIA=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...01-Remove-a-GCC-15-error-on-getopt.c.patch | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/libcdio-paranoia/0001-Remove-a-GCC-15-error-on-getopt.c.patch

diff --git a/package/libcdio-paranoia/0001-Remove-a-GCC-15-error-on-getopt.c.patch b/package/libcdio-paranoia/0001-Remove-a-GCC-15-error-on-getopt.c.patch
new file mode 100644
index 0000000000..de927c51bb
--- /dev/null
+++ b/package/libcdio-paranoia/0001-Remove-a-GCC-15-error-on-getopt.c.patch
@@ -0,0 +1,65 @@
+From c12e48edc5660c70509142349f4020d3f9e36218 Mon Sep 17 00:00:00 2001
+From: "R. Bernstein" <rocky@gnu.org>
+Date: Wed, 1 Oct 2025 15:32:52 -0400
+Subject: [PATCH] Remove a GCC-15 error on getopt.c
+
+Fixes Issue #54
+
+Upstream: https://github.com/libcdio/libcdio-paranoia/commit/c12e48edc5660c70509142349f4020d3f9e36218
+
+[Bernd: backported to 10.2+2.0.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/getopt.c |  4 ++--
+ src/getopt.h | 11 +++++++++--
+ 2 files changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/src/getopt.c b/src/getopt.c
+index e51c35b..dce7144 100644
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -2,7 +2,7 @@
+    NOTE: getopt is part of the C library, so if you don't know what
+    "Keep this file name-space clean" means, talk to drepper@gnu.org
+    before changing it!
+-   Copyright (C) 1987-2014 Free Software Foundation, Inc.
++   Copyright (C) 1987-2015 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -145,7 +145,7 @@ static struct _getopt_data getopt_data;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char *);
+ #endif
+ 
+ #endif /* not __GNU_LIBRARY__ */
+diff --git a/src/getopt.h b/src/getopt.h
+index 7cc9167..0a6c1b3 100644
+--- a/src/getopt.h
++++ b/src/getopt.h
+@@ -1,5 +1,5 @@
+ /* Declarations for getopt.
+-   Copyright (C) 1989-2014 Free Software Foundation, Inc.
++   Copyright (C) 1989-2015 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -141,7 +141,14 @@ struct option {
+    arguments to the option '\0'.  This behavior is specific to the GNU
+    `getopt'.  */
+ 
+-#ifdef __GNU_LIBRARY__
++/* Check for musl C library (<bits/alltypes.h> is musl specific).  */
++#if !defined __GLIBC__ && __has_include(<bits/alltypes.h>)
++# ifndef __MUSL__
++#   define __MUSL__ 1
++# endif
++#endif
++
++#if defined __GLIBC__ || defined __MUSL__
+ /* Many other libraries have conflicting prototypes for getopt, with
+    differences in the consts, in stdlib.h.  To avoid compilation
+    errors, only prototype getopt for the GNU C library.  */
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
