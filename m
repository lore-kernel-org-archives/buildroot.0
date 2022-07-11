Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590BBC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 077B340AA7;
	Mon, 11 Jul 2022 17:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 077B340AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwOnMn3m9IAe; Mon, 11 Jul 2022 17:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D90AC40AA0;
	Mon, 11 Jul 2022 17:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D90AC40AA0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 545341BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CD84417AD
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CD84417AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ppMPmL89GShF for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31515416BF
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31515416BF
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 62A78837EA; Mon, 11 Jul 2022 17:15:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:13:52 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3c7c8fc1b6edab9505ca207ce2157f5cf48830ac
X-Git-Newrev: a9a3971550361f7cb8871800fcff52dfa8bfa0b9
X-Patchwork-Hint: ignore
Message-Id: <20220711171517.62A78837EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/scripts/gen-bootlin-toolchains: check that toolchains exists for a
 certain arch
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9a3971550361f7cb8871800fcff52dfa8bfa0b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The "arches" dict lists the architectures for which Bootlin toolchains
are available, along with the corresponding Buildroot conditions for
those architecture variants.

However, there is nothing that checks that such architectures really
have Bootlin toolchains available. Even if no toolchain is available,
the architecture is considered as support, and will be listed in the
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS option, making menuconfig
believe that some Bootlin toolchain is available for the selected
architecture variant.

This is currently the case with the "mips64" architecture (as
identified by the Bootlin toolchains project). Such toolchains have
been made obsolete in toolchains.bootlin.com and replaced by the
mips64-n32 toolchains. But "mips64" is still listed in "arches",
causing this architecture to be considered as having Bootlin
toolchains available.

To avoid this to happen in the future, this commit adds a check that
verifies that an architecture listed in "arches" really has at least
one toolchain available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 3c11e6f3c8de5482ddb36809b129179022f520a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/gen-bootlin-toolchains | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 48bd3e4d08..5ed6c1111a 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -4,6 +4,7 @@ import os.path
 import re
 import requests
 import textwrap
+import sys
 
 BASE_URL = "https://toolchains.bootlin.com/downloads/releases/toolchains"
 
@@ -479,6 +480,10 @@ def get_toolchains():
                 version = parts[2][len("bleeding-edge-"):]
             tmp[(arch, libc, variant)] = version
 
+        if len(tmp) == 0:
+            print("ERROR: no toolchains found for architecture %s" % arch)
+            sys.exit(1)
+
         toolchains += [Toolchain(k[0], k[1], k[2], v) for k, v in tmp.items()]
 
     return toolchains
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
