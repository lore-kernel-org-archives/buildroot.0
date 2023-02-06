Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256F7C636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 15:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C86AF60B05;
	Mon,  6 Feb 2023 15:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C86AF60B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lyw3t-wFcA2w; Mon,  6 Feb 2023 15:08:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF8660AEE;
	Mon,  6 Feb 2023 15:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABF8660AEE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3D0E1BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 865A781424
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 865A781424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gaqC4-9kxkPp for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 15:08:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7137D8141D
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7137D8141D
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 15:08:50 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id u8so4766258ilq.13
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 07:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Eif3ulbn/xolaNSAv/0Pp0cteR7l0H4maZ4cu/QjmSs=;
 b=IiiENAbdGQV+3s89QsuUbx4Mi7h9IQGTvinW07UL6GjSk6iVUzIjv8MoRbtHttldyY
 LDx/R6+H0Ia4s6jMzHAcs0vmr61Kd0wt0kg/1Jz6pjbujdakzNs+E93Oq35BFd+QEA1Q
 PKADcuXNCv5DP2/c9j5mjBTAG0fN8yKfKrOz3iB7MbcdDZ4j/ENK0YGIp6NR9Ufi+DM6
 vBcuQTTRXfP2eST5q79LgdLnk37ZBs1yAXtu0mimXZXNcDMuRTqrj+kATXwLMC3fppGB
 SuqoxCyrTDOFH/cXlSBUPf+rYfQVDcBNVsS0SqR6F1kFnihsNsbBBRF89UTpKFXoUu6/
 AGqA==
X-Gm-Message-State: AO0yUKWOB+37h3R06FRVvDpaG/7LsdeuTJNPWCwnqbfelvRUg0b029wI
 PqS2e1/xCAUlejfM/QvZ7cW0aAWzGUaDeA==
X-Google-Smtp-Source: AK7set+JF9LxgYfeS3sj+YCo4Kpi3YTbEk0pMs3E0oR31te2+97eQnfRsQ1N4DKFnBasHEloNHvtSQ==
X-Received: by 2002:a05:6e02:4a4:b0:313:c1f7:5ef6 with SMTP id
 e4-20020a056e0204a400b00313c1f75ef6mr2769650ils.3.1675696129109; 
 Mon, 06 Feb 2023 07:08:49 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 b89-20020a0295e2000000b003a9962a24d1sm3668632jai.122.2023.02.06.07.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 07:08:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 08:08:47 -0700
Message-Id: <20230206150847.3621475-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Eif3ulbn/xolaNSAv/0Pp0cteR7l0H4maZ4cu/QjmSs=;
 b=ac2Pmp73yv9sgknJGFttgVUl1iW1++7rEzXzPmK2i0xmsMtHxWUZb3AwbluF91bT3e
 csaUvF0ajGsxVMMimI7dovMaO+vigrvWPbgQkDRgnjLwXPQYxx5nhe5mtEbOzh1rZqR6
 /XaSj88jImgX70jX0yDwbPmwdVKMtFczzkQToBsXcGTA2IKI1D6nMy5N8ZaSvt1BiOCf
 h+IO6oeC1Ug2Dnjj62nshdysjGv7arhRq6FnlmEs9o3TVBEKgTDzUbdbxswCZo7TQ2pw
 jy+NuibdMQdvSepJklNSNIYpUV/9CubvjTljVSWpiyGV+88NjlOo89OJsvZ1Oy+VUY2n
 XAZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ac2Pmp73
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: switch to async/await
 format
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This requires python 3.6 or newer but is a bit cleaner.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/genrandconfig | 62 +++++++++++++++++----------------------------
 1 file changed, 23 insertions(+), 39 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index b3576f8a51..8947898d88 100755
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
@@ -654,8 +645,7 @@ def fixup_config(sysinfo, configfile):
     return True
 
 
-@coroutine
-def gen_config(args):
+async def gen_config(args):
     """Generate a new random configuration
 
     This function generates the configuration, by choosing a random
@@ -713,8 +703,7 @@ def gen_config(args):
 
     # Randomly enable BR2_REPRODUCIBLE 10% of times
     # also enable tar filesystem images for testing
-    has_diffoscope = yield from sysinfo.has("diffoscope")
-    if has_diffoscope and randint(0, 10) == 0:
+    if await sysinfo.has("diffoscope") and randint(0, 10) == 0:
         configlines.append("BR2_REPRODUCIBLE=y\n")
         configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
 
@@ -728,14 +717,13 @@ def gen_config(args):
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
@@ -749,37 +737,33 @@ def gen_config(args):
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
