Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1371C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 07:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 523FC60B03;
	Sun,  9 Jan 2022 07:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wk2G6aiVEkdc; Sun,  9 Jan 2022 07:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9B3660A9B;
	Sun,  9 Jan 2022 07:44:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 453511BF473
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 07:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3408A40386
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 07:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syfgCZiWSQ22 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 07:44:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 271DA40360
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 07:44:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1833282A01; Sun,  9 Jan 2022 07:38:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 08:42:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e27a700f3e140015c02be05853d94b7f3dcc0f28
X-Git-Newrev: 8c12a6bf51bc4b166948b4392e96344259a64778
X-Patchwork-Hint: ignore
Message-Id: <20220109073836.1833282A01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: enable required kernel
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c12a6bf51bc4b166948b4392e96344259a64778
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required kernel options are listed in check_crypto() in srv/main.c:
https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/src/main.c?h=1.20#n268

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iwd/iwd.mk | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 7b122811c5..42f176b05b 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -63,4 +63,27 @@ define IWD_INSTALL_INIT_SYSV
 	ln -sf /tmp/iwd/hotspot $(TARGET_DIR)/var/lib/iwd/hotspot
 endef
 
+define IWD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_ASYMMETRIC_KEY_TYPE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_CBC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_CMAC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_ECB)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_HMAC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD5)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA512)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_HASH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_SKCIPHER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KEY_DH_OPERATIONS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PKCS7_MESSAGE_PARSER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PKCS8_PRIVATE_KEY_PARSER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_X509_CERTIFICATE_PARSER)
+endef
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
