From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Feb 2011 23:37:36 +0100
Subject: [Buildroot] [git commit master 1/1] makedevs: fix cases where
	(start != 0)
Message-ID: <20110223224020.3D7678F626@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a85971a68b6661327e21f44ce50925b220997dbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The makedevs script did not always generate the requested set of device names / minor number series.
* If start != 0, then requesting (count) devices would generate only (count - start)
* If start != 0 && increment != 1, then requesting minors starting with (minor) would generate minors starting with (minor + (start * (increment - 1)))

This patch fixes the code and updates the usage text with extra examples.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                     |    9 +++++----
 package/makedevs/makedevs.c |   18 +++++++++++++-----
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 757754e..3858296 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,10 +10,11 @@
 	enchant, fakeroot, gmpc, gpsd, gvfs, iperf, jpeg, libarchive,
 	libcgicc, libdaemon, libdrm, libevent, libgail, libglib2,
 	libgpg-error, libmicrohttpd, librsvg, libsoup, libxcp,
-	matchbox-fakekey, matchbox-startup-monitor, mdadm, metacity,
-	mpd, nasm, nfs-utils, olsr, popt, pthread-stubs, quagga, rpm,
-	samba, sdl, sdl_gfx, sdl_image, sdl_mixer, sdl_sound, sdl_ttf,
-	squashfs, taglib, tcpreplay, tiff, wpa_supplicant, xcb-util,
+	makedevs, matchbox-fakekey, matchbox-startup-monitor, mdadm,
+	metacity, mpd, nasm, nfs-utils, olsr, popt, pthread-stubs,
+	quagga, rpm, samba, sdl, sdl_gfx, sdl_image, sdl_mixer,
+	sdl_sound, sdl_ttf, squashfs, taglib, tcpreplay, tiff,
+	wpa_supplicant, xcb-util,
 	xdriver_xf86-input-{acepad,aiptek,evdev,joystick,keyboard},
 	xdriver_xf86-input-{mouse,synaptics,void},
 	xdriver_xf86-video-{chips,dummy,geode,glide,intel,nv,wsfb},
diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index a0e7450..79cfc60 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -345,14 +345,22 @@ void bb_show_usage(void)
 	fprintf(stderr, "/dev/null    c    666    0    0     1       3       0       0     -\n");
 	fprintf(stderr, "/dev/zero    c    666    0    0     1       5       0       0     -\n");
 	fprintf(stderr, "/dev/hda     b    640    0    0     3       0       0       0     -\n");
-	fprintf(stderr, "/dev/hda     b    640    0    0     3       1       1       1     15\n\n");
+	fprintf(stderr, "/dev/hda     b    640    0    0     3       1       1       1     15\n");
+	fprintf(stderr, "/dev/rtp     b    640    0    0     250     0       0       1     5\n");
+	fprintf(stderr, "/dev/gps     b    640    0    0     251     0       1       1     5\n");
+	fprintf(stderr, "/dev/uio     b    640    0    0     252     0       1       2     5\n");
+	fprintf(stderr, "/dev/uio     b    640    0    0     252     1       6       2     5\n\n");
 	fprintf(stderr, "Will Produce:\n");
 	fprintf(stderr, "/dev\n");
 	fprintf(stderr, "/dev/console\n");
 	fprintf(stderr, "/dev/null\n");
 	fprintf(stderr, "/dev/zero\n");
 	fprintf(stderr, "/dev/hda\n");
-	fprintf(stderr, "/dev/hda[0-15]\n");
+	fprintf(stderr, "/dev/hda[1-15] with minor numbers [1-15]\n");
+	fprintf(stderr, "/dev/rtp[0-4]  with minor numbers [0-4]\n");
+	fprintf(stderr, "/dev/gps[1-5]  with minor numbers [0-4]\n");
+	fprintf(stderr, "/dev/uio[1-5]  with minor numbers 0,2,4,6,8\n");
+	fprintf(stderr, "/dev/uio[6-10] with minor numbers 1,3,5,7,9\n");
 	exit(1);
 }
 
@@ -489,9 +497,9 @@ int main(int argc, char **argv)
 				char *full_name_inc;
 
 				full_name_inc = xmalloc(strlen(full_name) + 8);
-				for (i = start; i < count; i++) {
-					sprintf(full_name_inc, "%s%d", full_name, i);
-					rdev = makedev(major, minor + (i * increment - start));
+				for (i = 0; i < count; i++) {
+					sprintf(full_name_inc, "%s%d", full_name, start + i);
+					rdev = makedev(major, minor + i * increment);
 					if (mknod(full_name_inc, mode, rdev) == -1) {
 						bb_perror_msg("line %d: Couldnt create node %s", linenum, full_name_inc);
 						ret = EXIT_FAILURE;
-- 
1.7.3.4
