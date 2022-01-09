Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA7AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 534C84058E;
	Sun,  9 Jan 2022 20:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbAkYO-3LBpS; Sun,  9 Jan 2022 20:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61CF6404D4;
	Sun,  9 Jan 2022 20:59:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E59EF1BF20B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3A6C402D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UTUNAF2gwXCE for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:59:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D948C402D3
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:59:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8D25B82B94; Sun,  9 Jan 2022 20:53:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 21:53:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4dff1be05e906f5c3cfd56ebc1458579635b4ca7
X-Git-Newrev: c0f9e2447d57194f0b02edb93cd16a677ebb326c
X-Patchwork-Hint: ignore
Message-Id: <20220109205306.8D25B82B94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtest: host-gtest install like a
 normal cmake package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0f9e2447d57194f0b02edb93cd16a677ebb326c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, host-gtest does not actually build and install gtest
libraries or header files; it just installs the gmock_gen stuff.

Host gtest can however be used by packages to build and run their
unit-tests natively.

This patch will now build and install gtest to the host like a normal
cmake package.

To limit the disruption for existing users of host-gtest, the gmock_gen
stuff is still installed (as a post-install hook now).

Signed-off-by: Paul Soucy <paul.soucy@sense.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gtest/gtest.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 6447954e36..673e626c45 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -52,14 +52,14 @@ else
 GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
 endif
 
-define HOST_GTEST_INSTALL_CMDS
+define HOST_GTEST_POST_INSTALL_PYTHON
 	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
 		$(HOST_DIR)/bin/gmock_gen
 	cp -rp $(@D)/googlemock/scripts/generator/cpp \
 		$(HOST_GTEST_GMOCK_PYTHONPATH)
 endef
 
+HOST_GTEST_POST_INSTALL_HOOKS += HOST_GTEST_POST_INSTALL_PYTHON
+
 $(eval $(cmake-package))
-# The host package does not build anything, just installs gmock_gen stuff, so
-# it does not need to be a host-cmake-package.
-$(eval $(host-generic-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
