From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Jul 2010 08:59:36 +0200
Subject: [Buildroot] [git commit master 1/1] netcat: fix logic for archs
	with unsigned chars
Message-ID: <20100720065956.B2B5382B80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6c387f2e691293df096349af0f08c071d6f21a65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2245

Signed-off-by: Nick Leverton <nick@leverton.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    5 ++-
 .../netcat/netcat-0.7.1-signed-bit-counting.patch  |   30 ++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 package/netcat/netcat-0.7.1-signed-bit-counting.patch

diff --git a/CHANGES b/CHANGES
index 59b4a6f..1386a77 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,8 +21,8 @@
 	iptables, libart, libcgi, libfuse, libgpg-error, libidn,
 	liblockfile, libpng, links, linux-fusion, lmbench, lrzsz,
 	make, module-init-tools, mysql_client, nbd, ncurses, neon,
-	netperf, ntfsprogs, openssl, php, qt, quagga, sqlite, sdl,
-	sdl_mixer, sdl_sound, sdl_ttf, squashfs, tn5250, tremor,
+	netcat, netperf, ntfsprogs, openssl, php, qt, quagga, sqlite,
+	sdl, sdl_mixer, sdl_sound, sdl_ttf, squashfs, tn5250, tremor,
 	usbutils, xkeyboard-config, xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
@@ -70,6 +70,7 @@
 	#2191: linux-fusion build fail
 	#2221: Qt does not compile (dependencies not taken into account?)
 	#2233: Atmel atstk target skeletons have /etc/mtab as a file, not ...
+	#2245: Netcat does not work due to incorrect assumptions about signed..
 
 2010.05, Released May 30th, 2010:
 
diff --git a/package/netcat/netcat-0.7.1-signed-bit-counting.patch b/package/netcat/netcat-0.7.1-signed-bit-counting.patch
new file mode 100644
index 0000000..e29da31
--- /dev/null
+++ b/package/netcat/netcat-0.7.1-signed-bit-counting.patch
@@ -0,0 +1,30 @@
+# Fix the endian-specific bit-counting code so that it works.
+# SF:1068324 "netcat_flag_count() fix"
+#   http://sourceforge.net/tracker/?func=detail&aid=1205729&group_id=52204&atid=466046
+# SF:1205729 "doen't work on arm linux platform":
+#   http://sourceforge.net/tracker/?func=detail&aid=1068324&group_id=52204&atid=466046
+
+Index: netcat-0.7.1/src/flagset.c
+===================================================================
+--- netcat-0.7.1.orig/src/flagset.c	2010-07-19 13:51:46.000000000 +0100
++++ netcat-0.7.1/src/flagset.c	2010-07-19 13:52:27.000000000 +0100
+@@ -134,7 +134,7 @@
+ 
+ int netcat_flag_count(void)
+ {
+-  register char c;
++  register unsigned char c;
+   register int i;
+   int ret = 0;
+ 
+@@ -154,8 +154,8 @@
+ 	Assumed that the bit number 1 is the sign, and that we will shift the
+ 	bit 1 (or the bit that takes its place later) until the the most right,
+ 	WHY it has to keep the wrong sign? */
+-      ret -= (c >> 7);
+-      c <<= 1;
++      ret += c&1;
++      c>>=1;
+     }
+   }
+ 
-- 
1.7.1
