Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF48AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 19:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1B40614E7;
	Fri, 10 Dec 2021 19:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDaf_foldhb2; Fri, 10 Dec 2021 19:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 671EE61513;
	Fri, 10 Dec 2021 19:12:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D8381BF3D4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CE1E84CF1
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nB-tyBuNuLqO for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 19:12:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10F5584CCE
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 19:12:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 50C738251C; Fri, 10 Dec 2021 19:07:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 20:01:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 158a04a0a9ca479146f13828516e77136b903095
X-Git-Newrev: e5a74af215b9213fb7efea78c8d23e73fd500589
X-Patchwork-Hint: ignore
Message-Id: <20211210190713.50C738251C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update to version 0.23.y
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5a74af215b9213fb7efea78c8d23e73fd500589
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version adds support for openmpt, pipewire and snapcast, which are
disabled for now.

It also adds support for a choice between pupnp and npupnp for the UPnP
database. Therefore, the UPNP option is converted into three-value
choice in Config.in. Legacy handling of the BR2_PACKAGE_MPD_UPNP makes
sure that upnp remains selected.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
[Arnout: fix legacy handling; fix snapcast option]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                   | 10 ++++++
 ...eson.build-add-atomic-dependency-for-spar.patch |  4 +--
 package/mpd/Config.in                              | 41 +++++++++++++++++++---
 package/mpd/mpd.hash                               |  2 +-
 package/mpd/mpd.mk                                 | 21 +++++++----
 5 files changed, 64 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cc102a5307..5c62ffc182 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -153,6 +153,16 @@ config BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
 	  'none' backend has been removed from libmediaart since version
 	  1.9.5.
 
+config BR2_PACKAGE_MPD_UPNP
+	bool "MPD UPnP configuration changed"
+	select BR2_LEGACY
+	help
+	  From version 0.23, MPD supports npupnp in addition to pupnp to
+	  provide database access to a UPnP media server. To preserve
+	  the existing functionality, the pupnp option has been selected
+	  in the MPD UPnP configuration.
+# Note: BR2_PACKAGE_MPD_UPNP is still referenced from package/mpd/Config.in
+
 comment "Legacy options removed in 2021.11"
 
 config BR2_OPENJDK_VERSION_LTS
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
index eb05f25a0b..ff2dd88d6c 100644
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
@@ -354,7 +355,7 @@ config BR2_PACKAGE_MPD_LIBMPDCLIENT
 
 config BR2_PACKAGE_MPD_NEIGHBOR_DISCOVERY_SUPPORT
 	bool "neighbor discovery support"
-	depends on BR2_PACKAGE_MPD_LIBSMBCLIENT || BR2_PACKAGE_MPD_UPNP
+	depends on BR2_PACKAGE_MPD_LIBSMBCLIENT || !BR2_PACKAGE_MPD_UPNP_DISABLED
 	help
 	  Enable support for neighbor discovery.
 	  This option can be used in conjunction with the smbclient
@@ -373,13 +374,45 @@ config BR2_PACKAGE_MPD_TCP
 	  You want this on if MPD and the client(s) work
 	  on different machines (the usual scenario).
 
-config BR2_PACKAGE_MPD_UPNP
-	bool "UPnP"
+choice
+	prompt "UPnP"
+	default BR2_PACKAGE_MPD_UPNP_PUPNP if BR2_PACKAGE_MPD_UPNP # legacy
+	default BR2_PACKAGE_MPD_UPNP_DISABLED
+	help
+	  Enable MPD to access a UPnP based media server.
+
+	  For further information, see
+	  https://www.lesbonscomptes.com/upmpdcli/pages/upmpdcli-or-mpdupnp.html
+
+config BR2_PACKAGE_MPD_UPNP_PUPNP
+	bool "pupnp"
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBUPNP
 	select BR2_PACKAGE_MPD_CURL
 	help
-	  Enable MPD UPnP client support.
+	  Provides UPnP database access through libupnp
+	  (the legacy Portable SDK for UPnP devices).
+
+	  Introduces least additional dependencies.
+
+config BR2_PACKAGE_MPD_UPNP_NPUPNP
+	bool "npupnp"
+	select BR2_PACKAGE_LIBNPUPNP
+	select BR2_PACKAGE_MPD_CURL
+	help
+	  Provides UPnP database access through libnpupnp
+	  (a C++ reimplementation of the Portable UPnP library).
+
+	  This implementation is more modern, but also brings
+	  additional features not needed in this context, thus
+	  consuming more space.
+
+config BR2_PACKAGE_MPD_UPNP_DISABLED
+	bool "disabled"
+	help
+	  No UPnP client functionality.
+
+endchoice
 
 comment "Tag plugins"
 
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 2501be65de..cb9d05cd32 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  143f7f34aaee6e87888f3dd35d49aade6656052651b960ca42b46cbb518ca0a0  mpd-0.22.11.tar.xz
+sha256  b300625701005c6b14649f11dac118d05540529a5385d05b7c3062c0ce08f399  mpd-0.23.3.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index e105352b80..7bda0963c6 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,17 +4,20 @@
 #
 ################################################################################
 
-MPD_VERSION_MAJOR = 0.22
-MPD_VERSION = $(MPD_VERSION_MAJOR).11
+MPD_VERSION_MAJOR = 0.23
+MPD_VERSION = $(MPD_VERSION_MAJOR).3
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
-MPD_DEPENDENCIES = host-pkgconf boost
+MPD_DEPENDENCIES = host-pkgconf boost fmt
 MPD_LICENSE = GPL-2.0+
 MPD_LICENSE_FILES = COPYING
 MPD_SELINUX_MODULES = mpd
 MPD_CONF_OPTS = \
 	-Daudiofile=disabled \
-	-Ddocumentation=disabled
+	-Ddocumentation=disabled \
+	-Dopenmpt=disabled \
+	-Dpipewire=disabled \
+	-Dsnapcast=false
 
 # Zeroconf support depends on libdns_sd from avahi.
 ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
@@ -291,12 +294,16 @@ else
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
+else ifeq ($(BR2_PACKAGE_MPD_UPNP_NPUPNP),y)
+MPD_DEPENDENCIES += \
+	libnpupnp
+MPD_CONF_OPTS += -Dupnp=npupnp
+else ifeq ($(BR2_PACKAGE_MPD_UPNP_DISABLED),y)
 MPD_CONF_OPTS += -Dupnp=disabled
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
