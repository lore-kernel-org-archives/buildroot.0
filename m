Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDCEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 07:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF6A141755;
	Wed, 16 Mar 2022 07:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5r_PSY4gsxDM; Wed, 16 Mar 2022 07:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09EB741612;
	Wed, 16 Mar 2022 07:31:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 070A71BF9C6
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 07:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE43C60F45
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 07:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2tC-s-C7QUo for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 07:30:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CA2A60FDD
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 07:30:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 47ADC841D3; Wed, 16 Mar 2022 07:21:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 08:28:13 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: c80e612f5eeeaccf3bdefb8192507da6ae4997f4
X-Git-Newrev: 50e83f59bd187c69e182b8034a34d11909f3c526
X-Patchwork-Hint: ignore
Message-Id: <20220316072123.47ADC841D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libvirt: fix
 build without libvirtd
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

commit: https://git.buildroot.net/buildroot/commit/?id=50e83f59bd187c69e182b8034a34d11909f3c526
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fix the following build failure without libvirtd raised since the
addition of the package in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1 and
https://gitlab.com/libvirt/libvirt/-/commit/89064c9e378b99fea0a334199a524f13390d5fc3:

../output-1/build/libvirt-7.10.0/meson.build:1518:2: ERROR: Problem encountered: Requested the Interface driver without netcf or udev and libvirtd support

Fixes:
 - http://autobuild.buildroot.org/results/e43101c6d7f626439ef800263b8f5dfa99ce850b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 87f1dd7b52deedb5a7f50a43e4b1dd1d23313395)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/libvirt.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index e7bfe6964d..5b6a451264 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -38,7 +38,6 @@ LIBVIRT_CONF_OPTS = \
 	-Ddriver_ch=disabled \
 	-Ddriver_esx=disabled \
 	-Ddriver_hyperv=disabled \
-	-Ddriver_interface=enabled \
 	-Ddriver_libxl=disabled \
 	-Ddriver_openvz=disabled \
 	-Ddriver_remote=enabled \
@@ -195,7 +194,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
 # Network is used by daemon, only
-LIBVIRT_CONF_OPTS += -Ddriver_libvirtd=enabled -Ddriver_network=enabled
+LIBVIRT_CONF_OPTS += \
+	-Ddriver_interface=enabled \
+	-Ddriver_libvirtd=enabled \
+	-Ddriver_network=enabled
 
 ifeq ($(BR2_PACKAGE_LIBSSH),y)
 LIBVIRT_CONF_OPTS += -Dlibssh=enabled
@@ -234,7 +236,10 @@ endif
 
 else # BR2_PACKAGE_LIBVIRT_DAEMON
 
-LIBVIRT_CONF_OPTS += -Ddriver_libvirtd=disabled -Ddriver_network=disabled
+LIBVIRT_CONF_OPTS += \
+	-Ddriver_interface=disabled \
+	-Ddriver_libvirtd=disabled \
+	-Ddriver_network=disabled
 
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
