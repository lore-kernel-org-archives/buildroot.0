Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAA5C48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 20:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 763EB4267E;
	Thu,  8 Feb 2024 20:16:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9erkZHc_IFmi; Thu,  8 Feb 2024 20:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3385A424BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3385A424BF;
	Thu,  8 Feb 2024 20:16:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8686D1BF378
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 20:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80B6042E70
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 20:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6a_gnhNkTatH for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 20:16:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A0EBB42E78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0EBB42E78
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0EBB42E78
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 20:16:09 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7AD8713F8A9;
 Thu,  8 Feb 2024 21:16:05 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 21:15:59 +0100
Message-ID: <20240208201559.112223-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707423366;
 bh=ntEi8dgOrJv6Fz1nwD2WL+RbsAAPn2VoyL+adnJgT9w=;
 h=From:To:Cc:Subject:Date:From;
 b=FCPsIAW7H+xNNZ8OxA1u/d2YrduDt2PoO/i0wQP1wO2VQOsjcm/AWJnEOHQnEsAyt
 XhpSRdFuxenV7HIn/ad2B5dMXiJppzSJ5aAjUahqsR4GmbB7EyxVb0EHR8ujgfTTNW
 tJR3ps3A/F7WeMN0RjjF7nuJA+MNDS0m1T8reNwh7AvyrQD2+lA+dzIomoqAOZpEnY
 m56iHLyYZ3NE9FKlNu3uiZeIKMfUzoKJsj7xPDIvtWhLILHmrffj4ITX/0kio4ruO0
 ZoPfTiPyOFx2VNuT0FahRTOBsbWwCwTFI1w8qgW4pu2aNZ8HjMBgh3WShdPTuslqNt
 YfUwn2SR5kteg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FCPsIAW7
Subject: [Buildroot] [PATCH 1/1] support/testing: add attr runtime test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_attr.py | 75 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 support/testing/tests/package/test_attr.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c6c84b05b..635d7aedd1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1767,6 +1767,7 @@ F:	support/testing/tests/package/test_acl.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_apache.py
+F:	support/testing/tests/package/test_attr.py
 F:	support/testing/tests/package/test_bc.py
 F:	support/testing/tests/package/test_brotli.py
 F:	support/testing/tests/package/test_bzip2.py
diff --git a/support/testing/tests/package/test_attr.py b/support/testing/tests/package/test_attr.py
new file mode 100644
index 0000000000..1b43f7daf6
--- /dev/null
+++ b/support/testing/tests/package/test_attr.py
@@ -0,0 +1,75 @@
+import os
+
+
+import infra.basetest
+
+
+class TestAttr(infra.basetest.BRTest):
+    # Note: this test uses extended attributes (xattr). We use a ext4
+    # rootfs (which fully supports xattrs). Note that tmpfs has
+    # partial support of xattrs, and cpio initrd has not.
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_ATTR=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        disk_file = os.path.join(self.builddir, "images", "rootfs.ext4")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           kernel_cmdline=["rootwait", "root=/dev/sda"],
+                           options=["-drive", f"file={disk_file},if=scsi,format=raw"])
+        self.emulator.login()
+
+        # Check the programs can execute.
+        self.assertRunOk("getfattr --version")
+        self.assertRunOk("setfattr --version")
+
+        test_file = "/root/file.txt"
+        attr_name = "buildroot"
+        attr_value = "is-great"
+
+        # Create a test file.
+        self.assertRunOk(f"echo 'Hello Buildroot!' > {test_file}")
+
+        # Set an extended attribute.
+        cmd = f"setfattr -n user.{attr_name} -v {attr_value} {test_file}"
+        self.assertRunOk(cmd)
+
+        # Read back the attribute value. We add an extra "echo" to add
+        # a new line. getfattr --only-values prints raw attribute
+        # values and lack of a new line.
+        cmd = "getfattr"
+        cmd += f" -n user.{attr_name} --absolute-names --only-values"
+        cmd += f" {test_file} && echo"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], attr_value)
+
+        # We read back the attribute value again, but with the "attr"
+        # command this time.
+        cmd = f"attr -q -g {attr_name} {test_file} && echo"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], attr_value)
+
+        # List extended attributes with "attr", and check we see our
+        # test attribute.
+        cmd = f"attr -l {test_file}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertIn(attr_name, "\n".join(out))
+
+        # Remove the test attribute with setfattr.
+        cmd = f"setfattr -x user.{attr_name} {test_file}"
+        self.assertRunOk(cmd)
+
+        # We check the test attribute is no longer listed by the attr
+        # command.
+        cmd = f"attr -l {test_file}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertNotIn(attr_name, "\n".join(out))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
