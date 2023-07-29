Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33100C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 09:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1BA041521;
	Sat, 29 Jul 2023 09:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1BA041521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLJLQmE5cYo0; Sat, 29 Jul 2023 09:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 892B041999;
	Sat, 29 Jul 2023 09:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 892B041999
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 284961BF3FC
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C9D541999
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C9D541999
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q6x5tokODOKg for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 09:01:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EAF941521
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 09:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EAF941521
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DBA883798; Sat, 29 Jul 2023 09:01:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 11:00:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d6f966f9ad012879bb472896eb35eeda5baa9ab
X-Git-Newrev: d0e2e420c9cc4f05f7c8c0ca5bfb09fa5263bb69
X-Patchwork-Hint: ignore
Message-Id: <20230729090110.8DBA883798@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: override the EDK2 CPU
 hotplug bug check
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0e2e420c9cc4f05f7c8c0ca5bfb09fa5263bb69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
(requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)

The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.

https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186190 (TestGrubX8664EFI)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186198 (TestGrubi386EFI)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186306 (TestIso9660Grub2EFI)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186317 (TestIso9660Grub2Hybrid)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/boot/test_grub.py  | 20 ++++++++++++++++++--
 support/testing/tests/fs/test_iso9660.py | 11 ++++++++++-
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 2c393f730e..9f3a6a8495 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -61,7 +61,15 @@ class TestGrubi386EFI(infra.basetest.BRTest):
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "OVMF.fd")
-        self.emulator.boot(arch="i386", options=["-bios", bios, "-hda", hda])
+        # In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
+        # EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
+        # (requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)
+        # The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
+        # can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.
+        # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
+        # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
+        qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
+        self.emulator.boot(arch="i386", options=["-bios", bios, "-hda", hda, "-fw_cfg", qemu_fw_cfg])
         self.emulator.login()
 
         cmd = "modprobe efivarfs"
@@ -104,7 +112,15 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "OVMF.fd")
-        self.emulator.boot(arch="x86_64", options=["-bios", bios, "-hda", hda])
+        # In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
+        # EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
+        # (requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)
+        # The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
+        # can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.
+        # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
+        # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
+        qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
+        self.emulator.boot(arch="x86_64", options=["-bios", bios, "-hda", hda, "-fw_cfg", qemu_fw_cfg])
         self.emulator.login()
 
         cmd = "modprobe efivarfs"
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 692291267e..3d08f2e895 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -29,7 +29,16 @@ def test_mount_internal_external(emulator, builddir, internal=True, efi=False):
     img = os.path.join(builddir, "images", "rootfs.iso9660")
     if efi:
         efi_img = os.path.join(builddir, "images", "OVMF.fd")
-        emulator.boot(arch="i386", options=["-cdrom", img, "-bios", efi_img])
+        # In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
+        # EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
+        # (requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)
+        # The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
+        # can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.
+        # This workaround is needed only when efi=True since it imply EDK2 is used.
+        # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
+        # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
+        qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
+        emulator.boot(arch="i386", options=["-cdrom", img, "-bios", efi_img, "-fw_cfg", qemu_fw_cfg])
     else:
         emulator.boot(arch="i386", options=["-cdrom", img])
     emulator.login()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
