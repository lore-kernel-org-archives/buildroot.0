Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B344EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 16:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E10A408A5;
	Sat,  5 Mar 2022 16:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Msm1S7IWQ-Xo; Sat,  5 Mar 2022 16:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68B9B40898;
	Sat,  5 Mar 2022 16:31:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC6481BF5B3
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 16:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9AE981831
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 16:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vq2E3gczRRXj for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 16:31:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3F7F817FD
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 16:31:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 04936827FE; Sat,  5 Mar 2022 16:23:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Mar 2022 17:28:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d7f852ac5afb09f0a9a0b5f441403a98bc0f410
X-Git-Newrev: 87f1dd7b52deedb5a7f50a43e4b1dd1d23313395
X-Patchwork-Hint: ignore
Message-Id: <20220305162320.04936827FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: fix build without libvirtd
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

commit: https://git.buildroot.net/buildroot/commit/?id=87f1dd7b52deedb5a7f50a43e4b1dd1d23313395
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without libvirtd raised since the
addition of the package in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1 and
https://gitlab.com/libvirt/libvirt/-/commit/89064c9e378b99fea0a334199a524f13390d5fc3:

../output-1/build/libvirt-7.10.0/meson.build:1518:2: ERROR: Problem encountered: Requested the Interface driver without netcf or udev and libvirtd support

Fixes:
 - http://autobuild.buildroot.org/results/e43101c6d7f626439ef800263b8f5dfa99ce850b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/libvirt.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 7b0ed5e52e..1dc61a7549 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -39,7 +39,6 @@ LIBVIRT_CONF_OPTS = \
 	-Ddriver_ch=disabled \
 	-Ddriver_esx=disabled \
 	-Ddriver_hyperv=disabled \
-	-Ddriver_interface=enabled \
 	-Ddriver_libxl=disabled \
 	-Ddriver_openvz=disabled \
 	-Ddriver_remote=enabled \
@@ -196,7 +195,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
 # Network is used by daemon, only
-LIBVIRT_CONF_OPTS += -Ddriver_libvirtd=enabled -Ddriver_network=enabled
+LIBVIRT_CONF_OPTS += \
+	-Ddriver_interface=enabled \
+	-Ddriver_libvirtd=enabled \
+	-Ddriver_network=enabled
 
 ifeq ($(BR2_PACKAGE_LIBSSH),y)
 LIBVIRT_CONF_OPTS += -Dlibssh=enabled
@@ -235,7 +237,10 @@ endif
 
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
