Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF52C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ABBE60B2A;
	Sat, 13 Jan 2024 20:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ABBE60B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73KfEKBPfFHN; Sat, 13 Jan 2024 20:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C43BF607D6;
	Sat, 13 Jan 2024 20:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C43BF607D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B3CE1BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D53B607D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D53B607D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 18z91-6OsFu4 for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:48:35 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 742F3607B5
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 742F3607B5
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 030C313F879;
 Sat, 13 Jan 2024 21:48:30 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:48:24 +0100
Message-ID: <20240113204824.212604-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705178912;
 bh=u0Hx8N0ekjZsg4SNkb0oEEed88Ab9pZAp3La3r18QvI=;
 h=From:To:Cc:Subject:Date:From;
 b=Imwcth6l6qVXsYxKo65jCbx37Fc/b+FxTipZDdh21FEx54/FAiYwMdG0SbC9DS3Qq
 qfJ4I6u5Q0AtKiUYsTBp+e1+P/m43lL+9Dqm7b3Ck+mF8dx9Z756T2t9yLtggx1IdM
 n0yrA0emuU7TRmGbit5xnjy+5v8u8hiILdIaF4lBHOCNS7OYKe5iAjBoLAKij7r8CE
 kDrCenSj9zoLsbQGKiyUV0LqcP8OjzXr09k3sluUPWYeZDeyubxt/7J5dKEdqAB5tg
 2xZU6ueeUimUiMZGWog9ei7EPsBcMJ9VimY+MCVvcAYVWzUhB6ix4sAKlh5vmh/nge
 V1eHlFIZyyCxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Imwcth6l
Subject: [Buildroot] [PATCH 1/1] support/testing: add ngrep runtime test
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
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_ngrep.py | 49 +++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 support/testing/tests/package/test_ngrep.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 94a89c63d5..33ad5b3097 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1793,6 +1793,7 @@ F:	support/testing/tests/package/test_mtools.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
+F:	support/testing/tests/package/test_ngrep.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
diff --git a/support/testing/tests/package/test_ngrep.py b/support/testing/tests/package/test_ngrep.py
new file mode 100644
index 0000000000..29aaa55c2c
--- /dev/null
+++ b/support/testing/tests/package/test_ngrep.py
@@ -0,0 +1,49 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestNgrep(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_NETCAT=y
+        BR2_PACKAGE_NGREP=y
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
+        port = 12345
+        msg = 'Hello Buildroot'
+
+        # Check the program can execute.
+        self.assertRunOk("ngrep -V")
+
+        # Start a netcat server in background accepting connections
+        cmd = f"nc -l -p {port} >/dev/null </dev/null &"
+        self.assertRunOk(cmd)
+
+        time.sleep(1)
+
+        # Start a netcat client in background, sending one message
+        # every seconds
+        cmd = "( while true ; do "
+        cmd += f"echo '{msg}'; "
+        cmd += "sleep 1 ; "
+        cmd += "done) | "
+        cmd += f"nc 127.0.0.1 {port} &"
+        self.assertRunOk(cmd)
+
+        time.sleep(1)
+
+        # Capture 3 packets with the message.
+        cmd = f"ngrep -n 3 '{msg}'"
+        self.assertRunOk(cmd)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
