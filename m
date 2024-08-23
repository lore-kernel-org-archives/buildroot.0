Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCD2C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9676C8134F;
	Fri, 23 Aug 2024 17:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwsHEezMmmNG; Fri, 23 Aug 2024 17:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88CCF81A50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88CCF81A50;
	Fri, 23 Aug 2024 17:40:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A31BC1BF34F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C7F0412D0
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5EcDMcBaOoM for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 885544129C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 885544129C
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:40:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 738F78649B; Fri, 23 Aug 2024 17:40:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:40:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65247fcc6a12eb2443ae9861e7cd36b3881a466e
X-Git-Newrev: ea6bb507b1d3841be052525936121f7e88c43fbd
X-Patchwork-Hint: ignore
Message-Id: <20240823174035.738F78649B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: allow overriding
 KCONFIG_PROBABILITY
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ea6bb507b1d3841be052525936121f7e88c43fbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tweaking this variable should allow us to get better coverage of
packages with larger dependency trees.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index ae1f0f85de..282a9ebdea 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -542,7 +542,7 @@ async def gen_config(args):
         proc = await asyncio.create_subprocess_exec(
             "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
             "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
-            "KCONFIG_PROBABILITY=%d" % randint(1, 20),
+            "KCONFIG_PROBABILITY=%d" % args.probability,
             "randconfig",
             stdout=asyncio.subprocess.DEVNULL,
             stderr=asyncio.subprocess.DEVNULL)
@@ -603,6 +603,21 @@ async def gen_config(args):
 
 if __name__ == '__main__':
     import argparse
+
+    class Range(argparse.Action):
+        def __init__(self, minimum=None, maximum=None, *args, **kwargs):
+            self.min = minimum
+            self.max = maximum
+            kwargs["metavar"] = "[%d-%d]" % (self.min, self.max)
+            super(Range, self).__init__(*args, **kwargs)
+
+        def __call__(self, parser, namespace, value, option_string=None):
+            if not (self.min <= value <= self.max):
+                msg = 'invalid choice: %r (choose from [%d-%d])' % \
+                    (value, self.min, self.max)
+                raise argparse.ArgumentError(self, msg)
+            setattr(namespace, self.dest, value)
+
     parser = argparse.ArgumentParser(description="Generate a random configuration")
     parser.add_argument("--outputdir", "-o",
                         help="Output directory (relative to current directory)",
@@ -610,6 +625,10 @@ if __name__ == '__main__':
     parser.add_argument("--buildrootdir", "-b",
                         help="Buildroot directory (relative to current directory)",
                         type=str, default='.')
+    parser.add_argument("--probability", "-p",
+                        help="Override the KCONFIG_PROBABILITY value",
+                        type=int, action=Range, minimum=0, maximum=100,
+                        default=randint(1, 20))
     parser.add_argument("--toolchains-csv", help="Legacy, unused", type=str)
     parser.add_argument("--no-toolchains-csv", help="Legacy, unused", type=bool)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
