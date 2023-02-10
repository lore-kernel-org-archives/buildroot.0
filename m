Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D29CC05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 15:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38E5C822FB;
	Fri, 10 Feb 2023 15:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38E5C822FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeZcjzB51BB1; Fri, 10 Feb 2023 15:32:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60A65822EC;
	Fri, 10 Feb 2023 15:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60A65822EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC2AD1BF976
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 15:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1FC0419BC
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 15:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1FC0419BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2UWN9CZsaQpr for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 15:31:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDDE4419B2
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 15:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDDE4419B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A918184F2D; Fri, 10 Feb 2023 15:31:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 16:26:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57e297a215193c92f6a178139db53616f2ee23b5
X-Git-Newrev: 16e5c92ff5fd2b44a1126bd7d7538c68ce838213
X-Patchwork-Hint: ignore
Message-Id: <20230210153148.A918184F2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: Build with ninja
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

commit: https://git.buildroot.net/buildroot/commit/?id=16e5c92ff5fd2b44a1126bd7d7538c68ce838213
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Webkitgtk needs cmake >= 3.20 when building with the make backend since
webkitgtk 3.8.0.

Cmake 3.20 is above our minimal version in
support/dependencies/check-host-cmake.mk, so this breaks builds on hosts
with cmake >= 3.18 < 3.20 - So use the ninja backend instead.

https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index b42ac3b644..a6974db926 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -139,4 +139,23 @@ ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
+# webkitgtk needs cmake >= 3.20 when not building with ninja, which is
+# above our minimal version in
+# support/dependencies/check-host-cmake.mk, so use the ninja backend:
+# https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f
+WEBKITGTK_CONF_OPTS += -GNinja
+WEBKITGTK_DEPENDENCIES += host-ninja
+
+define WEBKITGTK_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(WEBKITGTK_BUILDDIR)
+endef
+
+define WEBKITGTK_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
+endef
+
+define WEBKITGTK_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
+endef
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
