Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EF9EEC28C
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 21:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E08748423D;
	Mon, 23 Feb 2026 21:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUqGoGXBcaVU; Mon, 23 Feb 2026 21:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E42E837B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771883052;
	bh=x1bUCW5Jl45MmAKhONBZnW2ZSqpPRE8Ol3AM7YdSp6k=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=WisoDDld9ISmXVoA0mnJljgNDL44f+IEBuOiKXrPtwVlGUjE6PCMVap0stXi/RWG2
	 5SZsPRvvk1Nqz1clk9VjDwnNkM1SrVBJ1ufpTBg9Qgf+MOB2W2ZLvN1sodROUCGJ54
	 xctDyYs+D1i/oy7HHUDIzTpfh9zUUwxFyX6odDooJWdjqS66hLUZlODJ8Nr1rAvtsZ
	 v40HC0Gwz4BzY1zbJP6MQJNlM/OPJ7TxNAKSBfQhb3s4v7YIGZcy0mmHRP1OV5GrrH
	 Ufy62UttgXo35lcxrOe1RfrA66kKXB8UxK+2t/vCkgJpnjI/7QhDGs3kHaIXCl2zEo
	 LiuseH6OJeT7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E42E837B6;
	Mon, 23 Feb 2026 21:44:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77922237
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 21:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 692DD40AE4
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 21:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXU5u-5tF3sd for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 21:44:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC27040AC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC27040AC9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC27040AC9
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 21:44:10 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6885119F58A;
 Mon, 23 Feb 2026 22:44:07 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 23 Feb 2026 22:43:58 +0100
Message-ID: <20260223214358.858432-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771883048;
 bh=yM+eK9j5vEfq4IsLlhDUX6za6azI0LHprhmF+fp9rlI=;
 h=From:To:Cc:Subject:Date:From;
 b=PK9d1ICS/zJVUniP1T5sMbtH54+aMKqLRB71i/XP5nEnjoRCgHItxEEVVrjXwpH7f
 Db3lRkGE7a7gqKljRPhP7MyAIHAucoRw3QIrOfNNi+VKOQQ9IV43YmqXF5cEv7Vmg8
 QAqV9d6wZ7DQDJe2pzJ3yI5N9mFM2GfMMB8QDeAugRZa+VmNehy9zX5c3rQAeEWttH
 asauTYCOIkIrNHhBUvYo1N3uewcXXOZljUF95Ld6SRJWLpa4hgFpED9rDW959eUpbZ
 AJsdoXXLKpkBzGzC9bFSHp2td+dyQEp31gELTpc9oOwtLPxtnlry5UAUQcimlDcG7S
 pnVoAAjSflk3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PK9d1ICS
Subject: [Buildroot] [PATCH 1/1] support/testing: test_connman: new runtime
 test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_connman.py | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 support/testing/tests/package/test_connman.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..63d1517652 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1874,6 +1874,7 @@ F:	support/testing/tests/package/test_btrfs_progs.py
 F:	support/testing/tests/package/test_btrfs_progs/
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
+F:	support/testing/tests/package/test_connman.py
 F:	support/testing/tests/package/test_coremark.py
 F:	support/testing/tests/package/test_cryptsetup.py
 F:	support/testing/tests/package/test_cryptsetup/
diff --git a/support/testing/tests/package/test_connman.py b/support/testing/tests/package/test_connman.py
new file mode 100644
index 0000000000..6fef95104c
--- /dev/null
+++ b/support/testing/tests/package/test_connman.py
@@ -0,0 +1,57 @@
+import os
+
+import infra.basetest
+
+
+class TestConnMan(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_CONNMAN=y
+        BR2_PACKAGE_CONNMAN_CLIENT=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We check the program can execute.
+        self.assertRunOk("connmand --version")
+
+        # We query the connman state and expect it to be ready.
+        out, ret = self.emulator.run("connmanctl state")
+        out_str = "\n".join(out)
+        self.assertEqual(ret, 0)
+        self.assertIn("State = ready", out_str)
+
+        # We list the technologies and expect to see at least Ethernet
+        # because the emulator has one interface.
+        out, ret = self.emulator.run("connmanctl technologies")
+        out_str = "\n".join(out)
+        self.assertEqual(ret, 0)
+        self.assertIn("Type = ethernet", out_str)
+
+        # We ping the qemu user networking gateway. The startup
+        # scripts should have brought up the interface, so the ping
+        # is expected to succeed.
+        ping_cmd = "ping -c 3 -i 0.2 -W 2 10.0.2.2"
+        self.assertRunOk(ping_cmd)
+
+        # Now, we ask connman to disable Ethernet. It should stop the
+        # interface.
+        self.assertRunOk("connmanctl disable ethernet")
+
+        # If we try to ping again the qemu gateway,
+        # it should now fail.
+        _, ret = self.emulator.run(ping_cmd)
+        self.assertNotEqual(ret, 0)
+
+        # We ask connman to re-enable Ethernet.
+        self.assertRunOk("connmanctl enable ethernet")
+
+        # We should be able to ping the qemu gateway again.
+        self.assertRunOk(ping_cmd)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
