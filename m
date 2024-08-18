Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD1EC531DF
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 10:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D21DF80F5A;
	Sun, 18 Aug 2024 10:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evhty2u72kCV; Sun, 18 Aug 2024 10:11:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 701F680F5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 701F680F5B;
	Sun, 18 Aug 2024 10:11:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4BA81BF297
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 10:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9095E605AD
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 10:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQzr92zCnNcZ for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 10:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3735F605AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3735F605AA
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 10:11:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEE9B85FD1; Sun, 18 Aug 2024 10:11:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 12:07:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e3388256811c943d8312db289959b74cae9536e
X-Git-Newrev: 2f260084d5771728f3340ff6a86a23391133a635
X-Patchwork-Hint: ignore
Message-Id: <20240818101127.CEE9B85FD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: remove support for
 toolchain CSV
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f260084d5771728f3340ff6a86a23391133a635
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 utils/genrandconfig | 101 +++-------------------------------------------------
 1 file changed, 4 insertions(+), 97 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index cefc3dca12..668cf012cf 100755
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
 
@@ -581,24 +513,11 @@ async def fixup_config(sysinfo, configfile):
 
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
@@ -658,9 +577,6 @@ async def gen_config(args):
     if ret:
         return ret
 
-    if not await is_toolchain_usable(configfile, toolchainconfig):
-        return 2
-
     # Now, generate the random selection of packages, and fixup
     # things if needed.
     # Safe-guard, in case we can not quickly come to a valid
@@ -676,7 +592,7 @@ async def gen_config(args):
             "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
             "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
             "KCONFIG_PROBABILITY=%d" % randint(1, 20),
-            "randpackageconfig" if args.toolchains_csv else "randconfig")
+            "randconfig")
         ret = await proc.wait()
         if ret:
             return ret
@@ -710,17 +626,8 @@ if __name__ == '__main__':
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
