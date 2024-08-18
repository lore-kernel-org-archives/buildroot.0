Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9110AC5320E
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 09:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 565F180F4B;
	Sun, 18 Aug 2024 09:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vj8Lcq4n7W0s; Sun, 18 Aug 2024 09:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DC4B80F5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DC4B80F5B;
	Sun, 18 Aug 2024 09:04:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B486F1BF3F7
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A178280BC1
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZ7tsn93fVgn for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 09:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31D2280B7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31D2280B7E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31D2280B7E
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 09:03:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2689FFF805;
 Sun, 18 Aug 2024 09:03:49 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 18 Aug 2024 11:03:40 +0200
Message-ID: <20240818090346.947914-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818090346.947914-1-thomas.petazzoni@bootlin.com>
References: <20240818090346.947914-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723971829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFUrhiEMqgMzs8vkZxutwRmvT31N9GsvVLxQaMqF4E4=;
 b=Ic1NZO2xYxrtkkE0KWJCU4sEAra7YIewnmK0SbAwGuX8cn3uMjvihF54LWi9M94c9dbhbU
 GEFb93vMuE1gwAt1v9tDkjUV7S9wIBbuS4WMN+6lRHutxGVI/zlREwb/HBIkovG3jgsy6f
 SzxTfQOaUMcYkOViMfngy1K4rC5G//IuMcj0HjkSgWRCCWG+qNm4Xv/Hb9CS1GJj3lCuPi
 X8S0Wb+zkOOdoajf2EbNDPljeIcR1Fn929GgfkF0eZvr0rlXpeABeNcGFwvpUX/GiTt3in
 x0t0bGTPriXkIkhu3ekbrwC1Dm47wYSCqkvmArnV1ArRjkDTl5Dp/XmbdmoHrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ic1NZO2x
Subject: [Buildroot] [PATCH v2 2/5] utils/genrandconfig: remove support for
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
