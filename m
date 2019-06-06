From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu,  6 Jun 2019 11:09:59 +0200
Subject: [Buildroot] [PATCH] package/snort: work around gcc bug 85180
Message-ID: <20190606090959.122857-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building snort with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
force using -O0.

Fixes:
http://autobuild.buildroot.net/results/d24/d2412710f6cfbfc069e7858e507e28555baafa3e/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
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
-- 
2.17.1
