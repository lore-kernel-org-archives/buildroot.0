Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E78C433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 08:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D1C181987;
	Tue, 24 May 2022 08:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3UN5P2sZmgpm; Tue, 24 May 2022 08:21:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72DEE81A46;
	Tue, 24 May 2022 08:21:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92ACE1BF28D
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 08:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F73360E14
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 08:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zni3vX59oAlN for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 08:21:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8EDB60D64
 for <buildroot@buildroot.org>; Tue, 24 May 2022 08:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C874E863F8; Tue, 24 May 2022 08:10:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 10:06:08 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5d43e3e5d67aabf31647f23e9b6586644ec3bc32
X-Git-Newrev: 222a90a363ba4633bd9fe8f1a981ec4d2694aaba
X-Patchwork-Hint: ignore
Message-Id: <20220524081008.C874E863F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libwebsockets:
 add mbedtls optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=222a90a363ba4633bd9fe8f1a981ec4d2694aaba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

mbedtls is an optional dependency since version 2.4.0 and
https://github.com/warmcat/libwebsockets/commit/3aaf38d3d89d0436301fe66d9a5c097ea4fb1064

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 702e7254f377501addfbb7c6d53ac6a2636eb076)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libwebsockets/libwebsockets.mk | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index c25686d385..f5557ea1c1 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -27,9 +27,18 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=ON
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_WITH_SSL=ON \
+	-DLWS_WITH_MBEDTLS=OFF
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBWEBSOCKETS_DEPENDENCIES += mbedtls
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_WITH_SSL=ON \
+	-DLWS_WITH_MBEDTLS=ON
 else
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=OFF
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_WITH_SSL=OFF \
+	-DLWS_WITH_MBEDTLS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEV),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
