From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 16:31:35 +0100
Subject: [Buildroot] [git commit master] rpm: fix build with
	BR2_CONFIG_CACHE, fix CFLAGS
Message-ID: <20091123153333.EAF37777E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3d82609bd11b9b3c9949ef4c9d078df1ccdd39d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 package/rpm/rpm.mk |    6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 41df742..264c398 100644
--- a/CHANGES
+++ b/CHANGES
@@ -28,7 +28,7 @@
 	libupnp, libuuid, libxml2, lighttpd, ltrace, lua, lzma, magiccube4d,
 	matchbox, mdadm, nbd, ncftp, ncurses, netkittelnet, netsnmp,
 	ng-spice-rework, ntfs-3g, openntp, openssl, pcmanfm, php, psmisc,
-	python, quagga, radvd, rsync, rubix, samba, sawman, sdl,
+	python, quagga, radvd, rpm, rsync, rubix, samba, sawman, sdl,
 	shared-mime-info, sfdisk, spawn-fcgi, speech-tools, sqlite, squashfs,
 	synergy, syslinux, target-binutils, tcpdump, torsmo, u-boot, udpcast,
 	util-linux, valgrind, vsftpd, wipe, wpa-supplicant, x11vnc,
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index e769a05..d3da779 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -10,8 +10,10 @@ RPM_LIBTOOL_PATCH = NO
 
 RPM_DEPENDENCIES = zlib bzip2 beecrypt neon popt
 
-RPM_CONF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon" \
+RPM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon" \
 		ac_cv_va_copy=yes
+# the above doesn't work with shared config.cache
+RPM_USE_CONFIG_CACHE = NO
 
 RPM_CONF_OPT = --disable-build-versionscript --disable-rpath \
 	--without-selinux \
@@ -22,7 +24,7 @@ RPM_CONF_OPT = --disable-build-versionscript --disable-rpath \
 	--with-mutex=UNIX/fcntl \
 	--with-bzip2
 
-RPM_MAKE_OPT = -j1
+RPM_MAKE = $(MAKE1)
 
 RPM_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) program_transform_name= install
 
-- 
1.6.3.3
