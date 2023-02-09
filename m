Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB007C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 17:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B11360FC6;
	Thu,  9 Feb 2023 17:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B11360FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Do7QqvzLxf0C; Thu,  9 Feb 2023 17:07:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF2EF60F71;
	Thu,  9 Feb 2023 17:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF2EF60F71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC1EE1BF348
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 17:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9338F60F71
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 17:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9338F60F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kzyiGUEw4Itp for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 17:07:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 758B160F41
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 758B160F41
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 17:07:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0A61760002;
 Thu,  9 Feb 2023 17:07:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pQAO6-00H40A-FL; Thu, 09 Feb 2023 18:07:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  9 Feb 2023 18:07:06 +0100
Message-Id: <20230209170707.4066903-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230209170707.4066903-1-peter@korsgaard.com>
References: <20230209170707.4066903-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/wpewebkit: Build with ninja
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Wpewebkit needs cmake >= 3.20 when building with the make backend since
wpewebkit 3.8.0.

Cmake 3.20 is above our minimal version in
support/dependencies/check-host-cmake.mk, so this breaks builds on hosts
with cmake >= 3.18 < 3.20 - So use the ninja backend instead.

https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
