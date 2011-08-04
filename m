From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Aug 2011 22:13:37 +0200
Subject: [Buildroot] [git commit] pkg-config: Add "mapdir" to sysroot
	handled variables
Message-ID: <20110804201503.43D598B505@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5496bc399bc9eee202dbd7bd1d143722f30536e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3583, #3649

Fixes xfonts_font-adobe build failure.

Signed-off-by: Michael J. Hammel <mjhammel@graphics-muse.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |   10 ++++++----
 .../pkg-config/pkg-config-0.25-fix-variable.patch  |    7 ++++---
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 158ab6a..09ef71e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,10 +21,10 @@
 	gvfs, hostapd, iproute2, iptables, iw, jpeg, lame, libarchive,
 	libdnet, libdrm, libgcrypt, libgtk2, libmpeg2, libpng,
 	libsoup, lighttpd, linux-fusion, lzo, midori, mtd-utils,
-	nfs-utils, openvpn, oprofile, orc, proftpd, qt, ruby, samba,
-	sdl, shared-mime-info, sudo, sqlite, squid, synergy, udev,
-	usbmount, usbutils, util-linux, valgrind, webkit,
-	xorg-xserver, xz, zlib
+	nfs-utils, openvpn, oprofile, orc, pkg-config, proftpd, qt,
+	ruby, samba, sdl, shared-mime-info, sudo, sqlite, squid,
+	synergy, udev, usbmount, usbutils, util-linux, valgrind,
+	webkit, xorg-xserver, xz, zlib
 
 	New packages: acl, attr, ebtables, gnutls, inotify-tools,
 	ipset, libargtable2, libiqrf, libmnl, libnspr, libnss,
@@ -40,6 +40,8 @@
 	#3559: libnspr: Add new package
 	#3595: patch to add libroxml
 	#3565: libnss: Add new package
+	#3583: xfonts_font-adobe-100dpi fails due to missing map file
+	#3649: [PATCH] Add mapdir to existing pkg-config patch
 	#3907: 2011.05 - Qt 4.7.3 not building on ARM
 	#3961: Nfs-utils: Remove SUSv3-function index
 	#3985: "help" target's defconfig list needs sort
diff --git a/package/pkg-config/pkg-config-0.25-fix-variable.patch b/package/pkg-config/pkg-config-0.25-fix-variable.patch
index 0b1d4a9..13a2b91 100644
--- a/package/pkg-config/pkg-config-0.25-fix-variable.patch
+++ b/package/pkg-config/pkg-config-0.25-fix-variable.patch
@@ -8,20 +8,21 @@ so ensure the sysroot'ed files are used.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 ---
- main.c |    5 +++++
- 1 file changed, 5 insertions(+)
+ main.c |    6 +++++
+ 1 file changed, 6 insertions(+)
 
 Index: pkg-config-0.25/main.c
 ===================================================================
 --- pkg-config-0.25.orig/main.c
 +++ pkg-config-0.25/main.c
-@@ -700,6 +700,11 @@
+@@ -700,6 +700,12 @@
    if (variable_name)
      {
        char *str = packages_get_var (packages, variable_name);
 +      /* include/lib variable? */
 +      if (pcsysrootdir &&
 +          (!strcmp(variable_name, "includedir") ||
++           !strcmp(variable_name, "mapdir") ||
 +           !strcmp(variable_name, "libdir")))
 +          printf ("%s/", pcsysrootdir);
        printf ("%s", str);
-- 
1.7.3.4
