Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40941C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFD1540260;
	Wed, 27 Jul 2022 10:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFD1540260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dl2rj2Ud1zK5; Wed, 27 Jul 2022 10:51:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB6B7404C6;
	Wed, 27 Jul 2022 10:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB6B7404C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B66391BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F0076063B
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F0076063B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ohvONgkgrE_K for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:51:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3D67600C6
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3D67600C6
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E4B9A865D5; Wed, 27 Jul 2022 10:37:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:50:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00290a6284637e23b7346a9242c21487c1d49d86
X-Git-Newrev: 7752afbe4bb9fa1def5ba89daf21564ea58af79a
X-Patchwork-Hint: ignore
Message-Id: <20220727103717.E4B9A865D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseaudio: improve dependency
 handling
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7752afbe4bb9fa1def5ba89daf21564ea58af79a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use explicit options
- speex is optional, not mandatory
- lirc-tools and valgrind are optional dependencies (enabled by default)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseaudio/Config.in     |  1 -
 package/pulseaudio/pulseaudio.mk | 65 +++++++++++++++++++++++++++++++++++-----
 2 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index 0fcd7b16eb..337a64bf1d 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -22,7 +22,6 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_PULSEAUDIO_ENABLE_ATOMIC
-	select BR2_PACKAGE_SPEEX
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 5f6981ba0d..7b2d362316 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -20,16 +20,32 @@ PULSEAUDIO_CONF_OPTS = \
 	-Dtests=false
 
 PULSEAUDIO_DEPENDENCIES = \
-	host-pkgconf libtool libsndfile speex libglib2 \
-	$(TARGET_NLS_DEPENDENCIES) \
-	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
-	$(if $(BR2_PACKAGE_DBUS),dbus) \
-	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
-	$(if $(BR2_PACKAGE_FFTW_SINGLE),fftw-single) \
-	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
+	host-pkgconf libtool libsndfile libglib2 \
+	$(TARGET_NLS_DEPENDENCIES)
 
 PULSEAUDIO_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
+ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
+PULSEAUDIO_CONF_OPTS += -Davahi=enabled
+PULSEAUDIO_DEPENDENCIES += avahi
+else
+PULSEAUDIO_CONF_OPTS += -Davahi=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+PULSEAUDIO_CONF_OPTS += -Ddbus=enabled
+PULSEAUDIO_DEPENDENCIES += dbus
+else
+PULSEAUDIO_CONF_OPTS += -Ddbus=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
+PULSEAUDIO_CONF_OPTS += -Dfftw=enabled
+PULSEAUDIO_DEPENDENCIES += fftw-single
+else
+PULSEAUDIO_CONF_OPTS += -Dfftw=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
 PULSEAUDIO_CONF_OPTS += -Dsamplerate=enabled
 PULSEAUDIO_DEPENDENCIES += libsamplerate
@@ -58,6 +74,20 @@ PULSEAUDIO_CFLAGS = $(TARGET_CFLAGS) -DAO_NO_SPARC_V9
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
+PULSEAUDIO_DEPENDENCIES += lirc-tools
+PULSEAUDIO_CONF_OPTS += -Dlirc=enabled
+else
+PULSEAUDIO_CONF_OPTS += -Dlirc=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+PULSEAUDIO_CONF_OPTS += -Dopenssl=enabled
+PULSEAUDIO_DEPENDENCIES += openssl
+else
+PULSEAUDIO_CONF_OPTS += -Dopenssl=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_ORC),y)
 PULSEAUDIO_DEPENDENCIES += orc
 PULSEAUDIO_CONF_ENV += ORCC=$(HOST_DIR)/bin/orcc
@@ -132,6 +162,27 @@ else
 PULSEAUDIO_CONF_OPTS += -Dx11=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_SPEEX),y)
+PULSEAUDIO_CONF_OPTS += -Dspeex=enabled
+PULSEAUDIO_DEPENDENCIES += speex
+else
+PULSEAUDIO_CONF_OPTS += -Dspeex=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+PULSEAUDIO_CONF_OPTS += -Dsystemd=enabled
+PULSEAUDIO_DEPENDENCIES += systemd
+else
+PULSEAUDIO_CONF_OPTS += -Dsystemd=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND),y)
+PULSEAUDIO_CONF_OPTS += -Dvalgrind=enabled
+PULSEAUDIO_DEPENDENCIES += valgrind
+else
+PULSEAUDIO_CONF_OPTS += -Dvalgrind=disabled
+endif
+
 # ConsoleKit module init failure breaks user daemon startup
 define PULSEAUDIO_REMOVE_CONSOLE_KIT
 	rm -f $(TARGET_DIR)/usr/lib/pulse-$(PULSEAUDIO_VERSION)/modules/module-console-kit.so
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
