Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F54C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09335405B5;
	Sun, 20 Mar 2022 17:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2OfwD4yeXdAW; Sun, 20 Mar 2022 17:48:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6594340012;
	Sun, 20 Mar 2022 17:48:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8ACFF1BF97A
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 793C4817B0
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W_BtWPxEE9jK for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:47:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9702B8144E
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:47:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C3162845D2; Sun, 20 Mar 2022 17:39:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 18:30:05 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 52bdcde13c736091e7876d4f31fb9b6ed2d3635a
X-Git-Newrev: ac1fa68623d89f4a66b8a91d358d755c3dfb6c41
X-Patchwork-Hint: ignore
Message-Id: <20220320173905.C3162845D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] support/testing:
 TestRust{Bin} use ripgrep package for testing
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac1fa68623d89f4a66b8a91d358d755c3dfb6c41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

TestRust and TestRustBin has been introduced at the time when there was
no cargo package infrastructure or any package using rust compiler
(Buildroot 2018.02).

Since then the ripgrep package has been introduced, initially using
the generic package infrastructure and converted later to the cargo
package infrastructure.

Due a recent change in rust/cargo removing the cargo config file [1]
the test TestRust and TestRustBin now fail to compile since they build
an hello-world crate outside of the cargo package infrastructure
without the correct environment for cross-compiling.

Replace the 'hello-world' crate by ripgrep package and check if it
can run properly in Qemu.

Fixes tests.package.test_rust.TestRustBin:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202545

But doesn't fixes tests.package.test_rust.TestRust due another bug:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202544

[1] b6378631c2609742382984f6f7b93c1d9d2cdb78

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f0d1f211950fe7cdf1bbb52397cdb86519d4a404)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_rust.py | 48 +++---------------------------
 1 file changed, 4 insertions(+), 44 deletions(-)

diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index 884b40a4a3..a1abd20c09 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -8,9 +8,6 @@ import infra.basetest
 
 class TestRustBase(infra.basetest.BRTest):
 
-    target = 'armv7-unknown-linux-gnueabihf'
-    crate = 'hello-world'
-
     def login(self):
         img = os.path.join(self.builddir, "images", "rootfs.cpio")
         self.emulator.boot(arch="armv7",
@@ -18,43 +15,6 @@ class TestRustBase(infra.basetest.BRTest):
                            options=["-initrd", img])
         self.emulator.login()
 
-    def build_test_prog(self):
-        hostdir = os.path.join(self.builddir, 'host')
-        env = os.environ.copy()
-        env["USER"] = "br-user"
-        env["PATH"] = "{}:".format(os.path.join(hostdir, 'bin')) + env["PATH"]
-        env["CARGO_HOME"] = os.path.join(hostdir, 'usr', 'share', 'cargo')
-        env["RUST_TARGET_PATH"] = os.path.join(hostdir, 'etc', 'rustc')
-        cargo = os.path.join(hostdir, 'bin', 'cargo')
-        workdir = os.path.join(tempfile.mkdtemp(suffix='-br2-testing-rust'),
-                               self.crate)
-        manifest = os.path.join(workdir, 'Cargo.toml')
-        prog = os.path.join(workdir, 'target', self.target, 'debug', self.crate)
-
-        cmd = [cargo, 'init', '--bin', '--vcs', 'none', '-vv', workdir]
-        ret = subprocess.call(cmd,
-                              stdout=self.b.logfile,
-                              stderr=self.b.logfile,
-                              env=env)
-        if ret != 0:
-            raise SystemError("Cargo init failed")
-
-        cmd = [
-            cargo, 'build', '-vv', '--target', self.target,
-            '--manifest-path', manifest
-        ]
-        ret = subprocess.call(cmd,
-                              stdout=self.b.logfile,
-                              stderr=self.b.logfile,
-                              env=env)
-        if ret != 0:
-            raise SystemError("Cargo build failed")
-
-        shutil.copy(prog, os.path.join(self.builddir, 'target', 'usr', 'bin'))
-        self.b.build()
-        shutil.rmtree(workdir)
-
-
 class TestRustBin(TestRustBase):
     config = \
         """
@@ -68,12 +28,12 @@ class TestRustBin(TestRustBase):
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_PACKAGE_HOST_RUSTC=y
+        BR2_PACKAGE_RIPGREP=y
         """
 
     def test_run(self):
-        self.build_test_prog()
         self.login()
-        self.assertRunOk(self.crate)
+        self.assertRunOk("rg Buildroot /etc/issue")
 
 
 class TestRust(TestRustBase):
@@ -90,9 +50,9 @@ class TestRust(TestRustBase):
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_PACKAGE_HOST_RUSTC=y
         BR2_PACKAGE_HOST_RUST=y
+        BR2_PACKAGE_RIPGREP=y
         """
 
     def test_run(self):
-        self.build_test_prog()
         self.login()
-        self.assertRunOk(self.crate)
+        self.assertRunOk("rg Buildroot /etc/issue")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
