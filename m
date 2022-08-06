Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A133DC19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 14:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EFDA60B52;
	Sat,  6 Aug 2022 14:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EFDA60B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TDGIT6muRPRM; Sat,  6 Aug 2022 14:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C8E060ACB;
	Sat,  6 Aug 2022 14:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C8E060ACB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4E81BF2F0
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 14:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 645BB60ACB
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 14:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 645BB60ACB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rziO01rXixkp for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 14:15:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E66160AC0
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 14:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E66160AC0
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4C66B86AD5; Sat,  6 Aug 2022 14:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 Aug 2022 16:14:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e5338ed06f74ebd8c216ba504fc1dc1e1a2f76b
X-Git-Newrev: 82e61bed8208857d5d13c384c89086c4dd4e1e79
X-Patchwork-Hint: ignore
Message-Id: <20220806140104.4C66B86AD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pistache: enable on uClibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=82e61bed8208857d5d13c384c89086c4dd4e1e79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pistache couldn't build on uClibc due to just one missing
definition. In addition, the Config.in comment was wrong as it said
that a glibc toolchain was needed, while in fact it could be glibc or
musl.

Cc: Thomas Ruschival <thomas@ruschival.de>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...transport.cc-fallback-value-for-RUSAGE_TH.patch | 33 ++++++++++++++++++++++
 package/pistache/Config.in                         |  4 +--
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch b/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
new file mode 100644
index 0000000000..327933e26d
--- /dev/null
+++ b/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
@@ -0,0 +1,33 @@
+From 5feed6d2f86750bfe1e7c26d6fd4e8d2195ea81f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 4 Aug 2022 19:54:23 +0200
+Subject: [PATCH] src/common/transport.cc: fallback value for RUSAGE_THREAD
+
+uClibc-ng currently does not define RUSAGE_THREAD, so let's add a
+fallback value until it gets fixed in uClibc-ng. The value is the same
+on all Linux systems, regardless of the CPU architecture.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream bug: https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/MEXOUSFSH46UFS3AEMEIEPTL5U4HVEFL/
+---
+ src/common/transport.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/common/transport.cc b/src/common/transport.cc
+index 62efb8c..0f3abb0 100644
+--- a/src/common/transport.cc
++++ b/src/common/transport.cc
+@@ -515,6 +515,10 @@ namespace Pistache::Tcp
+ 
+         rusage now;
+ 
++#if !defined(RUSAGE_THREAD)
++#define RUSAGE_THREAD 1
++#endif
++
+         auto res = getrusage(RUSAGE_THREAD, &now);
+         if (res == -1)
+             loadRequest_.reject(std::runtime_error("Could not compute usage"));
+-- 
+2.37.1
+
diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index 53a4b73a58..3acf1f53f0 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PISTACHE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	select BR2_PACKAGE_RAPIDJSON
 	help
@@ -14,9 +13,8 @@ config BR2_PACKAGE_PISTACHE
 
 	  https://github.com/oktal/pistache
 
-comment "pistache needs a glibc toolchain w/ C++, gcc >= 7, threads, wchar, not binutils bug 27597"
+comment "pistache needs a toolchain w/ C++, gcc >= 7, threads, wchar, not binutils bug 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		   BR2_TOOLCHAIN_USES_UCLIBC || \
 		   !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
 		   !BR2_USE_WCHAR || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
