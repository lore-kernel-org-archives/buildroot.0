Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA1AC369D5
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 20:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F0F40329;
	Thu, 24 Apr 2025 20:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-69OdJvZnqr; Thu, 24 Apr 2025 20:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 824384032A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 824384032A;
	Thu, 24 Apr 2025 20:56:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA094159
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 20:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A129B40329
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 20:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIGY_1kNW6CL for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 20:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E757D4030D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E757D4030D
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 20:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C531F86405; Thu, 24 Apr 2025 20:56:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Apr 2025 22:53:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fc51abc27d37c2874823ab864db0f32ae774eb6
X-Git-Newrev: 1896f8c7583f40652c212d2c5ded8c91b98873c4
X-Patchwork-Hint: ignore
Message-Id: <20250424205648.C531F86405@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: add Smart card
 option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=1896f8c7583f40652c212d2c5ded8c91b98873c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CONFIG_SMARTCARD was unconditionally disabled which has meant that
even if OpenSSL is compiled with engine support and the supplicant is
configured to use an engine it would warn that it was compiled without
engine support.

This mechanism is used to enable the more secure forms of 802.1x
networking authentication such as EAP-TLS with hardware-delegated
cryptography and private keys protected in hardware.

Enabling the option will allow delegating private key access to TPM2,
ARM TrustZone and other specialized secure hardware for establishing a
network connection.

Signed-off-by: Lars Wikman <lars@underjord.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpa_supplicant/Config.in         | 8 ++++++++
 package/wpa_supplicant/wpa_supplicant.mk | 9 ++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 92953f69f0..e385d762e6 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -175,4 +175,12 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
 	help
 	  Add introspection support for the DBus control interface.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD
+	bool "Smartcard support"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	help
+	  Enable the smart card support. Required for OpenSSL engines
+	  to work using PKCS11 and 802.1x
+
 endif
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 44cfed495b..9de536b943 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -24,9 +24,6 @@ WPA_SUPPLICANT_CONFIG_ENABLE = \
 	CONFIG_INTERNAL_LIBTOMMATH \
 	CONFIG_MATCH_IFACE
 
-WPA_SUPPLICANT_CONFIG_DISABLE = \
-	CONFIG_SMARTCARD
-
 # libnl-3 needs -lm (for rint) and -lpthread if linking statically
 # And library order matters hence stick -lnl-3 first since it's appended
 # in the wpa_supplicant Makefiles as in LIBS+=-lnl-3 ... thus failing
@@ -191,6 +188,12 @@ WPA_SUPPLICANT_DEPENDENCIES += readline
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD),y)
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_SMARTCARD
+else
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_SMARTCARD
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),y)
 define WPA_SUPPLICANT_ENABLE_CTRL_IFACE
 	sed -i '/ctrl_interface/s/^#//g' $(TARGET_DIR)/etc/wpa_supplicant.conf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
