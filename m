Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36569FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 20:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02F1B41E77;
	Fri,  6 Mar 2026 20:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIEMVJcd37iv; Fri,  6 Mar 2026 20:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61EFD41E59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772828116;
	bh=2SBEniOy3kC0NimTD6br7husAKpI9DjaRWzR+EUfP3w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZJeAgjIDvtpJDFcw4sYVwytUCES7FeO3TGxbP8ZoC3sABMv1XDmZfQWAeuRtXSaE2
	 ZaLBUy/tvMiIKrNXbTFH4HQGdobHuXaIvKVEwSXNg7AZGy+3ks9KoL4tVIzO+aMtYu
	 wleZ1Nydur2B7q+jQfb7FjZlku/tEpX+g/i4nkLPxStqWQlGLRMvlDU++3CCL7hUoh
	 QkLIk0BJg3fVXDwlI02k5MKmY4DuT+MWx+e0pJ0Beda5nTYlB+pIMzeTQUGre3QW+X
	 ujHbCToFDQMsDFuHIaWRVWmPcXim1eYOeID5wfRXlrIprAQXoJRMX+7vjrhkV36kDp
	 8q14g1xAFyJrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61EFD41E59;
	Fri,  6 Mar 2026 20:15:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06B9F169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 20:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC01E613DC
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 20:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeNfJLYt6JLW for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 20:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE1CC613DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE1CC613DF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE1CC613DF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 20:15:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2157FA4C3757;
 Fri,  6 Mar 2026 21:15:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51188)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vybZj-000000003im-0ZYH;
 Fri, 06 Mar 2026 20:15:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  6 Mar 2026 21:15:04 +0100
Message-ID: <20260306201507.2969457-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772828108;
 bh=nbpXMqi42pe98EESsjbc6jkS8qsW5ulJ8MXmLUXkPZI=;
 h=From:To:Cc:Subject:Date:From;
 b=kDVnSkPt/si0RRpTzDd1XtgWNV+hREoZlEXTezKVvE+w2n9oZ7YPtnDdM7wNvxRby
 e1c57xUvE8qrX/V36iX75IcVeTLXwufO/pPaagtCsEq2eKC/W1tjItWWq2zK/qoIDt
 lCwruomVIKvp+lAzEdfrIhK1HKwcUo+qOMTVpLtHW/T+pygGp5pFAHxG12FHdSJGtG
 YBvl/FUmHBBRAZ/02hcv5F0kfcpS/5g/u4V/1yMTDchbM7xP/j6jQ5EelMnwN4UXBy
 Wr1X6LJ953F+U7t4OguRW4EnEQBu1LmqJ/jQEhGPOA1ALtMGArkmnnxgXEm5ll77wx
 qxHrrfuIibCvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=kDVnSkPt
Subject: [Buildroot] [PATCH v2 1/2] package/gcc/15.2.0: fix build with glibc
 2.43
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

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
