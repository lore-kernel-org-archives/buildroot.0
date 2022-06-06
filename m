Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D45C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FF5C40256;
	Mon,  6 Jun 2022 12:46:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T95YL7OZsL-v; Mon,  6 Jun 2022 12:46:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6117400FD;
	Mon,  6 Jun 2022 12:46:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 46B381BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4381960BDC
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zR5XJ_xcvYqF for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:46:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4375F60BCA
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:46:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1B81286D02; Mon,  6 Jun 2022 12:35:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 14:43:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b79cefcb007d8d3279208f27d46426262f105c04
X-Git-Newrev: f642d28e48497f98868f694476fb39ff5cb30110
X-Patchwork-Hint: ignore
Message-Id: <20220606123505.1B81286D02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: put back libuuid
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f642d28e48497f98868f694476fb39ff5cb30110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
index 81d6eedf0f..3c39ce7d6d 100644
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
