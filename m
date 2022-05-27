Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73853C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 11:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B067B42918;
	Fri, 27 May 2022 11:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJ9AJQaNuqcK; Fri, 27 May 2022 11:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BD8442913;
	Fri, 27 May 2022 11:56:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E7D31BF40B
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 11:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54D8E825C6
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 11:56:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=metanate.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iwj8e-2hiPbS for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 11:56:27 +0000 (UTC)
X-Greylist: delayed 00:19:21 by SQLgrey-1.8.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 407E48001F
 for <buildroot@buildroot.org>; Fri, 27 May 2022 11:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=CWgwUSypvxiotBVtBAWrE46iQI32+x3O5OJ2P2ykdms=; b=4Y
 tTRJEVd6TqledR44lrKr3beH9UW0bcjDZ7DbweiDYNjBA7WP4tlCLxJJ60hALVbmLuQR2a6MtIHS9
 0YOuhJN9IOhNFft9iab4/Uxvv87M4bhj1eKa0qXu/nXfPIXyRbjA+mkQq0t3yCMRrKi07BfAj1uRo
 4CJurT1z73IvDIB4xgIm/ehX91wRQR23Y3zSbUAKvYIwyfnAE6mTYkI/iZSRoFHT6rDh6m53bBqF/
 eVymx+Wj73ljAbi7akPwpUubjgpDHQFKmTw06HFDnJEZo9hPJnZrOJs6PGe4af7P91tHS4eYFG0Di
 5QVrdDIG7wn6eKH/YOS2GceZID41n7/A==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1nuYH9-0003Xi-En; Fri, 27 May 2022 12:37:03 +0100
From: John Keeping <john@metanate.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 12:36:58 +0100
Message-Id: <20220527113658.731372-1-john@metanate.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Authenticated: YES
Subject: [Buildroot] [PATCH] package/network-manager: support libnss instead
 of gnutls
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
Cc: John Keeping <john@metanate.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NetworkManager supports compiling against either NSS or GnuTLS and in
fact upstream defaults to NSS if both are available and no choice is
specified.  Providing a choice can shrink images slightly if some other
package is already pulling in NSS but GnuTLS is not otherwise required.

Since a crypto provider is required and to maintain backwards
compatibility, select GnuTLS when NSS is not selected.

In keeping with the upstream default, choose NSS when both libraries are
available.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/network-manager/Config.in          |  2 +-
 package/network-manager/network-manager.mk | 11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 1370c81c9c..36bde4a297 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNDP
 	help
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 81d6eedf0f..e87b0e3c7a 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -9,7 +9,7 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
+NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev libglib2 \
 	host-intltool libndp
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
@@ -30,7 +30,6 @@ NETWORK_MANAGER_CONF_OPTS = \
 	--disable-tests \
 	--disable-qt \
 	--disable-more-warnings \
-	--with-crypto=gnutls \
 	--with-iptables=/usr/sbin/iptables \
 	--disable-ifupdown \
 	--without-nm-cloud-setup
@@ -71,6 +70,14 @@ else
 NETWORK_MANAGER_CONF_OPTS += --disable-concheck
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNSS),y)
+NETWORK_MANAGER_DEPENDENCIES += libnss
+NETWORK_MANAGER_CONF_OPTS += --with-crypto=nss
+else
+NETWORK_MANAGER_DEPENDENCIES += gnutls
+NETWORK_MANAGER_CONF_OPTS += --with-crypto=gnutls
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPSL),y)
 NETWORK_MANAGER_DEPENDENCIES += libpsl
 NETWORK_MANAGER_CONF_OPTS += --with-libpsl
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
