Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD23C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 12:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C409F60E35;
	Fri, 16 Aug 2024 12:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yn03wYi9dhqP; Fri, 16 Aug 2024 12:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C988660752
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C988660752;
	Fri, 16 Aug 2024 12:06:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2440E1BF37E
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 12:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1208840567
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 12:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5Trvo_jNT2i for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 12:06:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9405A40129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9405A40129
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9405A40129
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 12:06:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 191611C000B;
 Fri, 16 Aug 2024 12:06:43 +0000 (UTC)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 16 Aug 2024 14:06:29 +0200
Message-ID: <20240816120635.606346-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816120635.606346-1-thomas.petazzoni@bootlin.com>
References: <20240816120635.606346-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723810003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFUrhiEMqgMzs8vkZxutwRmvT31N9GsvVLxQaMqF4E4=;
 b=W83Jr8S2aledLk6mC+9fvdMAOW2DTua48IZASZ9w5Uw6lCOa3qsdd2grPM05WlKA4nqKUA
 nM6cjNv5Py+qlcsxqE1g+0p6ePnV4fP9rZO+9c5u5bXPnnC+dLfcR9mN/VMInGuWeJvBMo
 kBXwJ9ejJXi0s/6RqueB+U4Zv3F702+zq+r71DG1ijP872QxhIrLB42xus3Ac24z7ocPQ1
 cOm4B2I2jmU4Ed02qW1AGKiI3TPglE+YMPx4ma9MjX1vh9D/uHx3QDRXQ8PmQlymvRcpEr
 Qne9s3tOBRREPDJuHYejPBolg5VrTvixLhGNG9Lc+UsgnRj/4pRpV/OB6aQy0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W83Jr8S2
Subject: [Buildroot] [PATCH 2/5] utils/genrandconfig: remove support for
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that the support for generating a fully random configuration has
been well-tested, the whole mechanism based on a toolchain CSV isn't
really useful anymore, so let's drop it to simplify the logic.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 99 +--------------------------------------------
 1 file changed, 2 insertions(+), 97 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index cefc3dca12..ee094824fd 100755
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
@@ -711,17 +627,6 @@ if __name__ == '__main__':
                         help="Buildroot directory (relative to current directory)",
                         type=str, default='.')
 
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
-
     args = parser.parse_args()
 
     # We need the absolute path to use with O=, because the relative
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
