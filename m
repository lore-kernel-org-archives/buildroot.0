Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D426C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 19:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0EBC82D0F;
	Tue,  6 Feb 2024 19:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4wgfS5xmGXC; Tue,  6 Feb 2024 19:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C311B831CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C311B831CA;
	Tue,  6 Feb 2024 19:52:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 153D71BF409
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 025A3831CA
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofHbOhtvw6Fc for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 19:52:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 075E482D0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 075E482D0F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 075E482D0F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 19:52:47 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5760313F899;
 Tue,  6 Feb 2024 20:52:43 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 20:52:37 +0100
Message-ID: <20240206195237.55252-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707249164;
 bh=gOpSxUJNaeM8uKMQWuNac2pVIgV+YXv8kAmz6aFDPio=;
 h=From:To:Cc:Subject:Date:From;
 b=cTGVnGwRRb4BhO0AJP3j52XAmw9mwOEsxGagZqO8oKxDUjevoj/6aO+L4WWbVRzzt
 sYSpeIKp/ee1n5c0GsYUoWEpkkKb8gMAX4WHXVKUdzWRLxirbBBPNFj4IeCxLKjGz1
 rPS1e9rzlyuNbZWDd080CNbzNSpd4RtIENN80KKJQqWSkpNMA9z6zyNIkwaTZ0HIJZ
 Tn2ADoSqA0FHWq70f+P4MUAKfXI7gDoPIVgA/h476twO5GSNSCFmOw60XBS4hYp3qo
 hzI0XAfo/RrJyRaRUemBTr/cY9Hq5S1RHB7j1fcoSyJZkvzQzTyDSFI9z1lvS9vLIs
 293IZZbbPYukA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cTGVnGwR
Subject: [Buildroot] [PATCH 1/1] support/testing: new acl runtime test
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
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_acl.py | 87 +++++++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 support/testing/tests/package/test_acl.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 4b8d195f9f..ce248e8706 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1762,6 +1762,7 @@ F:	support/testing/tests/package/sample_python_midiutil.py
 F:	support/testing/tests/package/sample_python_ml_dtypes.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
+F:	support/testing/tests/package/test_acl.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_apache.py
diff --git a/support/testing/tests/package/test_acl.py b/support/testing/tests/package/test_acl.py
new file mode 100644
index 0000000000..e4827c7bec
--- /dev/null
+++ b/support/testing/tests/package/test_acl.py
@@ -0,0 +1,87 @@
+import os
+
+import infra.basetest
+
+
+class TestAcl(infra.basetest.BRTest):
+    # Note: this test requires a Kernel with a filesystem on /tmp
+    # supporting ACLs. This is the case for the basetest reference
+    # config. Kernel has CONFIG_TMPFS_POSIX_ACL=y, and /tmp is tmpfs
+    # in the default Buildroot config.
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_ACL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the programs can execute.
+        self.assertRunOk("getfacl --version")
+        self.assertRunOk("setfacl --version")
+
+        # Constants used in this test.
+        test_user = "acltest"
+        test_data = "Hello Buildroot!"
+        test_file = "/tmp/file.txt"
+
+        # Create a test user:
+        # -D    don't set a password
+        # -h    set home directory
+        # -H    don't create home directory
+        # -s    set shell to /bin/sh
+        self.assertRunOk(f"adduser -D -h /tmp -H -s /bin/sh {test_user}")
+
+        # Create a test file, and make sure the owner is "root" with
+        # standard Unix permissions to read/write only for the owner.
+        self.assertRunOk(f"echo '{test_data}' > {test_file}")
+        self.assertRunOk(f"chown root:root {test_file}")
+        self.assertRunOk(f"chmod 0600 {test_file}")
+
+        # Check we have no ACL for the test user.
+        getacl_cmd = f"getfacl -c -p {test_file}"
+        out, ret = self.emulator.run(getacl_cmd)
+        self.assertEqual(ret, 0)
+        self.assertNotIn(f"user:{test_user}:", "\n".join(out))
+
+        # Reading the file as the test user is expected to fail.
+        test_read_cmd = f"su - {test_user} -c 'cat {test_file}'"
+        _, ret = self.emulator.run(test_read_cmd)
+        self.assertNotEqual(ret, 0)
+
+        # We add a special read ACL for the test user.
+        cmd = f"setfacl -m u:{test_user}:r {test_file}"
+        self.assertRunOk(cmd)
+
+        # Check we now have an ACL entry for the test user.
+        out, ret = self.emulator.run(getacl_cmd)
+        self.assertEqual(ret, 0)
+        self.assertIn(f"user:{test_user}:", "\n".join(out))
+
+        # Reading the file as the test user is now expected to
+        # succeed.
+        out, ret = self.emulator.run(test_read_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], test_data)
+
+        # Attempting to write to the file as the test user is expected
+        # to fail (since we put an ACL only for reading).
+        cmd = f"su - {test_user} -c 'echo WriteTest > {test_file}'"
+        _, ret = self.emulator.run(cmd)
+        self.assertNotEqual(ret, 0)
+
+        # Remove all ACLs. This could have been done with the command
+        # "setfacl -b". Instead, we use the "chacl -B" command which
+        # is doing the same. The reason is to slightly improve the
+        # coverage of this test, by including an execution of "chacl".
+        self.assertRunOk(f"chacl -B {test_file}")
+
+        # Reading the file as the test user is expected to fail again.
+        _, ret = self.emulator.run(test_read_cmd)
+        self.assertNotEqual(ret, 0)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
