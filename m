Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191EEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 07:15:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FAF961050
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 07:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FAF961050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A14840711;
	Thu, 23 Sep 2021 07:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXgfSB0b0ZTr; Thu, 23 Sep 2021 07:15:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06D9D40716;
	Thu, 23 Sep 2021 07:15:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4001C1BF9C2
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 07:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CE6141609
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 07:15:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gYad-C0eWGHz for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 07:15:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42D53415EC
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 07:15:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F1EB78CA55; Thu, 23 Sep 2021 07:12:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 23:20:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98503116b4c0dee6720eb7b12f8ea19e405fd7c3
X-Git-Newrev: 84a2723568871745a0a50504dc741d77bb8d5470
X-Patchwork-Hint: ignore
Message-Id: <20210923071255.F1EB78CA55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: fix static build with
 musl
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=84a2723568871745a0a50504dc741d77bb8d5470
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Static build with musl fails since bump to version 2020.04 in commit
fe97212976ea0b2a80fe1e076ad17d6f648cd1de because LDFLAGS, which contains
-static, is not passed resulting in the following build failure:

/tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: /tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0':
/tmp/instance-1/output-1/build/host-gcc-final-10.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499: undefined reference to `raise'
collect2: error: ld returned 1 exit status

Fixes:
 - http://autobuild.buildroot.org/results/d71aba27ff0c7711f2cb67261183506f25217a5f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch b/package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch
new file mode 100644
index 0000000000..502458e219
--- /dev/null
+++ b/package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch
@@ -0,0 +1,34 @@
+From 3b89170333ef0fdfffee14751ce3e1d66d7dfa00 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 14 Sep 2021 19:08:02 +0200
+Subject: [PATCH] tools/Makefile: fix {C,LD}FLAGS with CROSS_BUILD_TOOLS
+
+When CROSS_BUILD_TOOLS is set, set KBUILD_HOST{CF,LD}FLAGS to
+{C,LD}FLAGS otherwise CC will be used with HOST{C,LD}FLAGS which seems
+wrong.
+
+It should be noted that, for an unknown reason, overriding
+HOST{C,LD}FLAGS don't work.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 4a86321f64..98bb92990d 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -316,7 +316,8 @@ subdir- += env
+ 
+ ifneq ($(CROSS_BUILD_TOOLS),)
+ override HOSTCC = $(CC)
+-override HOSTCFLAGS = $(CFLAGS)
++override KBUILD_HOSTCFLAGS = $(CFLAGS)
++override KBUILD_HOSTLDFLAGS = $(LDFLAGS)
+ 
+ quiet_cmd_crosstools_strip = STRIP   $^
+       cmd_crosstools_strip = $(STRIP) $^; touch $@
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
