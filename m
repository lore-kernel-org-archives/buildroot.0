From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Jun 2010 23:18:43 +0200
Subject: [Buildroot] [git commit master 1/1] dropbear: override detection of
	struct sockaddr_storage
Message-ID: <20100625212040.924728191D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c59d700786641403e10f33249b37a9f8f5a4712b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Configure misdetects this as no, but the result is not used for anything.
Unfortunately it breaks the build for other packages also checking for
struct sockaddr_storage (like rsync) when using a shared config cache,
so force it to yes.

Reported-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    8 ++++----
 package/dropbear/dropbear.mk |    5 +++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4046b67..27582cb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -14,10 +14,10 @@
 	luasocket, rings, wsapi, xavante, xterm
 
 	Updated/fixed packages: berkeleydb, busybox, cdrkit, dash,
-	dialog, diffutils, distcc, dmalloc, dnsmasq, fbv, file, gawk,
-	gstreamer, gzip, intltool, ipsec-tools, iptables, libart,
-	libfuse, libgpg-error, libidn, liblockfile, links, lmbench,
-	lrzsz, make, module-init-tools, nbd, ncurses, netperf,
+	dialog, diffutils, distcc, dmalloc, dnsmasq, dropbear, fbv,
+	file, gawk, gstreamer, gzip, intltool, ipsec-tools, iptables,
+	libart, libfuse, libgpg-error, libidn, liblockfile, links,
+	lmbench, lrzsz, make, module-init-tools, nbd, ncurses, netperf,
 	ntfsprogs, openssl, php, qt, quagga, sqlite, sdl, sdl_mixer,
 	sdl_ttf, squashfs, tn5250, usbutils, xkeyboard-config
 
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 2340f6a..c73525b 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -9,6 +9,11 @@ DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.gz
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_DEPENDENCIES = zlib
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
+# configure misdetects this as no, but the result is not used for
+# anything. Unfortunately it breaks the build for other packages also
+# checking for struct sockaddr_storage when using a shared config
+# cache, so force it to yes
+DROPBEAR_CONF_ENV = ac_cv_type_struct_sockaddr_storage=yes
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
 
-- 
1.7.1
