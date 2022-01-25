Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CC6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 07:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A14184CE3;
	Tue, 25 Jan 2022 07:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTYm0AfIt4jA; Tue, 25 Jan 2022 07:56:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F5CD84CE4;
	Tue, 25 Jan 2022 07:56:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BB221BF2CC
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3014840A91
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZH5HxeUzc9X for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B1CF400FB
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 378B082774; Tue, 25 Jan 2022 07:49:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 08:40:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7910b5e72df6e9b6c1dc6d3f041cf154668bd3b2
X-Git-Newrev: 93cb79318147191bf3b9fc2b047c24095f3194bc
X-Patchwork-Hint: ignore
Message-Id: <20220125074920.378B082774@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 add support for new x86-64 toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=93cb79318147191bf3b9fc2b047c24095f3194bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the merge of
d6ce2a16814fd96a45888a774da6a4db74cd540a ("arch/Config.in.x86: add
option for -march=x86-64") and
eeace1cc13ce09a0c88ce177465b836d6eb58298 ("arch/Config.in.x86: add support for
x86-64-v2, x86-64-v3, x86-64-v4"), bootlin.toolchains.com now provides
toolchains targetting the x86-64, x86-64-v2, x86-64-v3 and x86-64-v4
architecture variants.

This commits modifies gen-bootlin-toolchains to support these
toolchains. It should be noted that the description for the x86-64-v3
and x86-64-v4 toolchains are for now the same, as Buildroot doesn't
yet have the options to describe the extra features that x86-64-v4
expects to find on the hardware platform.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/gen-bootlin-toolchains | 48 ++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index f160a44152..a42ddb4097 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -178,6 +178,54 @@ arches = {
         'conditions': ['BR2_sparc', 'BR2_sparc_v8'],
         'prefix': 'sparc',
     },
+    'x86-64': {
+        'conditions': ['BR2_x86_64',
+                       'BR2_X86_CPU_HAS_MMX',
+                       'BR2_X86_CPU_HAS_SSE',
+                       'BR2_X86_CPU_HAS_SSE2'],
+        'test_options': ['BR2_x86_64', 'BR2_x86_x86_64'],
+        'prefix': 'x86_64',
+    },
+    'x86-64-v2': {
+        'conditions': ['BR2_x86_64',
+                       'BR2_X86_CPU_HAS_MMX',
+                       'BR2_X86_CPU_HAS_SSE',
+                       'BR2_X86_CPU_HAS_SSE2',
+                       'BR2_X86_CPU_HAS_SSE3',
+                       'BR2_X86_CPU_HAS_SSSE3',
+                       'BR2_X86_CPU_HAS_SSE4',
+                       'BR2_X86_CPU_HAS_SSE42'],
+        'test_options': ['BR2_x86_64', 'BR2_x86_x86_64_v2'],
+        'prefix': 'x86_64',
+    },
+    'x86-64-v3': {
+        'conditions': ['BR2_x86_64',
+                       'BR2_X86_CPU_HAS_MMX',
+                       'BR2_X86_CPU_HAS_SSE',
+                       'BR2_X86_CPU_HAS_SSE2',
+                       'BR2_X86_CPU_HAS_SSE3',
+                       'BR2_X86_CPU_HAS_SSSE3',
+                       'BR2_X86_CPU_HAS_SSE4',
+                       'BR2_X86_CPU_HAS_SSE42',
+                       'BR2_X86_CPU_HAS_AVX',
+                       'BR2_X86_CPU_HAS_AVX2'],
+        'test_options': ['BR2_x86_64', 'BR2_x86_x86_64_v3'],
+        'prefix': 'x86_64',
+    },
+    'x86-64-v4': {
+        'conditions': ['BR2_x86_64',
+                       'BR2_X86_CPU_HAS_MMX',
+                       'BR2_X86_CPU_HAS_SSE',
+                       'BR2_X86_CPU_HAS_SSE2',
+                       'BR2_X86_CPU_HAS_SSE3',
+                       'BR2_X86_CPU_HAS_SSSE3',
+                       'BR2_X86_CPU_HAS_SSE4',
+                       'BR2_X86_CPU_HAS_SSE42',
+                       'BR2_X86_CPU_HAS_AVX',
+                       'BR2_X86_CPU_HAS_AVX2'],
+        'test_options': ['BR2_x86_64', 'BR2_x86_x86_64_v4'],
+        'prefix': 'x86_64',
+    },
     'x86-64-core-i7': {
         'conditions': ['BR2_x86_64',
                        'BR2_X86_CPU_HAS_MMX',
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
