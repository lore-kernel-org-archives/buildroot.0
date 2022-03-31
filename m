Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B12C433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 13:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FA816131B;
	Thu, 31 Mar 2022 13:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9f6KLyN4NS3z; Thu, 31 Mar 2022 13:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 132B361320;
	Thu, 31 Mar 2022 13:22:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D18741BF28C
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 13:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C034C83FA5
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 13:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7Pw3ZqDByEy for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 13:22:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95BAD83F81
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 13:22:46 +0000 (UTC)
Received: from iago.. (unknown [151.57.94.39])
 by serv15.avernis.de (Postfix) with ESMTPSA id 99CA7D8C48D8;
 Thu, 31 Mar 2022 15:22:43 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 15:22:30 +0200
Message-Id: <20220331132230.227424-1-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/1] package/mpd: explicitly disable features to
 avoid collision with host packages
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

Background
During configuration, the meson build system tries to determine the 
availability of optional dependencies using (host) pkgconfig and cmake in that
order. If a library does not exist on the target, pkg-config will fail, but
cmake sometimes finds and reports libraries that exist as host packages. This
has been observed for host-expat (cmake dependency) and host-zlib. The link 
step subsequently fails, because necessary files are not present in the target 
architecture.

Unconditionally disable optional features often found in host binaries and
modify the menu selection processing in mpd.mk to re-enable them where
necessary. Currently this concerns expat and zlib only. 

This fixes the following build errors:

[expat]
/home/data/buildroot.x86_64/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.2.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: warning: libc.so.6, needed by /home/data/buildroot.x86_64/host/lib/libexpat.so.1.8.7, not found (try using -rpath or -rpath-link)
/home/data/buildroot.x86_64/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.2.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /home/data/buildroot.x86_64/host/lib/libexpat.so.1.8.7: undefined reference to `__errno_location@GLIBC_2.2.5'

[zlib]
http://autobuild.buildroot.net/results/f0a/f0a9e719114f19dc9d20622ed85dd4f8e968c20f/

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/mpd/mpd.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 12da36098f..4e67c9428c 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -14,6 +14,7 @@ MPD_LICENSE_FILES = COPYING
 # these refer to the FreeBSD PPP daemon
 MPD_IGNORE_CVES = CVE-2020-7465 CVE-2020-7466
 MPD_SELINUX_MODULES = mpd
+# These features are either unwanted or not selectable via the Buildroot menu
 MPD_CONF_OPTS = \
 	-Daudiofile=disabled \
 	-Ddocumentation=disabled \
@@ -21,6 +22,12 @@ MPD_CONF_OPTS = \
 	-Dpipewire=disabled \
 	-Dsnapcast=false
 
+# Explicitly disable features where meson's dependency detection picks up host
+# libraries. These settings can be overridden through menu options later
+MPD_CONF_OPTS += \
+	-Dexpat=disabled \
+	-Dzlib=disabled
+
 # Zeroconf support depends on libdns_sd from avahi.
 ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
 MPD_DEPENDENCIES += avahi
@@ -300,11 +307,11 @@ ifeq ($(BR2_PACKAGE_MPD_UPNP_PUPNP),y)
 MPD_DEPENDENCIES += \
 	expat \
 	libupnp
-MPD_CONF_OPTS += -Dupnp=pupnp
+MPD_CONF_OPTS += -Dupnp=pupnp -Dexpat=enabled
 else ifeq ($(BR2_PACKAGE_MPD_UPNP_NPUPNP),y)
 MPD_DEPENDENCIES += \
 	libnpupnp
-MPD_CONF_OPTS += -Dupnp=npupnp
+MPD_CONF_OPTS += -Dupnp=npupnp -Dexpat=enabled
 else ifeq ($(BR2_PACKAGE_MPD_UPNP_DISABLED),y)
 MPD_CONF_OPTS += -Dupnp=disabled
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
