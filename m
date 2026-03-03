Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29AAEDEBEB
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C71A26063F;
	Tue,  3 Mar 2026 20:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kifNzermmepY; Tue,  3 Mar 2026 20:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7C93606A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568223;
	bh=btN99ALvRPCR/NVlw5WOSpQndRUgXjYID3hyt1EIUXM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OxEaYO2t0dNA8jwoXlKuHnIoVB2e5sTq5O/Pe+tkfmh45uYsUH0Qmnwm3Gtw880FA
	 6UHwUtKuj0v1B2CXu9K43AjJfw8PSqLwGHAxmaqTLpgg6NSKz4+SVkoC5aGkjHjmZD
	 TcuFwhij9mqWMEmh6uwyJvAB/W3TgEH0o7fr8uygQV71KPq6tUlqcqlWEYAIVsZG4q
	 5BwV7f5AjScA+Vmo0HnBVhNnnaHDtyalxYOJDuMPxghXwBGy6yOuRuzsUxQrpS/Lsn
	 y/4cVDGeoaxEi0jNf+P4FdfyHlykJRBXQwEYTAlYKSs1rJTequFybr5Y8gM5ucFluz
	 Ggh2lg1wWOQEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7C93606A6;
	Tue,  3 Mar 2026 20:03:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A69A625B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C6FC400DC
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQ8Ds1ABKtxF for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:03:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77A274002D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77A274002D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77A274002D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04ca.dip0.t-ipconnect.de [91.58.4.202])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F4110A4C3424;
 Tue,  3 Mar 2026 21:01:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxVvM-000000003gI-1iEv;
 Tue, 03 Mar 2026 20:00:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 21:00:52 +0100
Message-ID: <20260303200054.784253-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303200054.784253-1-bernd@kuhls.net>
References: <20260303200054.784253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772568063;
 bh=+bM3uyowtcnCTJWk2x89oTb4psIXJXEUwzarqRtLc/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pjVstbL9ak5pL7zAaBww0Y5uep2U/J0tx7dD5FoTBRWq+a8wdZm0O4FbCffU2YSAE
 0F6RH+IrziudsNlSvSctHrYfcIT/fGEwjaKbkCwe7OZOxybAAoFktRJ6aIU6U1jTZk
 qdm3Qw4u4jWLYvoaFNnzQ+6/eJpPP4hPlQv63qDIb96MrIxX/qDQieRNCcMbh6e8ha
 psg9pb6hsAYAGegEgFBpqN1Wa+isDdhbM0Cnq2SN4HczRf3eZEomJfz7NAoMtfh+Qd
 1Y1c+m18e+cBbxWf6E/n8mj7xjiEDI7ut2EH8tNQytnZxzUdAACnaxDcwNPbxHZCap
 jXFt7FRhjt1gA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pjVstbL9
Subject: [Buildroot] [PATCH/next 13/14] package/gcc/15.2.0: fix build with
 glibc 2.43
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...mp-Fix-GCC-build-after-glibc-cd748a6.patch | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 package/gcc/15.2.0/0004-libgomp-Fix-GCC-build-after-glibc-cd748a6.patch

diff --git a/package/gcc/15.2.0/0004-libgomp-Fix-GCC-build-after-glibc-cd748a6.patch b/package/gcc/15.2.0/0004-libgomp-Fix-GCC-build-after-glibc-cd748a6.patch
new file mode 100644
index 0000000000..e24c4dd57e
--- /dev/null
+++ b/package/gcc/15.2.0/0004-libgomp-Fix-GCC-build-after-glibc-cd748a6.patch
@@ -0,0 +1,77 @@
+From 9c9d3aef2f66625d9cb03ef4baee10ed6648e681 Mon Sep 17 00:00:00 2001
+From: Frank Scheiner <frank.scheiner@web.de>
+Date: Tue, 25 Nov 2025 16:58:23 -0700
+Subject: [PATCH] [PATCH] libgomp: Fix GCC build after glibc@cd748a6
+
+The toolchain autobuilds for ia64 failed ([1]) yesterday with:
+
+```
+libtool: compile:  /usr/src/t2-src/src.gcc.ia64-toolchain.251121.040147.278918/gcc-16-20251116/objs/gcc/xgcc-wrapper /usr/src/t2-src/src.gcc.ia64-toolchain.251121.040147.278918/gcc-16-20251116/objs/./gcc/xgcc -B/usr/src/t2-src/src.gcc.ia64-toolchain.251121.040147.278918/gcc-16-20251116/objs/./gcc/ -B/usr/src/t2-src/build/ia64-toolchain-24-svn-generic-ia64-itanium2-cross-linux/TOOLCHAIN/cross/usr/ia64-t2-linux-gnu/bin/ -B/usr/src/t2-src/build/ia64-toolchain-24-svn-generic-ia64-itanium2-cross-linux/TOOLCHAIN/cross/usr/ia64-t2-linux-gnu/lib/ -isystem /usr/src/t2-src/build/ia64-toolchain-24-svn-generic-ia64-itanium2-cross-linux/TOOLCHAIN/cross/usr/ia64-t2-linux-gnu/include -isystem /usr/src/t2-src/build/ia64-toolchain-24-svn-generic-ia64-itanium2-cross-linux/TOOLCHAIN/cross/usr/ia64-t2-linux-gnu/sys-include --sysroot=/usr/src/t2-src/build/ia64-toolchain-24-svn-generic-ia64-itanium2-cross-linux -DHAVE_CONFIG_H -I. -I../../../libgomp -I../../../libgomp/config/linux/ia64 -I../../../libgomp
 /config/linux -I../../../libgomp/config/posix -I../../../libgomp -I../../../libgomp/../include -Wall -Werror -ftls-model=initial-exec -pthread -DUSING_INITIAL_EXEC_TLS -g -O2 -MT oacc-cuda.lo -MD -MP -MF .deps/oacc-cuda.Tpo -c ../../../libgomp/oacc-cuda.c -o oacc-cuda.o >/dev/null 2>&1
+../../../libgomp/affinity-fmt.c: In function 'gomp_display_affinity':
+../../../libgomp/affinity-fmt.c:330:25: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+  330 |               char *q = strchr (p + 1, '}');
+      |                         ^~~~~~
+```
+
+[1]: https://github.com/johnny-mnemonic/toolchain-autobuilds/actions/runs/19559235881
+
+This is not ia64-specific but due to the changes in the recent glibc
+commit "Implement C23 const-preserving standard library macros" (i.e.
+[2]) now requiring "char *q" to be a pointer to a const char to compile
+w/o error because of the return value of strchr() .
+
+[2]: https://sourceware.org/git/?p=glibc.git;a=commit;h=cd748a63ab1a7ae846175c532a3daab341c62690
+
+Also see the related discussion at [3] for details.
+
+[3]: https://sourceware.org/pipermail/libc-alpha/2025-November/172809.html
+
+The GCC build is fixed by the attached patch, see [4] for a successful
+build with the then latest snapshots of binutils, glibc and GCC.
+
+[4]: https://github.com/johnny-mnemonic/toolchain-autobuilds/actions/runs/19585045571
+
+Idea from Tomas, attached patch from me.
+
+Cheers,
+Frank
+
+0001-libgomp-Fix-GCC-build-after-glibc-cd748a6.patch
+
+From 80af9c233c694904174b54a59404d311378f41f8 Mon Sep 17 00:00:00 2001
+From: Frank Scheiner <frank.scheiner@web.de>
+Date: Sat, 22 Nov 2025 14:58:10 +0100
+Subject: [PATCH] libgomp: Fix GCC build after glibc@cd748a6
+
+char *q needs to be a pointer to a const char for the return value of
+strchr() with glibc after "Implement C23 const-preserving standard library
+macros".
+
+[glibc@cd748a6]: https://sourceware.org/git/?p=glibc.git;a=commit;h=cd748a63ab1a7ae846175c532a3daab341c62690
+
+libgomp/ChangeLog:
+	* affinity-fmt.c: Make char *q a pointer to a const char.
+
+Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=9c9d3aef2f66625d9cb03ef4baee10ed6648e681
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libgomp/affinity-fmt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgomp/affinity-fmt.c b/libgomp/affinity-fmt.c
+index 1fae893cbaca..8d3df5f1cd55 100644
+--- a/libgomp/affinity-fmt.c
++++ b/libgomp/affinity-fmt.c
+@@ -327,7 +327,7 @@ gomp_display_affinity (char *buffer, size_t size,
+ 	      }
+ 	  if (c == '{')
+ 	    {
+-	      char *q = strchr (p + 1, '}');
++	      const char *q = strchr (p + 1, '}');
+ 	      if (q)
+ 		gomp_fatal ("unsupported long type name '%.*s' in affinity "
+ 			    "format", (int) (q - (p + 1)), p + 1);
+-- 
+2.43.7
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
