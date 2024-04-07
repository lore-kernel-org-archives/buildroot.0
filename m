Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623A6CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28C5E415A9;
	Sun,  7 Apr 2024 16:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uq-tD5ZXbb74; Sun,  7 Apr 2024 16:05:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5727741685
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5727741685;
	Sun,  7 Apr 2024 16:05:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 740701BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DA094149D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AASUNUg9Skb7 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D416414A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D416414A1
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:05:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8467D85735; Sun,  7 Apr 2024 16:05:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 18:04:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3afff8d96ca1a042f195a59be3fc0633d3333f6
X-Git-Newrev: dd595d3b06a355f58efcc547ff1f001dd55c99c6
X-Patchwork-Hint: ignore
Message-Id: <20240407160511.8467D85735@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcf-agent: fix x86 build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dd595d3b06a355f58efcc547ff1f001dd55c99c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following x86 build failure raised since bump to version 1.8.0
in commit 81802e263a12e173e0e1028449d1e1e11b2e5974 and
https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/commit/8df5540c53b862d516ac25f908c2fff4a547b4a6:

/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'unpack_elf_symbol_info':
/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: error: 'STT_ARM_16BIT' undeclared (first use in this function)
 2079 |         if (info->type == STT_ARM_16BIT) {
      |                           ^~~~~~~~~~~~~
/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: note: each undeclared identifier is reported only once for each function it appears in
/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'create_symbol_addr_search_index':
/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2228:78: error: 'STT_ARM_16BIT' undeclared (first use in this function)
 2228 |                     if (type == STT_FUNC || type == STT_ARM_TFUNC || type == STT_ARM_16BIT) {
      |                                                                              ^~~~~~~~~~~~~

Fixes: 81802e263a12e173e0e1028449d1e1e11b2e5974
 - http://autobuild.buildroot.org/results/8388acf59689ed7e621bdf158483e3df1cf9bef7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...gent-tcf-services-tcf_elf.c-fix-x86-build.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch b/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch
new file mode 100644
index 0000000000..5f08fa485e
--- /dev/null
+++ b/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch
@@ -0,0 +1,60 @@
+From 0a847ca035113540ee44d17f364bf4701fe78355 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 1 Mar 2024 22:31:05 +0100
+Subject: [PATCH] agent/tcf/services/tcf_elf.c: fix x86 build
+
+Fix the following x86 build failure raised since version 1.8.0 and
+https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/commit/8df5540c53b862d516ac25f908c2fff4a547b4a6:
+
+/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'unpack_elf_symbol_info':
+/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: error: 'STT_ARM_16BIT' undeclared (first use in this function)
+ 2079 |         if (info->type == STT_ARM_16BIT) {
+      |                           ^~~~~~~~~~~~~
+/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: note: each undeclared identifier is reported only once for each function it appears in
+/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'create_symbol_addr_search_index':
+/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2228:78: error: 'STT_ARM_16BIT' undeclared (first use in this function)
+ 2228 |                     if (type == STT_FUNC || type == STT_ARM_TFUNC || type == STT_ARM_16BIT) {
+      |                                                                              ^~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8388acf59689ed7e621bdf158483e3df1cf9bef7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/merge_requests/1
+---
+ agent/tcf/services/tcf_elf.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/agent/tcf/services/tcf_elf.c b/agent/tcf/services/tcf_elf.c
+index 1b3900ec..b0b948e4 100644
+--- a/agent/tcf/services/tcf_elf.c
++++ b/agent/tcf/services/tcf_elf.c
+@@ -2076,10 +2076,12 @@ void unpack_elf_symbol_info(ELF_Section * sym_sec, U4_T index, ELF_SymbolInfo *
+     }
+ 
+     if (file->machine == EM_ARM) {
++#ifdef STT_ARM_16BIT
+         if (info->type == STT_ARM_16BIT) {
+             info->type = STT_OBJECT;
+             info->type16bit = 1;
+         }
++#endif
+         if (info->type == STT_ARM_TFUNC) {
+             info->type = STT_FUNC;
+             info->type16bit = 1;
+@@ -2225,7 +2227,11 @@ static void create_symbol_addr_search_index(ELF_Section * sec) {
+                 }
+                 add = add && type != STT_GNU_IFUNC;
+                 if (add && file->machine == EM_ARM) {
+-                    if (type == STT_FUNC || type == STT_ARM_TFUNC || type == STT_ARM_16BIT) {
++                    if (type == STT_FUNC || type == STT_ARM_TFUNC
++#ifdef STT_ARM_16BIT
++                     || type == STT_ARM_16BIT
++#endif
++                     ) {
+                         addr = addr & ~(U8_T)1;
+                     }
+                 }
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
