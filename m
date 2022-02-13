Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E837C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 14:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94F0980D1B;
	Sun, 13 Feb 2022 14:53:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZRb3muWhhGi; Sun, 13 Feb 2022 14:53:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5D1D80C1B;
	Sun, 13 Feb 2022 14:53:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8534A1BF841
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 14:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 733AE40192
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 14:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h8HyCwavTA2t for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 14:53:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57BEF40159
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 14:53:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E9CB082293; Sun, 13 Feb 2022 14:46:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 15:53:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f22134430f00edcfb9093f6095b1b5f72c27069
X-Git-Newrev: 9ecf705d8c65f6dfce189bc49e880ff6cd009882
X-Patchwork-Hint: ignore
Message-Id: <20220213144604.E9CB082293@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/re2: switch to generic-package
 make build
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ecf705d8c65f6dfce189bc49e880ff6cd009882
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cmake build appears to be missing features, such as pkg-config
generation support which is needed for some packages to find re2, like
qt5webengine.

Upstream is not keen on fixing the CMake-based buildsystem [0]

Instead of patching it on our side, and then have to carry the patch
forever, we switch to the Makefile-based generic buildsystem.

Note that previously some packages like grpc failed when the generic
Makefile was used, because they would not find the cmake-equivalent
of pkg-config, but this is now fixed [1].

[0] https://github.com/google/re2/issues/349
[1] https://github.com/grpc/grpc/commit/45e413d2520795e7281e9a592af81620349bc186

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Peter: Reword commit message as suggested by Yann]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/re2/re2.mk | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index 31252ee82f..41392cb179 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -10,8 +10,32 @@ RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
 RE2_INSTALL_STAGING = YES
 
-RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
-HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON
+define RE2_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		-C $(@D) $(if $(BR2_STATIC_LIBS),static)
+endef
 
-$(eval $(cmake-package))
-$(eval $(host-cmake-package))
+define RE2_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) \
+		$(if $(BR2_STATIC_LIBS),static-install,install)
+endef
+
+define RE2_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) \
+		$(if $(BR2_STATIC_LIBS),static-install,install)
+endef
+
+define HOST_RE2_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		-C $(@D)
+endef
+
+define HOST_RE2_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		-C $(@D) DESTDIR="$(HOST_DIR)" prefix=/usr install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
