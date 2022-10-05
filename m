Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BF5C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 09:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADC9260FD2;
	Wed,  5 Oct 2022 09:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADC9260FD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qdlMDeDwx6NS; Wed,  5 Oct 2022 09:12:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 874FD60DF0;
	Wed,  5 Oct 2022 09:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 874FD60DF0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D1511C11A0
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 09:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C33BA40CA4
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 09:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C33BA40CA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lhTmeDL3Ep-w for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 09:11:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4C3A40C22
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4C3A40C22
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 09:11:29 +0000 (UTC)
Received: from iago.. (unknown [151.19.224.153])
 by serv15.avernis.de (Postfix) with ESMTPSA id 861FABDE0C02;
 Wed,  5 Oct 2022 11:11:26 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Wed,  5 Oct 2022 11:10:32 +0200
Message-Id: <20221005091032.3014-5-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220409160921.GA3547512@scaer>
References: <20220409160921.GA3547512@scaer>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v2 4/4] package/mpd: introduce sub-options for
 expat and yajl
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
Cc: Andreas Ziegler <br015@umbiko.net>, YANN E MORIN <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make inclusion of expat and yajl libraries in the mpd build dependent on
user selection, not presence of the libraries in the target filesystem.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
Changes v1 -> v2:
 - based on a discussion w/ Arnout Vandecapelle, Yann Morin

 package/mpd/Config.in | 17 ++++++++++++++---
 package/mpd/mpd.mk    | 24 +++++++++++++++++-------
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index daf1469cae..fe4f22201a 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -20,6 +20,16 @@ menuconfig BR2_PACKAGE_MPD
 
 if BR2_PACKAGE_MPD
 
+# mpd internal feature dependencies
+
+config BR2_PACKAGE_MPD_EXPAT
+	bool
+	select BR2_PACKAGE_EXPAT
+
+config BR2_PACKAGE_MPD_YAJL
+	bool
+	select BR2_PACKAGE_YAJL
+
 comment "Archive plugins"
 
 config BR2_PACKAGE_MPD_BZIP2
@@ -48,14 +58,14 @@ config BR2_PACKAGE_MPD_QOBUZ
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	select BR2_PACKAGE_MPD_CURL
 	select BR2_PACKAGE_LIBGCRYPT
-	select BR2_PACKAGE_YAJL
+	select BR2_PACKAGE_MPD_YAJL
 	help
 	  Play songs from the commercial streaming service Qobuz.
 
 config BR2_PACKAGE_MPD_SOUNDCLOUD
 	bool "soundcloud"
 	select BR2_PACKAGE_MPD_CURL
-	select BR2_PACKAGE_YAJL
+	select BR2_PACKAGE_MPD_YAJL
 	help
 	  Enable soundcloud.com playlist support.
 
@@ -399,9 +409,9 @@ choice
 
 config BR2_PACKAGE_MPD_UPNP_PUPNP
 	bool "pupnp"
-	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBUPNP
 	select BR2_PACKAGE_MPD_CURL
+	select BR2_PACKAGE_MPD_EXPAT
 	help
 	  Provides UPnP database access through libupnp
 	  (the legacy Portable SDK for UPnP devices).
@@ -412,6 +422,7 @@ config BR2_PACKAGE_MPD_UPNP_NPUPNP
 	bool "npupnp"
 	select BR2_PACKAGE_LIBNPUPNP
 	select BR2_PACKAGE_MPD_CURL
+	select BR2_PACKAGE_MPD_EXPAT
 	help
 	  Provides UPnP database access through libnpupnp
 	  (a C++ reimplementation of the Portable UPnP library).
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 1269b90661..1c3b659220 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -78,6 +78,13 @@ else
 MPD_CONF_OPTS += -Ddsd=false
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_EXPAT),y)
+MPD_DEPENDENCIES += expat
+MPD_CONF_OPTS += -Dexpat=enabled
+else
+MPD_CONF_OPTS += -Dexpat=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_FAAD2),y)
 MPD_DEPENDENCIES += faad2
 MPD_CONF_OPTS += -Dfaad=enabled
@@ -252,7 +259,7 @@ MPD_CONF_OPTS += -Dpulse=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_QOBUZ),y)
-MPD_DEPENDENCIES += libgcrypt yajl
+MPD_DEPENDENCIES += libgcrypt
 MPD_CONF_OPTS += -Dqobuz=enabled
 else
 MPD_CONF_OPTS += -Dqobuz=disabled
@@ -273,7 +280,6 @@ MPD_CONF_OPTS += -Dsidplay=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_SOUNDCLOUD),y)
-MPD_DEPENDENCIES += yajl
 MPD_CONF_OPTS += -Dsoundcloud=enabled
 else
 MPD_CONF_OPTS += -Dsoundcloud=disabled
@@ -306,13 +312,10 @@ MPD_CONF_OPTS += -Dtwolame=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_UPNP_PUPNP),y)
-MPD_DEPENDENCIES += \
-	expat \
-	libupnp
+MPD_DEPENDENCIES += libupnp
 MPD_CONF_OPTS += -Dupnp=pupnp
 else ifeq ($(BR2_PACKAGE_MPD_UPNP_NPUPNP),y)
-MPD_DEPENDENCIES += \
-	libnpupnp
+MPD_DEPENDENCIES += libnpupnp
 MPD_CONF_OPTS += -Dupnp=npupnp
 else ifeq ($(BR2_PACKAGE_MPD_UPNP_DISABLED),y)
 MPD_CONF_OPTS += -Dupnp=disabled
@@ -333,6 +336,13 @@ else
 MPD_CONF_OPTS += -Dwavpack=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_YAJL),y)
+MPD_DEPENDENCIES += yajl
+MPD_CONF_OPTS += -Dyajl=enabled
+else
+MPD_CONF_OPTS += -Dyajl=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_ZZIP),y)
 MPD_DEPENDENCIES += zziplib
 MPD_CONF_OPTS += -Dzzip=enabled
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
