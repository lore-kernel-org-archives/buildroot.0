Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB10C19F21
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5125404EC;
	Wed, 27 Jul 2022 10:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5125404EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JtcegQyV2qA7; Wed, 27 Jul 2022 10:50:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDB0C40498;
	Wed, 27 Jul 2022 10:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDB0C40498
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A6F61BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56A486063B
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56A486063B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wnZak9fm0RUf for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:49:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88A4C600C6
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88A4C600C6
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A98FD865CB; Wed, 27 Jul 2022 10:35:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:49:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed005369bbe6d8d527c37cc8fc2173556a97a9f0
X-Git-Newrev: 00290a6284637e23b7346a9242c21487c1d49d86
X-Patchwork-Hint: ignore
Message-Id: <20220727103545.A98FD865CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptsetup: add libnss support
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

commit: https://git.buildroot.net/buildroot/commit/?id=00290a6284637e23b7346a9242c21487c1d49d86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnss is a crypto backend since version 1.3.0 and
https://github.com/mbroz/cryptsetup/commit/7b6eda0d273eb514bf2c1f834a5af019f614f606

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptsetup/cryptsetup.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 6fdda78fe2..20cf5d6346 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -26,7 +26,7 @@ CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
 
 # cryptsetup uses OpenSSL by default, but can be configured to use libgcrypt,
-# nettle or kernel crypto modules instead
+# nettle, libnss or kernel crypto modules instead
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 CRYPTSETUP_DEPENDENCIES += openssl
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
@@ -37,6 +37,9 @@ CRYPTSETUP_CONF_OPTS += --with-crypto_backend=gcrypt
 else ifeq ($(BR2_PACKAGE_NETTLE),y)
 CRYPTSETUP_DEPENDENCIES += nettle
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=nettle
+else ifeq ($(BR2_PACKAGE_LIBNSS),y)
+CRYPTSETUP_DEPENDENCIES += libnss
+CRYPTSETUP_CONF_OPTS += --with-crypto_backend=nss
 else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
