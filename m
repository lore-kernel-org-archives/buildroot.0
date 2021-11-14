Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB792C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7783640284;
	Mon,  6 Dec 2021 18:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNWZnqk5a2cF; Mon,  6 Dec 2021 18:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B629940248;
	Mon,  6 Dec 2021 18:17:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10C761BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D77A640497
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VgzEe7LLngwg for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB89A4048D
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 877A081504; Mon,  6 Dec 2021 18:07:39 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 16:27:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99a47828c13acf82a6af921b26fda2f77ae25317
X-Git-Newrev: 6ad98fab7a2a4f84d9ec38d86af6282f27a4a4c9
X-Patchwork-Hint: ignore
Message-Id: <20211206180739.877A081504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: make readline
 optional for network-manager
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ad98fab7a2a4f84d9ec38d86af6282f27a4a4c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This removes the hard dependency on readline which is GPL-3.0+ licensed.
If readline is enabled the dependency is added and nmcli is built.

Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/Config.in          | 1 -
 package/network-manager/network-manager.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 43987451b6..2534963918 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -18,7 +18,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_WIRELESS_TOOLS
 	select BR2_PACKAGE_WIRELESS_TOOLS_LIB
-	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_LIBNDP
 	help
 	  NetworkManager is a set of co-operative tools that make
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index fbd5b1c85c..453d1fc617 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -10,7 +10,7 @@ NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
-	libgcrypt wireless_tools util-linux host-intltool readline libndp
+	libgcrypt wireless_tools util-linux host-intltool libndp
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
 NETWORK_MANAGER_CPE_ID_VENDOR = gnome
@@ -49,6 +49,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += --disable-concheck
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+NETWORK_MANAGER_DEPENDENCIES += readline
+NETWORK_MANAGER_CONF_OPTS += --with-nmcli=yes
+else
+NETWORK_MANAGER_CONF_OPTS += --with-nmcli=no
+endif
+
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
 NETWORK_MANAGER_DEPENDENCIES += newt
 NETWORK_MANAGER_CONF_OPTS += --with-nmtui=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
