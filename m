Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A0CC5320E
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 09:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6228380F24;
	Sun, 18 Aug 2024 09:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uokosLTsOrCb; Sun, 18 Aug 2024 09:04:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DF7B80D4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DF7B80D4F;
	Sun, 18 Aug 2024 09:04:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1496B1BF3F7
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F56E80B7E
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKmPH9sc9D_Q for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 09:03:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAD0B80B7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAD0B80B7C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAD0B80B7C
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 09:03:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 512D0FF806;
 Sun, 18 Aug 2024 09:03:51 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 18 Aug 2024 11:03:43 +0200
Message-ID: <20240818090346.947914-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818090346.947914-1-thomas.petazzoni@bootlin.com>
References: <20240818090346.947914-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723971831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBLNEeU8qjGxqEqMXoOqXASbqIbodq9Xg1inuSPSHjA=;
 b=Lb1bWPfFskCqQnAUfipe/497BiHOFpHrq1V9B8xajV6uL0Xqtjifbt+ESTV/AZ7XuQyDzg
 /SCbw7c92obywxjmUxNK6CQwvL90I6tfRcKoG31KOxq0wkoWjv7WUkUP++JELcX2G8pUIk
 7nWZDE0RQauZQhrrg70NLXgPsCqC+q5KpjduQEycGVVyIMc3K2XcYh1u2D2ptk31NYSyDd
 v5gnw8iHsj4BOeUCE2b3foKxh0sDQNnKxHb0VxeaJnSWx2ZIFXcFTmbVxlKczRf9BZE7P5
 aWTlqZ/+y27YVpGLnZN7CRYgvrSI+m+tEk6XfAiT4T9/kzfl2dANOqOtoCDk6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Lb1bWPfF
Subject: [Buildroot] [PATCH v2 5/5] utils/genrandconfig: improve logging
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
index 66296e1954..7ff47b12cc 100755
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
     with open(configfile, "a") as configf:
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
