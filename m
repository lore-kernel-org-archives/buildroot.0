Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABC6C52D7D
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 12:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C705660E4E;
	Fri, 16 Aug 2024 12:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ifE-gQtzVT2; Fri, 16 Aug 2024 12:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7975960ED0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7975960ED0;
	Fri, 16 Aug 2024 12:07:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E8CB1BF37E
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 12:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFC6C4026A
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 12:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-XraT0uRpTb for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 12:06:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 48FA540296
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48FA540296
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48FA540296
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 12:06:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 948EF1C0009;
 Fri, 16 Aug 2024 12:06:46 +0000 (UTC)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 16 Aug 2024 14:06:32 +0200
Message-ID: <20240816120635.606346-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816120635.606346-1-thomas.petazzoni@bootlin.com>
References: <20240816120635.606346-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723810006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTBIVRc8JTiLMES8OyO1V4+Fn4nv2qFbwNMN3v4rR1o=;
 b=GMQjLYa25BFF0ccgrvjZ8wHI0KzqAKLSilwj4GfNT35/MB0AZbihZY5PmBwUwGWwB/0Hfa
 hBr4acfZijHIRC9Yrj5MOBJLtSIK//kCsQlBQJF8FfcAF5DMrPe6j8K3lcG59aM65qbyex
 T2ENNR/bDy0aQZD+aFduZZe3yetXzybI+Z3MRjjRMjnkOUsWJisAeX+GLmcaPK2TsjtBE5
 4ntTg/LU1eE5UoWoDUiWb+Cdj0NPBG8Z0bNBmbZxi2s8NxJsidtr0rdSoPk9awvQ2pt7f3
 RnRrFq+qEgzHvMABp9PSi5rgbIekgfcz6jsdG+yswcxi3m9LwBEtNHQM5Bf0hA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GMQjLYa2
Subject: [Buildroot] [PATCH 5/5] utils/genrandconfig: improve logging
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

Right now, genrandconfig just spits out the random messages from the
different make invocations, which isn't terribly useful. Instead,
let's redirect the output of make invocations to oblivion, and add
some more high level logging.

As part of this logging, we're interested to see how many iterations
were needed to find a valid configuration, so changed the loop logic
to count from 0 to 100 instead of from 100 to 0 so that we can easily
show the iteration number.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 7118807e9b..36a0381b64 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -531,23 +531,27 @@ async def gen_config(args):
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
@@ -570,20 +574,30 @@ async def gen_config(args):
     with open(configfile, "w+") as configf:
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
 
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
