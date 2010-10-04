From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 4 Oct 2010 11:44:08 +0200
Subject: [Buildroot] [git commit master 1/1] libosip2: change site location
	and bump to 3.3.0
Message-ID: <20101004094443.2C1248B8A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3d1de0ed96f6f8f87e45bc5326005f0cde41f900
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change the site location to debian mirror to get the latest debian patches.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    8 ++++----
 package/libosip2/libosip2.mk |   26 ++++++++++++++++++--------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index 69ec5d0..e14801b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -32,10 +32,10 @@
 	ifplugd, iperf, iproute2, iptables, iw, jpeg, kexec, kismet,
 	less, libcgi, libcurl, libdaemon, libdnet, liberation,
 	libevent, libglade, libgtk2, libiconv, libidn, libmms, libnl,
-	liboil, libpcap, libpng, libtool, libungif, libxml2, libxslt,
-	lighttpd, lite, lm-sensors, lockfile-progs, logrotate, m4,
-	mdadm, mesa3d, metacity, mtd-utils, mysql_client, nano, nbd,
-	ncftp, neon, netperf, netsnmp, ng-spice-rework, ntfsprogs,
+	liboil, libosip2, libpcap, libpng, libtool, libungif, libxml2,
+	libxslt, lighttpd, lite, lm-sensors, lockfile-progs, logrotate,
+	m4, mdadm, mesa3d, metacity, mtd-utils, mysql_client, nano,
+	nbd, ncftp, neon, netperf, netsnmp, ng-spice-rework, ntfsprogs,
 	ntp, openntpd, openssh, openvpn, oprofile, pango, patch, pcre,
 	php, pkg-config, prboom, radvd, rdesktop, ruby, qt, quagga,
 	samba, sawman, sdl_mixer, sdl_sound, setserial,
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 441b84c..aa15332 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -3,14 +3,24 @@
 # libosip2
 #
 #############################################################
-LIBOSIP2_VERSION=3.1.0
-LIBOSIP2_SOURCE=libosip2-$(LIBOSIP2_VERSION).tar.gz
-LIBOSIP2_SITE=http://www.antisip.com/download/exosip2
-LIBOSIP2_INSTALL_STAGING=YES
+LIBOSIP2_VERSION = 3.3.0
+LIBOSIP2_SOURCE = libosip2_$(LIBOSIP2_VERSION).orig.tar.gz
+LIBOSIP2_PATCH = libosip2_$(LIBOSIP2_VERSION)-1.diff.gz
+LIBOSIP2_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libo/libosip2
+LIBOSIP2_INSTALL_STAGING = YES
 
-LIBOSIP2_CONF_OPT = \
-	--with-gnu-ld \
-	--enable-shared \
-	--enable-static
+ifneq ($(LIBOSIP2_PATCH),)
+define LIBOSIP2_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		(cd $(@D)/debian/patches && for i in *; \
+		 do $(SED) 's,^\+\+\+ .*cvs-$(LIBOSIP2_VERSION)/,+++ cvs-$(LIBOSIP2_VERSION)/,' $$i; \
+		 done; \
+		); \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*; \
+	fi
+endef
+endif
+
+LIBOSIP2_POST_PATCH_HOOKS += LIBOSIP2_DEBIAN_PATCHES
 
 $(eval $(call AUTOTARGETS,package,libosip2))
-- 
1.7.1
