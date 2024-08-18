Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ECAC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 09:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BD6080C00;
	Sun, 18 Aug 2024 09:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WT99eMMpRx1R; Sun, 18 Aug 2024 09:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8248380D90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8248380D90;
	Sun, 18 Aug 2024 09:03:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2771E1BF3F7
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15B4960661
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEx-BUgKqYs8 for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 09:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA22D60658
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA22D60658
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA22D60658
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 09:03:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id D69ACFF807;
 Sun, 18 Aug 2024 09:03:49 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 18 Aug 2024 11:03:41 +0200
Message-ID: <20240818090346.947914-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818090346.947914-1-thomas.petazzoni@bootlin.com>
References: <20240818090346.947914-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723971830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ElQ2A4TdJux4jKUyhGKnUWmdNizfwuY7HeYUTTd3DDU=;
 b=EZGhKvVU4sPBMa/Ris3qNdSHQale18A2STYiggx7xV7KtDJZu6VU04MdHMP4lNQ3hUbHmM
 T5oY9paWp+hbTDY8jWXOM3e1/wyLBg9ziycjpQc4mkG0FsMIWTGBq4QuWec5/x1OnYnK37
 54GRSnmCPTJD3kcL5bcozBmdhUqvrL3xqQufnM+WglDTXsCNP5t3NiusQGxzVDiLqkHC06
 SJ/wA0qK86NRzeD7tiUebPuD9X30ft4oI2kp2ORAS8usv6wv905YD0iAJR9TL/DGPAvl5n
 KMtwC8BxGD6KU1ezvdYNS4be+sNmdEpNKzh5sra2wgNWWoqoH8Nv06/GgxiiXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EZGhKvVU
Subject: [Buildroot] [PATCH v2 3/5] utils/genrandconfig: rework fine-tuning
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Changes since v1:

- Restore proper randomness. Indeed the tuning done *after* randconfig
  was done by overwriting the .config entirely, instead of appending
  to it (open mode was "w+", while it should have been "a")

 utils/genrandconfig | 71 ++++++++++++---------------------------------
 1 file changed, 18 insertions(+), 53 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index ee094824fd..0ccb6d83a6 100755
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
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
