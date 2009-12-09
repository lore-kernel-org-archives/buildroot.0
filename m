From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Dec 2009 14:00:55 +0100
Subject: [Buildroot] [git commit master] libpcap: fix wireless handling
Message-ID: <20091209132020.1C7C67776F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=28ccc22ffd3d2fa8844f4572e14e32875c4ccd49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on ba23aa7b in libpcap upstream.

linux/wireless.h includes linux/if.h, which conflicts with net/if.h as
they both define if* structures. Fix build by simply using linux/if.h
instead of net/if.h.

The same fix should be done for the configure script, but cheat by
presetting it instead.

This fix in turn fixes kismet build with BR2_CONFIG_CACHE enabled, as
that uses the same ac_cv_linux_wireless_h cache value.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libpcap/libpcap-1.0.0-wireless.patch |   26 ++++++++++++++++++++++++++
 package/libpcap/libpcap.mk                   |    3 ++-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 package/libpcap/libpcap-1.0.0-wireless.patch

diff --git a/package/libpcap/libpcap-1.0.0-wireless.patch b/package/libpcap/libpcap-1.0.0-wireless.patch
new file mode 100644
index 0000000..7bcfcda
--- /dev/null
+++ b/package/libpcap/libpcap-1.0.0-wireless.patch
@@ -0,0 +1,26 @@
+[PATCH]: pcap-linux: fix build with wireless support
+
+Based on ba23aa7b upstream.
+
+linux/wireless.h includes linux/if.h, which conflicts with net/if.h as
+they both define if* structures. Fix build by simply using linux/if.h
+instead of net/if.h.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ pcap-linux.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: libpcap-1.0.0/pcap-linux.c
+===================================================================
+--- libpcap-1.0.0.orig/pcap-linux.c
++++ libpcap-1.0.0/pcap-linux.c
+@@ -93,7 +93,7 @@ static const char rcsid[] _U_ =
+ #include <sys/ioctl.h>
+ #include <sys/utsname.h>
+ #include <sys/mman.h>
+-#include <net/if.h>
++#include <linux/if.h>
+ #include <netinet/in.h>
+ #include <linux/if_ether.h>
+ #include <net/if_arp.h>
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index dc72924..801b15e 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -14,7 +14,8 @@ LIBPCAP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" \
 LIBPCAP_INSTALL_STAGING_OPT= DESTDIR="$(STAGING_DIR)" install \
 	$(if $(BR2_PREFER_STATIC_LIB),,install-shared)
 LIBPCAP_DEPENDENCIES:=zlib
-LIBPCAP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst .,$(space),$(firstword $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS)))))
+LIBPCAP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst .,$(space),$(firstword $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))))) \
+		  ac_cv_header_linux_wireless_h=yes # configure misdetects this
 LIBPCAP_CONF_OPT:=--disable-yydebug --with-pcap=linux
 
 $(eval $(call AUTOTARGETS,package,libpcap))
-- 
1.6.3.3
