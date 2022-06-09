Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC817C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8937D60672;
	Thu,  9 Jun 2022 20:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gmB02SUYzELW; Thu,  9 Jun 2022 20:36:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D6B60D71;
	Thu,  9 Jun 2022 20:36:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5FBF31C1135
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD6686060A
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lVafWAhexsc for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:35:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C0C8605AC
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:35:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 72E0C86ECF; Thu,  9 Jun 2022 20:23:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:20:13 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f5e5c9b4b25fb027aeb09b888545e3a1b5567745
X-Git-Newrev: 641f27b7bb2032fac0809cd581758b31b57f291f
X-Patchwork-Hint: ignore
Message-Id: <20220609202328.72E0C86ECF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/network-manager:
 put back libuuid dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=641f27b7bb2032fac0809cd581758b31b57f291f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit 8b47feff2ff8ac37355431cb0414822da2c87ea1 wrongly removed libuuid
dependency resulting in the following build failure:

checking for UUID... no
configure: error: Package requirements (uuid) were not met:

Package 'uuid', required by 'virtual:world', not found

It should be noted that <uuid/uuid.h> is still used in one example:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/main/examples/C/glib/add-connection-gdbus.c#L17
as stated in
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/73b9883c6f30320b727a664ff2c84cc772aac94b:

"We still require libuuid for building, because it is used by an example
program. Maybe that should be changed, to avoid the build dependency.
But that can be done at a later time."

Fixes:
 - http://autobuild.buildroot.org/results/ac25c42d73161bf4cdfae3e53de8826f0b8dbf9c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f642d28e48497f98868f694476fb39ff5cb30110)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in          | 2 ++
 package/network-manager/network-manager.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 1370c81c9c..39114daf18 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -13,6 +13,8 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNDP
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  NetworkManager is a set of co-operative tools that make
 	  networking simple and straightforward. Whether WiFi, wired,
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index d979cfc0d7..4afe947a78 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -10,7 +10,7 @@ NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
-	host-intltool libndp
+	host-intltool libndp util-linux
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
 NETWORK_MANAGER_CPE_ID_VENDOR = gnome
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
