Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7821C4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 20:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5869D4272D;
	Sat,  9 Dec 2023 20:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5869D4272D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9sEw7xXpHfQ9; Sat,  9 Dec 2023 20:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6964F41B6A;
	Sat,  9 Dec 2023 20:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6964F41B6A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBFA21BF681
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 20:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94B0A60AEE
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 20:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94B0A60AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWkEuMd6nLIr for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 20:57:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 170BD60A74
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 20:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 170BD60A74
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F154887A7C; Sat,  9 Dec 2023 20:57:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 9 Dec 2023 21:35:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf69c8be4760abedd3f289bbef3495029a7042f4
X-Git-Newrev: 241a8b0615ac35951aa6255593d853daac7fd4d1
X-Patchwork-Hint: ignore
Message-Id: <20231209205707.F154887A7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: bump prebuilt kernel to
 5.10.202
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

commit: https://git.buildroot.net/buildroot/commit/?id=241a8b0615ac35951aa6255593d853daac7fd4d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported on the mailing list [1], TestPolkitSystemd and
TestPolkitInitd are failing since we bumped the Bootlin toolchain
2023.08 [2].

The issue is caused by expat (XML library) package detecting
arc4random_buf() introduced by glibc 2.36 [3].

With arc4random_buf() support enabled, expat hang Polkit while reading
its policy files (XML files) due to a lack of entropy on the system.

Upgrading the kernel allows to avoid such issue thanks to
random_get_entropy_fallback() introduced in 5.10.119 (backpored) [4].

Build the vexpress-v2p-ca9 (armv7) 5.10.202 using the kernel
configuration file found in /proc/config.gz but with additional kernel
options provided by SYSTEMD_LINUX_CONFIG_FIXUPS. Indeed some kernel
options requested by systemd were missing in 5.10.7 kernel.

Build the versatile-pb (armv5) kernel using the same kernel
configuration as qemu_arm_versatile_defconfig but with additional
kernel options like for vexpress-v2p-ca9. While at it, enable
IKCONFIG_PROC option to provide the kernel configuration at runtime
in /proc/config.gz.

Runtime tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/1097887826 (tests.package.test_polkit.TestPolkit*)
https://gitlab.com/kubu93/buildroot/-/pipelines/1097705399 (tests.init.*)

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/5689309948 (TestPolkitSystemd)
https://gitlab.com/buildroot.org/buildroot/-/jobs/5689309947 (TestPolkitInitd)

[1] http://lists.busybox.net/pipermail/buildroot/2023-December/680445.html
[2] 452365a385ef35e808eb2eb669d1e3227c7399dd
[3] https://sourceware.org/git/?p=glibc.git;a=commit;h=6f4e0fcfa2d2b0915816a3a3a1d48b4763a7dee2
[4] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=fdca775081527364621857957655207d83035376

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/infra/emulator.py | 8 ++++----
 support/testing/run-tests         | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 09f81eca89..624740fcb1 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -54,16 +54,16 @@ class Emulator(object):
 
                 if arch == "armv7":
                     kernel = infra.download(self.downloaddir,
-                                            "kernel-vexpress-5.10.7")
+                                            "kernel-vexpress-5.10.202")
                     dtb = infra.download(self.downloaddir,
-                                         "vexpress-v2p-ca9-5.10.7.dtb")
+                                         "vexpress-v2p-ca9-5.10.202.dtb")
                     qemu_cmd += ["-dtb", dtb]
                     qemu_cmd += ["-M", "vexpress-a9"]
                 elif arch == "armv5":
                     kernel = infra.download(self.downloaddir,
-                                            "kernel-versatile-5.10.7")
+                                            "kernel-versatile-5.10.202")
                     dtb = infra.download(self.downloaddir,
-                                         "versatile-pb-5.10.7.dtb")
+                                         "versatile-pb-5.10.202.dtb")
                     qemu_cmd += ["-dtb", dtb]
                     qemu_cmd += ["-M", "versatilepb"]
                     qemu_cmd += ["-device", "virtio-rng-pci"]
diff --git a/support/testing/run-tests b/support/testing/run-tests
index e8c540f370..485811b746 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -65,10 +65,10 @@ def main():
     BRConfigTest.downloaddir = os.path.abspath(args.download)
 
     if args.prepare_only:
-        emulator_builtin_binaries = ["kernel-vexpress-5.10.7",
-                                     "vexpress-v2p-ca9-5.10.7.dtb",
-                                     "kernel-versatile-5.10.7",
-                                     "versatile-pb-5.10.7.dtb"]
+        emulator_builtin_binaries = ["kernel-vexpress-5.10.202",
+                                     "vexpress-v2p-ca9-5.10.202.dtb",
+                                     "kernel-versatile-5.10.202",
+                                     "versatile-pb-5.10.202.dtb"]
         print("Downloading emulator builtin binaries")
         for binary in emulator_builtin_binaries:
             infra.download(BRConfigTest.downloaddir, binary)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
