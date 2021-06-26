Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F566C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:01:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0E896103C
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0E896103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CC25422A9;
	Wed,  4 Aug 2021 00:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5NXO3YiKVvx; Wed,  4 Aug 2021 00:01:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BC98422B7;
	Wed,  4 Aug 2021 00:01:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9839D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 823EA4060A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TIDfdo7t4YQ1 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 664BC4067B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B926F87B09; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 26 Jun 2021 17:41:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f579afc3930506311068a6f2575a487a5bc8c8e1
X-Git-Newrev: afc1ed4d5152e0f6e724e6986a1d12c8001b94fe
X-Patchwork-Hint: ignore
Message-Id: <20210803210956.B926F87B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: use
 .assertRunOk() when possible
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=afc1ed4d5152e0f6e724e6986a1d12c8001b94fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The BRTest() class implements an assertRunOk() method that does the
very common work of running a command inside the emulator, and
checking that it is successful.

This commit changes all locations where this .assertRunOk() method can
be used, instead of open-coding the same logic.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/fs/test_f2fs.py               |  3 +--
 support/testing/tests/fs/test_jffs2.py              |  3 +--
 support/testing/tests/fs/test_squashfs.py           |  3 +--
 support/testing/tests/init/base.py                  |  6 ++----
 support/testing/tests/init/test_none.py             |  3 +--
 support/testing/tests/init/test_systemd.py          |  3 +--
 support/testing/tests/package/test_atop.py          |  6 ++----
 support/testing/tests/package/test_bmap_tools.py    |  3 +--
 .../testing/tests/package/test_docker_compose.py    |  3 +--
 support/testing/tests/package/test_dropbear.py      |  6 ++----
 support/testing/tests/package/test_lua.py           |  3 +--
 support/testing/tests/package/test_netdata.py       |  3 +--
 support/testing/tests/package/test_openssh.py       |  6 ++----
 support/testing/tests/package/test_opkg.py          | 12 ++++--------
 support/testing/tests/package/test_perl.py          |  3 +--
 support/testing/tests/package/test_python.py        | 12 ++++--------
 support/testing/tests/package/test_python_pytest.py |  3 +--
 .../tests/package/test_python_pytest_asyncio.py     |  3 +--
 support/testing/tests/package/test_redis.py         |  3 +--
 support/testing/tests/package/test_rust.py          |  6 ++----
 support/testing/tests/package/test_s6_rc.py         | 21 ++++++++++-----------
 support/testing/tests/package/test_sudo.py          |  6 ++----
 support/testing/tests/package/test_syslog_ng.py     | 10 ++++------
 support/testing/tests/package/test_tmux.py          | 12 ++++--------
 24 files changed, 51 insertions(+), 91 deletions(-)

diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
index 950d4cf25b..e6872f39c1 100644
--- a/support/testing/tests/fs/test_f2fs.py
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -44,5 +44,4 @@ class TestF2FS(infra.basetest.BRTest):
                            options=options)
         self.emulator.login()
         cmd = "mount | grep '/dev/root on / type f2fs'"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/fs/test_jffs2.py b/support/testing/tests/fs/test_jffs2.py
index f5066ff01f..f595e408d5 100644
--- a/support/testing/tests/fs/test_jffs2.py
+++ b/support/testing/tests/fs/test_jffs2.py
@@ -41,5 +41,4 @@ class TestJffs2(infra.basetest.BRTest):
                            options=["-drive", "file={},if=pflash".format(img)])
         self.emulator.login()
         cmd = "mount | grep '/dev/root on / type jffs2'"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index 234f4944be..3e58a12ab7 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -32,5 +32,4 @@ class TestSquashfs(infra.basetest.BRTest):
         self.emulator.login()
 
         cmd = "mount | grep '/dev/root on / type squashfs'"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
index 75cfbe9c59..80f7731ba3 100644
--- a/support/testing/tests/init/base.py
+++ b/support/testing/tests/init/base.py
@@ -39,10 +39,8 @@ class InitSystemBase(infra.basetest.BRTest):
 
     def check_init(self, path):
         cmd = "cmp /proc/1/exe {}".format(path)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
     def check_network(self, interface, exitCode=0):
         cmd = "ip addr show {} |grep inet".format(interface)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, exitCode)
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/init/test_none.py b/support/testing/tests/init/test_none.py
index 5b9b4e43f1..fc4a46efd9 100644
--- a/support/testing/tests/init/test_none.py
+++ b/support/testing/tests/init/test_none.py
@@ -27,7 +27,6 @@ class TestInitSystemNone(InitSystemBase):
         self.assertEqual(exit_code, 0)
         self.assertEqual(out[0], "1")
 
-        _, exit_code = self.emulator.run("mount -t proc none /proc")
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk("mount -t proc none /proc")
 
         self.check_init("/bin/sh")
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index c0ef5e1202..b553f69a48 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -29,8 +29,7 @@ class InitSystemSystemdBase(InitSystemBase):
         self.assertEqual(len(output), 0)
 
         # Test we can reach the DBus daemon
-        _, exit_code = self.emulator.run("busctl --no-pager")
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk("busctl --no-pager")
 
         # Test we can read at least one line from the journal
         output, _ = self.emulator.run("journalctl --no-pager --lines 1 --quiet")
diff --git a/support/testing/tests/package/test_atop.py b/support/testing/tests/package/test_atop.py
index 1da1ac7cc4..5a96684799 100644
--- a/support/testing/tests/package/test_atop.py
+++ b/support/testing/tests/package/test_atop.py
@@ -33,9 +33,7 @@ class TestAtop(infra.basetest.BRTest):
         self.emulator.login()
 
         cmd = "atop -V | grep '^Version'"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
         cmd = "atop -a 1 2 | grep '% *atop *$'"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/package/test_bmap_tools.py b/support/testing/tests/package/test_bmap_tools.py
index 5b4e5dcd3f..baa23154f8 100644
--- a/support/testing/tests/package/test_bmap_tools.py
+++ b/support/testing/tests/package/test_bmap_tools.py
@@ -42,8 +42,7 @@ class TestBmapTools(BRTest):
     def test_run(self):
         self.login()
         cmd = "/root/{}".format(os.path.basename(self.sample_script))
-        _, exit_code = self.emulator.run(cmd, timeout=20)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd, timeout=20)
 
 
 class TestPy2BmapTools(TestBmapTools):
diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 737dbf393c..142ac95d03 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -37,8 +37,7 @@ class TestDockerCompose(infra.basetest.BRTest):
 
     def docker_test(self):
         # will download container if not available, which may take some time
-        _, exit_code = self.emulator.run('docker run --rm -p 8888:8888 busybox:latest /bin/true', 120)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk('docker run --rm -p 8888:8888 busybox:latest /bin/true', 120)
 
     def docker_compose_test(self):
         # will download container if not available, which may take some time
diff --git a/support/testing/tests/package/test_dropbear.py b/support/testing/tests/package/test_dropbear.py
index bfec8701f2..2dd9070231 100644
--- a/support/testing/tests/package/test_dropbear.py
+++ b/support/testing/tests/package/test_dropbear.py
@@ -24,9 +24,7 @@ class TestDropbear(infra.basetest.BRTest):
                                     "-net", "user"])
         self.emulator.login(self.passwd)
         cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:22"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
         cmd = "sshpass -p {} ssh -y localhost /bin/true".format(self.passwd)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/package/test_lua.py b/support/testing/tests/package/test_lua.py
index 66ae85c999..573ae01005 100644
--- a/support/testing/tests/package/test_lua.py
+++ b/support/testing/tests/package/test_lua.py
@@ -31,8 +31,7 @@ class TestLuaBase(infra.basetest.BRTest):
 
     def module_test(self, module, script="a=1"):
         cmd = "lua -l {} -e '{}'".format(module, script)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
 
 class TestLua(TestLuaBase):
diff --git a/support/testing/tests/package/test_netdata.py b/support/testing/tests/package/test_netdata.py
index 7418b762a4..6b616398d3 100644
--- a/support/testing/tests/package/test_netdata.py
+++ b/support/testing/tests/package/test_netdata.py
@@ -19,5 +19,4 @@ class TestNetdata(infra.basetest.BRTest):
         self.emulator.login()
 
         cmd = "wget localhost:19999 -O - | grep '<title>netdata dashboard</title>'"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/package/test_openssh.py b/support/testing/tests/package/test_openssh.py
index 2ae5030d5d..490147f86f 100644
--- a/support/testing/tests/package/test_openssh.py
+++ b/support/testing/tests/package/test_openssh.py
@@ -25,12 +25,10 @@ class TestOpensshBase(infra.basetest.BRTest):
         self.emulator.login(self.passwd)
 
         cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:22"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
         cmd = "sshpass -p {} ssh -oStrictHostKeyChecking=no localhost /bin/true".format(self.passwd)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
 
 class TestOpenSshuClibc(TestOpensshBase):
diff --git a/support/testing/tests/package/test_opkg.py b/support/testing/tests/package/test_opkg.py
index aa93708223..e47879cad6 100644
--- a/support/testing/tests/package/test_opkg.py
+++ b/support/testing/tests/package/test_opkg.py
@@ -33,23 +33,19 @@ class TestOpkg(infra.basetest.BRTest):
         # and prerm scripting provided in the package archive.
 
         cmd = "opkg install example-snmpd-package_1.0_arm.ipk"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
         cmd = "opkg list-installed | grep example-snmpd-package"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
         # Check that postinst script ran to start the services
         cmd = "ps aux | grep [s]nmpd"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
         # If successful, the prerm script ran to stop the service prior to
         # the removal of the service scripting and files
         cmd = "opkg remove example-snmpd-package"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
         # Verify after package removal that the services is not
         # running, but let's give it some time to really stop
diff --git a/support/testing/tests/package/test_perl.py b/support/testing/tests/package/test_perl.py
index 37e7390a4b..ae3f105919 100644
--- a/support/testing/tests/package/test_perl.py
+++ b/support/testing/tests/package/test_perl.py
@@ -19,8 +19,7 @@ class TestPerlBase(infra.basetest.BRTest):
 
     def module_test(self, module, script="1"):
         cmd = "perl -M{} -e '{}'".format(module, script)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
 
 class TestPerl(TestPerlBase):
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index bcd363ad1e..60da8765c4 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -20,21 +20,18 @@ class TestPythonBase(infra.basetest.BRTest):
 
     def version_test(self, version, timeout=-1):
         cmd = self.interpreter + " --version 2>&1 | grep '^{}'".format(version)
-        _, exit_code = self.emulator.run(cmd, timeout)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd, timeout)
 
     def math_floor_test(self, timeout=-1):
         cmd = self.interpreter + " -c 'import math; math.floor(12.3)'"
-        _, exit_code = self.emulator.run(cmd, timeout)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd, timeout)
 
     def libc_time_test(self, timeout=-1):
         cmd = self.interpreter + " -c 'from __future__ import print_function;"
         cmd += "import ctypes;"
         cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.1\");"
         cmd += "print(libc.time(None))'"
-        _, exit_code = self.emulator.run(cmd, timeout)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd, timeout)
 
     def zlib_test(self, timeout=-1):
         cmd = self.interpreter + " -c 'import zlib'"
@@ -116,8 +113,7 @@ class TestPythonPackageBase(TestPythonBase):
         """Run each script previously added to the image."""
         for script in self.sample_scripts:
             cmd = self.interpreter + " " + os.path.basename(script)
-            _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
-            self.assertEqual(exit_code, 0)
+            self.assertRunOk(cmd, timeout=self.timeout)
 
     def test_run(self):
         self.login()
diff --git a/support/testing/tests/package/test_python_pytest.py b/support/testing/tests/package/test_python_pytest.py
index 7fa7e44018..1a631adfd3 100644
--- a/support/testing/tests/package/test_python_pytest.py
+++ b/support/testing/tests/package/test_python_pytest.py
@@ -15,5 +15,4 @@ class TestPythonPy3Pytest(TestPythonPackageBase):
     def run_sample_scripts(self):
         for script in self.sample_scripts:
             cmd = self.interpreter + " -m pytest " + os.path.basename(script)
-            _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
-            self.assertEqual(exit_code, 0)
+            self.assertRunOk(cmd, timeout=self.timeout)
diff --git a/support/testing/tests/package/test_python_pytest_asyncio.py b/support/testing/tests/package/test_python_pytest_asyncio.py
index caf034be7b..e09abf2abb 100644
--- a/support/testing/tests/package/test_python_pytest_asyncio.py
+++ b/support/testing/tests/package/test_python_pytest_asyncio.py
@@ -16,5 +16,4 @@ class TestPythonPy3PytestAsyncio(TestPythonPackageBase):
     def run_sample_scripts(self):
         for script in self.sample_scripts:
             cmd = self.interpreter + " -m pytest " + os.path.basename(script)
-            _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
-            self.assertEqual(exit_code, 0)
+            self.assertRunOk(cmd, timeout=self.timeout)
diff --git a/support/testing/tests/package/test_redis.py b/support/testing/tests/package/test_redis.py
index d79998514e..2a333f46ad 100644
--- a/support/testing/tests/package/test_redis.py
+++ b/support/testing/tests/package/test_redis.py
@@ -16,8 +16,7 @@ class TestRedis(infra.basetest.BRTest):
                            options=["-initrd", cpio_file])
         self.emulator.login()
 
-        _, exit_code = self.emulator.run("redis-cli SET hello world")
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk("redis-cli SET hello world")
 
         output, exit_code = self.emulator.run("redis-cli GET hello")
         self.assertEqual(exit_code, 0)
diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index 15bb93dd97..cd5dccf8e1 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -79,8 +79,7 @@ class TestRustBin(TestRustBase):
     def test_run(self):
         self.build_test_prog()
         self.login()
-        _, exit_code = self.emulator.run(self.crate)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(self.crate)
 
 
 class TestRust(TestRustBase):
@@ -108,5 +107,4 @@ class TestRust(TestRustBase):
     def test_run(self):
         self.build_test_prog()
         self.login()
-        _, exit_code = self.emulator.run(self.crate)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(self.crate)
diff --git a/support/testing/tests/package/test_s6_rc.py b/support/testing/tests/package/test_s6_rc.py
index 8d375efe88..7551ba7b98 100644
--- a/support/testing/tests/package/test_s6_rc.py
+++ b/support/testing/tests/package/test_s6_rc.py
@@ -22,19 +22,18 @@ class TestS6Rc(infra.basetest.BRTest):
         self.assertEqual(exit_code, 100)
 
         # Set up two service directories with a dependency
-        self.emulator.run("mkdir -p source/testsv1")
-        self.emulator.run("mkdir -p source/testsv2")
-        self.emulator.run("echo oneshot > source/testsv1/type")
-        self.emulator.run("echo oneshot > source/testsv2/type")
-        self.emulator.run("echo 'echo foo' > source/testsv1/up")
-        self.emulator.run("echo 'echo bar' > source/testsv2/up")
-        self.emulator.run("echo testsv1 > source/testsv2/dependencies")
-        self.emulator.run("chmod +x source/testsv1/up")
-        self.emulator.run("chmod +x source/testsv2/up")
+        self.assertRunOk("mkdir -p source/testsv1")
+        self.assertRunOk("mkdir -p source/testsv2")
+        self.assertRunOk("echo oneshot > source/testsv1/type")
+        self.assertRunOk("echo oneshot > source/testsv2/type")
+        self.assertRunOk("echo 'echo foo' > source/testsv1/up")
+        self.assertRunOk("echo 'echo bar' > source/testsv2/up")
+        self.assertRunOk("echo testsv1 > source/testsv2/dependencies")
+        self.assertRunOk("chmod +x source/testsv1/up")
+        self.assertRunOk("chmod +x source/testsv2/up")
 
         # Compile the service database
-        _, exit_code = self.emulator.run("s6-rc-compile compiled source")
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk("s6-rc-compile compiled source")
 
         # Inspect dependencies
         cmd = "s6-rc-db -c compiled -d dependencies testsv1"
diff --git a/support/testing/tests/package/test_sudo.py b/support/testing/tests/package/test_sudo.py
index f9d0a6f301..daba28a1ea 100644
--- a/support/testing/tests/package/test_sudo.py
+++ b/support/testing/tests/package/test_sudo.py
@@ -22,11 +22,9 @@ class TestSudo(infra.basetest.BRTest):
         # -h    set home directory
         # -H    don't create home directory
         # -s    set shell
-        _, exit_code = self.emulator.run("adduser -D -h /tmp -H -s /bin/sh sudotest")
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk("adduser -D -h /tmp -H -s /bin/sh sudotest")
 
-        _, exit_code = self.emulator.run("echo 'sudotest ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers")
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk("echo 'sudotest ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers")
 
         output, exit_code = self.emulator.run("su - sudotest -c 'echo hello world'")
         self.assertEqual(output, ["hello world"])
diff --git a/support/testing/tests/package/test_syslog_ng.py b/support/testing/tests/package/test_syslog_ng.py
index 3fb0be5fb8..153c9f73e5 100644
--- a/support/testing/tests/package/test_syslog_ng.py
+++ b/support/testing/tests/package/test_syslog_ng.py
@@ -20,19 +20,17 @@ class TestSyslogNg(infra.basetest.BRTest):
         self.emulator.login()
 
         cmd = "grep 'syslog-ng starting' /var/log/messages"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
         cmd = "logger my-message && "
         cmd += "sleep 1 && "
         cmd += "grep my-message /var/log/messages"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
         cmd = "syslog-ng-ctl reload && "
         cmd += "sleep 1"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
+
         cmd = "grep -i 'syslog-ng.*warning' /var/log/messages"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 1)
diff --git a/support/testing/tests/package/test_tmux.py b/support/testing/tests/package/test_tmux.py
index b31854cab3..7a10b7a2b0 100644
--- a/support/testing/tests/package/test_tmux.py
+++ b/support/testing/tests/package/test_tmux.py
@@ -19,20 +19,16 @@ class TestTmux(infra.basetest.BRTest):
         self.emulator.login()
 
         cmd = "tmux -V"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
         cmd = "tmux -C </dev/null"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
         cmd = "tmux split"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
         cmd = "tmux new-window"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk(cmd)
 
         cmd = "tmux list-windows"
         output, exit_code = self.emulator.run(cmd)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
