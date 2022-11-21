Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89A9C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 543174046B;
	Mon, 21 Nov 2022 21:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 543174046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CquDjKwEbd3T; Mon, 21 Nov 2022 21:21:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8613C405D8;
	Mon, 21 Nov 2022 21:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8613C405D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76AB41BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 513F7409E7
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 513F7409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cLi2pTH4bu3h for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:20:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36940408A3
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36940408A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 235F884096; Mon, 21 Nov 2022 21:20:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 22:20:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea3e1696776187b55bbcaa49072cda49a43c32f5
X-Git-Newrev: 75cb8a490200e2480d1dcc2a2e59de0a575c1531
X-Patchwork-Hint: ignore
Message-Id: <20221121212053.235F884096@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: don't build
 igh-ethercat drivers
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

commit: https://git.buildroot.net/buildroot/commit/?id=75cb8a490200e2480d1dcc2a2e59de0a575c1531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

igh-ethercat comes with a small number of patched Linux kernel network
drivers, which aim at replacing the ones available in upstream Linux
kernel. All those drivers are provided only for specific kernel
releases. For example:

r8169-2.6.24-ethercat.c
r8169-2.6.24-orig.c
r8169-2.6.27-ethercat.c
r8169-2.6.27-orig.c
r8169-2.6.28-ethercat.c
r8169-2.6.28-orig.c
r8169-2.6.29-ethercat.c
r8169-2.6.29-orig.c
r8169-2.6.31-ethercat.c
r8169-2.6.31-orig.c
r8169-2.6.32-ethercat.c
r8169-2.6.32-orig.c
r8169-2.6.33-ethercat.c
r8169-2.6.33-orig.c
r8169-2.6.35-ethercat.c
r8169-2.6.35-orig.c
r8169-2.6.36-ethercat.c
r8169-2.6.36-orig.c
r8169-2.6.37-ethercat.c
r8169-2.6.37-orig.c
r8169-3.10-ethercat.c
r8169-3.10-orig.c
r8169-3.12-ethercat.c
r8169-3.12-orig.c
r8169-3.14-ethercat.c
r8169-3.14-orig.c
r8169-3.16-ethercat.c
r8169-3.16-orig.c
r8169-3.2-ethercat.c
r8169-3.2-orig.c
r8169-3.4-ethercat.c
r8169-3.4-orig.c
r8169-3.6-ethercat.c
r8169-3.6-orig.c
r8169-3.8-ethercat.c
r8169-3.8-orig.c
r8169-4.4-ethercat.c
r8169-4.4-orig.c

Obviously, this doesn't play well with the random configuration
testing done by utils/genrandconfig. This commit avoids this issue by
making sure we never build any of those drivers as part of the
genrandconfig generated configurations.

Fixes:

  http://autobuild.buildroot.net/results/07b7475d780c067d99ee5618a5fd2bb024a5b4e7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 9c6c2b359c..eccd3a228e 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -629,6 +629,13 @@ def fixup_config(sysinfo, configfile):
         configlines.append('BR2_PACKAGE_XVISOR_USE_DEFCONFIG=y\n')
         configlines.remove('BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n')
 
+    # Don't build igh-ethercat driver as they are highly
+    # kernel-version specific
+    for opt in ['8139TOO', 'E100', 'E1000', 'E1000E', 'R8169']:
+        optstr = 'BR2_PACKAGE_IGH_ETHERCAT_%s=y\n' % opt
+        if optstr in configlines:
+            configlines.remove(optstr)
+
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
