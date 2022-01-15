Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF49C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36CC560B87;
	Sat, 15 Jan 2022 11:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01mDTdZQ0dVk; Sat, 15 Jan 2022 11:21:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8763860AC0;
	Sat, 15 Jan 2022 11:21:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CABA1BF2E4
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77E6C40463
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrunJNFYImtF for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:20:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D9F24010E
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:20:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9F1F88077E; Sat, 15 Jan 2022 11:13:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 12:15:53 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: f610ca46e01053771bb5d1f63e1bdc356fde59a5
X-Git-Newrev: b287106c74d969c0c185d7da389fe7065e5e167b
X-Patchwork-Hint: ignore
Message-Id: <20220115111353.9F1F88077E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libvirt: fix
 libvirtd option
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

commit: https://git.buildroot.net/buildroot/commit/?id=b287106c74d969c0c185d7da389fe7065e5e167b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Replace libvirtd by driver_libvirtd to avoid the following build failure
raised since the addition of the package in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

../output-1/build/libvirt-7.7.0/meson.build:1:0: ERROR: Unknown options: "libvirtd"

Fixes:
 - http://autobuild.buildroot.org/results/3a20db6cb39c0d91213adbe82934274659df43e7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 86f91e14b5c158d4533909656c8174b6f28760af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
