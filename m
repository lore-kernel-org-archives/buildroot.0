Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF714C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:11:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89EB4601FD
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89EB4601FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67E8F60B5A;
	Wed,  4 Aug 2021 01:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ortpVKiaPNRT; Wed,  4 Aug 2021 01:11:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B390460B51;
	Wed,  4 Aug 2021 01:11:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8AB71BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC889414B9
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o582jahzrZlW for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D7EA414FD
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D37DE85E9B; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 Aug 2021 18:29:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 69d2d1d91e44d6bc80690b82811d0447e81ed31b
X-Git-Newrev: 3be90cd5b1262b992030513f7f0f6331b2364257
X-Patchwork-Hint: ignore
Message-Id: <20210803211027.D37DE85E9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/irqbalance: use
 pkg-config to find numa
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

commit: https://git.buildroot.net/buildroot/commit/?id=3be90cd5b1262b992030513f7f0f6331b2364257
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use pkg-config to find numa to avoid the following build failure when
checking for numa_available:

configure:9667: checking for numa_available in -lnuma
configure:9692: /tmp/instance-7/output-1/host/bin/microblazeel-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lnuma   >&5
/tmp/instance-7/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: /tmp/instance-7/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libnuma.a(libnuma.o): in function `numa_node_to_cpus_v1':
(.text+0x2a80): undefined reference to `__atomic_fetch_and_1'
/tmp/instance-7/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: /tmp/instance-7/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libnuma.a(libnuma.o): in function `numa_node_to_cpus_v2':
(.text+0x2ddc): undefined reference to `__atomic_fetch_and_1'
collect2: error: ld returned 1 exit status

Fixes:
 - http://autobuild.buildroot.org/results/577a63432fba2f9ae1ed2c6c2a77c5ce54ac5521

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-configure.ac-use-pkg-config-to-find-numa.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/irqbalance/0002-configure.ac-use-pkg-config-to-find-numa.patch b/package/irqbalance/0002-configure.ac-use-pkg-config-to-find-numa.patch
new file mode 100644
index 0000000000..751367ccfb
--- /dev/null
+++ b/package/irqbalance/0002-configure.ac-use-pkg-config-to-find-numa.patch
@@ -0,0 +1,38 @@
+From 274cb8ea470a10ce46b783e77784b0eb08cf20d8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 1 Aug 2021 23:26:01 +0200
+Subject: [PATCH] configure.ac: use pkg-config to find numa
+
+Use pkg-config to find numa and fallback to current mechanism.
+Thanks to pkg-config, numa dependencies such as -latomic will be
+retrieved.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/Irqbalance/irqbalance/pull/188]
+---
+ configure.ac | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c45b9ce..50c62ba 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -23,7 +23,14 @@ AC_CHECK_HEADERS([numa.h])
+ 
+ AC_CHECK_FUNCS(getopt_long)
+ 
+-AC_CHECK_LIB(numa, numa_available)
++PKG_CHECK_MODULES([NUMA], [numa], [has_numa=yes], [AC_CHECK_LIB(numa, numa_available)])
++AS_IF([test "x$has_numa" = "xyes"], [
++  AC_SUBST([NUMA_CFLAGS])
++  AC_SUBST([NUMA_LIBS])
++  LIBS="$LIBS $NUMA_LIBS"
++  AC_SUBST([LIBS])
++])
++
+ AC_CHECK_LIB(m, floor)
+ 
+ PKG_CHECK_MODULES([GLIB2], [glib-2.0], [], [AC_MSG_ERROR([glib-2.0 is required])])
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
