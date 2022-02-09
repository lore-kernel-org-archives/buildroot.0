Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E05C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F99E82E22;
	Wed,  9 Feb 2022 16:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7JpA_2F7PCky; Wed,  9 Feb 2022 16:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4BB582F51;
	Wed,  9 Feb 2022 16:53:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED6021BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBFDA82C2E
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aWseL9uDg0Aj for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:52:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F18958194A
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B4D2D40008;
 Wed,  9 Feb 2022 16:52:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCd-0001DN-9Z; Wed, 09 Feb 2022 17:52:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:29 +0100
Message-Id: <20220209165213.4498-4-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 003/107] package/alsa-lib: drop python2 support
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/Config.in   |  2 +-
 package/alsa-lib/alsa-lib.mk | 11 +----------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 4168d1f220..af3de984d9 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -22,7 +22,7 @@ if BR2_PACKAGE_ALSA_LIB
 
 config BR2_PACKAGE_ALSA_LIB_PYTHON
 	bool "Python support for alsa-lib"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Add python support for alsa-lib.
 	  Python will be built and libpython will be installed
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index b5cd3f0d13..5d12f5e6d8 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -61,20 +61,11 @@ endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
 ALSA_LIB_CONF_OPTS += \
-	--enable-mixer-pymods
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-ALSA_LIB_CONF_OPTS += \
-	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
-	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-ALSA_LIB_DEPENDENCIES += python
-else
-ALSA_LIB_CONF_OPTS += \
+	--enable-mixer-pymods \
 	--with-pythonlibs=-lpython$(PYTHON3_VERSION_MAJOR) \
 	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 ALSA_LIB_DEPENDENCIES += python3
-endif
 else
 ALSA_LIB_CONF_OPTS += --disable-python
 endif
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
