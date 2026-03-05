Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B792AF47CDA
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 21:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E69C8131F;
	Thu,  5 Mar 2026 21:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-0Qfq_cUfKg; Thu,  5 Mar 2026 21:12:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9754081321
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772745152;
	bh=btN99ALvRPCR/NVlw5WOSpQndRUgXjYID3hyt1EIUXM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZDsUclBSqEFNKwbosHtxIoLU02b8MRdcsnk9axUZR8cpIGoaoqFTSxCHZaZGP7skK
	 spGwLByqUGPAa4MDhhEOHnGYIEYIWTQaXZf/ULp9s62pBRr6L3BbHFYMDGoMKeFnH7
	 9pVMaK9wshvqqqRJwh8O/vnxGShnp/WXAuhDcOGRe73s9iWUU6eVHf4R3AZlJFXXxK
	 ltxGq5KUX1/SmF82b2MGmhWYrbFg0PmlyEIuGX/6lIDySV/Hx/P7ipwhuwfoBlfJYz
	 VHz1s0m4oRTetmSESh5CvFEpqh0LCIHBDEt/iGXZcjHGIQKWWym1s+p/d1K6RSS5qs
	 ScKzelseQv4+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9754081321;
	Thu,  5 Mar 2026 21:12:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A41825B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7000640CBF
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u21R3C8oaTJU for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 21:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56C7A404D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56C7A404D5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56C7A404D5
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:12:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76433A4C3749;
 Thu,  5 Mar 2026 22:09:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47648)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyFxA-000000003FD-1m16;
 Thu, 05 Mar 2026 21:09:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Mar 2026 22:09:48 +0100
Message-ID: <20260305210950.3471974-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305210950.3471974-1-bernd@kuhls.net>
References: <20260305210950.3471974-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772744998;
 bh=+bM3uyowtcnCTJWk2x89oTb4psIXJXEUwzarqRtLc/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TkJteQlqblM5j7vwDGxV76Pub0G35Dzdcm7tafHLb8nD+eFTzzeHoU2gewgxdjIoo
 ftBbn9rNn+LBKZWyedSWiS6Jn+CPfVdC4A16+vb8KRH47rhIeNIv07bbMZ1zXsFC0f
 R3qr7zR8oaKL54MYKJ2kbkGephMIhI43xJgmvoU/xm/OYupDWLjOaISjDRWtqAdF0s
 vhGc+NVB8KOzBosx+QtU1c9RAq59sUTsmLp1lDZfi+fy5BJXaiX+RC3yr6FaRm2v0J
 uiYSwR7JG1Vg5K4ebXY5yoxaFeKFFgJQjn4wIW6WU5aLpYtN7sDIxIiM0ZUS6NFFtx
 kzdjQ8TCEfQOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TkJteQlq
Subject: [Buildroot] [PATCH v2 13/14] package/gcc/15.2.0: fix build with
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
