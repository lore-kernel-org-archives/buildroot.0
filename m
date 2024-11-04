Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161F4D1CA01
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 22:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D500560787;
	Mon,  4 Nov 2024 22:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGsZ8JuNXDqf; Mon,  4 Nov 2024 22:06:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDE9D60793
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDE9D60793;
	Mon,  4 Nov 2024 22:06:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 356B2B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D5BC607A9
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-A4fhgc0Rij for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 22:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E1AB60787
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E1AB60787
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:06:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AA4385D04; Mon,  4 Nov 2024 22:06:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 23:03:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fcf3a1bbe71c191d8fa46ab10a59a41d6b5ea47
X-Git-Newrev: 6ced53de5f835fa539838871e43b4f54bec0a627
X-Patchwork-Hint: ignore
Message-Id: <20241104220651.3AA4385D04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: disable tests using edk2
 on aarch64 architecture
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ced53de5f835fa539838871e43b4f54bec0a627
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

EDK2 version edk2-stable202405 (not yet in Buildroot) has dependencies
on specific Qemu version.

Buildroot guidelines also recommend that "each patch must be complete".
See: [1]. This means, a patch in a series is not allowed to break
something knowingly, even in the same patch series. This rule is
mainly for using git bisect.

We also want to avoid bumping EDK2, update the runtime test infra,
and few tests in a big single commit, for readability. This would mix
too many changes in the same commit.

As a trade off, this commit disables the runtime tests which are known
to be broken by the upcoming edk2 update. Then, those tests will be
individually fixed and re-enabled in followup commits.

This EDK2/Qemu incompatibility only affects runtime tests using EDK2
on the Arm Aarch64 architecture. This commit disable the runtime
tests by adding a "skipTest()" call in:
- tests.boot.test_edk2
- tests.boot.test_grub.TestGrubAArch64EFI
- tests.package.test_fwts

[1] https://buildroot.org/downloads/manual/manual.html#submitting-patches

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/boot/test_edk2.py    | 4 ++++
 support/testing/tests/boot/test_grub.py    | 4 ++++
 support/testing/tests/package/test_fwts.py | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 16fa10f8c9..7d350f52d9 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -33,6 +33,10 @@ class TestEdk2(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_MTOOLS=y
         """
 
+    def setUp(self):
+        self.skipTest("Incompatible QEmu 5.2.0 (Docker image) / "
+                      "EDK2 (stable202405) versions.")
+
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         flash0 = os.path.join(self.builddir, "images", "SBSA_FLASH0.fd")
diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 5315fa23ba..41234de2b9 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -156,6 +156,10 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
         """.format(post_image=infra.filepath("tests/boot/test_grub/post-image-aarch64-efi.sh"),
                    linux_fragment=infra.filepath("tests/boot/test_grub/linux-aarch64-efi.config"))
 
+    def setUp(self):
+        self.skipTest("Incompatible QEmu 5.2.0 (Docker image) / "
+                      "EDK2 (stable202405) versions.")
+
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "QEMU_EFI.fd")
diff --git a/support/testing/tests/package/test_fwts.py b/support/testing/tests/package/test_fwts.py
index ef792136c2..2c9873ee54 100644
--- a/support/testing/tests/package/test_fwts.py
+++ b/support/testing/tests/package/test_fwts.py
@@ -36,6 +36,10 @@ class TestFwts(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_MTOOLS=y
         """
 
+    def setUp(self):
+        self.skipTest("Incompatible QEmu 5.2.0 (Docker image) / "
+                      "EDK2 (stable202405) versions.")
+
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         flash0 = os.path.join(self.builddir, "images", "SBSA_FLASH0.fd")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
