Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75025C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26336404C6;
	Wed, 27 Jul 2022 10:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26336404C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VOdj7x6Hzckn; Wed, 27 Jul 2022 10:49:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FB1E404CA;
	Wed, 27 Jul 2022 10:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FB1E404CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 543591BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D52281B23
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D52281B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5ISyqdEprQD for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:49:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78D5B81A3B
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78D5B81A3B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9A53B865CA; Wed, 27 Jul 2022 10:35:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:49:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b42bbf30a914b0fd40a4518e61ac7bc511a7deb
X-Git-Newrev: ed005369bbe6d8d527c37cc8fc2173556a97a9f0
X-Patchwork-Hint: ignore
Message-Id: <20220727103545.9A53B865CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptsetup: add nettle support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ed005369bbe6d8d527c37cc8fc2173556a97a9f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nettle is a crypto backend since version 1.3.1 and
https://github.com/mbroz/cryptsetup/commit/35d6914779578908e7b37abfdd188ec7c8101404

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptsetup/cryptsetup.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 0f5c2dc5ae..6fdda78fe2 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -25,8 +25,8 @@ CRYPTSETUP_AUTORECONF = YES
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
 
-# cryptsetup uses OpenSSL by default, but can be configured to use libgcrypt
-# or kernel crypto modules instead
+# cryptsetup uses OpenSSL by default, but can be configured to use libgcrypt,
+# nettle or kernel crypto modules instead
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 CRYPTSETUP_DEPENDENCIES += openssl
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
@@ -34,6 +34,9 @@ else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 CRYPTSETUP_DEPENDENCIES += libgcrypt
 CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=gcrypt
+else ifeq ($(BR2_PACKAGE_NETTLE),y)
+CRYPTSETUP_DEPENDENCIES += nettle
+CRYPTSETUP_CONF_OPTS += --with-crypto_backend=nettle
 else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
