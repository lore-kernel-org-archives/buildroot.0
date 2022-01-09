Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69709C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C30281AD1;
	Sun,  9 Jan 2022 15:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDkqA0Ac1TD7; Sun,  9 Jan 2022 15:01:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4144B81AAC;
	Sun,  9 Jan 2022 15:01:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15DA91BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05444402C1
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tBCQh088ny3h for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:00:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94B28402BE
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:00:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D5EB882DCE; Sun,  9 Jan 2022 14:53:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 15:58:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6050df28b225a686d750b6f9d6825de977735ad1
X-Git-Newrev: df3f0c226fccd8d6143b09a1e05a0f5f23587136
X-Patchwork-Hint: ignore
Message-Id: <20220109145350.D5EB882DCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tesseract-ocr: bump to version
 5.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=df3f0c226fccd8d6143b09a1e05a0f5f23587136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Updated language training data version to 4.1.0
- Removed current patch as not required anymore
- Added patch to fix uclibc failures
- Supported C++ version has moved from C++11 to C++17

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Check-if-platform-supports-feenableexcept.patch | 42 ++++++++++++++++++++++
 .../0001-Fix-timeval-structure-build-failure.patch | 27 --------------
 package/tesseract-ocr/Config.in                    |  6 ++--
 package/tesseract-ocr/tesseract-ocr.hash           |  2 +-
 package/tesseract-ocr/tesseract-ocr.mk             |  4 +--
 5 files changed, 48 insertions(+), 33 deletions(-)

diff --git a/package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch b/package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch
new file mode 100644
index 0000000000..5280f01aba
--- /dev/null
+++ b/package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch
@@ -0,0 +1,42 @@
+From 52484af83a58664c3cc91b8af07aeeea271f67ef Mon Sep 17 00:00:00 2001
+From: Gilles Talis <gilles.talis@gmail.com>
+Date: Sun, 9 Jan 2022 10:58:36 +0100
+Subject: [PATCH] Check if platform supports feenableexcept
+
+Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
+---
+ configure.ac      | 4 ++++
+ src/tesseract.cpp | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9177d64..80cd735 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -188,6 +188,10 @@ case "${host_cpu}" in
+ 
+ esac
+
++# check whether feenableexcept is supported. some C libraries (e.g. uclibc) don't.
++AC_CHECK_FUNC(feenableexcept, [feenableexcept=true], [feenableexcept=false])
++AM_CONDITIONAL([HAVE_FEENABLEEXCEPT], $feenableexcept)
++
+ AX_CHECK_COMPILE_FLAG([-fopenmp-simd], [openmp_simd=true], [openmp_simd=false], [$WERROR])
+ AM_CONDITIONAL([OPENMP_SIMD], $openmp_simd)
+ 
+diff --git a/src/tesseract.cpp b/src/tesseract.cpp
+index 933116e..9154db8 100644
+--- a/src/tesseract.cpp
++++ b/src/tesseract.cpp
+@@ -629,7 +629,7 @@ static void PreloadRenderers(tesseract::TessBaseAPI &api,
+  **********************************************************************/
+ 
+ int main(int argc, char **argv) {
+-#if defined(__USE_GNU)
++#if defined(__USE_GNU) && defined(HAVE_FEENABLEEXCEPT)
+   // Raise SIGFPE.
+ #  if defined(__clang__)
+   // clang creates code which causes some FP exceptions, so don't enable those.
+-- 
+2.32.0
+
diff --git a/package/tesseract-ocr/0001-Fix-timeval-structure-build-failure.patch b/package/tesseract-ocr/0001-Fix-timeval-structure-build-failure.patch
deleted file mode 100644
index 0b0bb1a899..0000000000
--- a/package/tesseract-ocr/0001-Fix-timeval-structure-build-failure.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ea1e1ddfc0af9966a0c613a93087bc3e0a5979a7 Mon Sep 17 00:00:00 2001
-From: Gilles Talis <gilles.talis@gmail.com>
-Date: Fri, 19 Jul 2019 18:52:03 +0200
-Subject: [PATCH] Fix timeval structure build failure
-
-timeval structure definition requires <sys/time.h> to be included
-
-Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
----
- src/ccutil/ocrclass.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ccutil/ocrclass.h b/src/ccutil/ocrclass.h
-index d39a6dd..2a01118 100644
---- a/src/ccutil/ocrclass.h
-+++ b/src/ccutil/ocrclass.h
-@@ -28,6 +28,7 @@
- 
- #include <chrono>
- #include <ctime>
-+#include <sys/time.h>
- #ifdef _WIN32
- #include <winsock2.h> // for timeval
- #endif
--- 
-2.7.4
-
diff --git a/package/tesseract-ocr/Config.in b/package/tesseract-ocr/Config.in
index 3afaca771a..4d9b78733e 100644
--- a/package/tesseract-ocr/Config.in
+++ b/package/tesseract-ocr/Config.in
@@ -1,13 +1,13 @@
-comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 4.8, dynamic library, wchar"
+comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 7, dynamic library, wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 menuconfig BR2_PACKAGE_TESSERACT_OCR
 	bool "tesseract-ocr"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
index 808ea174ef..9e526423d3 100644
--- a/package/tesseract-ocr/tesseract-ocr.hash
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  2a66ff0d8595bff8f04032165e6c936389b1e5727c3ce5a27b3e059d218db1cb  tesseract-ocr-4.1.1.tar.gz
+sha256  b5b0e561650ed67feb1e9de38d4746121d302ae4c876c95b99b8b6f9f89d5c58  tesseract-ocr-5.0.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  daa0c97d651c19fba3b25e81317cd697e9908c8208090c94c3905381c23fc047  eng.traineddata
 sha256  eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913  fra.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index fc083c27f6..7e23e64136 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TESSERACT_OCR_VERSION = 4.1.1
-TESSERACT_OCR_DATA_VERSION = 4.0.0
+TESSERACT_OCR_VERSION = 5.0.1
+TESSERACT_OCR_DATA_VERSION = 4.1.0
 TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
 TESSERACT_OCR_LICENSE = Apache-2.0
 TESSERACT_OCR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
