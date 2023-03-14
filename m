Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B5DC6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 07:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8784F8142C;
	Tue, 14 Mar 2023 07:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8784F8142C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPHZrpbwkMH1; Tue, 14 Mar 2023 07:28:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B135381C46;
	Tue, 14 Mar 2023 07:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B135381C46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C69461BF95E
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACE7381417
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACE7381417
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FNPNFvByl8JR for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 07:28:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5A588133F
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 07:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5A588133F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3820870EC; Tue, 14 Mar 2023 07:28:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 08:26:32 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: eecb4a6630ada80c96d9544282c3bdb8f42a55f7
X-Git-Newrev: d2a00c83ae6a772e84dd238bde31bd526972412d
X-Patchwork-Hint: ignore
Message-Id: <20230314072822.B3820870EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/python-numpy:
 needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2a00c83ae6a772e84dd238bde31bd526972412d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

C++ is mandatory since at least version 1.23.0 and
https://github.com/numpy/numpy/commit/c91a7d0c5691c9d78bd75284777fda73f225155d
resulting in the following build failure since bump to version 1.23.4 in
commit 32d8e23b977a5bba1f23e3821709c6aa9ff3bc55:

RuntimeError: Broken toolchain: cannot link a simple C++ program. note: A compiler with support for C++11 language features is required.

Fixes:
 - http://autobuild.buildroot.org/results/2d048d9b669ad60f37eeb2162b0a4f9fb425be1e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cc5a6c4af7e7809fccdb72b7140b33dacbbd1a94)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
