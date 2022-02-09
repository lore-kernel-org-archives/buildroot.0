Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A39C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B23B60B5C;
	Wed,  9 Feb 2022 16:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fhVXtq3Cfsut; Wed,  9 Feb 2022 16:56:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0E1F60AEC;
	Wed,  9 Feb 2022 16:56:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27EA51BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00D3240902
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wt9e0lJgFU3Y for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:52:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8ADA2403CA
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3890E60008;
 Wed,  9 Feb 2022 16:52:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCo-0001GG-5t; Wed, 09 Feb 2022 17:52:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:50 +0100
Message-Id: <20220209165213.4498-25-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 024/107] package/libiio: drop python2 support
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiio/Config.in |  2 +-
 package/libiio/libiio.mk | 10 +++-------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 0d89331c89..98d663e203 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -91,7 +91,7 @@ config BR2_PACKAGE_LIBIIO_BINDINGS_CSHARP
 
 config BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON
 	bool "Install Python bindings"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Install the Python bindings.
 
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index a4fe0d4541..48e2f385e3 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -73,14 +73,10 @@ LIBIIO_CONF_OPTS += -DHAVE_DNS_SD=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-LIBIIO_DEPENDENCIES += host-python-setuptools python
-LIBIIO_CONF_OPTS += -DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python
-else ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIBIIO_DEPENDENCIES += host-python3-setuptools python3
-LIBIIO_CONF_OPTS += -DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
-endif
-LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=ON
+LIBIIO_CONF_OPTS += \
+	-DPYTHON_BINDINGS=ON
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
 else
 LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=OFF
 endif
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
