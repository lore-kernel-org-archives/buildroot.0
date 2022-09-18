Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2FEC6FA82
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 20:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A5594241A;
	Sun, 18 Sep 2022 20:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A5594241A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eSb4IVJIbjG2; Sun, 18 Sep 2022 20:56:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E5FC4098B;
	Sun, 18 Sep 2022 20:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E5FC4098B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0ED851BF3CB
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 20:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEA4860AE8
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 20:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEA4860AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKivJqvIn9vG for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 20:55:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06C7B60AE6
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 20:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06C7B60AE6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E43CD853EE; Sun, 18 Sep 2022 20:55:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 22:55:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7561a8c5e107b411d01afa5627cb0bb730abe86
X-Git-Newrev: 0f42b815323b4d4731bd508550e2b0bcc019a8ce
X-Patchwork-Hint: ignore
Message-Id: <20220918205556.E43CD853EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: support libnss
 instead of gnutls
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f42b815323b4d4731bd508550e2b0bcc019a8ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NetworkManager supports compiling against either NSS or GnuTLS and in
fact upstream defaults to NSS if both are available and no choice is
specified.  Providing a choice can shrink images slightly if some other
package is already pulling in NSS but GnuTLS is not otherwise required.

Since a crypto provider is required and to maintain backwards
compatibility, select GnuTLS when NSS is not selected.

In keeping with the upstream default, choose NSS when both libraries are
available.

Signed-off-by: John Keeping <john@metanate.com>
[Peter: rework to the meson equivalent]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in          |  2 +-
 package/network-manager/network-manager.mk | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 1f56daa187..37c4a79d16 100644
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
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 105273a74c..a17c5e1774 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -20,7 +20,6 @@ NETWORK_MANAGER_DEPENDENCIES = \
 	host-libxslt \
 	host-pkgconf \
 	dbus \
-	gnutls \
 	libglib2 \
 	libndp \
 	udev \
@@ -31,7 +30,6 @@ NETWORK_MANAGER_CONF_OPTS = \
 	-Ddocs=false \
 	-Dtests=no \
 	-Dqt=false \
-	-Dcrypto=gnutls \
 	-Diptables=/usr/sbin/iptables \
 	-Difupdown=false \
 	-Dnm_cloud_setup=false \
@@ -73,6 +71,14 @@ else
 NETWORK_MANAGER_CONF_OPTS += -Dconcheck=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNSS),y)
+NETWORK_MANAGER_DEPENDENCIES += libnss
+NETWORK_MANAGER_CONF_OPTS += -Dcrypto=nss
+else
+NETWORK_MANAGER_DEPENDENCIES += gnutls
+NETWORK_MANAGER_CONF_OPTS += -Dcrypto=gnutls
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPSL),y)
 NETWORK_MANAGER_DEPENDENCIES += libpsl
 NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
