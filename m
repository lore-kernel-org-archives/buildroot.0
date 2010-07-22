From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 13:08:24 +0200
Subject: [Buildroot] [git commit master 1/1] ltrace: fix build without
	USE_DEMANGLE
Message-ID: <20100722110847.0C66D82DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=80890ab0ec1218d83c19b9fcab0e98a913380747
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    8 +++---
 ...ltrace-0.5-fix-build-without-USE_DEMANGLE.patch |   27 ++++++++++++++++++++
 2 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 package/ltrace/ltrace-0.5-fix-build-without-USE_DEMANGLE.patch

diff --git a/CHANGES b/CHANGES
index a67effe..6600eee 100644
--- a/CHANGES
+++ b/CHANGES
@@ -20,10 +20,10 @@
 	dropbear, e2fsprogs, fbv, file, flex, fontconfig, gawk,
 	gstreamer, gzip, intltool, ipsec-tools, iptables, libart,
 	libcgi, libdrm, libfuse, libgpg-error, libidn, liblockfile,
-	libpng, lighttpd, links, linux-fusion, lmbench, lrzsz, make,
-	module-init-tools, mysql_client, nbd, ncurses, neon, netcat,
-	netperf, ntfsprogs, openssl, php, qt, quagga, sqlite, sdl,
-	sdl_mixer, sdl_sound, sdl_ttf, squashfs, tn5250, tremor,
+	libpng, lighttpd, links, linux-fusion, lmbench, lrzsz, ltrace,
+	make, module-init-tools, mysql_client, nbd, ncurses, neon,
+	netcat, netperf, ntfsprogs, openssl, php, qt, quagga, sqlite,
+	sdl, sdl_mixer, sdl_sound, sdl_ttf, squashfs, tn5250, tremor,
 	usbutils, xkeyboard-config, xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
diff --git a/package/ltrace/ltrace-0.5-fix-build-without-USE_DEMANGLE.patch b/package/ltrace/ltrace-0.5-fix-build-without-USE_DEMANGLE.patch
new file mode 100644
index 0000000..180f688
--- /dev/null
+++ b/package/ltrace/ltrace-0.5-fix-build-without-USE_DEMANGLE.patch
@@ -0,0 +1,27 @@
+[PATCH] ltrace: fix build when USE_DEMANGLE isn't enabled
+
+summary.c unconditionally calls my_demangle(), which is only available
+when USE_DEMANGLE is enabled (which requires libiberty).
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ summary.c |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+Index: ltrace-0.5/summary.c
+===================================================================
+--- ltrace-0.5.orig/summary.c
++++ ltrace-0.5/summary.c
+@@ -83,7 +83,12 @@ void show_summary(void)
+ 		       (int)entries[i].tv.tv_sec, (int)entries[i].tv.tv_usec,
+ 		       (unsigned long int)(c / entries[i].count),
+ 		       entries[i].count,
++#ifdef USE_DEMANGLE
+ 		       opt_C ? my_demangle(entries[i].name) : entries[i].name);
++#else
++		       entries[i].name);
++#endif
++
+ 	}
+ 	printf
+ 	    ("------ ----------- ----------- --------- --------------------\n");
-- 
1.7.1
