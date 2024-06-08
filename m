Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6797CC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB0A3846D3;
	Sat,  8 Jun 2024 19:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTVnNbFWATBi; Sat,  8 Jun 2024 19:15:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BDD384A46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BDD384A46;
	Sat,  8 Jun 2024 19:15:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11C521BF869
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB50340382
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xu2B3JwyBeWL for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:14:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F5FB40376
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F5FB40376
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:14:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77473814F1; Sat,  8 Jun 2024 19:14:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 18:51:41 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 626c967c5f3a08a8737f91ce8cee7d1ea5cd95ff
X-Git-Newrev: 58ec14fe8f5d396bd567e0eb40af2e6255530948
X-Patchwork-Hint: ignore
Message-Id: <20240608191459.77473814F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/genrandconfig:
 switch to async/await format
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

commit: https://git.buildroot.net/buildroot/commit/?id=58ec14fe8f5d396bd567e0eb40af2e6255530948
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This requires python 3.5 or newer but is a bit cleaner than the
previous coroutine method.

This should also fix a python3.12 issue:
[Tue, 28 May 2024 13:09:05] INFO: generate the configuration
Traceback (most recent call last):
  File "/home/autobuild/autobuild/instance-0/buildroot/utils/genrandconfig", line 833, in <module>
    ret = asyncio.run(gen_config(args))
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/asyncio/runners.py", line 194, in run
    return runner.run(main)
           ^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/asyncio/runners.py", line 89, in run
    raise ValueError("a coroutine was expected, got {!r}".format(coro))
ValueError: a coroutine was expected, got <generator object gen_config at 0xffff7bd822c0>
[Tue, 28 May 2024 13:09:06] WARN: failed to generate configuration

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 584ebdea6e2edb415b6a3c96bea490a0d2beea78)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 62 ++++++++++++++++++++---------------------------------
 1 file changed, 23 insertions(+), 39 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 5ebec415b5..d00b9cb36f 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -28,11 +28,6 @@ import traceback
 from distutils.version import StrictVersion
 import platform
 
-if sys.version_info < (3, 8):
-    from asyncio import coroutine
-else:
-    from types import coroutine
-
 
 class SystemInfo:
     DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
@@ -60,8 +55,7 @@ class SystemInfo:
         # --
         return None
 
-    @coroutine
-    def has(self, prog):
+    async def has(self, prog):
         """Checks whether a program is available.
         Lazily evaluates missing entries.
 
@@ -76,11 +70,11 @@ class SystemInfo:
         have_it = self.find_prog(prog)
         # java[c] needs special care
         if have_it and prog in ('java', 'javac'):
-            proc = yield from asyncio.create_subprocess_shell(
+            proc = await asyncio.create_subprocess_shell(
                 "%s -version | grep gcj" % prog,
                 stdout=asyncio.subprocess.DEVNULL,
                 stderr=asyncio.subprocess.DEVNULL)
-            ret = yield from proc.wait()
+            ret = await proc.wait()
             if ret != 1:
                 have_it = False
         # --
@@ -159,8 +153,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
     return configs
 
 
-@coroutine
-def is_toolchain_usable(configfile, config):
+async def is_toolchain_usable(configfile, config):
     """Check if the toolchain is actually usable."""
 
     with open(configfile) as configf:
@@ -180,9 +173,9 @@ def is_toolchain_usable(configfile, config):
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
-            proc = yield from asyncio.create_subprocess_exec(
+            proc = await asyncio.create_subprocess_exec(
                 'ldd', '--version', stdout=asyncio.subprocess.PIPE)
-            ldd_version_output, _ = yield from proc.communicate()
+            ldd_version_output, _ = await proc.communicate()
             if proc.returncode:
                 return False
             glibc_version = ldd_version_output.decode().splitlines()[0].split()[-1]
@@ -193,8 +186,7 @@ def is_toolchain_usable(configfile, config):
     return True
 
 
-@coroutine
-def fixup_config(sysinfo, configfile):
+async def fixup_config(sysinfo, configfile):
     """Finalize the configuration and reject any problematic combinations
 
     This function returns 'True' when the configuration has been
@@ -210,8 +202,7 @@ def fixup_config(sysinfo, configfile):
 
     BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
 
-    has_java = yield from sysinfo.has("java")
-    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not has_java:
+    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not await sysinfo.has("java"):
         return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
@@ -681,8 +672,7 @@ def fixup_config(sysinfo, configfile):
     return True
 
 
-@coroutine
-def gen_config(args):
+async def gen_config(args):
     """Generate a new random configuration
 
     This function generates the configuration, by choosing a random
@@ -740,8 +730,7 @@ def gen_config(args):
 
     # Randomly enable BR2_REPRODUCIBLE 10% of times
     # also enable tar filesystem images for testing
-    has_diffoscope = yield from sysinfo.has("diffoscope")
-    if has_diffoscope and randint(0, 10) == 0:
+    if await sysinfo.has("diffoscope") and randint(0, 10) == 0:
         configlines.append("BR2_REPRODUCIBLE=y\n")
         configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
 
@@ -755,14 +744,13 @@ def gen_config(args):
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
-    proc = yield from asyncio.create_subprocess_exec(
+    proc = await asyncio.create_subprocess_exec(
         "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
-    ret = yield from proc.wait()
+    ret = await proc.wait()
     if ret:
         return ret
 
-    toolchain_usable = yield from is_toolchain_usable(configfile, toolchainconfig)
-    if not toolchain_usable:
+    if not await is_toolchain_usable(configfile, toolchainconfig):
         return 2
 
     # Now, generate the random selection of packages, and fixup
@@ -776,37 +764,33 @@ def gen_config(args):
                   file=sys.stderr)
             return 1
         bounded_loop -= 1
-        make_rand = [
+        proc = await asyncio.create_subprocess_exec(
             "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
             "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
             "KCONFIG_PROBABILITY=%d" % randint(1, 20),
-            "randpackageconfig" if args.toolchains_csv else "randconfig"
-        ]
-        proc = yield from asyncio.create_subprocess_exec(*make_rand)
-        ret = yield from proc.wait()
+            "randpackageconfig" if args.toolchains_csv else "randconfig")
+        ret = await proc.wait()
         if ret:
             return ret
 
-        ret = yield from fixup_config(sysinfo, configfile)
-        if ret:
+        if await fixup_config(sysinfo, configfile):
             break
 
-    proc = yield from asyncio.create_subprocess_exec(
+    proc = await asyncio.create_subprocess_exec(
         "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
-    ret = yield from proc.wait()
+    ret = await proc.wait()
     if ret:
         return ret
 
-    proc = yield from asyncio.create_subprocess_exec(
+    proc = await asyncio.create_subprocess_exec(
         "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "savedefconfig")
-    ret = yield from proc.wait()
+    ret = await proc.wait()
     if ret:
         return ret
 
-    proc = yield from asyncio.create_subprocess_exec(
+    proc = await asyncio.create_subprocess_exec(
         "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "dependencies")
-    ret = yield from proc.wait()
-    return ret
+    return await proc.wait()
 
 
 if __name__ == '__main__':
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
