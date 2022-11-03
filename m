Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F70C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E443F40BCE;
	Thu,  3 Nov 2022 22:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E443F40BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGEtFu-xX5Li; Thu,  3 Nov 2022 22:08:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E03A40BDC;
	Thu,  3 Nov 2022 22:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E03A40BDC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D70B1BF331
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48CD361043
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48CD361043
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jGYk_ITyWVqX for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:08:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CB8D61042
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CB8D61042
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B09887CEC; Thu,  3 Nov 2022 22:08:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 23:08:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7930708a3b1e429ea605f4544564b29313b0a7b
X-Git-Newrev: b9dd9ee857ec59e35552efe46a173eebc50659d2
X-Patchwork-Hint: ignore
Message-Id: <20221103220821.3B09887CEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/package/test_gdb.py:
 drop version-specific tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9dd9ee857ec59e35552efe46a173eebc50659d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Back when support/testing/tests/package/test_gdb was introduced, there
was a significant difference in how gdb < 10 and gdb >= 10 were
handled in gdb.mk, which explained why we were testing both gdb 9.x
and gdb 11.x.

However, support for gdb 9.x has now been dropped, and we only support
gdb >= 10.x, so testing gdb 9.x and 11.x separately no longer make
much sense. In addition:

 - other GDB tests in the same file already test the default version,
 which is now 11.x, meaning we in fact have duplicated tests between
 the ones testing the default version and the ones testing 11.x
 specifically

 - GDB 9.x has been removed, which means all the tests testing GDB 9.x
 are failing, with a Config.in.legacy build error.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3249828456 (TestGdbHostOnly9x)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/3249828454 (TestGdbHostGdbserver9x)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/3249828451 (TestGdbHostGdbTarget9x)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_gdb.py | 108 ------------------------------
 1 file changed, 108 deletions(-)

diff --git a/support/testing/tests/package/test_gdb.py b/support/testing/tests/package/test_gdb.py
index a7b0870644..4712162349 100644
--- a/support/testing/tests/package/test_gdb.py
+++ b/support/testing/tests/package/test_gdb.py
@@ -91,114 +91,6 @@ class TestGdbFullTarget(BaseGdb):
         self.verify_gdb()
 
 
-class TestGdbHostOnly9x(BaseGdb):
-    config = \
-        infra.basetest.MINIMAL_CONFIG + \
-        """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_GDB_VERSION_9_2=y
-        """
-
-    def test_run(self):
-        self.verify_host_gdb()
-
-
-class TestGdbHostGdbserver9x(BaseGdb):
-    config = \
-        """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_GDB_VERSION_9_2=y
-        BR2_PACKAGE_GDB=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-
-    def test_run(self):
-        self.verify_host_gdb()
-        self.boot()
-        self.verify_gdbserver()
-
-
-class TestGdbHostGdbTarget9x(BaseGdb):
-    config = \
-        """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_GDB_VERSION_9_2=y
-        BR2_PACKAGE_GDB=y
-        BR2_PACKAGE_GDB_DEBUGGER=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-
-    def test_run(self):
-        self.verify_host_gdb()
-        self.boot()
-        self.verify_gdb()
-
-
-class TestGdbHostOnly11x(BaseGdb):
-    config = \
-        infra.basetest.MINIMAL_CONFIG + \
-        """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_GDB_VERSION_11=y
-        """
-
-    def test_run(self):
-        self.verify_host_gdb()
-
-
-class TestGdbHostGdbserver11x(BaseGdb):
-    config = \
-        """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_GDB_VERSION_11=y
-        BR2_PACKAGE_GDB=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-
-    def test_run(self):
-        self.verify_host_gdb()
-        self.boot()
-        self.verify_gdbserver()
-
-
-class TestGdbHostGdbTarget11x(BaseGdb):
-    config = \
-        """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_GDB_VERSION_11=y
-        BR2_PACKAGE_GDB=y
-        BR2_PACKAGE_GDB_DEBUGGER=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-
-    def test_run(self):
-        self.verify_host_gdb()
-        self.boot()
-        self.verify_gdb()
-
-
 class TestGdbArc(BaseGdb):
     config = \
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
