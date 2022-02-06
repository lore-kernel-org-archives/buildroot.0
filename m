Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56376C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 12:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D83F140331;
	Sun,  6 Feb 2022 12:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lL09t0OPWj_w; Sun,  6 Feb 2022 12:17:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A972402FD;
	Sun,  6 Feb 2022 12:17:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C97E1BF5F5
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 12:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47A2D401A2
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 12:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nx9ortkYRVJ4 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 12:17:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CC8D400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 12:16:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 90B05200003;
 Sun,  6 Feb 2022 12:16:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nGgTP-00082R-Bm; Sun, 06 Feb 2022 13:16:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 13:16:51 +0100
Message-Id: <20220206121652.30854-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libpwquality: support python bindings
 with python3
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
Cc: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python bindings support python3 as well, so enable it if python3 is
enabled.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpwquality/libpwquality.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index 7c0c5df38e..54a03be453 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -12,9 +12,9 @@ LIBPWQUALITY_INSTALL_STAGING = YES
 LIBPWQUALITY_DEPENDENCIES = cracklib
 LIBPWQUALITY_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
 LIBPWQUALITY_CONF_OPTS += --enable-python-bindings
-LIBPWQUALITY_DEPENDENCIES += python
+LIBPWQUALITY_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),python3,python)
 LIBPWQUALITY_MAKE_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
 else
 LIBPWQUALITY_CONF_OPTS += --disable-python-bindings
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
