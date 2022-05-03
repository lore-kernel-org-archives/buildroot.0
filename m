Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2535AC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9612B417A8;
	Tue,  3 May 2022 20:31:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Szn8gXastyU7; Tue,  3 May 2022 20:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4DD54171C;
	Tue,  3 May 2022 20:31:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76B151BF9B2
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6642580C34
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DjdMDl44Nrq5 for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:31:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B964580C33
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:31:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 63713854F4; Tue,  3 May 2022 20:20:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 May 2022 22:20:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4dd01598c227c028c39c90b806e0ffa3b817cafe
X-Git-Newrev: fe740dcac8b065e4d52674b84cd3ff4e65959442
X-Patchwork-Hint: ignore
Message-Id: <20220503202054.63713854F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: use high quality
 random for KCONFIG_SEED
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe740dcac8b065e4d52674b84cd3ff4e65959442
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Internally genrandconfig will use gettimeofday when generating a
KCONFIG_SEED, since autobuild-run executes genrandconfig at the same
time for multiple autobuilder runners this could potentially result
in the same KCONFIG_SEED being generated for those test runs started
at the same time.

To ensure this doesn't happen set the KCONFIG_SEED using the urandom
entropy source.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/genrandconfig | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 70af84f002..8ed2783a6d 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -18,6 +18,7 @@
 
 # This script generates a random configuration for testing Buildroot.
 
+from binascii import hexlify
 import contextlib
 import csv
 import os
@@ -605,9 +606,13 @@ def gen_config(args):
                   file=sys.stderr)
             return 1
         bounded_loop -= 1
-        subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                               "KCONFIG_PROBABILITY=%d" % randint(1, 20),
-                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
+        make_rand = [
+            "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
+            "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
+            "KCONFIG_PROBABILITY=%d" % randint(1, 20),
+            "randpackageconfig" if args.toolchains_csv else "randconfig"
+        ]
+        subprocess.check_call(make_rand)
 
         if fixup_config(sysinfo, configfile):
             break
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
