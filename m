Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23ABEC8735
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 14:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5088841D74;
	Thu,  7 Sep 2023 14:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5088841D74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMjbNPXrxJ1R; Thu,  7 Sep 2023 14:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4251C41DB6;
	Thu,  7 Sep 2023 14:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4251C41DB6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16AED1BF995
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B6076123E
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B6076123E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OPvjTFZJ_yWJ for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC3936124D
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC3936124D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA87986A21; Thu,  7 Sep 2023 14:51:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 15:52:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606
X-Git-Newrev: e8cb970534debcb5b36c7919d435dbad8c4e38ee
X-Patchwork-Hint: ignore
Message-Id: <20230907145125.AA87986A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: use the CMAKE_NINJA flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8cb970534debcb5b36c7919d435dbad8c4e38ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the newly introduce backend option to specify what cmake backend to
use, in lieue of special-coding its use as done in 16e5c92ff5fd
(package/webkitgtk: Build with ninja).

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/webkitgtk/webkitgtk.mk | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 56277a0a0a..3e9d42c7c3 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -16,6 +16,9 @@ WEBKITGTK_CPE_ID_VENDOR = webkitgtk
 WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
 	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
+
+WEBKITGTK_CMAKE_BACKEND = ninja
+
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_DOCUMENTATION=OFF \
@@ -140,23 +143,4 @@ ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
-# webkitgtk needs cmake >= 3.20 when not building with ninja, which is
-# above our minimal version in
-# support/dependencies/check-host-cmake.mk, so use the ninja backend:
-# https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f
-WEBKITGTK_CONF_OPTS += -GNinja
-WEBKITGTK_DEPENDENCIES += host-ninja
-
-define WEBKITGTK_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(WEBKITGTK_BUILDDIR)
-endef
-
-define WEBKITGTK_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
-endef
-
-define WEBKITGTK_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
-endef
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
