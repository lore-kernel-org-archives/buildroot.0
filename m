Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02528C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:59:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA86160720
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA86160720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77CED81BB4;
	Thu,  5 Aug 2021 19:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M4Tdn3wb5h85; Thu,  5 Aug 2021 19:59:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B955A81AC1;
	Thu,  5 Aug 2021 19:59:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C0D81BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5111F83B83
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9R6mp-973MGR for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E23A83BA5
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 17A3683738; Thu,  5 Aug 2021 19:49:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 18:47:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 08d1536202b4a80e974e23ee62a898bc511a64c6
X-Git-Newrev: 63ecfad96ad653e445d57632c81f5f27fa1761ca
X-Patchwork-Hint: ignore
Message-Id: <20210805194940.17A3683738@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/usbguard: needs at
 least a crypto backend
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=63ecfad96ad653e445d57632c81f5f27fa1761ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since its addition in commit fbff7d7289cc95db991184f890f4ca1fcf8a101e,
usbguard needs a crypto backend otherwise the build will fail on:

checking for sodium... no
checking for libcrypto... no
checking for powerpc-buildroot-linux-uclibc-libgcrypt-config... no
checking for libgcrypt-config... no
checking for LIBGCRYPT - version >= 1.5.0... no
configure: error: The selected crypto backend library is not available.

So select sodium as the default crypto backend as this is the default
choice in configure.ac.

Fixes:
 - http://autobuild.buildroot.org/results/fb9865e2c65ea1dd9a657e1181a6c8c49481fda7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/usbguard/Config.in   |  1 +
 package/usbguard/usbguard.mk | 14 +++++---------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index 58ee5c4b25..41f19dc1a0 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_USBGUARD
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_LIBQB
+	select BR2_PACKAGE_LIBSODIUM if !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_LIBOPENSSL
 	help
 	  The USBGuard software framework
 
diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 1518f92fc5..a0d1c8446f 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -18,23 +18,19 @@ USBGUARD_CONF_OPTS = \
 
 USBGUARD_DEPENDENCIES += libqb protobuf
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
+USBGUARD_CONF_OPTS += --with-crypto-library=sodium
+USBGUARD_DEPENDENCIES += libsodium
+else ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 USBGUARD_CONF_OPTS += --with-crypto-library=openssl
 USBGUARD_DEPENDENCIES += libopenssl
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 USBGUARD_CONF_ENV += \
 	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 USBGUARD_CONF_OPTS += --with-crypto-library=gcrypt
 USBGUARD_DEPENDENCIES += libgcrypt
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
-USBGUARD_CONF_OPTS += --with-crypto-library=sodium
-USBGUARD_DEPENDENCIES += libsodium
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 USBGUARD_CONF_OPTS += --enable-systemd
 USBGUARD_DEPENDENCIES += systemd
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
