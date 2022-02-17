Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5769CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05E8483E9B;
	Thu, 17 Feb 2022 20:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5AQHoCaUvYVC; Thu, 17 Feb 2022 20:49:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E94C83E8C;
	Thu, 17 Feb 2022 20:49:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62C1C1BF3B5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DE4840227
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LhyYYxHS6_GZ for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:49:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86BCF400D8
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8B00C83721; Thu, 17 Feb 2022 20:42:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 21:49:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cc60c732a19548cfbd3543d3521324ef5faaa116
X-Git-Newrev: 0ce909afa98223bbd6bb1b2c65dec6cc8982ad31
X-Patchwork-Hint: ignore
Message-Id: <20220217204203.8B00C83721@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cryptsetup: openssl is
 the default crypto backend
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ce909afa98223bbd6bb1b2c65dec6cc8982ad31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

openssl is the default crypto backend since version 2.1.0 and
https://github.com/mbroz/cryptsetup/commit/bc3d0feb5cd33f9181102b418cc7bf44fe112e82

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cryptsetup/cryptsetup.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 2e06047c56..bad31cec8a 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -20,15 +20,15 @@ CRYPTSETUP_INSTALL_STAGING = YES
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
 
-# cryptsetup uses libgcrypt by default, but can be configured to use OpenSSL
+# cryptsetup uses OpenSSL by default, but can be configured to use libgcrypt
 # or kernel crypto modules instead
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+CRYPTSETUP_DEPENDENCIES += openssl
+CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
+else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 CRYPTSETUP_DEPENDENCIES += libgcrypt
 CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=gcrypt
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-CRYPTSETUP_DEPENDENCIES += openssl
-CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
 else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
