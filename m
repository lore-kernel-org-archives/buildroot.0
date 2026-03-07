Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEB1FC9ED3
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 09:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE0CE614D6;
	Sat,  7 Mar 2026 09:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jb_J68Oi5IwN; Sat,  7 Mar 2026 09:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BA526145E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772875629;
	bh=ke4Xzwh+U5g0ZWO7JXBw+Ri5Viwa7VVmq4MqRJ6Iyi0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VOd+2EMCE5g2Ea3Ls2xiTcXYpoQsq5ByCYoTw0O/ef8TFpn+d6TU9RFvdZ74xck7Y
	 lr/5M/B8IDMn6buR3L2Drc2ta62cb5RpWw30LvAC3n8B0SZOFCYE1ORKsFUA9Kh3w5
	 4EAB4eqBGxPr2L/SoQxCfxvPGFAK4TfLaZiEFHOTRGqkRsF8MxERkiVk7ihV0slpOv
	 0F05ty9GSiOSme0tHR8nEUjTJmjhAd//ppMrJ5lLdNSw2g+dRSUInxZbb+F44ViU6M
	 ScvARMfo+jhKO3KAQ7ZKIJDhIcAWZSm1d8NPdg3i/yjCrbLMlj/mcxkA4x3k9kzSF/
	 w015hB2rTPlPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BA526145E;
	Sat,  7 Mar 2026 09:27:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D737F223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 09:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8E17405B0
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 09:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EjZ7ElkT_a5n for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 09:27:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A010405AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A010405AE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A010405AE
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 09:27:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8F41CA4C3785;
 Sat,  7 Mar 2026 10:27:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57846)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vynw6-000000000pr-0eIn;
 Sat, 07 Mar 2026 09:27:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  7 Mar 2026 10:27:00 +0100
Message-ID: <20260307092701.14217-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772875622;
 bh=+LK9kvCBOyBMiw4ZRnaYH1vRsrdzU+8s/dKaRZXhr5o=;
 h=From:To:Cc:Subject:Date:From;
 b=iGmIliE+R4PvsfAORH43RnZzvwX4zLMFjKFqEqc9ZhceYvtLALF2p8QmIZA2xTiAn
 d+4v4stkFLkj1nRRuZ8UacEIMISYoAHd8IsK0YaomvTTSTHcCU4oQph2DsdhpOU4fp
 3C59RijNQNsen3Uq6l5kQVHDcqfMC4OP9s7UqGFVmEeYddGyfk97+5kO0/XMfjx69I
 78zux6N2M5DVDi+XctuQWoYdoWXNdzpwZbT1jHQq1lYuuZjDjRTzPzvpXU1BhrWaWs
 EY+wU4xk2AVXNRZlLjpFLVSGX0ZabNEephZQIoznRorN79oNLqTvEnC2wlqz2x/9X/
 WUtLkFXB9pRLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=iGmIliE+
Subject: [Buildroot] [PATCH v3 1/2] package/gcc/15.2.0: fix build with glibc
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
v3: fix format error
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
