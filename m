Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55B9C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 07:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E03E60FEE;
	Wed,  8 Jun 2022 07:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnjdFzdLojzE; Wed,  8 Jun 2022 07:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FF3860FF8;
	Wed,  8 Jun 2022 07:12:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A4391BF3D2
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE3F283F4F
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjeDCZow_lhI for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 07:10:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0893483F4C
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 07:10:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 213F9FF804;
 Wed,  8 Jun 2022 07:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654672244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5kAP5+DAhfBc63h9BAEP3Bqqs5XnCbeLaP/41GmYMQ=;
 b=DHrRkk2arPyhZBqChpPaRFfZPvWTA414mrq1lmb0qQPTGOMYe34D30YYRSUsOJlh6hK8vQ
 EVJ9oognfjxGIMg+Nnn6RMw7lyKfEuzhfWxU7lKyLDxk4wMb/SikvXxoryfU5Yyr4JgpqZ
 NOF6txEhp5BpdPE91QDk8+mxbnpVkPdakM7+SU5d/rd++jZjSyS/TehO/4qWDQulQEIfgY
 P9n7MrPchxGLAHnvbMK9QhG6G0tbcaF+/tuXMVHlyFQSYSAivtIV0CU03feDfj/NE2X1Kj
 5A6NVL0+rj/RfrFS/flUgDShtPzajp7Q4sqEk1EsY8dgaPQNxRDbHtCEpweQ4w==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed,  8 Jun 2022 09:10:22 +0200
Message-Id: <20220608071027.3384469-11-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
References: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 10/14]
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
