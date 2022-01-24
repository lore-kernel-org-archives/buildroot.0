Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C1AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 23:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2877060EED;
	Mon, 24 Jan 2022 23:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UC1MVvba2Hc; Mon, 24 Jan 2022 23:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BE8460B09;
	Mon, 24 Jan 2022 23:01:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFB361BF3EC
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC71B60B09
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hVVIz8R-GMNz for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 23:01:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D083A60B03
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 23:01:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E943A40005;
 Mon, 24 Jan 2022 23:01:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Tue, 25 Jan 2022 00:01:00 +0100
Message-Id: <20220124230116.203218-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
References: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 02/16] support/scripts/gen-bootlin-toolchains:
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 support/scripts/gen-bootlin-toolchains | 48 ++++++++++++++++++++++++++
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
