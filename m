Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C35CC52D7D
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 12:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74CE660E24;
	Fri, 16 Aug 2024 12:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eoJnJiS0W8uK; Fri, 16 Aug 2024 12:06:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 588CE60E3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 588CE60E3B;
	Fri, 16 Aug 2024 12:06:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 069F81BF37E
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 12:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E71B88415E
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 12:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WJ9Lk1KA577 for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 12:06:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8F0484144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8F0484144
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8F0484144
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 12:06:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 63B2E1C0005;
 Fri, 16 Aug 2024 12:06:44 +0000 (UTC)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 16 Aug 2024 14:06:30 +0200
Message-ID: <20240816120635.606346-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816120635.606346-1-thomas.petazzoni@bootlin.com>
References: <20240816120635.606346-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723810005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V7n3wcXD0g+ABV6Rr0m/xCGvs5lkHVDzuk3oYvuv9vY=;
 b=HG/v+sINSkC3AZXw1oamwCqV+lvALvErhBhcUCM3XclAJTVgK3ot2PdlYD5mtjsN4KBpXN
 doM3TA637YpfI4gfngCagxxaNzghyk4/VYfSe8Xur4JgwZ1xs3M5u4EEbvIjQorkNt8mKN
 iR46Z3URFiZNfBU5MafXFidf/KsmCEe06jYPxZHAzkJeVZdexAePYzY0VoRkmvDR7wPXSN
 4S6eVN+p3oUTJctCyYgPF1qI1g7Dg+uNObbw+FDxpn5NpULaNlJiC0qdf5LnEix0bsq11q
 hVFW3EAYNjPIOT0l6YWHyzv9W2BD614W0yp8nTE/BpQ3AMsNNG9/3pMV79NRpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HG/v+sIN
Subject: [Buildroot] [PATCH 3/5] utils/genrandconfig: rework fine-tuning
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
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
 utils/genrandconfig | 71 ++++++++++++---------------------------------
 1 file changed, 18 insertions(+), 53 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index ee094824fd..7dc50682c9 100755
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
+    with open(configfile, "w+") as configf:
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
