From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Jan 2011 22:50:39 +0100
Subject: [Buildroot] [git commit master 1/1] makedevs: Add support for
	16-bit major/minor numbers
Message-ID: <20110114215058.1792A8B527@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7879a4ba3fb9effbf2b89ed744abf200d1386e1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2647

[Peter: Adjust for the real 12bit majors/20bit minors supported by Linux]
Signed-off-by: Matt Fleming <matthew.fleming@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                     |   15 ++++++++-------
 package/makedevs/makedevs.c |    4 ++--
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 15ae301..fd9da9c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,13 +18,13 @@
 	hostapd, i2c-tools, icu, input-tools, iproute2, iptables,
 	jpeg, libaio, libcap, libconfig, libglib2, libogg, libtheora,
 	libtool, libvorbis, libxml2, libxslt, linux-fusion, lsof,
-	ltp-testsuite, ltrace, lvm2, m4, memtester, mesa3d, mii-diag,
-	mpc, mpfr, mplayer, mrouted, nano, netperf, netplug, openssh,
-	openssl, openvpn, oprofile, pango, patch, pciutils, php,
-	portmap, qt, rsync, screen, sdl_gfx, sdl_sound, sqlite, squid,
-	sstrip, sysklogd, sysvinit, tar, tslib, udev, usbutils, vim,
-	vtun, webkit, xapp_xlogo, xkeyboard-config, xlib_libX11, xz,
-	zlib
+	ltp-testsuite, ltrace, lvm2, m4, makedevs, memtester, mesa3d,
+	mii-diag, mpc, mpfr, mplayer, mrouted, nano, netperf, netplug,
+	openssh, openssl, openvpn, oprofile, pango, patch, pciutils,
+	php, portmap, qt, rsync, screen, sdl_gfx, sdl_sound, sqlite,
+	squid, sstrip, sysklogd, sysvinit, tar, tslib, udev, usbutils,
+	vim, vtun, webkit, xapp_xlogo, xkeyboard-config, xlib_libX11,
+	xz, zlib
 
 	New packages: dhrystone, fbgrab, irda-utils, libao, lsuio,
 	rsh-redone, sdparm, vorbis-tools, whetstone, xl2tp
@@ -37,6 +37,7 @@
 	#561:  ltp-testsuite failed to install
 	#1651: Build fail caused by ccache in module-init-tools
 	#1735: [PATCH] mplayer: convert to autotools infrastructure
+	#2647: makedevs package lacks support for 16-bit major/minor numbers
 	#2371: QT MYSQL Module does not build when MySQL installed on the host
 	#2905: Qt: Speed up compilation, if gui-module isn't selected
 	#2929: genext2fs: couldn't allocate a block (no free space)
diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index 5ca45e9..a0e7450 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -414,7 +414,7 @@ int main(int argc, char **argv)
 		if ((2 > sscanf(line, "%40s %c %o %40s %40s %u %u %u %u %u", name,
 						&type, &mode, user, group, &major,
 						&minor, &start, &increment, &count)) ||
-				((major | minor | start | count | increment) > 255))
+				((major | minor | start | count | increment) > 0xfffff))
 		{
 			if (*line=='\0' || *line=='#' || isspace(*line))
 				continue;
@@ -488,7 +488,7 @@ int main(int argc, char **argv)
 				int i;
 				char *full_name_inc;
 
-				full_name_inc = xmalloc(strlen(full_name) + 4);
+				full_name_inc = xmalloc(strlen(full_name) + 8);
 				for (i = start; i < count; i++) {
 					sprintf(full_name_inc, "%s%d", full_name, i);
 					rdev = makedev(major, minor + (i * increment - start));
-- 
1.7.2.2
