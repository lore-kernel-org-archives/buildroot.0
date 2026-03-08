Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F347EA8537
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 16:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0770841959;
	Sun,  8 Mar 2026 16:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 559Wl4rEelrg; Sun,  8 Mar 2026 16:43:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D49A7418F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772988182;
	bh=r99irVFSOMcvs9WkqReqOOUPlBK8q6qJ5IvvbITE9H8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s/RBVsIHQ7JBTbN+DOoH+eBesKjp8qlRhA5y6RnFmXL4YyrCB5YR1sEThrossBt4H
	 ZMcC5aW6ou2aF6Rc09WJ79xTF+2v7maFpDZ/RVcUJoUvSKh82LfvhDBVThF7Ed9Pka
	 bJQs7SPeloOt2U7IF900RfJKrSXQmlDZJPKq+eEMQPh2iqKVg/7nSy1rNbAKKjMopC
	 jHehElJNvIpsZoajTqRpfrhhHKJ8w4rLCEP/N2tSz0nAGil1W7zW/rLkrlcU1VCOXq
	 up22IxbO2AcW5qBwVzN0phBKuUtcoNo3Fooicj0SPp8S8f0ro7UuI1Zk4H9ZrVbkXx
	 Sf61Xo6PtJl6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D49A7418F9;
	Sun,  8 Mar 2026 16:43:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EB4A223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14B5360EE0
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7me41d-9_uoq for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 16:43:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E83CA60711
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E83CA60711
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:43:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0CDE82A07; Sun,  8 Mar 2026 16:43:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 8 Mar 2026 17:39:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f983411b57a0be2c34b0b03a33a3750fa5b77c95
X-Git-Newrev: ca02e86f882a427ff39926bcf6e8f15123eac56b
X-Patchwork-Hint: ignore
Message-Id: <20260308164300.F0CDE82A07@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc/15.2.0: fix build with glibc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ca02e86f882a427ff39926bcf6e8f15123eac56b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...libgomp-Fix-GCC-build-after-glibc-cd748a6.patch | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
