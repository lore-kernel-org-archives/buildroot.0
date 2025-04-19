Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171FAC369CA
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 16:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB0F440398;
	Sat, 19 Apr 2025 16:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id so5Va1hcTbOy; Sat, 19 Apr 2025 16:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6552403A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6552403A5;
	Sat, 19 Apr 2025 16:37:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B55A22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4126180CB9
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dj0J3FuxyOjD for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 16:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7755180BA5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7755180BA5
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:37:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66E9685C6A; Sat, 19 Apr 2025 16:37:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 18:37:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e125357ddd2d8e8e23d120367bbdee7dd204b1c
X-Git-Newrev: 4f7e3f0bdd9200303f5dfc717d9dc45e8c1875d3
X-Patchwork-Hint: ignore
Message-Id: <20250419163752.66E9685C6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_edk2: add a few
 build tests
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
Content-Type: multipart/mixed; boundary="===============0203111181868029929=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0203111181868029929==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4f7e3f0bdd9200303f5dfc717d9dc45e8c1875d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some EDK II configurations have complex dependencies on several packages
and additional build options; build tests help keeping track of those
more easily.

Factorize some code common to all the build tests into a new
TestEdk2BuildBase class, which defines a base configuration and a method
to assert that binaries do indeed exist after the build.

While at it, add myself in DEVELOPERS.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                              |   1 +
 support/testing/tests/boot/test_edk2.py | 101 ++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5ac9a477ec..3a2797d7ec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3351,6 +3351,7 @@ F:	configs/qemu_aarch64_ebbr_defconfig
 F:	configs/qemu_arm_ebbr_defconfig
 F:	configs/rockpro64_ebbr_defconfig
 F:	package/edk2-non-osi/
+F:	support/testing/tests/boot/test_edk2.py
 
 N:	Vincent Stehlé <vincent.stehle@laposte.net>
 F:	board/arm/foundation-v8/
diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 90583b56fe..4e0942b3a4 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -48,3 +48,104 @@ class TestEdk2(infra.basetest.BRTest):
                                     "-pflash", flash1,
                                     "-hda", hda])
         self.emulator.login()
+
+
+class TestEdk2BuildBase(infra.basetest.BRTest):
+    """A class to test the build of various edk2 platforms."""
+    base_config = \
+        """
+        # BR2_PACKAGE_BUSYBOX is not set
+        # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_INIT_NONE=y
+        BR2_SYSTEM_BIN_SH_NONE=y
+        BR2_TARGET_EDK2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        """
+
+    def assertBinariesExist(self, *binaries: str) -> None:
+        """Assert that the binaries passed as argument exist
+        under the images folder.
+        We print a message to the emulator logfile for each binary found.
+        """
+        for binary in binaries:
+            binpath = os.path.join(self.builddir, "images", binary)
+            self.assertTrue(os.path.exists(binpath), f"Missing {binpath}!")
+            print(f"{binary} exists: {binpath}", file=self.emulator.logfile,
+                  flush=True)
+
+
+class TestEdk2BuildArmVirtQemu(TestEdk2BuildBase):
+    config = TestEdk2BuildBase.base_config + \
+        """
+        BR2_aarch64=y
+        BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU=y
+        """
+
+    def test_run(self) -> None:
+        self.assertBinariesExist("QEMU_EFI.fd", "QEMU_VARS.fd")
+
+
+class TestEdk2BuildArmVirtQemuKernel(TestEdk2BuildBase):
+    config = TestEdk2BuildBase.base_config + \
+        """
+        BR2_aarch64=y
+        BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL=y
+        """
+
+    def test_run(self) -> None:
+        self.assertBinariesExist("QEMU_EFI.fd", "QEMU_VARS.fd")
+
+
+class TestEdk2BuildArmSgi575(TestEdk2BuildBase):
+    config = TestEdk2BuildBase.base_config + \
+        """
+        BR2_aarch64=y
+        BR2_TARGET_EDK2_PLATFORM_ARM_SGI575=y
+        """
+
+    def test_run(self) -> None:
+        self.assertBinariesExist("BL33_AP_UEFI.fd")
+
+
+class TestEdk2BuildArmVexpressFvpAarch64(TestEdk2BuildBase):
+    config = TestEdk2BuildBase.base_config + \
+        """
+        BR2_aarch64=y
+        BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64=y
+        """
+
+    def test_run(self) -> None:
+        self.assertBinariesExist("FVP_AARCH64_EFI.fd")
+
+
+class TestEdk2BuildSocionextDeveloperbox(TestEdk2BuildBase):
+    config = TestEdk2BuildBase.base_config + \
+        """
+        BR2_aarch64=y
+        BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="synquacer"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="PRELOADED_BL33_BASE=0x8200000"
+        """
+
+    def test_run(self) -> None:
+        self.assertBinariesExist("SPI_NOR_IMAGE.fd", "fip.bin")
+
+
+class TestEdk2BuildQemuSbsa(TestEdk2BuildBase):
+    # This configuration is not exactly identical to the configuration built
+    # during TestEdk2, as we use the latest arm-trusted-firmware version, among
+    # other things.
+    config = TestEdk2BuildBase.base_config + \
+        """
+        BR2_aarch64=y
+        BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+        """
+
+    def test_run(self) -> None:
+        self.assertBinariesExist("SBSA_FLASH0.fd", "SBSA_FLASH1.fd", "fip.bin")

--===============0203111181868029929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0203111181868029929==--
