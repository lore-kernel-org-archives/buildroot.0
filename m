From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Dec 2012 09:41:52 -0800
Subject: [Buildroot] [git commit] libpcap: fix canusb related build issue
Message-ID: <20121206175825.834BB9A033@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e63dcf20e2e457534346b144b32a2c4abe469a29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/1b57e479a643df11ea3b20f848085af4ef40799b

The libusb auto detection oddly enough succeeds, even though libusb isn't
available. Fix it by explicitly enabling/disabling canusb support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libpcap/libpcap.mk |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index d35c228..7e68f51 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -20,12 +20,18 @@ LIBPCAP_INSTALL_STAGING = YES
 # configure script correctly handles --enable-shared/--disable-shared.
 LIBPCAP_AUTORECONF = YES
 
-LIBPCAP_DEPENDENCIES = zlib \
-	$(if $(BR2_PACKAGE_LIBUSB),libusb)
+LIBPCAP_DEPENDENCIES = zlib
 LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \
 		ac_cv_header_linux_wireless_h=yes # configure misdetects this
 LIBPCAP_CONF_OPT = --disable-yydebug --with-pcap=linux
 
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+LIBPCAP_CONF_OPT += --enable-canusb
+LIBPCAP_DEPENDENCIES += libusb
+else
+LIBPCAP_CONF_OPT += --disable-canusb
+endif
+
 # microblaze needs -fPIC instead of -fpic
 ifeq ($(BR2_microblaze),y)
 LIBPCAP_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
