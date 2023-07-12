Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40FCEB64DD
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BC84416C2;
	Wed, 12 Jul 2023 21:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BC84416C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UvxK66UbMwLb; Wed, 12 Jul 2023 21:24:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4D60416EC;
	Wed, 12 Jul 2023 21:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4D60416EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5352E1BF3A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DB7683BF4
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DB7683BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vO-cob96ZmDK for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46EA283BF2
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46EA283BF2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35B5486F3D; Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 23:22:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1dd1a8c5cc0dd537b4c29a18e11e73e136e1895f
X-Git-Newrev: f2652461c6f3b997ecd4e13c5637e23a34f38ce8
X-Patchwork-Hint: ignore
Message-Id: <20230712212319.35B5486F3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing:
 TestPythonPy3Cryptography: use python base configuration
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2652461c6f3b997ecd4e13c5637e23a34f38ce8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The base configuration now provide a glibc toolchain,
we can safely switch to it.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_python_cryptography.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
index bf11c02e5c..ee8e75f885 100644
--- a/support/testing/tests/package/test_python_cryptography.py
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -3,14 +3,8 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Cryptography(TestPythonPackageBase):
     __test__ = True
-    # Need to use a different toolchain than the default due to
-    # python-cryptography using Rust (not available with uclibc)
-    config = \
+    config = TestPythonPackageBase.config + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
         BR2_TARGET_ROOTFS_CPIO=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
