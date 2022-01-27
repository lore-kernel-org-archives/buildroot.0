Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AB5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 17:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5C39416B9;
	Thu, 27 Jan 2022 17:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yvk7t40vwBXI; Thu, 27 Jan 2022 17:00:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2B6241BD5;
	Thu, 27 Jan 2022 17:00:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D49C21C1135
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 17:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C35C960F10
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 17:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qQbCbllcVn1 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 17:00:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C21E60DFD
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 17:00:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E760A829F9; Thu, 27 Jan 2022 16:53:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 17:58:08 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: b7e5a5a7918021697e9f309a14e4999e90059fb1
X-Git-Newrev: cf0b5f24427dc01106d0c3c892763588dcb21b85
X-Patchwork-Hint: ignore
Message-Id: <20220127165358.E760A829F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libvirt: disable
 sasl
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf0b5f24427dc01106d0c3c892763588dcb21b85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

sasl depends on libsasl2 (https://github.com/cyrusimap/cyrus-sasl) which
is not packaged yet in buildroot and will result in the following build
failure raised since commit fbf25acfbfd5a73b3560918bea081768abbe5723:

output/build/libvirt-7.7.0/meson.build:1212:2: ERROR: Dependency "libsasl2" not found, tried pkgconfig

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ba2016dc04271844416088b766284f9a22a6b58d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/libvirt.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 291d892bae..e7bfe6964d 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -62,6 +62,7 @@ LIBVIRT_CONF_OPTS = \
 	-Dpciaccess=enabled \
 	-Dpm_utils=disabled \
 	-Dsanlock=disabled \
+	-Dsasl=disabled \
 	-Dsecdriver_apparmor=disabled \
 	-Dstorage_iscsi=disabled \
 	-Dstorage_iscsi_direct=disabled \
@@ -211,13 +212,6 @@ else
 LIBVIRT_CONF_OPTS += -Dnss=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGSASL),y)
-LIBVIRT_CONF_OPTS += -Dsasl=enabled
-LIBVIRT_DEPENDENCIES += libgsasl
-else
-LIBVIRT_CONF_OPTS += -Dsasl=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 LIBVIRT_CONF_OPTS += -Dlibssh2=enabled
 LIBVIRT_DEPENDENCIES += libssh2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
