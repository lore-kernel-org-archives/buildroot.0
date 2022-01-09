Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56610C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C88040887;
	Sun,  9 Jan 2022 11:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f34ZYTqFaqxr; Sun,  9 Jan 2022 11:14:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0551340888;
	Sun,  9 Jan 2022 11:14:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 197121BF370
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 069FA4047C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id seyluBB7vylZ for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:14:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D262C400E9
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:14:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 769C882941; Sun,  9 Jan 2022 11:07:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 12:13:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36e8743da181420775b79d5be9bbe872b00f2c01
X-Git-Newrev: e5ead094e18cd4a5a9a22b69a42e687f43ee8a8b
X-Patchwork-Hint: ignore
Message-Id: <20220109110756.769C882941@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests: switch
 python-cryptography related tests to glibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5ead094e18cd4a5a9a22b69a42e687f43ee8a8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In a follow-up commit, we are about to bump python-cryptography to a
new version, which has the interesting charateristic of using Rust
code. This means python-cryptography will now only be available on
platforms supported by Rust, which for now excludes uclibc-based
configurations (none of the Rust Tier1/Tier2 platforms use uClibc,
there is some uClibc support in Tier3 platforms but they have not been
added to Buildroot for now).

So in preparation for this bump, we switch the few test cases of
Python packages that directly or indirectly use python-cryptography to
use a glibc toolchain. Another impacted test case is the
docker-compose test case, but it already uses a glibc toolchain;

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_python_autobahn.py         | 10 +++++++++-
 support/testing/tests/package/test_python_crossbar.py         | 10 +++++++++-
 support/testing/tests/package/test_python_cryptography.py     | 10 +++++++++-
 support/testing/tests/package/test_python_service_identity.py | 10 +++++++++-
 support/testing/tests/package/test_python_treq.py             | 10 +++++++++-
 support/testing/tests/package/test_python_txtorcon.py         | 10 +++++++++-
 6 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_python_autobahn.py b/support/testing/tests/package/test_python_autobahn.py
index a237ce465d..6c1678a615 100644
--- a/support/testing/tests/package/test_python_autobahn.py
+++ b/support/testing/tests/package/test_python_autobahn.py
@@ -3,9 +3,17 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Autobahn(TestPythonPackageBase):
     __test__ = True
-    config = TestPythonPackageBase.config + \
+    # Need to use a different toolchain than the default due to
+    # python-cryptography using Rust (not available with uclibc)
+    config = \
         """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_AUTOBAHN=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
         """
     sample_scripts = ["tests/package/sample_python_autobahn.py"]
diff --git a/support/testing/tests/package/test_python_crossbar.py b/support/testing/tests/package/test_python_crossbar.py
index d7843ddd8b..83649aeec2 100644
--- a/support/testing/tests/package/test_python_crossbar.py
+++ b/support/testing/tests/package/test_python_crossbar.py
@@ -3,10 +3,18 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Crossbar(TestPythonPackageBase):
     __test__ = True
-    config = TestPythonPackageBase.config + \
+    # Need to use a different toolchain than the default due to
+    # python-cryptography using Rust (not available with uclibc)
+    config = \
         """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_CROSSBAR=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
         """
     sample_scripts = ["tests/package/sample_python_crossbar.py"]
     timeout = 60
diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
index 62f0ca0def..bf11c02e5c 100644
--- a/support/testing/tests/package/test_python_cryptography.py
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -3,10 +3,18 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Cryptography(TestPythonPackageBase):
     __test__ = True
-    config = TestPythonPackageBase.config + \
+    # Need to use a different toolchain than the default due to
+    # python-cryptography using Rust (not available with uclibc)
+    config = \
         """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
         """
     sample_scripts = ["tests/package/sample_python_cryptography.py"]
     timeout = 40
diff --git a/support/testing/tests/package/test_python_service_identity.py b/support/testing/tests/package/test_python_service_identity.py
index 09cfbe0a26..dbad5f931f 100644
--- a/support/testing/tests/package/test_python_service_identity.py
+++ b/support/testing/tests/package/test_python_service_identity.py
@@ -3,10 +3,18 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3ServiceIdentity(TestPythonPackageBase):
     __test__ = True
-    config = TestPythonPackageBase.config + \
+    # Need to use a different toolchain than the default due to
+    # python-cryptography using Rust (not available with uclibc)
+    config = \
         """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_SERVICE_IDENTITY=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
         """
     sample_scripts = ["tests/package/sample_python_service_identity.py"]
     timeout = 30
diff --git a/support/testing/tests/package/test_python_treq.py b/support/testing/tests/package/test_python_treq.py
index 307c9932b2..515f1ea304 100644
--- a/support/testing/tests/package/test_python_treq.py
+++ b/support/testing/tests/package/test_python_treq.py
@@ -14,8 +14,16 @@ class TestPythonTreq(TestPythonPackageBase):
 
 class TestPythonPy3Treq(TestPythonTreq):
     __test__ = True
-    config = TestPythonTreq.config + \
+    # Need to use a different toolchain than the default due to
+    # python-cryptography using Rust (not available with uclibc)
+    config = \
         """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_TREQ=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
         """
diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
index 8e74190ee1..6f0c4ca1ed 100644
--- a/support/testing/tests/package/test_python_txtorcon.py
+++ b/support/testing/tests/package/test_python_txtorcon.py
@@ -3,10 +3,18 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Txtorcon(TestPythonPackageBase):
     __test__ = True
-    config = TestPythonPackageBase.config + \
+    # Need to use a different toolchain than the default due to
+    # python-cryptography using Rust (not available with uclibc)
+    config = \
         """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_TXTORCON=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
         """
     sample_scripts = ["tests/package/sample_python_txtorcon.py"]
     timeout = 30
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
