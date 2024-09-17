Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAE0CAC5A2
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB379614E3;
	Tue, 17 Sep 2024 21:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9VwNfRnaR2B; Tue, 17 Sep 2024 21:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D315614F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D315614F6;
	Tue, 17 Sep 2024 21:09:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 175D31BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F22E44018F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOBQnDuvWC9w for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0B044026F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0B044026F
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10C50838FA; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:16:20 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 439eaa9d106090426f2043ba980d7b007539ab35
X-Git-Newrev: d22b11c0935f42fcb4aea305f4f817f102e50be9
X-Patchwork-Hint: ignore
Message-Id: <20240917210908.10C50838FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/genrandconfig:
 remove support for toolchain CSV
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

commit: https://git.buildroot.net/buildroot/commit/?id=d22b11c0935f42fcb4aea305f4f817f102e50be9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Now that the support for generating a fully random configuration has
been well-tested, the whole mechanism based on a toolchain CSV isn't
really useful anymore, so let's drop it to simplify the logic.

Note that the autobuilder code still uses --{,no-}toolchains-csv, so we
can't remove those or the autobuilders would fail. Once all supported
branches no longer use those argumetns, we can drop them from the
autobuilder code, then ask people to update their runners, and we will
finally be able to drop those arguments. Eventually.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: keep --{,no-}toolchains-csv and explain why]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2f260084d5771728f3340ff6a86a23391133a635)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 101 +++-------------------------------------------------
 1 file changed, 4 insertions(+), 97 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index e660496fe5..6745507f7f 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -20,7 +20,6 @@
 
 from binascii import hexlify
 import asyncio
-import csv
 import os
 from random import randint
 import sys
@@ -100,73 +99,6 @@ class SystemInfo:
         return not missing_requirements
 
 
-def get_toolchain_configs(toolchains_csv, buildrootdir):
-    """Fetch and return the possible toolchain configurations
-
-    This function returns an array of toolchain configurations. Each
-    toolchain configuration is itself an array of lines of the defconfig.
-    """
-
-    with open(toolchains_csv) as r:
-        # filter empty lines and comments
-        lines = [t for t in r.readlines() if len(t.strip()) > 0 and t[0] != '#']
-        toolchains = lines
-    configs = []
-
-    (_, _, _, _, hostarch) = os.uname()
-    # ~2015 distros report x86 when on a 32bit install
-    if hostarch == 'i686' or hostarch == 'i386' or hostarch == 'x86':
-        hostarch = 'x86'
-
-    for row in csv.reader(toolchains):
-        config = {}
-        configfile = row[0]
-        config_hostarch = row[1]
-        keep = False
-
-        # Keep all toolchain configs that work regardless of the host
-        # architecture
-        if config_hostarch == "any":
-            keep = True
-
-        # Keep all toolchain configs that can work on the current host
-        # architecture
-        if hostarch == config_hostarch:
-            keep = True
-
-        # Assume that x86 32 bits toolchains work on x86_64 build
-        # machines
-        if hostarch == 'x86_64' and config_hostarch == "x86":
-            keep = True
-
-        if not keep:
-            continue
-
-        if not os.path.isabs(configfile):
-            configfile = os.path.join(buildrootdir, configfile)
-
-        with open(configfile) as r:
-            config = r.readlines()
-        configs.append(config)
-    return configs
-
-
-async def is_toolchain_usable(configfile, config):
-    """Check if the toolchain is actually usable."""
-
-    with open(configfile) as configf:
-        configlines = configf.readlines()
-
-    # Check that the toolchain configuration is still present
-    for toolchainline in config:
-        if toolchainline not in configlines:
-            print("WARN: toolchain can't be used", file=sys.stderr)
-            print("      Missing: %s" % toolchainline.strip(), file=sys.stderr)
-            return False
-
-    return True
-
-
 async def fixup_config(sysinfo, configfile):
     """Finalize the configuration and reject any problematic combinations
 
@@ -574,24 +506,11 @@ async def fixup_config(sysinfo, configfile):
 
 async def gen_config(args):
     """Generate a new random configuration
-
-    This function generates the configuration, by choosing a random
-    toolchain configuration and then generating a random selection of
-    packages.
     """
 
     sysinfo = SystemInfo()
 
-    if args.toolchains_csv:
-        # Select a random toolchain configuration
-        configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
-
-        i = randint(0, len(configs) - 1)
-        toolchainconfig = configs[i]
-    else:
-        toolchainconfig = []
-
-    configlines = list(toolchainconfig)
+    configlines = list()
 
     # Combine with the minimal configuration
     minimalconfigfile = os.path.join(args.buildrootdir,
@@ -650,9 +569,6 @@ async def gen_config(args):
     if ret:
         return ret
 
-    if not await is_toolchain_usable(configfile, toolchainconfig):
-        return 2
-
     # Now, generate the random selection of packages, and fixup
     # things if needed.
     # Safe-guard, in case we can not quickly come to a valid
@@ -668,7 +584,7 @@ async def gen_config(args):
             "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
             "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
             "KCONFIG_PROBABILITY=%d" % randint(1, 20),
-            "randpackageconfig" if args.toolchains_csv else "randconfig")
+            "randconfig")
         ret = await proc.wait()
         if ret:
             return ret
@@ -702,17 +618,8 @@ if __name__ == '__main__':
     parser.add_argument("--buildrootdir", "-b",
                         help="Buildroot directory (relative to current directory)",
                         type=str, default='.')
-
-    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
-    toolchains_csv.add_argument("--toolchains-csv",
-                                dest="toolchains_csv",
-                                help="Path of the toolchain configuration file",
-                                type=str)
-    toolchains_csv.add_argument("--no-toolchains-csv",
-                                dest="toolchains_csv",
-                                help="Generate random toolchain configuration",
-                                action='store_false')
-    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
+    parser.add_argument("--toolchains-csv", help="Legacy, unused", type=str)
+    parser.add_argument("--no-toolchains-csv", help="Legacy, unused")
 
     args = parser.parse_args()
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
