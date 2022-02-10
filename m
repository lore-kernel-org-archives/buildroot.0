Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3C7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7627D4089E;
	Thu, 10 Feb 2022 19:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PtwPGqYBdppd; Thu, 10 Feb 2022 19:14:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BACCD408E6;
	Thu, 10 Feb 2022 19:14:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3861BF3BB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AC7440571
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5yee3BWSFwbV for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:14:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62F1040544
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:14:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 97F9520009;
 Thu, 10 Feb 2022 19:14:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nIEtP-0003bw-Ne; Thu, 10 Feb 2022 20:14:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:14:00 +0100
Message-Id: <20220210191401.13822-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gtest: drop python2 host support
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
Cc: Stephan Hoffmann <sho@relinux.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And simplify the package a bit while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
