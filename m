Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8E8C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9F98406F4;
	Mon, 13 May 2024 20:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_de2kupLvdB; Mon, 13 May 2024 20:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7381E40707
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7381E40707;
	Mon, 13 May 2024 20:44:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCB501BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9F3C4012A
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbpqhRXxTCAO for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAD4A400B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAD4A400B8
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:44:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4F4387163; Mon, 13 May 2024 20:44:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 22:40:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c8bdef54213640e88b199466d1e504515c1a073
X-Git-Newrev: 36e417efc85141001df13a1e50f73dae682da4f3
X-Patchwork-Hint: ignore
Message-Id: <20240513204453.D4F4387163@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib-ng: fix riscv build with
 uclibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=36e417efc85141001df13a1e50f73dae682da4f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following riscv build failure with uclibc-ng < 1.0.43 raised
since bump to version 2.1.6 in commit
47b6737e841baf8b666ea9f37edc5f169652e88d and
https://github.com/zlib-ng/zlib-ng/commit/6ff8b52cefe56a824fae1d53fdd687bcde2e53c9:

/home/autobuild/autobuild/instance-2/output-1/build/zlib-ng-2.1.6/arch/riscv/riscv_features.c:4:10: fatal error: sys/auxv.h: No such file or directory
    4 | #include <sys/auxv.h>
      |          ^~~~~~~~~~~~

Fixes: 47b6737e841baf8b666ea9f37edc5f169652e88d
 - http://autobuild.buildroot.org/results/06a7d8e59ec4de7c711d3f4a4624f67b97d78afe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...h-riscv-riscv-features-c-fix-uclibc-build.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/zlib-ng/0001-arch-riscv-riscv-features-c-fix-uclibc-build.patch b/package/zlib-ng/0001-arch-riscv-riscv-features-c-fix-uclibc-build.patch
new file mode 100644
index 0000000000..39cc93f929
--- /dev/null
+++ b/package/zlib-ng/0001-arch-riscv-riscv-features-c-fix-uclibc-build.patch
@@ -0,0 +1,51 @@
+From 3f35bfccff2d1dacdfe9844712be1e042d028700 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 Mar 2024 21:56:53 +0100
+Subject: [PATCH] arch/riscv/riscv_features.c: fix uclibc build
+
+Fix the following uclibc build failure raised since version 2.1.4 and
+https://github.com/zlib-ng/zlib-ng/commit/6ff8b52cefe56a824fae1d53fdd687bcde2e53c9:
+
+/home/autobuild/autobuild/instance-2/output-1/build/zlib-ng-2.1.6/arch/riscv/riscv_features.c:4:10: fatal error: sys/auxv.h: No such file or directory
+    4 | #include <sys/auxv.h>
+      |          ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/06a7d8e59ec4de7c711d3f4a4624f67b97d78afe
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/zlib-ng/zlib-ng/commit/3f35bfccff2d1dacdfe9844712be1e042d028700
+---
+ arch/riscv/riscv_features.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/arch/riscv/riscv_features.c b/arch/riscv/riscv_features.c
+index 506b480c11..1e3f45e0a7 100644
+--- a/arch/riscv/riscv_features.c
++++ b/arch/riscv/riscv_features.c
+@@ -1,9 +1,12 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <sys/auxv.h>
+ #include <sys/utsname.h>
+ 
++#if defined(__linux__) && defined(HAVE_SYS_AUXV_H)
++#  include <sys/auxv.h>
++#endif
++
+ #include "../../zbuild.h"
+ #include "riscv_features.h"
+ 
+@@ -33,7 +36,11 @@ void Z_INTERNAL riscv_check_features_compile_time(struct riscv_cpu_features *fea
+ }
+ 
+ void Z_INTERNAL riscv_check_features_runtime(struct riscv_cpu_features *features) {
++#if defined(__linux__) && defined(HAVE_SYS_AUXV_H)
+     unsigned long hw_cap = getauxval(AT_HWCAP);
++#else
++    unsigned long hw_cap = 0;
++#endif
+     features->has_rvv = hw_cap & ISA_V_HWCAP;
+ }
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
