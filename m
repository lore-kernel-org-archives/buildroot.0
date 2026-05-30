Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57842CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 228EE858C4;
	Tue,  9 Jun 2026 13:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V63NyBbf-_sd; Tue,  9 Jun 2026 13:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0563E857C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010170;
	bh=Py/DmKa9SHmsTj8PhJ4Ixmsg04FBwkrJwPxpDVn6/Sw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AIAnmq+JvLgjsNBJDEQohGjKmSMd7Sw7efbYIsUwxSe6A4jNlO+pokkeWZQ6lNBsP
	 n4N1JU/GOAyp7Cc8/Hk8wLRDwCwNOjgueW2j4q8w+Csh9BhW5/T8jZU8lGFjgmzHTC
	 H+J9VtOgr6vhmOoklw24GWKCsQ2G1c11gexoC8hiIJp5+HAyshqjJxj5RkMBwqZM1l
	 MiXn8yyHHLcxbuINqohL/F1LSki2rNAVMuRuvPZ2p3VAq/oE256PQoGdOIfxkfy+l0
	 zohqboxZjQJFrHxD7KWCLg+b8FUQsrleh6HmsDPPvSx6fduvpsIIeyYIZfvGAFdUfN
	 2kAqd61QnAREQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0563E857C8;
	Tue,  9 Jun 2026 13:02:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 892752EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83CEA855E4
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3tWYY3y8KhR for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46C298560C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46C298560C
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82AEC87E8B; Tue,  9 Jun 2026 13:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 16:20:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3872cf8a7555774d3093bbf324a9c478be837359
X-Git-Newrev: 10088b538115d9d23136fae98ef764cfc5602104
X-Patchwork-Hint: ignore
Message-Id: <20260609130123.82AEC87E8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: transfer config in
 environment instead of class variables
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/10088b538115d9d23136fae98ef764cfc5602104
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Passing runtime configuration to tests in BRConfigTest class variables
requires the "fork" start method for multiprocessing. With
"forkserver" (default for POSIX platforms since Python 3.14) class
variables modified in the parent process are lost, because the child
process does not inherit the full Python state. This broke the way
support/testing/run-tests sets configuration for BRConfigTest, so a
start method override was added in commit
3d2141bceefda32bef06ddda594eaf8665913276.

Instead this patch adds a settings dataclass (requires Python >= 3.7)
which is serialized into an environment variable from run-tests and
read during BRConfigTest.__init__(). Reading is skipped if the
environment variable is not set so test discovery (not execution)
works without configuration (e.g. utils/get-developers uses this).

With that, run-tests no longer relies on a specific multiprocessing
start method.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/basetest.py | 37 +++++++++++++++++++++++++++++++++++++
 support/testing/run-tests         | 38 +++++++++++++++-----------------------
 2 files changed, 52 insertions(+), 23 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 13f9b2d398..5fa902a77f 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -1,6 +1,9 @@
 import unittest
 import os
+import dataclasses
 import datetime
+import json
+from typing import ClassVar
 
 from infra.builder import Builder
 from infra.emulator import Emulator
@@ -22,6 +25,33 @@ MINIMAL_CONFIG = \
     """
 
 
+@dataclasses.dataclass
+class BRTestSettings:
+    """support/testing/run-tests stores runtime settings in this
+    object, and serializes it into the environment variable named in
+    CONF_ENV. On instantiation, BRConfigTest loads this
+    configuration. That way configuration can be transferred into
+    multiprocessing worker processes without requiring the "fork"
+    start method.
+
+    """
+    CONF_ENV: ClassVar[str] = 'BR_TEST_CONFIG_JSON'
+
+    downloaddir: str
+    outputdir: str
+    logtofile: bool = True
+    keepbuilds: bool = False
+    jlevel: int = 0
+    timeout_multiplier: int = 1
+
+    def to_env(self) -> None:
+        os.environ[self.CONF_ENV] = json.dumps(dataclasses.asdict(self))
+
+    @classmethod
+    def from_env(cls) -> 'BRTestSettings':
+        return cls(**json.loads(os.environ[cls.CONF_ENV]))
+
+
 class BRConfigTest(unittest.TestCase):
     """Test up to the configure stage."""
     config: str
@@ -35,6 +65,8 @@ class BRConfigTest(unittest.TestCase):
 
     def __init__(self, names):
         super(BRConfigTest, self).__init__(names)
+        if BRTestSettings.CONF_ENV in os.environ:
+            self.conf_from_env()
         self.testname = self.__class__.__name__
         self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
         self.config += '\nBR2_DL_DIR="{}"\n'.format(self.downloaddir)
@@ -44,6 +76,11 @@ class BRConfigTest(unittest.TestCase):
         print("{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
                                     self.testname, msg))
 
+    def conf_from_env(self) -> None:
+        conf = BRTestSettings.from_env()
+        for f in dataclasses.fields(conf):
+            setattr(self, f.name, getattr(conf, f.name))
+
     def setUp(self):
         self.show_msg("Starting")
         self.b = Builder(self.config, self.builddir, self.logtofile, self.jlevel)
diff --git a/support/testing/run-tests b/support/testing/run-tests
index 2c7ce87c96..f0c1cc782a 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -6,7 +6,7 @@ import sys
 
 import nose2
 
-from infra.basetest import BRConfigTest
+from infra.basetest import BRTestSettings
 
 import infra
 
@@ -44,9 +44,6 @@ def main():
     script_path = os.path.realpath(__file__)
     test_dir = os.path.dirname(script_path)
 
-    if args.stdout:
-        BRConfigTest.logtofile = False
-
     if args.list:
         print("List of tests")
         nose2_args = [
@@ -69,7 +66,7 @@ def main():
             parser.print_help()
             return 1
 
-    BRConfigTest.downloaddir = os.path.abspath(args.download)
+    args.download = os.path.abspath(args.download)
 
     if args.prepare_only:
         emulator_builtin_binaries = ["kernel-vexpress-5.10.202",
@@ -78,7 +75,7 @@ def main():
                                      "versatile-pb-5.10.202.dtb"]
         print("Downloading emulator builtin binaries")
         for binary in emulator_builtin_binaries:
-            infra.download(BRConfigTest.downloaddir, binary)
+            infra.download(args.download, binary)
         return 0
 
     if args.output is None:
@@ -90,15 +87,13 @@ def main():
     if not os.path.exists(args.output):
         os.mkdir(args.output)
 
-    BRConfigTest.outputdir = os.path.abspath(args.output)
-
     if args.all is False and not args.testname:
         print("No test selected")
         print("")
         parser.print_help()
         return 1
 
-    BRConfigTest.keepbuilds = args.keep
+    jlevel = 0
 
     if args.testcases != 1:
         if args.testcases < 1:
@@ -109,7 +104,7 @@ def main():
         # same default BR2_JLEVEL as package/Makefile.in
         br2_jlevel = 1 + multiprocessing.cpu_count()
         each_testcase = int((br2_jlevel + args.testcases) / args.testcases)
-        BRConfigTest.jlevel = each_testcase
+        jlevel = each_testcase
 
     if args.jlevel:
         if args.jlevel < 0:
@@ -118,14 +113,22 @@ def main():
             parser.print_help()
             return 1
         # the user can override the auto calculated value
-        BRConfigTest.jlevel = args.jlevel
+        jlevel = args.jlevel
 
     if args.timeout_multiplier < 1:
         print("Invalid multiplier for timeout values")
         print("")
         parser.print_help()
         return 1
-    BRConfigTest.timeout_multiplier = args.timeout_multiplier
+
+    BRTestSettings(
+        logtofile=not args.stdout,
+        downloaddir=args.download,
+        outputdir=os.path.abspath(args.output),
+        keepbuilds=args.keep,
+        jlevel=jlevel,
+        timeout_multiplier=args.timeout_multiplier
+    ).to_env()
 
     nose2_args = ["-v",
                   "-N", str(args.testcases),
@@ -142,15 +145,4 @@ def main():
 
 
 if __name__ == "__main__":
-    # python 3.14 changed default start method from fork to
-    # fork-server, which is not compatible with the nose2 setup
-    if multiprocessing.get_start_method(allow_none=True) != "fork":
-        multiprocessing.set_start_method("fork", force=True)
-        # set_start_method throws a RuntimeError if called more than
-        # once.
-        # Debian python3-nose2 0.15.1-2 includes a patch adding
-        # another set_start_method() call, so monkey patch it out to
-        # get rid of this
-        multiprocessing.set_start_method = lambda *args: None
-
     sys.exit(main())
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
