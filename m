Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E964C4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 22:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B69D340357;
	Mon, 12 Feb 2024 22:17:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d7va73d5rvgG; Mon, 12 Feb 2024 22:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B45CA4052B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B45CA4052B;
	Mon, 12 Feb 2024 22:17:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBC6C1BF34E
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8E1F81FBB
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jpOVhuweNZG2 for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 22:17:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4AB6D81F86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AB6D81F86
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AB6D81F86
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 22:17:39 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CA1C213F81D;
 Mon, 12 Feb 2024 23:17:35 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 23:17:30 +0100
Message-ID: <20240212221730.66390-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707776257;
 bh=Mf5f2YtEq1+K1CBZ+lrp9YyaAsBsUQP+e0eInzjBK64=;
 h=From:To:Cc:Subject:Date:From;
 b=Wri93Ee2bjFRXj0KJsNpvSwmQfty+CaDEQPGWAdZ4WktNs/fTIoWBTDNPeFsWVTsQ
 EgM5bCezEUghF0jp/Ntow4ic6/SDwFIjSZvGav8gn9ffFhXdwjd8V8RNTIJL/K08Lb
 /P2/EJNccAebaPYkFHZHtxfYa4xtCXeXsWBfF0ZJbXoVF6Gx+ZFptdsKud0T6ffjUL
 poY6d6cvVuIChUmdDdMU9Us5ZmEMO8RSEM52NTQkbQ+6wrLUhUk1ndbm4Sfdyz/yMD
 J7AUTCy7Pu8PR0V9BdGtGDM2Al3gNLDRSaWkFKQEem7DfhA765tLL4txsUCuePHj7b
 yaJKr8QwsrvEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wri93Ee2
Subject: [Buildroot] [PATCH 1/1] support/testing: add git runtime test
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
 support/testing/tests/package/test_git.py | 57 +++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 support/testing/tests/package/test_git.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d12c3abcb..5a6fc11191 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1786,6 +1786,7 @@ F:	support/testing/tests/package/test_fping.py
 F:	support/testing/tests/package/test_gawk.py
 F:	support/testing/tests/package/test_ghostscript.py
 F:	support/testing/tests/package/test_ghostscript/
+F:	support/testing/tests/package/test_git.py
 F:	support/testing/tests/package/test_glslsandbox_player.py
 F:	support/testing/tests/package/test_glslsandbox_player/
 F:	support/testing/tests/package/test_gnupg2.py
diff --git a/support/testing/tests/package/test_git.py b/support/testing/tests/package/test_git.py
new file mode 100644
index 0000000000..878c4c8092
--- /dev/null
+++ b/support/testing/tests/package/test_git.py
@@ -0,0 +1,57 @@
+import os
+
+import infra.basetest
+
+
+class TestGit(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_GIT=y
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
+        # Check the program can execute.
+        self.assertRunOk("git --version")
+
+        # Initialize some git global configuration.
+        git_cfg = [
+            ("user.name", "Build Root"),
+            ("user.email", "build.root@localhost.localdomain"),
+            ("color.ui", "false"),
+            ("init.defaultBranch", "master"),
+            ("core.pager", "")
+        ]
+        for cfg_name, cfg_value in git_cfg:
+            cmd = f"git config --global {cfg_name} '{cfg_value}'"
+            self.assertRunOk(cmd)
+
+        # Run a sequence of few git commands.
+        commands = [
+            "mkdir workdir",
+            "cd workdir",
+            "git init",
+            "echo 'Hello World' > file.txt",
+            "git add file.txt",
+            "git commit -as -m 'Initial commit'",
+            "git checkout -b my_branch",
+            "sed -i 's/World/Buildroot/g' file.txt",
+            "git status",
+            "git commit -as -m 'Replace World by Buildroot'",
+            "git format-patch -M -n -s -o patches master",
+            "ls -al patches/*.patch",
+            "git checkout -b another_branch master",
+            "git am patches/*.patch",
+            "git diff --exit-code my_branch another_branch",
+            "git tag -a -m 'Tagged v1.0' v1.0",
+            "git log"
+        ]
+        for cmd in commands:
+            self.assertRunOk(cmd)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
