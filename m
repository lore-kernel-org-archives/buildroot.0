Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1645BF47CDA
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 21:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF37E809B0;
	Thu,  5 Mar 2026 21:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8iAXBdxd7G7; Thu,  5 Mar 2026 21:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10D6482D75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772745056;
	bh=AMQn9gtcXsCVsW2RntO4ZEr0ifUPGMhhoz0QRIu5MUg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oebN2qMuIVBlXnSe5pIuunb+XTnjIXREXS7KPWRkPp+3MMnZkCUs3L1V3U6u5DLfn
	 xVsfz2J2qTPWnP6nL1m424eOAqycALtoTvqDuf7RC8WRPSh8RQaJ3ZPQtHy9mLBDiO
	 aw5VG3sj8Kmwu/o+gxz8ZVyrdX1o30hZgj/SCl8om4JA8UbhHwTKRv6o7wxy4/NGPC
	 iRG9/ri66yV8C/OY3udgFggmq64ddbCgrGDzbDY0ENpCikO7rzvB702sULNewAcsvh
	 Zi6IPO3kI9bePlDno3ULlmEk5x/LSJt3h5NMdmL7NHXwEYbZAtiCgyToVcCblX0RNx
	 MGVtYf11t3oag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10D6482D75;
	Thu,  5 Mar 2026 21:10:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DE4E25B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53E2260E32
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cO3ai_ZTnv4e for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 21:10:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4451360E30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4451360E30
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4451360E30
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:10:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EAE85A4C3734;
 Thu,  5 Mar 2026 22:09:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47648)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyFx9-000000003FD-3UPw;
 Thu, 05 Mar 2026 21:09:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Mar 2026 22:09:41 +0100
Message-ID: <20260305210950.3471974-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305210950.3471974-1-bernd@kuhls.net>
References: <20260305210950.3471974-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772744996;
 bh=FOJ3lAcCfJ2Dyu0pQytA3C5DKJ2C+DKsxKKxOUwiP20=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DI4EZA5476Le8eXS1DCXE5NlfPJMNVrDdIEU+ksHA2jMpIs+3DX7G+rgJd89f6+Zm
 HF/OwlMrWKpugn5du76iPhFWJRN8chZeLgItAxfU5iAQMZB5JXmhg1pKF92uxPQppG
 pwTo/6lFamW1BwUkqyAZy0HF1hxki3QXCVAkvz3cd9lx3QzGBhACaAYzy/u7tS6cLH
 G79nR7ogBTiaUx9LubTFJSsQxZmYZqbGKCyZ7AleDD/zGO4Lig5ZfBZlIcYNmNzyMt
 Y3dwN1x7PRVHsSWeiACwNY//EQ1VtadCthIvj7d41eXvKPr0Ou6XGVsAxIqme2aJ01
 yKpMsVRi+Pa5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=DI4EZA54
Subject: [Buildroot] [PATCH v2 06/14] package/ntp: fix build with glibc 2.43
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sntp/crypto.c includes sntp/config.h, then sntp/crypto.h which includes
ntp_stdlib.h which in turn includes l_stdlib.h that contains

  #ifndef HAVE_MEMCHR
  extern void *memchr(const void *s, int c, size_t n);
  #endif

and breaks the build with glibc 2.43.

sntp/config.h does not contain any information about memchr() while the
top-level config.h does but this top-level config.h is not included
because sntp/Makefile lacks -I$(top_builddir) so sntp/config.h gets
included which does not define HAVE_MEMCHR although glibc does provide
memchr() but sntp/configure lacks a check for memchr().

This was not a problem with previous glibc versions but due to recent
C23 changes in glibc the ntp build is now broken.

To fix the problem we add a configure check for memchr() to
sntp/configure so HAVE_MEMCHR gets defined in sntp/config.h.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ntp/0007-memchr.patch | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/ntp/0007-memchr.patch

diff --git a/package/ntp/0007-memchr.patch b/package/ntp/0007-memchr.patch
new file mode 100644
index 0000000000..a9c21042be
--- /dev/null
+++ b/package/ntp/0007-memchr.patch
@@ -0,0 +1,42 @@
+Fix build with glibc 2.43
+
+sntp/crypto.c includes sntp/config.h, then sntp/crypto.h which includes
+ntp_stdlib.h which in turn includes l_stdlib.h that contains
+
+  #ifndef HAVE_MEMCHR
+  extern void *memchr(const void *s, int c, size_t n);
+  #endif
+
+and breaks the build with glibc 2.43:
+
+./../include/l_stdlib.h:225:14: error: expected identifier or '(' before '_Generic'
+  225 | extern void *memchr(const void *s, int c, size_t n);
+
+sntp/config.h does not contain any information about memchr() while the
+top-level config.h does but this top-level config.h is not included
+because sntp/Makefile lacks -I$(top_builddir) so sntp/config.h gets
+included which does not define HAVE_MEMCHR although glibc does provide
+memchr() but sntp/configure lacks a check for memchr().
+
+This was not a problem with previous glibc versions but due to recent
+C23 changes in glibc the ntp build is now broken.
+
+To fix the problem we add a configure check for memchr() to
+sntp/configure so HAVE_MEMCHR gets defined in sntp/config.h.
+
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=4015
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -uNr ntp-4.2.8p18/sntp/m4/ntp_libntp.m4 ntp-4.2.8p18/sntp/m4/ntp_libntp.m4
+--- ntp-4.2.8p18/sntp/m4/ntp_libntp.m4	2024-05-07 13:21:13.000000000 +0200
++++ ntp-4.2.8p18/sntp/m4/ntp_libntp.m4	2026-02-19 21:50:37.291724180 +0100
+@@ -77,7 +77,7 @@
+     ;;
+ esac
+ 
+-AC_CHECK_FUNCS([getclock stime timegm strlcpy strlcat])
++AC_CHECK_FUNCS([getclock memchr stime timegm strlcpy strlcat])
+ 
+ # Bug 2713
+ LDADD_LIBUTIL=
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
