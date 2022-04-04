Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A569C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 372E440520;
	Mon,  4 Apr 2022 17:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d9lEtPgG6C2R; Mon,  4 Apr 2022 17:49:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D9EB4017C;
	Mon,  4 Apr 2022 17:49:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9191BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C1C4606C0
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZt5NZ1kMQMh for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:49:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 152E36059F
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:49:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 93055807CF; Mon,  4 Apr 2022 17:39:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 19:48:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e67eaafd6fa96a6f1e8fe32edd8580613cbdf1cb
X-Git-Newrev: 4bba8d0b64d5dc70aa3e5bb6eec7a6b87d4930b4
X-Patchwork-Hint: ignore
Message-Id: <20220404173947.93055807CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/htop: fix hwloc
 static build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4bba8d0b64d5dc70aa3e5bb6eec7a6b87d4930b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following static build failure with hwloc raised since commit
c83bf9720632bcd4d438094a9fc30feff69fc555:

checking for hwloc_get_proc_cpubind in -lhwloc... no
configure: error: can not find required library libhwloc

Fixes:
 - http://autobuild.buildroot.org/results/5d815ec08c580005a863df6ac9ac29deff7d4128

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit dd6c4a9929b4980b4a3b4dc3232cd23882dd3789)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-configure.ac-fix-static-build-with-hwloc.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch b/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
new file mode 100644
index 0000000000..0ac79766c5
--- /dev/null
+++ b/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
@@ -0,0 +1,54 @@
+From 4ccad4604586c921b4ad831b254496c2cdece9fc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 2 Apr 2022 17:27:01 +0200
+Subject: [PATCH] configure.ac: fix static build with hwloc
+
+Retrieve hwloc dependencies through pkg-config to avoid the following
+static build failure:
+
+checking for hwloc_get_proc_cpubind in -lhwloc... no
+configure: error: can not find required library libhwloc
+
+This build failure is raised because without pkg-config, hwloc
+dependencies such as libxml2 are not retrieved:
+
+configure:8999: checking for hwloc_get_proc_cpubind in -lhwloc
+configure:9022: /home/autobuild/autobuild/instance-0/output-1/host/bin/powerpc-buildroot-linux-uclibc-gcc -o conftest -D_GNU_SOURCE -I/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Og -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lhwloc  -llzma -L/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/lib -lncurses -lm   >&5
+/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/lib/libhwloc.a(topology-xml-libxml.o): in function `hwloc_libxml_free_buffer':
+topology-xml-libxml.c:(.text+0x6a): undefined reference to `xmlFree'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5d815ec08c580005a863df6ac9ac29deff7d4128
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/htop-dev/htop/commit/4ccad4604586c921b4ad831b254496c2cdece9fc]
+---
+ configure.ac | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4ecac1ecf..6bb7eb69f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -456,8 +456,18 @@ case "$enable_hwloc" in
+    no)
+       ;;
+    yes)
+-      AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
+-      AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
++      m4_ifdef([PKG_PROG_PKG_CONFIG], [
++         PKG_PROG_PKG_CONFIG()
++         PKG_CHECK_MODULES(HWLOC, hwloc, [
++               CFLAGS="$CFLAGS $HWLOC_CFLAGS" LIBS="$LIBS $HWLOC_LIBS"
++            ], [
++               AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
++               AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
++            ])
++         ], [
++            AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
++            AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
++         ])
+       ;;
+    *)
+       AC_MSG_ERROR([bad value '$enable_hwloc' for --enable-hwloc])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
