Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EFCC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 12:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAC6260B29;
	Sun, 17 Jul 2022 12:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAC6260B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8KqSoqRy-6e; Sun, 17 Jul 2022 12:07:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93D5B6080A;
	Sun, 17 Jul 2022 12:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93D5B6080A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FEA01BF3D1
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 12:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E41A840190
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 12:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E41A840190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJ_o1lz3-jAO for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 12:07:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E87C8400DD
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 12:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E87C8400DD
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CEA0E83A68; Sun, 17 Jul 2022 11:54:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 14:05:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f25bbb7a758d4deee8216e25485ad113bae0f2c
X-Git-Newrev: 98ecdd1d1125f2529a8d61c01a2bec6d8dbc48d1
X-Patchwork-Hint: ignore
Message-Id: <20220717115414.CEA0E83A68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zerofree: new package
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
Content-Type: multipart/mixed; boundary="===============7801483500225703992=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7801483500225703992==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=98ecdd1d1125f2529a8d61c01a2bec6d8dbc48d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zerofree is a utility which scans the free blocks in an ext2 filesystem
and fills any non-zero blocks with zeroes.

https://frippery.org/uml/

The ext2fs/ext2fs.h header guards the inclusion of <sys/types.h> behind
HAVE_SYS_TYPES_H, which is an autotools-defined macro that is only
supposed to be defined by the package itself, i.e. e2fsprogs, and that
should not leak into installed headers. However, e2fsprogs does leak it,
so we work it around, liek gentoo does.

Tested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr:
  - fix MMU dependency for comment; reword comment
  - fix multi-line assignment of ZEROFREE_CFLAGS
  - do not add comment trailing after assignment
  - extend commit log to explain why we need the workaround
  - use TARGET_CONFIGURE_OPTS, drop explicit CC=
  - install to explicit destination file
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                     |  2 ++
 package/Config.in                              |  1 +
 package/zerofree/Config.in                     | 14 +++++++++
 package/zerofree/zerofree.hash                 |  3 ++
 package/zerofree/zerofree.mk                   | 28 ++++++++++++++++++
 support/testing/tests/package/test_zerofree.py | 41 ++++++++++++++++++++++++++
 6 files changed, 89 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 71dd7d3d6c..0fc73f311f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2917,8 +2917,10 @@ F:	configs/uevm5432_defconfig
 F:	package/i7z/
 F:	package/msr-tools/
 F:	package/pixz/
+F:	package/zerofree/
 F:	support/testing/tests/package/test_msr_tools*
 F:	support/testing/tests/package/test_pixz.py
+F:	support/testing/tests/package/test_zerofree.py
 
 N:	Vinicius Tinti <viniciustinti@gmail.com>
 F:	package/python-thrift/
diff --git a/package/Config.in b/package/Config.in
index 230aa7a2c2..3feb47c534 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -239,6 +239,7 @@ menu "Filesystem and flash utilities"
 	source "package/udftools/Config.in"
 	source "package/unionfs/Config.in"
 	source "package/xfsprogs/Config.in"
+	source "package/zerofree/Config.in"
 	source "package/zfs/Config.in"
 endmenu
 
diff --git a/package/zerofree/Config.in b/package/zerofree/Config.in
new file mode 100644
index 0000000000..99466d6bae
--- /dev/null
+++ b/package/zerofree/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_ZEROFREE
+	bool "zerofree"
+	depends on BR2_USE_MMU # e2fsprogs
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_E2FSPROGS
+	help
+	  zerofree is a utility which scans the free blocks in an ext2
+	  filesystem and fills any non-zero blocks with zeroes.
+
+	  https://frippery.org/uml/
+
+comment "zerofree needs  a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
diff --git a/package/zerofree/zerofree.hash b/package/zerofree/zerofree.hash
new file mode 100644
index 0000000000..3399611787
--- /dev/null
+++ b/package/zerofree/zerofree.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  956bc861b55ba0a2b7593c58d32339dab1a0e7da6ea2b813d27c80f08b723867  zerofree-1.1.1.tgz
+sha256  90daae00475a992a367da5b0658469a5d1c4449dbbe964c5b7246e1aec92f491  COPYING
diff --git a/package/zerofree/zerofree.mk b/package/zerofree/zerofree.mk
new file mode 100644
index 0000000000..f26280cc2a
--- /dev/null
+++ b/package/zerofree/zerofree.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# zerofree
+#
+################################################################################
+
+ZEROFREE_VERSION = 1.1.1
+ZEROFREE_SOURCE = zerofree-$(ZEROFREE_VERSION).tgz
+ZEROFREE_SITE = https://frippery.org/uml
+ZEROFREE_LICENSE = GPL-2.0
+ZEROFREE_LICENSE_FILE = COPYING
+ZEROFREE_DEPENDENCIES = e2fsprogs
+
+# We use the same workaround as in https://bugs.gentoo.org/716136
+# to build with musl.
+ZEROFREE_CFLAGS = \
+	$(TARGET_CFLAGS) \
+	$(if $(BR2_TOOLCHAIN_USES_MUSL),-DHAVE_SYS_TYPES_H)
+
+define ZEROFREE_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(ZEROFREE_CFLAGS)" -C $(@D)
+endef
+
+define ZEROFREE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/zerofree $(TARGET_DIR)/usr/bin/zerofree
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_zerofree.py b/support/testing/tests/package/test_zerofree.py
new file mode 100644
index 0000000000..75eea346d3
--- /dev/null
+++ b/support/testing/tests/package/test_zerofree.py
@@ -0,0 +1,41 @@
+import os
+import infra.basetest
+import subprocess
+
+
+class TestZerofree(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_ZEROFREE=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        # Prepare disk image.
+        # We keep it small (8 MB) for the sake of test time.
+        disk_file = os.path.join(self.outputdir, "disk.img")
+        subprocess.check_call(
+            ["dd", "if=/dev/zero", f"of={disk_file}", "bs=1M", "count=8"],
+            stdout=self.emulator.logfile,
+            stderr=self.emulator.logfile)
+
+        # Run the emulator with a drive.
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=[
+                                "-initrd", cpio_file,
+                                "-drive", f"file={disk_file},format=raw"])
+        self.emulator.login()
+
+        # Prepare filesystem.
+        output, exit_code = self.emulator.run("mkfs.ext4 /dev/sda")
+        self.assertEqual(exit_code, 0)
+        self.assertIn('Creating filesystem', output[2])
+
+        # Run zerofree on newly created filesystem.
+        cmd = "zerofree -v /dev/sda"
+        output, exit_code = self.emulator.run(cmd, timeout=60)
+        self.assertEqual(exit_code, 0)
+        self.assertIn('/8192', output[-1])  # total number of blocks

--===============7801483500225703992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7801483500225703992==--
