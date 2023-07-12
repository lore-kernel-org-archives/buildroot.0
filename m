Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1111EB64DD
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A7E941704;
	Wed, 12 Jul 2023 21:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A7E941704
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WT0dOrLet_8I; Wed, 12 Jul 2023 21:25:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EA5B416F6;
	Wed, 12 Jul 2023 21:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EA5B416F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B55FF1BF3A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ABD783BF1
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ABD783BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MPgQy8Po6KJg for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10E7E83BF0
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10E7E83BF0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F341486F3C; Wed, 12 Jul 2023 21:23:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 23:22:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60b84fb7ce4612b2b14a675e28331111468e1f2b
X-Git-Newrev: f89f52168fcb667a3e8e43f6f44d5b1ca3961a8c
X-Patchwork-Hint: ignore
Message-Id: <20230712212318.F341486F3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/infra/basetest.py: use
 Bootlin toolchain stable 2022.08-1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f89f52168fcb667a3e8e43f6f44d5b1ca3961a8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates the default toolchain used for runtime tests. The
last time this toolchain was updated was in commit
0207a65323fc73fe9570f3d7e03bbfed4ab6d477 3 years ago. Since then,
multiple things have changed:

Firstly, it used uclibc-ng as the libc whereas since commit
4057e36ca9665edd5248512e4edba2c243b8f4be, glibc is used as the default
library.

And secondly, since commit 531b2a10cda6bae78ecc141c9fe48f2024f71dbc, buildroot
dropped the support for gcc 8 and it cannot be built internally anymore.
So the testsuite was executed using a toolchain that can't be built by
the Buildroot internal toolchain backend anymore.

This new Bootlin toolchain stable 2022.08-1 is based on gcc 11.3.0,
linux headers 4.9.327, glibc 2.35 and binutils 2.38.

The previous toolchain bleeding edge 2018.11-1 is based on gcc 8.2.0,
linux headers 4.14.80, uclibc 1.0.30 and binutils 2.31.1

Nowadays Bootlin toolchains are packaged in Buildroot and we can
directly select them from BASIC_TOOLCHAIN_CONFIG and avoid
setting the toolchain parameters (BR2_TOOLCHAIN_EXTERNAL_CUSTOM...).

The switch to Glibc requires to update some tests for the following
reasons:

- TestPython3Py, TestPython3Pyc and TestPython3PyPyc has been updated
  since they use the libc binary file name in their test
  (uClibc: libc.so.1 vs Glibc: libc.so.6).

- TestTmux needs at least one locale to pass (as stated in tmux help
  text "tmux needs a working UTF-8 locale"), so use "C.UTF-8".

- TestOpenSsh needs a toolchain >= 5.x due to a openssh issue
  (Similar to: https://bugs.busybox.net/show_bug.cgi?id=13671)
  Use the Bootlin toolchain bleeding-edge 2022.08-1 rhat provide
  kernel headers 5.4

- TestShadow needs a toolchain >= 4.14
  Use the Bootlin toolchain bleeding-edge 2022.08-1 rhat provide
  kernel headers 5.4

Runtime tested on the gcc farm server.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/basetest.py             | 10 ++--------
 support/testing/tests/package/test_openssh.py |  8 +++++++-
 support/testing/tests/package/test_python.py  |  2 +-
 support/testing/tests/package/test_shadow.py  |  7 ++++++-
 support/testing/tests/package/test_tmux.py    |  1 +
 5 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 670c7213d6..12d96415da 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -9,14 +9,8 @@ BASIC_TOOLCHAIN_CONFIG = \
     """
     BR2_arm=y
     BR2_TOOLCHAIN_EXTERNAL=y
-    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-    BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2018.11-1.tar.bz2"
-    BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-    BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
-    BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-    BR2_TOOLCHAIN_HAS_THREADS_DEBUG=y
-    BR2_TOOLCHAIN_EXTERNAL_CXX=y
+    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
     """
 
 MINIMAL_CONFIG = \
diff --git a/support/testing/tests/package/test_openssh.py b/support/testing/tests/package/test_openssh.py
index 4b48059573..a28c28f797 100644
--- a/support/testing/tests/package/test_openssh.py
+++ b/support/testing/tests/package/test_openssh.py
@@ -32,9 +32,13 @@ class TestOpensshBase(infra.basetest.BRTest):
 
 
 class TestOpenSshuClibc(TestOpensshBase):
-    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+    config = \
         TestOpensshBase.opensshconfig + \
         """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE=y
         BR2_TARGET_ROOTFS_CPIO=y
         """
 
@@ -43,12 +47,14 @@ class TestOpenSshuClibc(TestOpensshBase):
 
 
 class TestOpenSshGlibc(TestOpensshBase):
+
     config = \
         TestOpensshBase.opensshconfig + \
         """
         BR2_arm=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE=y
         BR2_PACKAGE_RNG_TOOLS=y
         BR2_TARGET_ROOTFS_CPIO=y
         """
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index d6f69a83c7..c9ecf9acda 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -29,7 +29,7 @@ class TestPythonBase(infra.basetest.BRTest):
     def libc_time_test(self, timeout=-1):
         cmd = self.interpreter + " -c '"
         cmd += "import ctypes;"
-        cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.1\");"
+        cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.6\");"
         cmd += "print(libc.time(None))'"
         self.assertRunOk(cmd, timeout)
 
diff --git a/support/testing/tests/package/test_shadow.py b/support/testing/tests/package/test_shadow.py
index 09b580de59..3352d454a5 100644
--- a/support/testing/tests/package/test_shadow.py
+++ b/support/testing/tests/package/test_shadow.py
@@ -5,9 +5,14 @@ from infra.basetest import BRTest, BASIC_TOOLCHAIN_CONFIG
 
 class TestShadow(BRTest):
     username = 'user_test'
-    config = BASIC_TOOLCHAIN_CONFIG + \
+    # Need to use a different toolchain than the default due to
+    # shadow package requiring a toolchain w/ headers >= 4.14
+    config = \
         """
         BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE=y
         BR2_PACKAGE_SHADOW=y
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_4=y
diff --git a/support/testing/tests/package/test_tmux.py b/support/testing/tests/package/test_tmux.py
index 7a10b7a2b0..f2c620d5ca 100644
--- a/support/testing/tests/package/test_tmux.py
+++ b/support/testing/tests/package/test_tmux.py
@@ -9,6 +9,7 @@ class TestTmux(infra.basetest.BRTest):
         BR2_PACKAGE_TMUX=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_GENERATE_LOCALE="C.UTF-8"
         """
 
     def test_run(self):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
