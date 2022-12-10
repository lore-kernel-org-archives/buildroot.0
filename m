Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2873CC64ED9
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD3204AE4C;
	Mon, 20 Feb 2023 21:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD3204AE4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L6qVs6Cg7BnC; Mon, 20 Feb 2023 21:50:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79CD84EC45;
	Mon, 20 Feb 2023 21:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79CD84EC45
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 233721BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1D324169B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1D324169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d41JE5umK8vp for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5BA341694
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5BA341694
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E05D486494; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 09:47:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1567fbd72d4b547f70a7509247bf9abb73ab58e3
X-Git-Newrev: de82d57b56dd895c7eb56948c631fa30c4935a2a
X-Patchwork-Hint: ignore
Message-Id: <20230220205159.E05D486494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libftdi1: fix static
 build with libusb and -latomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=de82d57b56dd895c7eb56948c631fa30c4935a2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use pkg-config to retrieve libusb dependencies such as -latomic and
avoid the following static build failure raised since bump of libusb to
version 1.0.25 in commit aad609936fc83acfe1eac6ffc86d29ac35dcf54e:

/nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libusb-1.0.a(core.o): in function `libusb_unref_device':
/nvmedata/autobuild/instance-29/output-1/build/libusb-1.0.25/libusb/core.c:1186: undefined reference to `__atomic_fetch_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/1ca7cd85ae60ad4797a6d8a83b2fb51d7eab96d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...txt-fix-static-build-with-libusb-and-lato.patch | 47 ++++++++++++++++++++++
 package/libftdi1/libftdi1.mk                       |  2 +-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch b/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
new file mode 100644
index 0000000000..c818c58d68
--- /dev/null
+++ b/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
@@ -0,0 +1,47 @@
+From b5b8fab6063ad90bb5ef05a72708ecde1796bc81 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 13 May 2022 18:11:50 +0200
+Subject: [PATCH] CMakeLists.txt: fix static build with libusb and -latomic
+
+Use pkg-config to retrieve libusb dependencies such as -latomic and
+avoid the following static build failure:
+
+/nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libusb-1.0.a(core.o): in function `libusb_unref_device':
+/nvmedata/autobuild/instance-29/output-1/build/libusb-1.0.25/libusb/core.c:1186: undefined reference to `__atomic_fetch_add_4'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1ca7cd85ae60ad4797a6d8a83b2fb51d7eab96d9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+http://developer.intra2net.com/git/?p=libftdi;a=commit;h=b5b8fab6063ad90bb5ef05a72708ecde1796bc81]
+---
+ CMakeLists.txt |   12 ++++++++++--
+ 1 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 58f664a..d20aa94 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -25,8 +25,16 @@ if(${CMAKE_BUILD_TYPE} STREQUAL Debug)
+ endif(${CMAKE_BUILD_TYPE} STREQUAL Debug)
+ 
+ # find libusb
+-find_package ( USB1 REQUIRED )
+-include_directories ( ${LIBUSB_INCLUDE_DIR} )
++find_package( PkgConfig )
++if (PkgConfig_FOUND)
++  pkg_check_modules( LIBUSB libusb-1.0 )
++  if (LIBUSB_FOUND)
++    include_directories ( ${LIBUSB_INCLUDE_DIRS} )
++  else()
++    find_package ( USB1 REQUIRED )
++    include_directories ( ${LIBUSB_INCLUDE_DIR} )
++  endif()
++endif()
+ 
+ # Find Boost
+ if (FTDIPP OR BUILD_TESTS)
+-- 
+1.7.1
+
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index d2e3f42e14..66798addc4 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -8,7 +8,7 @@ LIBFTDI1_VERSION = 1.5
 LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
 LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI1_INSTALL_STAGING = YES
-LIBFTDI1_DEPENDENCIES = libusb
+LIBFTDI1_DEPENDENCIES = host-pkgconf libusb
 LIBFTDI1_LICENSE = LGPL-2.1 (libftdi1), MIT (libftdi1)
 LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
 LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
