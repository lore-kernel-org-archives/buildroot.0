Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA6DD5D695
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 23:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E4084095;
	Thu,  7 Nov 2024 23:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 477BJnUIlB6i; Thu,  7 Nov 2024 23:11:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 462F98410C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 462F98410C;
	Thu,  7 Nov 2024 23:11:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25C92C1
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 23:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1128C416F4
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 23:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m85F2Sv3PY9C for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 23:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3492640280
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3492640280
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 23:11:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BFB585D3C; Thu,  7 Nov 2024 23:11:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 7 Nov 2024 21:08:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 580d899382e28beb518d697315e9364c4dfd73d3
X-Git-Newrev: 47fc9e5509837260310cd7e41335fade29b587b1
X-Patchwork-Hint: ignore
Message-Id: <20241107231139.1BFB585D3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/{test_edk2, test_grub,
 test_iso9660, test_fwts}: fix edk2 download
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47fc9e5509837260310cd7e41335fade29b587b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All EDK2 releases <= edk2-stable202408 can't be fetched from git
anymore due to a missing git submodule as reported by [1].

Usually Buildroot fall-back using https://sources.buildroot.net thanks
to BR2_BACKUP_SITE where a backup of the generated archive is
available. But the BRConfigTest remove BR2_BACKUP_SITE default value
while generating the .config used by runtime tests. See [2].

Replace the BR2_BACKUP_SITE override from BRConfigTest in order to
continue testing EDK2 package using the usual backup site.

This workaround needs to be removed with the next EDK2 version bump
using this commit [3].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995977 (TestGrubX8664EFI)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995962 (TestGrubi386EFI)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995455 (TestFwts)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995427 (TestIso9660Grub2Hybrid)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995416 (TestIso9660Grub2EFI)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8258992621 (TestEdk2)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8258990697 (TestGrubAArch64EFI)

[1] https://github.com/tianocore/edk2/issues/6398
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/559bb33ae71dd2358ca2314ccb24b56cc3809fc1
[3] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Julien: insert link to [2] in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/boot/test_edk2.py    | 22 ++++++++++
 support/testing/tests/boot/test_grub.py    | 66 ++++++++++++++++++++++++++++++
 support/testing/tests/fs/test_iso9660.py   | 44 ++++++++++++++++++++
 support/testing/tests/package/test_fwts.py | 22 ++++++++++
 4 files changed, 154 insertions(+)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index e6b7855284..39d7a4dbcc 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -35,6 +35,28 @@ class TestEdk2(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
         """
 
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestEdk2, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestEdk2.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         flash0 = os.path.join(self.builddir, "images", "SBSA_FLASH0.fd")
diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index c753a16c34..c6e86f7b71 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -58,6 +58,28 @@ class TestGrubi386EFI(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_DOSFSTOOLS=y
         """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
 
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestGrubi386EFI, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestGrubi386EFI.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "OVMF.fd")
@@ -109,6 +131,28 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_DOSFSTOOLS=y
         """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
 
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestGrubX8664EFI, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestGrubX8664EFI.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "OVMF.fd")
@@ -158,6 +202,28 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
         """.format(post_image=infra.filepath("tests/boot/test_grub/post-image-aarch64-efi.sh"),
                    linux_fragment=infra.filepath("tests/boot/test_grub/linux-aarch64-efi.config"))
 
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestGrubAArch64EFI, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestGrubAArch64EFI.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "QEMU_EFI.fd")
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 3d08f2e895..6f8ca06de3 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -135,6 +135,28 @@ class TestIso9660Grub2EFI(infra.basetest.BRTest):
         """.format(infra.filepath("conf/grub2-efi.cfg"),
                    infra.filepath("conf/grub2.cfg"))
 
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestIso9660Grub2EFI, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestIso9660Grub2EFI.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
     def test_run(self):
         exit_code = test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=True,
@@ -163,6 +185,28 @@ class TestIso9660Grub2Hybrid(infra.basetest.BRTest):
         """.format(infra.filepath("conf/grub2-efi.cfg"),
                    infra.filepath("conf/grub2.cfg"))
 
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestIso9660Grub2Hybrid, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestIso9660Grub2Hybrid.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
     def test_run(self):
         exit_code = test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=True,
diff --git a/support/testing/tests/package/test_fwts.py b/support/testing/tests/package/test_fwts.py
index 5b79a17e33..6e2b6f50ba 100644
--- a/support/testing/tests/package/test_fwts.py
+++ b/support/testing/tests/package/test_fwts.py
@@ -38,6 +38,28 @@ class TestFwts(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
         """
 
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestFwts, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestFwts.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         flash0 = os.path.join(self.builddir, "images", "SBSA_FLASH0.fd")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
