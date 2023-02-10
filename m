Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7984DC6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 258044F58A;
	Tue, 21 Feb 2023 00:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 258044F58A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ONBXB4_RM_nK; Tue, 21 Feb 2023 00:45:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E598A4F5B7;
	Tue, 21 Feb 2023 00:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E598A4F5B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7BC01BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5629441808
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5629441808
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tW7phwrA9Mhk for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 755A7417E3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 755A7417E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65A9486495; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 16:26:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 57e297a215193c92f6a178139db53616f2ee23b5
X-Git-Newrev: 16e5c92ff5fd2b44a1126bd7d7538c68ce838213
X-Patchwork-Hint: ignore
Message-Id: <20230220205257.65A9486495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/webkitgtk: Build with
 ninja
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
