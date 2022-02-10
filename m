Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B08C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 20:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A4514091D;
	Thu, 10 Feb 2022 20:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bCJix4W1USrR; Thu, 10 Feb 2022 20:45:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99AD0408EE;
	Thu, 10 Feb 2022 20:45:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A47B41C1135
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 989488244D
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cBw_BM3-wAMg for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 20:45:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DBF38242D
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 20:45:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6253F82984; Thu, 10 Feb 2022 20:37:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 21:44:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f32a2b04c89b6fbcd2cccf22b34fcfebfbcc1f2d
X-Git-Newrev: aa01b17862ab3af9d95a05018bf8ccf5e875057b
X-Patchwork-Hint: ignore
Message-Id: <20220210203748.6253F82984@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtest: drop python2 host support
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa01b17862ab3af9d95a05018bf8ccf5e875057b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And simplify the package a bit while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gtest/gtest.mk | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 673e626c45..e7ce89a3f4 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -19,16 +19,7 @@ endif
 
 HOST_GTEST_LICENSE = Apache-2.0
 HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
-HOST_GTEST_DEPENDENCIES += host-python3
-else
-HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
-HOST_GTEST_DEPENDENCIES += host-python
-endif
-
-HOST_GTEST_GMOCK_PYTHONPATH = \
-	$(HOST_DIR)/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
+HOST_GTEST_DEPENDENCIES = host-python3
 
 # While it is possible to build gtest as shared library, using this gtest shared
 # library requires to set some special configure option in the project using
@@ -56,7 +47,7 @@ define HOST_GTEST_POST_INSTALL_PYTHON
 	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
 		$(HOST_DIR)/bin/gmock_gen
 	cp -rp $(@D)/googlemock/scripts/generator/cpp \
-		$(HOST_GTEST_GMOCK_PYTHONPATH)
+		$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 endef
 
 HOST_GTEST_POST_INSTALL_HOOKS += HOST_GTEST_POST_INSTALL_PYTHON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
