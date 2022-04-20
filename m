Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C212C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 21:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E214419E4;
	Wed, 20 Apr 2022 21:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QMHrrN97Z9Kq; Wed, 20 Apr 2022 21:34:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0BC9419C4;
	Wed, 20 Apr 2022 21:34:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3943E1BF20F
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 21:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 369CA401D6
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 21:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YEFMYYR2jsAh for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 21:34:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CE5D40025
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 21:34:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5CAD683F80; Wed, 20 Apr 2022 21:24:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 23:33:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1d289174eb1e4a34ca70a99e9a655a115b724a1
X-Git-Newrev: 1b38894e348f261898c19985b1a1d2299fe74502
X-Patchwork-Hint: ignore
Message-Id: <20220420212447.5CAD683F80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: add optional lv2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b38894e348f261898c19985b1a1d2299fe74502
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pipewire supports lv2 via the lilv dependency.
https://github.com/PipeWire/pipewire/blob/0.3.45/meson.build#L451

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pipewire/pipewire.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 9d4dc45f02..64f7d054c1 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -30,8 +30,7 @@ PIPEWIRE_CONF_OPTS += \
 	-Dvolume=enabled \
 	-Dsession-managers=[] \
 	-Dlegacy-rtkit=false \
-	-Dlibcanberra=disabled \
-	-Dlv2=disabled
+	-Dlibcanberra=disabled
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 PIPEWIRE_CONF_OPTS += -Ddbus=enabled
@@ -130,6 +129,13 @@ else
 PIPEWIRE_CONF_OPTS += -Dlibcamera=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LILV),y)
+PIPEWIRE_CONF_OPTS += -Dlv2=enabled
+PIPEWIRE_DEPENDENCIES += lilv
+else
+PIPEWIRE_CONF_OPTS += -Dlv2=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 PIPEWIRE_CONF_OPTS += -Dx11=enabled
 PIPEWIRE_DEPENDENCIES += xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
