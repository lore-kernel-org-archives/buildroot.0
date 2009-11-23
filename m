From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 15:10:53 +0100
Subject: [Buildroot] [git commit master] psmisc: bump version and fix build
Message-ID: <20091123141347.52F65777BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7ba54a07d42825e06292c09a34de4490929506b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

./configure in psmisc 22.6 tested for a working C++ compiler and errored out
if not found, even though psmisc doesn't need it - Fixed in 22.8.

pstree.c uses __progname for pstree.x11 support, which isn't (per default)
available in uclibc. This stuff isn't really critical, so just disable it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                   |   11 ++++++-----
 package/psmisc/psmisc-no-__progname.patch |   24 ++++++++++++++++++++++++
 package/psmisc/psmisc.mk                  |    6 +++---
 3 files changed, 33 insertions(+), 8 deletions(-)
 create mode 100644 package/psmisc/psmisc-no-__progname.patch

diff --git a/CHANGES b/CHANGES
index 43993a7..b620a1b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -27,11 +27,12 @@
 	libelf, libevent, libglib2, libidn, liblockfile, libmad, libpcap,
 	libupnp, libuuid, libxml2, lighttpd, ltrace, lua, lzma, magiccube4d,
 	matchbox, mdadm, nbd, ncftp, ncurses, netkittelnet, netsnmp,
-	ng-spice-rework, ntfs-3g, openntp, openssl, pcmanfm, php, python,
-	quagga, radvd, rsync, rubix, samba, sawman, sdl, shared-mime-info,
-	spawn-fcgi, speech-tools, sqlite, squashfs, synergy, syslinux,
-	target-binutils, tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe,
-	wpa-supplicant, xdata_xcursor-themes, xboard, xstroke, zlib
+	ng-spice-rework, ntfs-3g, openntp, openssl, pcmanfm, php, psmisc,
+	python, quagga, radvd, rsync, rubix, samba, sawman, sdl,
+	shared-mime-info, spawn-fcgi, speech-tools, sqlite, squashfs, synergy,
+	syslinux, target-binutils, tcpdump, u-boot, util-linux, valgrind,
+	vsftpd, wipe, wpa-supplicant, xdata_xcursor-themes, xboard, xstroke,
+	zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4, vice
 
diff --git a/package/psmisc/psmisc-no-__progname.patch b/package/psmisc/psmisc-no-__progname.patch
new file mode 100644
index 0000000..82e6daf
--- /dev/null
+++ b/package/psmisc/psmisc-no-__progname.patch
@@ -0,0 +1,24 @@
+[PATCH]: pstree: don't use glibc-specific __progname
+
+uclibc (per default) doesn't implement __progname, and the pstree.x11
+stuff isn't that critical, so just disable it.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/pstree.c |    3 ---
+ 1 file changed, 3 deletions(-)
+
+Index: psmisc-22.8/src/pstree.c
+===================================================================
+--- psmisc-22.8.orig/src/pstree.c
++++ psmisc-22.8/src/pstree.c
+@@ -893,9 +893,6 @@ main (int argc, char **argv)
+   bindtextdomain(PACKAGE, LOCALEDIR);
+   textdomain(PACKAGE);
+ #endif
+-  
+-  if (!strcmp(__progname, "pstree.x11"))
+-    wait_end=1;
+ 
+   /*
+    * Attempt to figure out a good default symbol set.  Will be overriden by
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 90a5186..9276b08 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -3,11 +3,11 @@
 # psmisc
 #
 #############################################################
-PSMISC_VERSION:=22.6
+PSMISC_VERSION:=22.8
 PSMISC_SOURCE:=psmisc-$(PSMISC_VERSION).tar.gz
 PSMISC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/psmisc
-PSMISC_AUTORECONF:=no
-PSMISC_INSTALL_STAGING:=no
+PSMISC_AUTORECONF:=NO
+PSMISC_INSTALL_STAGING:=NO
 PSMISC_INSTALL_TARGET:=YES
 PSMISC_CONF_ENV:=ac_cv_func_malloc_0_nonnull=yes \
 		 ac_cv_func_realloc_0_nonnull=yes
-- 
1.6.3.3
