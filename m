Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5C4C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 20:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90593611BF;
	Tue, 28 Feb 2023 20:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90593611BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjoZRh9YDxFc; Tue, 28 Feb 2023 20:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4238611BE;
	Tue, 28 Feb 2023 20:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4238611BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05AA61BF870
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D4F9605D6
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D4F9605D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8wU_xYMVju8 for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 20:10:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 500F060AED
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 20:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 500F060AED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EC8386D8F; Tue, 28 Feb 2023 20:10:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 18:36:10 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4dfc6797e845678fff52bd7f2f16a2ce7f0af68f
X-Git-Newrev: 5048dfff7c72660d9e7fc934713ed43849fb6c4e
X-Patchwork-Hint: ignore
Message-Id: <20230228201056.3EC8386D8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wpewebkit: Build
 with ninja
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

commit: https://git.buildroot.net/buildroot/commit/?id=5048dfff7c72660d9e7fc934713ed43849fb6c4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Wpewebkit needs cmake >= 3.20 when building with the make backend since
wpewebkit 3.8.0.

Cmake 3.20 is above our minimal version in
support/dependencies/check-host-cmake.mk, so this breaks builds on hosts
with cmake >= 3.18 < 3.20 - So use the ninja backend instead.

https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 78d499409f71d8a22b0632c8ebc06f67ee6ae6dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 54f37fd702..b9c2fef395 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -103,4 +103,23 @@ ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS
 WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
+# wpewebkit needs cmake >= 3.20 when building with the make backend, which is
+# above our minimal version in
+# support/dependencies/check-host-cmake.mk, so use the ninja backend:
+# https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f
+WPEWEBKIT_CONF_OPTS += -GNinja
+WPEWEBKIT_DEPENDENCIES += host-ninja
+
+define WPEWEBKIT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(WPEWEBKIT_BUILDDIR)
+endef
+
+define WPEWEBKIT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(WPEWEBKIT_BUILDDIR)
+endef
+
+define WPEWEBKIT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(WPEWEBKIT_BUILDDIR)
+endef
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
