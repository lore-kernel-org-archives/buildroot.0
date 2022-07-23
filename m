Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC6DC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1D2E84020;
	Sat, 23 Jul 2022 16:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1D2E84020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zBI9pYfr1t-L; Sat, 23 Jul 2022 16:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00F0583F9E;
	Sat, 23 Jul 2022 16:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00F0583F9E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71A091BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A95EB84BFC
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A95EB84BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7YhOU7jEWmV for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D01A784BFD
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D01A784BFD
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 942C3847EF; Sat, 23 Jul 2022 16:44:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 18:57:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b29d6dc77304db19a4a6cb82f05d30ab68abf78
X-Git-Newrev: bb2e5e2f76508cfccf6315e142601d3ccc790522
X-Patchwork-Hint: ignore
Message-Id: <20220723164412.942C3847EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbsd: fix sh4aeb build
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb2e5e2f76508cfccf6315e142601d3ccc790522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following sh4aeb build failure:

In file included from nlist.c:44:
nlist.c: In function '__elf_is_okay__':
local-elf.h:223:25: error: 'ELFDATA2LMSB' undeclared (first use in this function); did you mean 'ELFDATA2LSB'?
  223 | #define ELF_TARG_DATA   ELFDATA2LMSB
      |                         ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2980fb79c208454195d77383f1ece9afbd7f981b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-src-local-elf.h-fix-big-endian-sh.patch   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch b/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch
new file mode 100644
index 0000000000..8612d268f8
--- /dev/null
+++ b/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch
@@ -0,0 +1,39 @@
+From 93c9f8aa72349a4fe33e2a732100c76f3904eb80 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 7 Jun 2022 19:27:13 +0200
+Subject: [PATCH] src/local-elf.h: fix big endian sh
+
+Fix the following build failure with big endian sh (e.g. sh4aeb):
+
+In file included from nlist.c:44:
+nlist.c: In function '__elf_is_okay__':
+local-elf.h:223:25: error: 'ELFDATA2LMSB' undeclared (first use in this function); did you mean 'ELFDATA2LSB'?
+  223 | #define ELF_TARG_DATA   ELFDATA2LMSB
+      |                         ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2980fb79c208454195d77383f1ece9afbd7f981b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/libbsd/libbsd/-/merge_requests/19]
+---
+ src/local-elf.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/local-elf.h b/src/local-elf.h
+index 1dd3b42..8c4794f 100644
+--- a/src/local-elf.h
++++ b/src/local-elf.h
+@@ -230,7 +230,7 @@
+ #if defined(__LITTLE_ENDIAN__)
+ #define ELF_TARG_DATA	ELFDATA2LSB
+ #elif defined(__BIG_ENDIAN__)
+-#define ELF_TARG_DATA	ELFDATA2LMSB
++#define ELF_TARG_DATA	ELFDATA2MSB
+ #else
+ #error Unknown SH endianness
+ #endif
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
