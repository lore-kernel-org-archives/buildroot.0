Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404CFC4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 07:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BABBA409DB;
	Tue, 20 Dec 2022 07:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BABBA409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ttw6WQztYs8k; Tue, 20 Dec 2022 07:46:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 915B6410A0;
	Tue, 20 Dec 2022 07:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 915B6410A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B46F21BF300
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 07:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D255818C2
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 07:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D255818C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id McL4AH01Hdz8 for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 07:46:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A744E81463
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 07:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A744E81463
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95D8086A70; Tue, 20 Dec 2022 07:46:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Dec 2022 08:44:03 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: b85968ac06d3a5f1b99fade5bba8379d8dd5c54f
X-Git-Newrev: 8932807e5fabd822ad79d78079744ba1f910186f
X-Patchwork-Hint: ignore
Message-Id: <20221220074654.95D8086A70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/libftdi1: fix
 static build with libusb and -latomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=8932807e5fabd822ad79d78079744ba1f910186f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit de82d57b56dd895c7eb56948c631fa30c4935a2a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
