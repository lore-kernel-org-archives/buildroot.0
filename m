Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2667AD13587
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 21:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A62F606F2;
	Sun, 27 Oct 2024 21:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FoGODcNZaUiH; Sun, 27 Oct 2024 21:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AD686080B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AD686080B;
	Sun, 27 Oct 2024 21:27:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A9F1112A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 21:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73528401B5
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 21:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yw9JJuEId_vR for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 21:27:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D84B04017C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D84B04017C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D84B04017C
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 21:27:41 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 48581B00592;
 Sun, 27 Oct 2024 22:27:37 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 27 Oct 2024 22:27:32 +0100
Message-ID: <20241027212732.3337953-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730064458;
 bh=/btBo/LVx2PdNrrdM65EP8UuUnPk0lO8p8UUx6DDOUc=;
 h=From:To:Cc:Subject:Date:From;
 b=HfO2sF+w1405bMBH5HFVD/YJwilt3Ybb+HziwOnwQKtQW8KwuzXsPJt1vcdtGKJNx
 FML5Rb4uW/YomXqJZ4rA8ZH2WCYDggrJ1ZM71bJgX2F60AKjgwuaRTgD8k2lFV6wGt
 vBOfHXDGpiABAasZG9EUHWxccHD6uB0+2IlgBlB9zxgWNitpnCncORUCxAmzxelhS7
 5HkK/0cT7a7jAy4Ffs5fXVlWybIby26+iTVLt0uX/YoT6e6KNRlgLgYzzn30ShTqxR
 YJ9xK6Ulc5+HY/bKaI+b51vahr7q4EWFWopstnA8crdWaNS8x7w5QkWbZVgAx8E3tn
 M38zQbilTFXvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HfO2sF+w
Subject: [Buildroot] [PATCH 1/1] support/testing: add audit runtime test
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

This test was suggested by Thomas, in:
https://lists.buildroot.org/pipermail/buildroot/2024-October/766091.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8199781301

Note: this test was requested during a patch review for a bump to
audit 4.0.2 which is not merged yet. This patch was written and
tested with audit 3.1.2 (the current version). Some adjustments
might be needed with newer audit versions.
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_audit.py | 91 +++++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 support/testing/tests/package/test_audit.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 8ad5540dc9..93576c7d97 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1853,6 +1853,7 @@ F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_apache.py
 F:	support/testing/tests/package/test_attr.py
 F:	support/testing/tests/package/test_audio_codec_base.py
+F:	support/testing/tests/package/test_audit.py
 F:	support/testing/tests/package/test_bc.py
 F:	support/testing/tests/package/test_bcc.py
 F:	support/testing/tests/package/test_bcc/
diff --git a/support/testing/tests/package/test_audit.py b/support/testing/tests/package/test_audit.py
new file mode 100644
index 0000000000..f68a4b6831
--- /dev/null
+++ b/support/testing/tests/package/test_audit.py
@@ -0,0 +1,91 @@
+import os
+
+import infra.basetest
+
+
+class TestAudit(infra.basetest.BRTest):
+    # This test needs a Kernel with the audit support (the builtin
+    # test Kernel does not have this support). Since the audit support
+    # enabled by default, a kernel fragment is not required.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.58"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_AUDIT=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        # We check the program can run by showing its version. This
+        # invocation also checks the Kernel has the audit support
+        # enabled.
+        self.assertRunOk("auditctl -v")
+
+        # We define a normal user name for this test.
+        user = "audit-test"
+
+        # Audit rule inspired from auditctl manual page examples.
+
+        # We add an audit rule logging write access on the
+        # system password file.
+        cmd = "auditctl -a always,exit -F path=/etc/shadow -F perm=wa"
+        self.assertRunOk(cmd)
+
+        # We do a read-only access on this file, as the root user.
+        self.assertRunOk("cat /etc/shadow")
+
+        # We check our previous read-only access did NOT generated an
+        # event record.
+        ausearch_cmd = "ausearch --format text"
+        out, ret = self.emulator.run(ausearch_cmd)
+        self.assertEqual(ret, 0)
+        open_shadow_str = "acting as root, successfully opened-file /etc/shadow"
+        self.assertNotIn(open_shadow_str, "\n".join(out))
+
+        # We create a normal user. This will modify the shadow password file.
+        cmd = f"adduser -D -h /tmp -H -s /bin/sh {user}"
+        self.assertRunOk(cmd)
+
+        # We are now expecting an event record of this modification.
+        out, ret = self.emulator.run(ausearch_cmd)
+        self.assertEqual(ret, 0)
+        self.assertIn(open_shadow_str, "\n".join(out))
+
+        # We add a new audit rule, recording failed open of the system
+        # password file.
+        cmd = "auditctl -a always,exit -S openat -F success=0 -F path=/etc/shadow"
+        self.assertRunOk(cmd)
+
+        # We attempt to read the system password file as our new
+        # normal user. This command is expected to fail (as only root
+        # can root is supposed to read this file).
+        cmd = f"su - {user} -c 'cat /etc/shadow'"
+        _, ret = self.emulator.run(cmd)
+        self.assertNotEqual(ret, 0)
+
+        # Our last failed read attempt is supposed to have generated
+        # an event. We check we can see it in the log.
+        out, ret = self.emulator.run(ausearch_cmd)
+        self.assertEqual(ret, 0)
+        evt_str = f"acting as {user}, unsuccessfully opened-file /etc/shadow"
+        self.assertIn(evt_str, "\n".join(out))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
