Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6130CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19E9B60BF6;
	Tue, 14 Dec 2021 20:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z4sKeMCDwm6Y; Tue, 14 Dec 2021 20:12:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78F9860BF3;
	Tue, 14 Dec 2021 20:12:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B4471BF9B4
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05B8C408F9
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f3INmqfNZSOb for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5033540948
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4C34281EAD; Tue, 14 Dec 2021 20:05:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:56:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c3ff03090dcbfce32823c046899305eb816d6d0
X-Git-Newrev: 86f91e14b5c158d4533909656c8174b6f28760af
X-Patchwork-Hint: ignore
Message-Id: <20211214200520.4C34281EAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: fix libvirtd option
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

commit: https://git.buildroot.net/buildroot/commit/?id=86f91e14b5c158d4533909656c8174b6f28760af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace libvirtd by driver_libvirtd to avoid the following build failure
raised since the addition of the package in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

../output-1/build/libvirt-7.7.0/meson.build:1:0: ERROR: Unknown options: "libvirtd"

Fixes:
 - http://autobuild.buildroot.org/results/3a20db6cb39c0d91213adbe82934274659df43e7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libvirt/libvirt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 3118de4d58..9a4788c905 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -194,7 +194,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
 # Network is used by daemon, only
-LIBVIRT_CONF_OPTS += -Dlibvirtd=enabled -Ddriver_network=enabled
+LIBVIRT_CONF_OPTS += -Ddriver_libvirtd=enabled -Ddriver_network=enabled
 
 ifeq ($(BR2_PACKAGE_LIBSSH),y)
 LIBVIRT_CONF_OPTS += -Dlibssh=enabled
@@ -240,7 +240,7 @@ endif
 
 else # BR2_PACKAGE_LIBVIRT_DAEMON
 
-LIBVIRT_CONF_OPTS += -Dlibvirtd=disabled -Ddriver_network=disabled
+LIBVIRT_CONF_OPTS += -Ddriver_libvirtd=disabled -Ddriver_network=disabled
 
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
