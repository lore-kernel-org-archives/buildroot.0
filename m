Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B155C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09BED41CCE;
	Mon, 20 Feb 2023 20:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09BED41CCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E8DIl53uIwAI; Mon, 20 Feb 2023 20:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD64041D2B;
	Mon, 20 Feb 2023 20:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD64041D2B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0FB1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47C3F61088
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47C3F61088
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dggbEAi5wW-7 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A0456100B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A0456100B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 294CF8648F; Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 23:08:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e7930708a3b1e429ea605f4544564b29313b0a7b
X-Git-Newrev: b9dd9ee857ec59e35552efe46a173eebc50659d2
X-Patchwork-Hint: ignore
Message-Id: <20230220205146.294CF8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/package/test_gdb.py: drop version-specific tests
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
