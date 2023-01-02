Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAA4C3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 12:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AAC060750;
	Mon,  2 Jan 2023 12:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AAC060750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4nzJJPTvYYHD; Mon,  2 Jan 2023 12:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A370B606FF;
	Mon,  2 Jan 2023 12:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A370B606FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B83201BF33E
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 947B040600
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 947B040600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cRAj1WJz2dE0 for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 12:08:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4B6A40602
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 12:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4B6A40602
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0535870AF; Mon,  2 Jan 2023 12:08:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Jan 2023 13:07:13 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 005e5fc0eb0f6fff8622bb552c5b350a79977eb1
X-Git-Newrev: a0bdbf46e04ae08cf4954b310eaa624bae66a36b
X-Patchwork-Hint: ignore
Message-Id: <20230102120821.B0535870AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rtl_433: fix
 static openssl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0bdbf46e04ae08cf4954b310eaa624bae66a36b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following static openssl build failure raised since commit
7967755fbf25fe4d5860884bedb3e01fcd7e9855:

/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-13/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_cert.o): in function `ssl_cert_free':
ssl_cert.c:(.text+0x384): undefined reference to `__atomic_fetch_sub_4'

Fixes:
 - http://autobuild.buildroot.org/results/417c86963ffe038aa052ea3cf19fd52c3e9b7396

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 56763ca01229ead2dba2cfb27025b41c0a5e18ed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...txt-use-pkg-config-to-detect-openssl-when.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch b/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch
new file mode 100644
index 0000000000..00858c8ff9
--- /dev/null
+++ b/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch
@@ -0,0 +1,42 @@
+From b860de9e207d8fe2ea37dad28fdd014493d87703 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 27 Dec 2022 16:29:16 +0100
+Subject: [PATCH] build: Fix CMake to use pkg-config openssl when possible
+ (#2290)
+
+In order to take into account the libraries used by openssl when
+building statically, using pkg-config is recommended. This patch
+therefore improves the CMakeLists.txt to use pkg-config to detect
+openssl when pkg-config is available. This will avoid
+static build failure when openssl needs to link with -latomic.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/417c86963ffe038aa052ea3cf19fd52c3e9b7396
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/merbanan/rtl_433/commit/b860de9e207d8fe2ea37dad28fdd014493d87703]
+---
+ CMakeLists.txt | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d47a3eda2..cf30d8be2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -175,7 +175,14 @@ set(ENABLE_OPENSSL AUTO CACHE STRING "Enable OpenSSL TLS support")
+ set_property(CACHE ENABLE_OPENSSL PROPERTY STRINGS AUTO ON OFF)
+ if(ENABLE_OPENSSL) # AUTO / ON
+ 
+-find_package(OpenSSL)
++find_package(PkgConfig)
++if(PKG_CONFIG_FOUND)
++    pkg_check_modules(OPENSSL openssl)
++    set(OPENSSL_LIBRARIES ${OPENSSL_LINK_LIBRARIES})
++    set(OPENSSL_INCLUDE_DIR ${OPENSSL_INCLUDE_DIRS})
++else()
++    find_package(OpenSSL)
++endif()
+ if(OPENSSL_FOUND)
+     message(STATUS "OpenSSL TLS support will be compiled. Found version ${OPENSSL_VERSION}")
+     include_directories(${OPENSSL_INCLUDE_DIR})
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
