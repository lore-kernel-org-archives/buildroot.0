Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1487C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 870A1831F5;
	Wed,  9 Feb 2022 21:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ytT22SnOGjgr; Wed,  9 Feb 2022 21:36:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9327F83180;
	Wed,  9 Feb 2022 21:36:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 109C21BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BC90600C5
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WjsnKmSQKoXT for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6273560BF2
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6673E8323C; Wed,  9 Feb 2022 21:25:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:07:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 611e04609bea5fbe9f3616504d04f747653a789e
X-Git-Newrev: 82fc920fbe0dc774e2cf8639b450ac9e0b29d56a
X-Patchwork-Hint: ignore
Message-Id: <20220209212559.6673E8323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: drop python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=82fc920fbe0dc774e2cf8639b450ac9e0b29d56a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/boost/Config.in |  2 +-
 package/boost/boost.mk  | 11 +++--------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 2c458bf88a..33a5337096 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -296,7 +296,7 @@ config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 
 config BR2_PACKAGE_BOOST_PYTHON
 	bool "boost-python"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  The Boost Python Library is a framework for interfacing Python
 	  and C++. It allows you to quickly and seamlessly expose C++
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index b6681b0ad3..032ba5c820 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -68,16 +68,11 @@ BOOST_DEPENDENCIES += bzip2 zlib
 endif
 
 ifeq ($(BR2_PACKAGE_BOOST_PYTHON),y)
-BOOST_FLAGS += --with-python-root=$(HOST_DIR)
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-BOOST_FLAGS += --with-python=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)
+BOOST_FLAGS += \
+	--with-python-root=$(HOST_DIR) \
+	--with-python=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)
 BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 BOOST_DEPENDENCIES += python3
-else
-BOOST_FLAGS += --with-python=$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR)
-BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-BOOST_DEPENDENCIES += python
-endif
 endif
 
 HOST_BOOST_OPTS += --no-cmake-config toolset=gcc threading=multi \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
