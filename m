Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083D4C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 14:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8721B60AFB;
	Mon,  6 Feb 2023 14:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8721B60AFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9__liEPXp3V5; Mon,  6 Feb 2023 14:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9815460B03;
	Mon,  6 Feb 2023 14:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9815460B03
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 816701BF343
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 14:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 642E44036F
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 14:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 642E44036F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EOsTkzwdMNAu for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 14:55:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93D1E4021C
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 14:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93D1E4021C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8122883C54; Mon,  6 Feb 2023 14:55:10 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 15:54:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00410ab668833d822f645fffd782ce11253457b1
X-Git-Newrev: 579b65b55234d298570e5191efb509905933eef5
X-Patchwork-Hint: ignore
Message-Id: <20230206145510.8122883C54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: migrate to asyncio
 subprocess calls
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

commit: https://git.buildroot.net/buildroot/commit/?id=579b65b55234d298570e5191efb509905933eef5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since genrandconfig no longer appears to support python2 we can
migrate the subprocess calls to use asyncio variants.

This has the advantage of allowing for runners like autobuild-run to
integrate directly into genrandconfig by calling the asyncio
gen_config using importlib instead of having to run genrandconfig as
a subprocess.

Using asyncio is advantageous here as it eliminates the requirement
for the runner to deal with blocking subprocess calls(by having to
use threading for example).

Also cleanup some unused functions/python2 compatibility shims.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/genrandconfig | 85 +++++++++++++++++++++++++++++++++++------------------
 1 file changed, 56 insertions(+), 29 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index b4ebb9a9be..b3576f8a51 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -19,24 +19,19 @@
 # This script generates a random configuration for testing Buildroot.
 
 from binascii import hexlify
-import contextlib
+import asyncio
 import csv
 import os
 from random import randint
-import subprocess
 import sys
 import traceback
 from distutils.version import StrictVersion
 import platform
 
-if sys.hexversion >= 0x3000000:
-    import urllib.request as _urllib
+if sys.version_info < (3, 8):
+    from asyncio import coroutine
 else:
-    import urllib2 as _urllib
-
-
-def urlopen_closing(uri):
-    return contextlib.closing(_urllib.urlopen(uri))
+    from types import coroutine
 
 
 class SystemInfo:
@@ -65,6 +60,7 @@ class SystemInfo:
         # --
         return None
 
+    @coroutine
     def has(self, prog):
         """Checks whether a program is available.
         Lazily evaluates missing entries.
@@ -80,11 +76,13 @@ class SystemInfo:
         have_it = self.find_prog(prog)
         # java[c] needs special care
         if have_it and prog in ('java', 'javac'):
-            with open(os.devnull, "w") as devnull:
-                if subprocess.call("%s -version | grep gcj" % prog,
-                                   shell=True,
-                                   stdout=devnull, stderr=devnull) != 1:
-                    have_it = False
+            proc = yield from asyncio.create_subprocess_shell(
+                "%s -version | grep gcj" % prog,
+                stdout=asyncio.subprocess.DEVNULL,
+                stderr=asyncio.subprocess.DEVNULL)
+            ret = yield from proc.wait()
+            if ret != 1:
+                have_it = False
         # --
         self.progs[prog] = have_it
         return have_it
@@ -161,6 +159,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
     return configs
 
 
+@coroutine
 def is_toolchain_usable(configfile, config):
     """Check if the toolchain is actually usable."""
 
@@ -181,7 +180,11 @@ def is_toolchain_usable(configfile, config):
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
-            ldd_version_output = subprocess.check_output(['ldd', '--version'])
+            proc = yield from asyncio.create_subprocess_exec(
+                'ldd', '--version', stdout=asyncio.subprocess.PIPE)
+            ldd_version_output, _ = yield from proc.communicate()
+            if proc.returncode:
+                return False
             glibc_version = ldd_version_output.decode().splitlines()[0].split()[-1]
             if StrictVersion('2.14') > StrictVersion(glibc_version):
                 print("WARN: ignoring the Linaro ARM toolchains because too old host glibc", file=sys.stderr)
@@ -190,6 +193,7 @@ def is_toolchain_usable(configfile, config):
     return True
 
 
+@coroutine
 def fixup_config(sysinfo, configfile):
     """Finalize the configuration and reject any problematic combinations
 
@@ -206,7 +210,8 @@ def fixup_config(sysinfo, configfile):
 
     BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
 
-    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has("java"):
+    has_java = yield from sysinfo.has("java")
+    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not has_java:
         return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
@@ -649,6 +654,7 @@ def fixup_config(sysinfo, configfile):
     return True
 
 
+@coroutine
 def gen_config(args):
     """Generate a new random configuration
 
@@ -707,7 +713,8 @@ def gen_config(args):
 
     # Randomly enable BR2_REPRODUCIBLE 10% of times
     # also enable tar filesystem images for testing
-    if sysinfo.has("diffoscope") and randint(0, 10) == 0:
+    has_diffoscope = yield from sysinfo.has("diffoscope")
+    if has_diffoscope and randint(0, 10) == 0:
         configlines.append("BR2_REPRODUCIBLE=y\n")
         configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
 
@@ -721,10 +728,14 @@ def gen_config(args):
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "olddefconfig"])
+    proc = yield from asyncio.create_subprocess_exec(
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
+    ret = yield from proc.wait()
+    if ret:
+        return ret
 
-    if not is_toolchain_usable(configfile, toolchainconfig):
+    toolchain_usable = yield from is_toolchain_usable(configfile, toolchainconfig)
+    if not toolchain_usable:
         return 2
 
     # Now, generate the random selection of packages, and fixup
@@ -744,19 +755,31 @@ def gen_config(args):
             "KCONFIG_PROBABILITY=%d" % randint(1, 20),
             "randpackageconfig" if args.toolchains_csv else "randconfig"
         ]
-        subprocess.check_call(make_rand)
+        proc = yield from asyncio.create_subprocess_exec(*make_rand)
+        ret = yield from proc.wait()
+        if ret:
+            return ret
 
-        if fixup_config(sysinfo, configfile):
+        ret = yield from fixup_config(sysinfo, configfile)
+        if ret:
             break
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "olddefconfig"])
+    proc = yield from asyncio.create_subprocess_exec(
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
+    ret = yield from proc.wait()
+    if ret:
+        return ret
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "savedefconfig"])
+    proc = yield from asyncio.create_subprocess_exec(
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "savedefconfig")
+    ret = yield from proc.wait()
+    if ret:
+        return ret
 
-    return subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                            "dependencies"])
+    proc = yield from asyncio.create_subprocess_exec(
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "dependencies")
+    ret = yield from proc.wait()
+    return ret
 
 
 if __name__ == '__main__':
@@ -788,7 +811,11 @@ if __name__ == '__main__':
     args.outputdir = os.path.abspath(args.outputdir)
 
     try:
-        ret = gen_config(args)
+        if sys.version_info < (3, 7):
+            loop = asyncio.get_event_loop()
+            ret = loop.run_until_complete(gen_config(args))
+        else:
+            ret = asyncio.run(gen_config(args))
     except Exception:
         traceback.print_exc()
         parser.exit(1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
