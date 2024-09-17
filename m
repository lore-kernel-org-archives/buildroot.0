Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE448CAC5A2
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DE966113B;
	Tue, 17 Sep 2024 21:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RYfjpyVN_HV; Tue, 17 Sep 2024 21:09:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 937356113E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 937356113E;
	Tue, 17 Sep 2024 21:09:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F3D21BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B813614AE
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dFHtcyf3ks9 for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31C6F60616
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31C6F60616
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2005D83A63; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:18:18 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d22b11c0935f42fcb4aea305f4f817f102e50be9
X-Git-Newrev: 53b1a482f2773fda0776cfe52da258a341bebfc0
X-Patchwork-Hint: ignore
Message-Id: <20240917210908.2005D83A63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/genrandconfig:
 rework fine-tuning logic
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

commit: https://git.buildroot.net/buildroot/commit/?id=53b1a482f2773fda0776cfe52da258a341bebfc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Before calling randpackageconfig/randconfig, we were pre-generating a
snippet of .config with:

 (1) minimal.config
 (2) BR2_CURL/BR2_WGET settings
 (3) some random selection of init system, debug, runtime debug, etc
 (4) enabling BR2_REPRODUCIBLE=y when diffoscope was found

Now that we only use randconfig, this whole fine-tuning is completely
irrelevant, as it gets overridden by "make randconfig".

(1) and (3) above are useless, as randconfig does all the
randomization that is needed.

However, we want to preserve (2) and (4) above, so we re-implement
those fixups, but *after* randconfig has done its job.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3d33d394c2c9659f8c487929bf45f7daf673e521)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 70 ++++++++++++++---------------------------------------
 1 file changed, 18 insertions(+), 52 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 6745507f7f..d2e3ac36a8 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -510,64 +510,15 @@ async def gen_config(args):
 
     sysinfo = SystemInfo()
 
-    configlines = list()
-
-    # Combine with the minimal configuration
-    minimalconfigfile = os.path.join(args.buildrootdir,
-                                     'support/config-fragments/minimal.config')
-    with open(minimalconfigfile) as minimalf:
-        configlines += minimalf.readlines()
-
-    # Allow hosts with old certificates to download over https
-    configlines.append("BR2_WGET=\"wget -nd -t 3 --no-check-certificate\"\n")
-
-    # Per-package folder
-    if randint(0, 15) == 0:
-        configlines.append("BR2_PER_PACKAGE_DIRECTORIES=y\n")
-
-    # Amend the configuration with a few things.
-    if randint(0, 20) == 0:
-        configlines.append("BR2_ENABLE_DEBUG=y\n")
-    if randint(0, 20) == 0:
-        configlines.append("BR2_ENABLE_RUNTIME_DEBUG=y\n")
-    if randint(0, 1) == 0:
-        configlines.append("BR2_INIT_BUSYBOX=y\n")
-    elif randint(0, 15) == 0:
-        configlines.append("BR2_INIT_SYSTEMD=y\n")
-    elif randint(0, 10) == 0:
-        configlines.append("BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y\n")
-    if randint(0, 20) == 0:
-        configlines.append("BR2_STATIC_LIBS=y\n")
-    if randint(0, 20) == 0:
-        configlines.append("BR2_PACKAGE_PYTHON3_PY_ONLY=y\n")
-    if randint(0, 5) == 0:
-        configlines.append("BR2_OPTIMIZE_2=y\n")
-    if randint(0, 4) == 0:
-        configlines.append("BR2_SYSTEM_ENABLE_NLS=y\n")
-    if randint(0, 4) == 0:
-        configlines.append("BR2_FORTIFY_SOURCE_2=y\n")
-
-    # Randomly enable BR2_REPRODUCIBLE 10% of times
-    # also enable tar filesystem images for testing
-    if await sysinfo.has("diffoscope") and randint(0, 10) == 0:
-        configlines.append("BR2_REPRODUCIBLE=y\n")
-        configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
-
-    # Write out the configuration file
+    # Create output directory
     if not os.path.exists(args.outputdir):
         os.makedirs(args.outputdir)
+
+    # Calculate path to config file
     if args.outputdir == os.path.abspath(os.path.join(args.buildrootdir, "output")):
         configfile = os.path.join(args.buildrootdir, ".config")
     else:
         configfile = os.path.join(args.outputdir, ".config")
-    with open(configfile, "w+") as configf:
-        configf.writelines(configlines)
-
-    proc = await asyncio.create_subprocess_exec(
-        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
-    ret = await proc.wait()
-    if ret:
-        return ret
 
     # Now, generate the random selection of packages, and fixup
     # things if needed.
@@ -592,6 +543,21 @@ async def gen_config(args):
         if await fixup_config(sysinfo, configfile):
             break
 
+    configlines = list()
+
+    # Allow hosts with old certificates to download over https
+    configlines.append("BR2_WGET=\"wget -nd -t 3 --no-check-certificate\"\n")
+    configlines.append("BR2_CURL=\"curl --ftp-pasv --retry 3 --insecure\"\n")
+
+    # Randomly enable BR2_REPRODUCIBLE 10% of times
+    # also enable tar filesystem images for testing
+    if await sysinfo.has("diffoscope") and randint(0, 10) == 0:
+        configlines.append("BR2_REPRODUCIBLE=y\n")
+        configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
+
+    with open(configfile, "a") as configf:
+        configf.writelines(configlines)
+
     proc = await asyncio.create_subprocess_exec(
         "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
     ret = await proc.wait()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
