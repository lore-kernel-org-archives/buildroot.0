Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3477C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB9B770B31;
	Fri, 28 Feb 2025 17:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BP5NRxDCVVvV; Fri, 28 Feb 2025 17:12:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC3C770B32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC3C770B32;
	Fri, 28 Feb 2025 17:12:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1317C1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 310C742544
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WMzL3G2TysI9 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1DB342F7A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1DB342F7A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABEC487A92; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 16:16:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 097faead4a46e0faee98684ce128472774fe9933
X-Git-Newrev: 91e51e267906f41cad530b93879ff3c157f3200d
X-Patchwork-Hint: ignore
Message-Id: <20250228163030.ABEC487A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/package/test_python_sdbus_networkmanager: use more
 recent toolchain
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=91e51e267906f41cad530b93879ff3c157f3200d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since the bump of NetworkManager to 1.50.0 in Buildroot commit
489d1f924979f7a94008e887393702e3c3663705, the
tests.package.test_python_sdbus_networkmanager.TestPythonPy3SdbusNetworkmanager
is failing to build as NM >= 1.50.0 needs headers >= 4.20.

We fix this test by using a newer toolchain. This means we can't use
anymore the basic toolchain config, so we use a fully specific
defconfig for this test.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173666

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../testing/tests/package/test_python_sdbus_networkmanager.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_sdbus_networkmanager.py b/support/testing/tests/package/test_python_sdbus_networkmanager.py
index a3961ec54f..c10f73920d 100644
--- a/support/testing/tests/package/test_python_sdbus_networkmanager.py
+++ b/support/testing/tests/package/test_python_sdbus_networkmanager.py
@@ -3,12 +3,21 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3SdbusNetworkmanager(TestPythonPackageBase):
     __test__ = True
-    config = TestPythonPackageBase.config + \
+    # Can't use TestPythonPackageBase.config because we need headers
+    # >= 4.20 for network-manager, so we have to use the bleeding-edge
+    # toolchain.
+    config = \
         """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_INIT_SYSTEMD=y
         BR2_PACKAGE_NETWORK_MANAGER=y
         BR2_PACKAGE_PYTHON_SDBUS_NETWORKMANAGER=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
         """
     sample_scripts = ["tests/package/sample_python_sdbus_networkmanager.py"]
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
