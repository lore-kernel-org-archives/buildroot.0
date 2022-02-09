Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCD7C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72DDC60E42;
	Wed,  9 Feb 2022 21:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1MtWkWSFrYG; Wed,  9 Feb 2022 21:35:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C70D560BF2;
	Wed,  9 Feb 2022 21:35:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12E641BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37B1560E5E
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lcWK2OrOGcF for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7073060E34
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 76D6283245; Wed,  9 Feb 2022 21:25:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:07:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66dbb7476390ddc939dc3ae7f7ea1ea71fa6153e
X-Git-Newrev: 6ab41d540ef7b88496bf3fe9cb39a1c747f29f3e
X-Patchwork-Hint: ignore
Message-Id: <20220209212559.76D6283245@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cracklib: move python support to
 python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ab41d540ef7b88496bf3fe9cb39a1c747f29f3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script needs a bit of help to detect the python version.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
