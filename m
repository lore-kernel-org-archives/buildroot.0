Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75895C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:01:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 404626023D
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 404626023D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AC1240179;
	Tue,  5 Oct 2021 14:01:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PkJuCL9BilZg; Tue,  5 Oct 2021 14:01:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2599B40772;
	Tue,  5 Oct 2021 14:01:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B6B21BF2A5
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BB2783D5C
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgvwWQa9Eqak for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 14:01:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AB2C8386E
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 14:01:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9CF3490340; Tue,  5 Oct 2021 13:58:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 15:29:43 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 7ae5a4a9d6280a571d5b4215ee6e2e6ac39bcabc
X-Git-Newrev: 1e9392b8bbeaed86be74e628584e2bca4092c80b
X-Patchwork-Hint: ignore
Message-Id: <20211005135859.9CF3490340@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/uboot-tools: fix
 static build with musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e9392b8bbeaed86be74e628584e2bca4092c80b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit 84a2723568871745a0a50504dc741d77bb8d5470)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/uboot-tools/0005-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch b/package/uboot-tools/0005-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch
new file mode 100644
index 0000000000..502458e219
--- /dev/null
+++ b/package/uboot-tools/0005-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
