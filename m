Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC07C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41222400E3;
	Thu, 13 Jan 2022 19:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXtn6v6mRD4k; Thu, 13 Jan 2022 19:40:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEA75400E4;
	Thu, 13 Jan 2022 19:40:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AFA61BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 193CF60A91
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EyQ1RC4INl-q for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:40:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29C506FC60
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:40:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E733B82DFE; Thu, 13 Jan 2022 19:34:30 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 20:40:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc819438f61c693ffe01cd6827f23372570cb7c6
X-Git-Newrev: 55f7c2a580a202638b5c0c9042b24b434632b6a8
X-Patchwork-Hint: ignore
Message-Id: <20220113193430.E733B82DFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avahi: add hidden libavahi-client
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=55f7c2a580a202638b5c0c9042b24b434632b6a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This hidden option will simplify packages depending on libavahi-client

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/avahi/Config.in                  | 6 ++++++
 package/cups-filters/cups-filters.mk     | 3 +--
 package/libiio/libiio.mk                 | 3 +--
 package/libostree/libostree.mk           | 6 +-----
 package/pipewire/pipewire.mk             | 3 +--
 package/shairport-sync/shairport-sync.mk | 6 +-----
 package/vlc/vlc.mk                       | 3 +--
 7 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 95b01bfe92..2484d8ce5c 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -34,6 +34,12 @@ config BR2_PACKAGE_AVAHI_DAEMON
 	  The daemon registers local IP addresses and services using
 	  mDNS/DNS-SD.
 
+# This hidden option allows packages that need the libavahi-client to
+# more easily determine if it's available or not.
+config BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
+	bool
+	default y if BR2_PACKAGE_AVAHI_DAEMON && BR2_PACKAGE_DBUS
+
 config BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
 	bool "libdns_sd compatibility (Bonjour)"
 	depends on BR2_PACKAGE_AVAHI_DAEMON
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 63b85f0b8b..c8f2dd0aae 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -45,8 +45,7 @@ else
 CUPS_FILTERS_CONF_OPTS += --disable-dbus
 endif
 
-# avahi support requires avahi-client, which needs avahi-daemon and dbus
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 CUPS_FILTERS_DEPENDENCIES += avahi
 CUPS_FILTERS_CONF_OPTS += --enable-avahi
 else
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 38b2f83e6e..a4fe0d4541 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -65,8 +65,7 @@ else
 LIBIIO_CONF_OPTS += -DWITH_AIO=OFF
 endif
 
-# Avahi support in libiio requires avahi-client, which needs avahi-daemon and dbus
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 LIBIIO_DEPENDENCIES += avahi
 LIBIIO_CONF_OPTS += -DHAVE_DNS_SD=ON
 else
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 22cb83d039..9cbf2848c9 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -37,11 +37,7 @@ else
 LIBOSTREE_CONF_OPTS += --without-openssl
 endif
 
-# Avahi support needs libavahi-client, which is built by avahi if avahi-daemon
-# and dbus is selected. Since there is no BR2_PACKAGE_LIBAVAHI_CLIENT config
-# option yet, use the avahi-daemon and dbus config symbols to check for
-# libavahi-client.
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 LIBOSTREE_CONF_OPTS += --with-avahi
 LIBOSTREE_DEPENDENCIES += avahi
 else
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 604d08f90d..b05ce2bcc2 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -83,8 +83,7 @@ else
 PIPEWIRE_CONF_OPTS += -Dalsa=disabled -Dpipewire-alsa=disabled
 endif
 
-# avahi support needs avahi-client, which needs avahi-daemon and dbus
-ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 PIPEWIRE_CONF_OPTS += -Davahi=enabled
 PIPEWIRE_DEPENDENCIES += avahi
 else
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index cf49f2b2ed..487e0c05e5 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -22,11 +22,7 @@ SHAIRPORT_SYNC_CONF_OPTS = --with-alsa \
 SHAIRPORT_SYNC_CONF_ENV += LIBS="$(SHAIRPORT_SYNC_CONF_LIBS)"
 
 # Avahi or tinysvcmdns (shaiport-sync bundles its own version of tinysvcmdns).
-# Avahi support needs libavahi-client, which is built by avahi if avahi-daemon
-# and dbus is selected. Since there is no BR2_PACKAGE_LIBAVAHI_CLIENT config
-# option yet, use the avahi-daemon and dbus congig symbols to check for
-# libavahi-client.
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 SHAIRPORT_SYNC_DEPENDENCIES += avahi
 SHAIRPORT_SYNC_CONF_OPTS += --with-avahi --without-tinysvcmdns
 else
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index fe338fcbe8..b793e0efe0 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -117,8 +117,7 @@ else
 VLC_CONF_OPTS += --disable-alsa
 endif
 
-# avahi support needs avahi-client, which needs avahi-daemon and dbus
-ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 VLC_CONF_OPTS += --enable-avahi
 VLC_DEPENDENCIES += avahi
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
