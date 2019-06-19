From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 18:00:17 +0200
Subject: [Buildroot] [git commit] package/snort: work around gcc bug 85180
Message-ID: <20190619155942.609498282C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a2452df766b0bf05f498414b072079f25ebea88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building snort with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
force using -O0.

Fixes:
http://autobuild.buildroot.net/results/d24/d2412710f6cfbfc069e7858e507e28555baafa3e/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snort/snort.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index c767d7c545..191ef673d7 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -20,6 +20,10 @@ SNORT_CONF_OPTS = \
 	--with-libpcap-includes=$(STAGING_DIR)/usr/include/pcap \
 	--disable-static-daq
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+SNORT_CFLAGS += -O0
+endif
+
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 SNORT_DEPENDENCIES += libtirpc host-pkgconf
 SNORT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
