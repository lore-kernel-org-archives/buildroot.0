Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE08C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 17:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A043E40B2F;
	Mon, 30 Jan 2023 17:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A043E40B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ix1Tz8yofy9R; Mon, 30 Jan 2023 17:44:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBA7040AF4;
	Mon, 30 Jan 2023 17:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBA7040AF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CEAD1BF28E
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 17:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 821A74179E
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 17:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 821A74179E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NnIKF6Fer73B for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 17:43:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A16741847
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A16741847
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 17:43:43 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout11.t-online.de (Postfix) with SMTP id B44E98F4F;
 Mon, 30 Jan 2023 18:43:40 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.195.67]) by fwd84.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pMYBw-3OM8cz0; Mon, 30 Jan 2023 18:43:40 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:59284)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pMYBv-00052S-2J;
 Mon, 30 Jan 2023 18:43:39 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 18:43:36 +0100
Message-Id: <20230130174339.36794-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130174339.36794-1-bernd.kuhls@t-online.de>
References: <20230130174339.36794-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675100620-521BFA0B-5D29B14C/0/0 CLEAN NORMAL
X-TOI-MSGID: 126a6fb9-87dc-43ea-aa65-a5b0cbfb53b1
Subject: [Buildroot] [PATCH 2/5] package/libva: switch to meson
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The time between version 2.17.0 being tagged and the release of its
tarball version containing autoconf scripts was three weeks now.
With the switch to meson we can directly use the github-generated
tarball while not needing to run autoreconf.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.hash |  4 +---
 package/libva/libva.mk   | 19 +++++++++----------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 700ace0378..780c186069 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,3 @@
-# From https://github.com/intel/libva/releases/download/2.17.0/libva-2.17.0.tar.bz2.sha1sum
-sha1  997f7b3111bc5a4d32ec72e9d7f9fcfca41e4923  libva-2.17.0.tar.bz2
 # Locally computed
-sha256  f3e5eb27c305e05a9bb62703d1915a127301cc0c4f9f209025767432230c4eac  libva-2.17.0.tar.bz2
+sha256  8940541980ef998a36cd8f6ad905e81838ea4ddf56dc479ed2bebd12711e6001  libva-2.17.0.tar.gz
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index c6b9f63b10..f50010d9fc 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBVA_VERSION = 2.17.0
-LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
-LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
+LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
 LIBVA_INSTALL_STAGING = YES
@@ -14,25 +13,25 @@ LIBVA_DEPENDENCIES = host-pkgconf libdrm
 
 # libdrm is a hard-dependency
 LIBVA_CONF_OPTS = \
-	--enable-drm \
-	--with-drivers-path="/usr/lib/va"
+	-Ddisable_drm=false \
+	-Ddriverdir="/usr/lib/va"
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
-LIBVA_CONF_OPTS += --enable-x11
+LIBVA_CONF_OPTS += -Dwith_x11=yes
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 LIBVA_DEPENDENCIES += libgl
-LIBVA_CONF_OPTS += --enable-glx
+LIBVA_CONF_OPTS += -Dwith_glx=yes
 endif
 else
-LIBVA_CONF_OPTS += --disable-glx --disable-x11
+LIBVA_CONF_OPTS += -Dwith_glx=no -Dwith_x11=no
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 LIBVA_DEPENDENCIES += wayland
-LIBVA_CONF_OPTS += --enable-wayland
+LIBVA_CONF_OPTS += -Dwith_wayland=yes
 else
-LIBVA_CONF_OPTS += --disable-wayland
+LIBVA_CONF_OPTS += -Dwith_wayland=no
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
