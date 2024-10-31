Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5F0E67487
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 21:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CEB1605DB;
	Thu, 31 Oct 2024 21:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZgmyuJia5IE; Thu, 31 Oct 2024 21:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D87F960650
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D87F960650;
	Thu, 31 Oct 2024 21:34:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EB9745E46
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D966E401AD
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbNtUcwsU-EB for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 21:34:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8DD98400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DD98400D7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DD98400D7
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:37 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 22568B0051E;
 Thu, 31 Oct 2024 22:34:30 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Romain Naour <romain.naour@gmail.com>
Date: Thu, 31 Oct 2024 22:33:42 +0100
Message-ID: <20241031213348.2057705-3-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031213348.2057705-1-ju.o@free.fr>
References: <20241031213348.2057705-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730410475;
 bh=vt1S06ZEbpxHlYaiANw4wRrR0otqY5oWxaiIWNrSHjo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UBKd5qKMwJpFMEMfcPsGH+pj+Iq2B6w4KR5xg+hWhJKi27wHTIfhlp3r1VcFn8J2C
 fkT1ak+1APfrEkoZaEHVCunMFXxbM0GASe+yiDZ1BzjZHXA0/C1WwIW8pJVCD9zIy5
 NKsOlhSNXTAsIAY9MffxYpObJxYuFXPA/4GLt/gpleDcWnUZZ0Uum5mfjdsDRw6YqM
 jNZcfVz6L5hzQmBIp41/Vw1x6o4LF8CAeCt+eLqaKumw/lASF7H3AffshGmFuUcOM4
 gvPM5gGTesVFVcHSq7xAd3zDAQHGJHgUHOe4bZOSQRGoch5IGaI3ERbdSS/ZoEkZ+S
 SdCavBljWbR0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UBKd5qKM
Subject: [Buildroot] [PATCH v3 2/8] support/testing: disable tests using
 edk2 on aarch64 architecture
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
