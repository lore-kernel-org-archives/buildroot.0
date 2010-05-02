From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 00:00:10 +0200
Subject: [Buildroot] [git commit master] libxslt: fix host compilation
Message-ID: <20100502220949.282E48A6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6af9c84a5192c2d250b47ba06808dc08ec4e17f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not build against libgcrypt on the host, since we don't build
libgcrypt ourself, and it might fail even when libgcrypt is installed
on the host:

...configure...
checking for libgcrypt-config... /usr/bin/libgcrypt-config
Crypto extensions will be available.

...build...
gcc: /usr/lib/libgcrypt.so: No such file or directory

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/libxslt/libxslt.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4ef1fc7..57d6de1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,7 +15,7 @@
 	Updated/fixed packages: alsa-utils, busybox, dnsmasq,
 	dosfstools, e2fsprogs, eeprog, fbv, freetype, haserl, hostapd,
 	iperf, iptables, iw, less, libaio,libdrm, libgcrypt, libglib2,
-	libpng, libxml2, lua, matchbox, mdadm, memstat, mesa3d,
+	libpng, libxml2, libxslt, lua, matchbox, mdadm, memstat, mesa3d,
 	mtd-utils, nano, openssl, pciutils, php, pixman, portage,
 	pppd, pthread-stubs, python, qt, radvd, samba, setserial,
 	squashfs, tslib, usb_modeswith, wget, xdata_xcursor-themes,
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 407924d..e77663d 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -27,7 +27,8 @@ LIBXSLT_DEPENDENCIES = libxml2 $(LIBXSLT_DEPENDENCIES_EXTRA)
 HOST_LIBXSLT_CONF_OPT = --enable-shared \
 			--without-debugging \
 			--without-python \
-			--without-threads
+			--without-threads \
+			--without-crypto
 
 HOST_LIBXSLT_DEPENDENCIES = host-libxml2
 
-- 
1.6.3.3
