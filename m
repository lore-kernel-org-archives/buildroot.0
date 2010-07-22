From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 13:08:24 +0200
Subject: [Buildroot] [git commit master 1/1] mplayer: fix build after
	efb1d8d3f40 (Cleanup TARGET_CONFIGURE_OPTS)
Message-ID: <20100722110847.DBC8782DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=89fc8a4f5a900ce493c4aabb29bbd6186f27ebf8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mplayer's configure script got confused by the equal sign (=) we now have
in TARGET_CC because of --sysroot=<path>.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    8 +++---
 .../mplayer/mplayer-1.0rc2-fix-cc-parsing.patch    |   22 ++++++++++++++++++++
 2 files changed, 26 insertions(+), 4 deletions(-)
 create mode 100644 package/multimedia/mplayer/mplayer-1.0rc2-fix-cc-parsing.patch

diff --git a/CHANGES b/CHANGES
index f6388c5..381141a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,10 +21,10 @@
 	gst-plugins-base, gstreamer, gzip, intltool, ipsec-tools,
 	iptables, libart, libcgi, libdrm, libfuse, libgpg-error,
 	libidn, liblockfile, libpng, lighttpd, links, linux-fusion,
-	lmbench, lrzsz, ltrace, make, module-init-tools, mysql_client,
-	nbd, ncurses, neon, netcat, netperf, ntfsprogs, openssl, php,
-	qt, quagga, sqlite, sdl, sdl_mixer, sdl_sound, sdl_ttf,
-	squashfs, tn5250, tremor, usbutils, xkeyboard-config,
+	lmbench, lrzsz, ltrace, make, module-init-tools, mplayer,
+	mysql_client, nbd, ncurses, neon, netcat, netperf, ntfsprogs,
+	openssl, php, qt, quagga, sqlite, sdl, sdl_mixer, sdl_sound,
+	sdl_ttf, squashfs, tn5250, tremor, usbutils, xkeyboard-config,
 	xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
diff --git a/package/multimedia/mplayer/mplayer-1.0rc2-fix-cc-parsing.patch b/package/multimedia/mplayer/mplayer-1.0rc2-fix-cc-parsing.patch
new file mode 100644
index 0000000..770e145
--- /dev/null
+++ b/package/multimedia/mplayer/mplayer-1.0rc2-fix-cc-parsing.patch
@@ -0,0 +1,22 @@
+[PATCH] mplayer: fix --cc= parsing if the value contains equal signs (=)
+
+E.G. if -cc="$CROSS-gcc --sysroot=<SYSROOT>" is passed.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ configure |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: MPlayer-1.0rc2/configure
+===================================================================
+--- MPlayer-1.0rc2.orig/configure
++++ MPlayer-1.0rc2/configure
+@@ -761,7 +761,7 @@ for ac_option do
+     _target=`echo $ac_option | cut -d '=' -f 2`
+     ;;
+   --cc=*)
+-    _cc=`echo $ac_option | cut -d '=' -f 2`
++    _cc=`echo $ac_option | cut -d '=' -f 2-`
+     ;;
+   --host-cc=*)
+     _host_cc=`echo $ac_option | cut -d '=' -f 2`
-- 
1.7.1
