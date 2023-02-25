Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A8FC64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 20:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1366D40156;
	Sat, 25 Feb 2023 20:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1366D40156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4cDBwSpK8sS; Sat, 25 Feb 2023 20:53:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 268F840BB4;
	Sat, 25 Feb 2023 20:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 268F840BB4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DD371BF860
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 20:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28B4180C9C
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 20:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28B4180C9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 13ne-3r8wLk1 for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4714F80C0B
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4714F80C0B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35EAA86AE0; Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 21:53:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ec2a9d4383b3370da39d70805b7c7854cefeded
X-Git-Newrev: cc5a6c4af7e7809fccdb72b7140b33dacbbd1a94
X-Patchwork-Hint: ignore
Message-Id: <20230225205333.35EAA86AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-numpy: needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc5a6c4af7e7809fccdb72b7140b33dacbbd1a94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

C++ is mandatory since at least version 1.23.0 and
https://github.com/numpy/numpy/commit/c91a7d0c5691c9d78bd75284777fda73f225155d
resulting in the following build failure since bump to version 1.23.4 in
commit 32d8e23b977a5bba1f23e3821709c6aa9ff3bc55:

RuntimeError: Broken toolchain: cannot link a simple C++ program. note: A compiler with support for C++11 language features is required.

Fixes:
 - http://autobuild.buildroot.org/results/2d048d9b669ad60f37eeb2162b0a4f9fb425be1e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/piglit/Config.in       | 6 ++++--
 package/python-numpy/Config.in | 6 ++++--
 package/python-zlmdb/Config.in | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/piglit/Config.in b/package/piglit/Config.in
index 736fd95d71..5e957a555a 100644
--- a/package/piglit/Config.in
+++ b/package/piglit/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PIGLIT
 		BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND || \
 		BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL || \
 		BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
+	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBPNG
@@ -31,5 +32,6 @@ config BR2_PACKAGE_PIGLIT
 
 	  https://piglit.freedesktop.org
 
-comment "piglit needs glibc or musl"
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+comment "piglit needs a glibc or musl toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index a65164d9d5..132c3f7a82 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 config BR2_PACKAGE_PYTHON_NUMPY
 	bool "python-numpy"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
 	# python-numpy needs fenv.h which is not provided by uclibc
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	help
@@ -27,6 +28,7 @@ config BR2_PACKAGE_PYTHON_NUMPY
 
 	  http://www.numpy.org/
 
-comment "python-numpy needs glibc or musl"
+comment "python-numpy needs a glibc or musl toolchain w/ C++"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Config.in
index ac4ee05442..8eba2d7946 100644
--- a/package/python-zlmdb/Config.in
+++ b/package/python-zlmdb/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ZLMDB
 	bool "python-zlmdb"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
+	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
@@ -17,6 +18,7 @@ config BR2_PACKAGE_PYTHON_ZLMDB
 
 	  https://github.com/crossbario/zlmdb
 
-comment "python-zlmdb needs glibc or musl"
+comment "python-zlmdb needs a glibc or musl toolchain w/ C++"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
