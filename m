Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098CFC43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 15:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEA024097A;
	Tue, 14 Jun 2022 15:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtTYLNUSJAy4; Tue, 14 Jun 2022 15:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B2724091C;
	Tue, 14 Jun 2022 15:45:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 388231BF4D7
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79FC960B19
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AE98pAK6TByW for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 15:44:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFC6560C29
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 15:44:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0651286FFB; Tue, 14 Jun 2022 15:32:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 17:28:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34676320a212fc5bd9753aed1a78d1e40e6859fa
X-Git-Newrev: 3c11e6f3c8de5482ddb36809b129179022f520a1
X-Patchwork-Hint: ignore
Message-Id: <20220614153201.0651286FFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 check that toolchains exists for a certain arch
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c11e6f3c8de5482ddb36809b129179022f520a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 support/scripts/gen-bootlin-toolchains | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index ad65f9fe5e..36727c8fea 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -4,6 +4,7 @@ import os.path
 import re
 import requests
 import textwrap
+import sys
 
 BASE_URL = "https://toolchains.bootlin.com/downloads/releases/toolchains"
 
@@ -483,6 +484,10 @@ def get_toolchains():
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
