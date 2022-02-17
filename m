Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23257C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 18:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 800006F72B;
	Thu, 17 Feb 2022 18:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2jJSE6m2mnp; Thu, 17 Feb 2022 18:22:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEF4C6F709;
	Thu, 17 Feb 2022 18:22:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEDC41BF3EB
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 18:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8B9F425AB
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 18:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aGcxvv0blVy9 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 18:22:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCAA0417F6
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 18:22:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2F21C60004;
 Thu, 17 Feb 2022 18:22:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nKlPn-00033v-1Q; Thu, 17 Feb 2022 19:22:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 19:21:59 +0100
Message-Id: <20220217182202.11640-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pkg-python.mk: drop references to
 PYTHON_{PATH, DIR}
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With python 2.x support dropped these variables no longer exist, so
unconditionally use the python3 variant.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 02df061a19..b8dc9cd9e5 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -38,10 +38,10 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	PATH=$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
-	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
+	PYTHONPATH="$(PYTHON3_PATH)" \
 	PYTHONNOUSERSITE=1 \
 	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
-	_PYTHON_PROJECT_BASE="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_DIR),$(PYTHON_DIR))" \
+	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
@@ -70,11 +70,11 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
 	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
-	_PYTHON_PROJECT_BASE="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_DIR),$(PYTHON_DIR))" \
+	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
-	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
+	PYTHONPATH="$(PYTHON3_PATH)" \
 	PYTHONNOUSERSITE=1 \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
