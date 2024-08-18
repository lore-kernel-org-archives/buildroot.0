Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB58C531DF
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 10:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 742D680F52;
	Sun, 18 Aug 2024 10:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJXlyjGjb3Qs; Sun, 18 Aug 2024 10:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0929080F55
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0929080F55;
	Sun, 18 Aug 2024 10:11:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 544BE1BF8C7
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 10:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 417A74023F
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 10:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u188r9nQRf5S for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 10:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12BE040194
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12BE040194
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 10:11:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2FB885FD8; Sun, 18 Aug 2024 10:11:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 12:08:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da5c25c9f91b17a3c00ff0b35164881f2d1aa425
X-Git-Newrev: ce3dedc26b9080399c44d86e14aa1704f7bf563a
X-Patchwork-Hint: ignore
Message-Id: <20240818101127.F2FB885FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: improve logging
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce3dedc26b9080399c44d86e14aa1704f7bf563a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Right now, genrandconfig just spits out the random messages from the
different make invocations, which isn't terribly useful. Instead,
let's redirect the output of make invocations to oblivion, and add
some more high level logging.

As part of this logging, we're interested to see how many iterations
were needed to find a valid configuration, so changed the loop logic
to count from 0 to 100 instead of from 100 to 0 so that we can easily
show the iteration number.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 3e17819325..8e60fd3f9e 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -531,23 +531,27 @@ async def gen_config(args):
     # things if needed.
     # Safe-guard, in case we can not quickly come to a valid
     # configuration: allow at most 100 (arbitrary) iterations.
-    bounded_loop = 100
+    loop = 0
     while True:
-        if bounded_loop == 0:
+        if loop == 100:
             print("ERROR: cannot generate random configuration after 100 iterations",
                   file=sys.stderr)
             return 1
-        bounded_loop -= 1
+        print("Generating configuration, loop %d" % loop)
+        loop += 1
         proc = await asyncio.create_subprocess_exec(
             "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
             "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
             "KCONFIG_PROBABILITY=%d" % randint(1, 20),
-            "randconfig")
+            "randconfig",
+            stdout=asyncio.subprocess.DEVNULL,
+            stderr=asyncio.subprocess.DEVNULL)
         ret = await proc.wait()
         if ret:
             return ret
 
         if await fixup_config(sysinfo, configfile):
+            print("  configuration valid")
             break
 
     configlines = list()
@@ -570,20 +574,30 @@ async def gen_config(args):
     with open(configfile, "a") as configf:
         configf.writelines(configlines)
 
+    print("  olddefconfig")
     proc = await asyncio.create_subprocess_exec(
-        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig",
+        stdout=asyncio.subprocess.DEVNULL,
+        stderr=asyncio.subprocess.DEVNULL)
     ret = await proc.wait()
     if ret:
         return ret
 
+    print("  savedefconfig")
     proc = await asyncio.create_subprocess_exec(
-        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "savedefconfig")
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "savedefconfig",
+        stdout=asyncio.subprocess.DEVNULL,
+        stderr=asyncio.subprocess.DEVNULL)
+
     ret = await proc.wait()
     if ret:
         return ret
 
+    print("  dependencies")
     proc = await asyncio.create_subprocess_exec(
-        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "dependencies")
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "dependencies",
+        stdout=asyncio.subprocess.DEVNULL,
+        stderr=asyncio.subprocess.DEVNULL)
     return await proc.wait()
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
