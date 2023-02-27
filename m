Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43081C64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 16:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE2961042;
	Mon, 27 Feb 2023 16:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDE2961042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RYDw5-2rmrpT; Mon, 27 Feb 2023 16:05:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C9461062;
	Mon, 27 Feb 2023 16:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C9461062
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7F71BF2AA
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 16:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDE8460FDA
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 16:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDE8460FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AARFb-l7jNgg for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 16:05:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1428B605A2
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 16:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1428B605A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0093C86C3C; Mon, 27 Feb 2023 16:05:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 17:04:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c4435190773195fc5d1a97f819e1160f4bd52ca
X-Git-Newrev: 3aa7821d77386b597c7c63d9bdafa3278df60c36
X-Patchwork-Hint: ignore
Message-Id: <20230227160516.0093C86C3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtty: fix openssl static build
 with -latomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=3aa7821d77386b597c7c63d9bdafa3278df60c36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following openssl static build failure with -latomic raised
since bump to version 8.1.0 in commit
7e608885a2df51ba77378f210f4c0e8cb59d5b8b:

/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-8/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_cert.o): in function `ssl_cert_free':
ssl_cert.c:(.text+0x53c): undefined reference to `__atomic_fetch_sub_4'

Fixes:
 - http://autobuild.buildroot.org/results/f606bb15bf4f88ba29ef0795413e13acc9cd0976

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-CMakeLists.txt-prefer-pkg_check_modules.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch b/package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch
new file mode 100644
index 0000000000..3714050445
--- /dev/null
+++ b/package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch
@@ -0,0 +1,40 @@
+From 565c003ac412c9b0fa39d208d4a911f4300477c3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 26 Feb 2023 20:39:11 +0100
+Subject: [PATCH] CMakeLists.txt: prefer pkg_check_modules
+
+Prefer pkg_check_modules over find_package to avoid the following static
+build failure with openssl and -latomic:
+
+/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-8/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_cert.o): in function `ssl_cert_free':
+ssl_cert.c:(.text+0x53c): undefined reference to `__atomic_fetch_sub_4'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f606bb15bf4f88ba29ef0795413e13acc9cd0976
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zhaojh329/ssl/pull/4]
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/ssl/CMakeLists.txt b/src/ssl/CMakeLists.txt
+index 4868bf7..36488c7 100644
+--- a/src/ssl/CMakeLists.txt
++++ b/src/ssl/CMakeLists.txt
+@@ -14,10 +14,10 @@ endif()
+ 
+ find_package(PkgConfig QUIET)
+ 
+-find_package(OpenSSL)
++pkg_check_modules(OPENSSL openssl)
+ 
+ if (NOT OPENSSL_FOUND)
+-    pkg_check_modules(OPENSSL openssl)
++    find_package(OpenSSL)
+ endif()
+ 
+ find_package(WolfSSL)
+-- 
+2.39.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
