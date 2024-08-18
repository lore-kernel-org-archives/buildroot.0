Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B4DC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 10:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79F2180F3E;
	Sun, 18 Aug 2024 10:11:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtKFMq6Wc5ty; Sun, 18 Aug 2024 10:11:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3B3E80F41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3B3E80F41;
	Sun, 18 Aug 2024 10:11:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39FC31BF297
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 10:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34D7460661
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 10:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFHQ1OT3z0JC for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 10:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F3D9605AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F3D9605AD
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 10:11:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA9C685FD4; Sun, 18 Aug 2024 10:11:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 12:07:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f260084d5771728f3340ff6a86a23391133a635
X-Git-Newrev: 3d33d394c2c9659f8c487929bf45f7daf673e521
X-Patchwork-Hint: ignore
Message-Id: <20240818101127.DA9C685FD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: rework fine-tuning
 logic
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d33d394c2c9659f8c487929bf45f7daf673e521
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 utils/genrandconfig | 71 ++++++++++++++---------------------------------------
 1 file changed, 18 insertions(+), 53 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 668cf012cf..c83999a7cf 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -517,65 +517,15 @@ async def gen_config(args):
 
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
-    configlines.append("BR2_CURL=\"curl --ftp-pasv --retry 3 --insecure\"\n")
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
@@ -600,6 +550,21 @@ async def gen_config(args):
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
