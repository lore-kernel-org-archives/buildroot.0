Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F9EC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECD044F2E5;
	Mon, 20 Feb 2023 22:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECD044F2E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NI1nx5sb1EGA; Mon, 20 Feb 2023 22:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B66294F308;
	Mon, 20 Feb 2023 22:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B66294F308
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA2991BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91C034170D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91C034170D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1Ps94QMC7JX for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1F1A416DB
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1F1A416DB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF01786494; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 22:32:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 85c5af46ad6c18841576c0f7abe241a617a44cb7
X-Git-Newrev: 56763ca01229ead2dba2cfb27025b41c0a5e18ed
X-Patchwork-Hint: ignore
Message-Id: <20230220205216.AF01786494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rtl_433: fix static
 openssl build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=56763ca01229ead2dba2cfb27025b41c0a5e18ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following static openssl build failure raised since commit
7967755fbf25fe4d5860884bedb3e01fcd7e9855:

/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-13/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_cert.o): in function `ssl_cert_free':
ssl_cert.c:(.text+0x384): undefined reference to `__atomic_fetch_sub_4'

Fixes:
 - http://autobuild.buildroot.org/results/417c86963ffe038aa052ea3cf19fd52c3e9b7396

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
