Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D934AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:45:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ADC460FDC
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3ADC460FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B285402E2;
	Mon, 25 Oct 2021 09:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvV_1FcJPivA; Mon, 25 Oct 2021 09:45:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 326C1401E4;
	Mon, 25 Oct 2021 09:45:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F5781BF38A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C36980D7D
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:45:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gADuePsRZNga for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 09:45:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5818B80D79
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 09:45:31 +0000 (UTC)
Received: from localhost.localdomain (fi-19-215-8.service.infuturo.it
 [151.19.215.8])
 by serv15.avernis.de (Postfix) with ESMTPSA id 5618ABF67820;
 Mon, 25 Oct 2021 11:45:28 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 11:44:53 +0200
Message-Id: <20211025094453.245364-1-br015@umbiko.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.23.2
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In addition to various bug fixes, mpd version 0.23 introduces a new 
dependency (mft) and a change in the configuration of the UPnP client 
functionality. 

Optional new features (openmpt decoder, pipewire and snapcast outputs) are 
currently not available as Buildroot packages and were not considered. 

The change log can be found in [1]

Introduce new dependency for fmt library. Change configuration of UPnP plugin 
to submenu, allowing to optionally select libupnp, libnpupnp or disabled. The 
default setting is 'no UPnP client functionality'. Correct a typo in toolchain 
dependency comment. Adapt sparc patch to changes in source layout. 

[1] https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.2/NEWS

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 ...build-add-atomic-dependency-for-spar.patch |  4 +-
 package/mpd/Config.in                         | 37 ++++++++++++++++---
 package/mpd/mpd.hash                          |  2 +-
 package/mpd/mpd.mk                            | 16 +++++---
 4 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch b/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
index 81bd981d65..390cf12583 100644
--- a/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
+++ b/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
@@ -20,7 +20,7 @@ diff --git a/src/event/meson.build b/src/event/meson.build
 index bc13bbcd2..88370c03a 100644
 --- a/src/event/meson.build
 +++ b/src/event/meson.build
-@@ -21,9 +21,13 @@ event = static_library(
+@@ -47,9 +47,13 @@ event = declare_dependency(
    ],
  )
  
@@ -32,8 +32,8 @@ index bc13bbcd2..88370c03a 100644
    dependencies: [
 +    atomic_dep,
      thread_dep,
+     net_dep,
      system_dep,
-     boost_dep,
 -- 
 2.20.1
 
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 7a2597558b..7b5aeb4bf6 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -8,6 +8,7 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
 	depends on BR2_HOST_GCC_AT_LEAST_8 # C++17
 	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  MPD is a flexible, powerful, server-side application
@@ -361,7 +362,7 @@ config BR2_PACKAGE_MPD_LIBMPDCLIENT
 
 config BR2_PACKAGE_MPD_NEIGHBOR_DISCOVERY_SUPPORT
 	bool "neighbor discovery support"
-	depends on BR2_PACKAGE_MPD_LIBSMBCLIENT || BR2_PACKAGE_MPD_UPNP
+	depends on BR2_PACKAGE_MPD_LIBSMBCLIENT || !BR2_PACKAGE_MPD_UPNP_DISABLED
 	help
 	  Enable support for neighbor discovery.
 	  This option can be used in conjunction with the smbclient
@@ -380,13 +381,39 @@ config BR2_PACKAGE_MPD_TCP
 	  You want this on if MPD and the client(s) work
 	  on different machines (the usual scenario).
 
-config BR2_PACKAGE_MPD_UPNP
-	bool "UPnP"
+choice
+	prompt "UPnP"
+	default BR2_PACKAGE_MPD_UPNP_DISABLED
+	help
+	  Enable MPD UPnP client support.
+
+config BR2_PACKAGE_MPD_UPNP_PUPNP
+	bool "pupnp"
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBUPNP
 	select BR2_PACKAGE_MPD_CURL
 	help
-	  Enable MPD UPnP client support.
+	  Provides UPnP functionality through libupnp
+	  (the legacy Portable SDK for UPnP devices).
+	  
+	  Introduces least additional dependencies.
+
+config BR2_PACKAGE_MPD_UPNP_NPUPNP
+	bool "npupnp"
+	select BR2_PACKAGE_LIBNPUPNP
+	select BR2_PACKAGE_MPD_CURL
+	help
+	  Provides UPnP functionality through libnpupnp
+	  (a C++ reimplementation of the Portable UPnP library).
+	  
+	  Prefer this option if you plan to use upmpdcli.
+
+config BR2_PACKAGE_MPD_UPNP_DISABLED
+	bool "disabled"
+	help
+	  No UPnP client functionality.
+
+endchoice
 
 comment "Tag plugins"
 
@@ -398,7 +425,7 @@ config BR2_PACKAGE_MPD_ID3TAG
 
 endif
 
-comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 7, host gcc >= 7"
+comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 8, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 2501be65de..af660d3690 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  143f7f34aaee6e87888f3dd35d49aade6656052651b960ca42b46cbb518ca0a0  mpd-0.22.11.tar.xz
+sha256  74ec75689746baaeab7c65d70019f96f70b31b658cb25cfd2ebcca03f65acddf  mpd-0.23.2.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index fe6b8d539b..c649cd1d8f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MPD_VERSION_MAJOR = 0.22
-MPD_VERSION = $(MPD_VERSION_MAJOR).11
+MPD_VERSION_MAJOR = 0.23
+MPD_VERSION = $(MPD_VERSION_MAJOR).2
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
@@ -298,12 +298,18 @@ else
 MPD_CONF_OPTS += -Dtwolame=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MPD_UPNP),y)
+ifeq ($(BR2_PACKAGE_MPD_UPNP_PUPNP),y)
 MPD_DEPENDENCIES += \
 	expat \
 	libupnp
-MPD_CONF_OPTS += -Dupnp=enabled
-else
+MPD_CONF_OPTS += -Dupnp=pupnp
+endif
+ifeq ($(BR2_PACKAGE_MPD_UPNP_NPUPNP),y)
+MPD_DEPENDENCIES += \
+	libnpupnp
+MPD_CONF_OPTS += -Dupnp=npupnp
+endif
+ifeq ($(BR2_PACKAGE_MPD_UPNP_DISABLED),y)
 MPD_CONF_OPTS += -Dupnp=disabled
 endif
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
