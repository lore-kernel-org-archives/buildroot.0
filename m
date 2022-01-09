Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD8BC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B163A60BD1;
	Sun,  9 Jan 2022 20:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pCcB4OKagNQ4; Sun,  9 Jan 2022 20:16:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 129F660BD7;
	Sun,  9 Jan 2022 20:16:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6C1C1BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2E4B60BD0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7y-Ku9UlGDJD for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:16:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4920960BCF
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:16:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1519B831C4; Sun,  9 Jan 2022 20:10:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 21:16:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c077b4a919d697c0b4f5c0c30d945418691e2e23
X-Git-Newrev: ba2016dc04271844416088b766284f9a22a6b58d
X-Patchwork-Hint: ignore
Message-Id: <20220109201037.1519B831C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: disable sasl
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba2016dc04271844416088b766284f9a22a6b58d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sasl depends on libsasl2 (https://github.com/cyrusimap/cyrus-sasl) which
is not packaged yet in buildroot and will result in the following build
failure raised since commit fbf25acfbfd5a73b3560918bea081768abbe5723:

output/build/libvirt-7.7.0/meson.build:1212:2: ERROR: Dependency "libsasl2" not found, tried pkgconfig

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libvirt/libvirt.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 0c1ee82f43..816bb0760d 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -63,6 +63,7 @@ LIBVIRT_CONF_OPTS = \
 	-Dpciaccess=enabled \
 	-Dpm_utils=disabled \
 	-Dsanlock=disabled \
+	-Dsasl=disabled \
 	-Dsecdriver_apparmor=disabled \
 	-Dstorage_iscsi=disabled \
 	-Dstorage_iscsi_direct=disabled \
@@ -212,13 +213,6 @@ else
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
