Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E893C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D10CE422BB;
	Sun, 18 Sep 2022 10:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D10CE422BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tX4qlzE1r0WY; Sun, 18 Sep 2022 10:20:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91D5A41BE7;
	Sun, 18 Sep 2022 10:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91D5A41BE7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8471BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25A31405A9
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:20:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25A31405A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEvluGXXbU8z for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:20:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 712A64012E
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 712A64012E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6086284E3D; Sun, 18 Sep 2022 10:20:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 12:20:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14df1bc61661765cfc33741ad8f3deb6d81e1548
X-Git-Newrev: 37e26947565df581e2e0e1b41b0d5b4a3e8a7df1
X-Patchwork-Hint: ignore
Message-Id: <20220918102042.6086284E3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbedtls: use pre-configure,
 not post-patch, hooks to configure
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

commit: https://git.buildroot.net/buildroot/commit/?id=37e26947565df581e2e0e1b41b0d5b4a3e8a7df1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we use post-patch hooks to apply our configuration settings.
This works, but this is semantically wrong; post-patch hooks are there
to amend the source code to actually fix it (i.e. because it can't be
done with a patch for example).

Configuring the package, on the other hand, belong to the configure
step, and if we need to tweak the source code for configuration
purposes, this should be done in pre-configure hooks.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mbedtls/mbedtls.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 1a888e8c67..49ea7886f6 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -25,7 +25,7 @@ define MBEDTLS_ENABLE_THREADING
 	$(SED) "s://#define MBEDTLS_THREADING_PTHREAD:#define MBEDTLS_THREADING_PTHREAD:" \
 		$(@D)/include/mbedtls/config.h
 endef
-MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_THREADING
+MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_THREADING
 ifeq ($(BR2_STATIC_LIBS),y)
 MBEDTLS_CONF_OPTS += -DLINK_WITH_PTHREAD=ON
 endif
@@ -49,7 +49,7 @@ define MBEDTLS_ENABLE_ZLIB
 	$(SED) "s://#define MBEDTLS_ZLIB_SUPPORT:#define MBEDTLS_ZLIB_SUPPORT:" \
 		$(@D)/include/mbedtls/config.h
 endef
-MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_ZLIB
+MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_ZLIB
 else
 MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=OFF
 endif
@@ -77,7 +77,7 @@ define MBEDTLS_ENABLE_DTLS_SRTP
 	$(SED) "s://#define MBEDTLS_SSL_DTLS_SRTP:#define MBEDTLS_SSL_DTLS_SRTP:" \
 		$(@D)/include/mbedtls/config.h
 endef
-MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_DTLS_SRTP
+MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_DTLS_SRTP
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
