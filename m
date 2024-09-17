Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC75CAC5A3
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D889610DC;
	Tue, 17 Sep 2024 21:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eawn4Kp8G7w3; Tue, 17 Sep 2024 21:09:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E70E614F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E70E614F6;
	Tue, 17 Sep 2024 21:09:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EF681BF969
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D834610C5
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAZeRBgXgTwS for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57E5460782
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57E5460782
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41AA283A80; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:19:25 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ef3f407a82c835e8e73997d89bff3520e6d15197
X-Git-Newrev: 82346f7c8ed987239e95e3778b87463709c0557c
X-Patchwork-Hint: ignore
Message-Id: <20240917210908.41AA283A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/genrandconfig:
 improve logging
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

commit: https://git.buildroot.net/buildroot/commit/?id=82346f7c8ed987239e95e3778b87463709c0557c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit ce3dedc26b9080399c44d86e14aa1704f7bf563a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 6ebb720ef7..06c26b0512 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -524,23 +524,27 @@ async def gen_config(args):
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
@@ -563,20 +567,30 @@ async def gen_config(args):
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
