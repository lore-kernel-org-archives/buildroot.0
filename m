Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BD3C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9A03813A2;
	Wed,  9 Feb 2022 17:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkszbFC3ipoc; Wed,  9 Feb 2022 17:08:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B219F813A3;
	Wed,  9 Feb 2022 17:08:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2E051BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE2BD401D4
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vOIxyg42NjYd for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:59:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC6034018C
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:59:24 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id D4037D2437
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD530C0005;
 Wed,  9 Feb 2022 16:52:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCf-0001Du-Dy; Wed, 09 Feb 2022 17:52:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:33 +0100
Message-Id: <20220209165213.4498-8-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 007/107] package/cracklib: move python support
 to python3
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

The configure script needs a bit of help to detect the python version.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cracklib/cracklib.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index 8e6a844f11..46917b7926 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -20,9 +20,12 @@ else
 CRACKLIB_CONF_OPTS += --without-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
 CRACKLIB_CONF_OPTS += --with-python
-CRACKLIB_DEPENDENCIES += python
+CRACKLIB_CONF_ENV += \
+	ac_cv_path_PYTHON=$(HOST_DIR)/bin/python3 \
+	am_cv_python_version=$(PYTHON3_VERSION_MAJOR)
+CRACKLIB_DEPENDENCIES += python3
 else
 CRACKLIB_CONF_OPTS += --without-python
 endif
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
