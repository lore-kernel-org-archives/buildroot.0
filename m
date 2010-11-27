From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 27 Nov 2010 18:55:09 -0500
Subject: [Buildroot] [PATCH] libpcap: update static handling
Message-ID: <1290902109-11971-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new version of libpcap changed how its install targets work.  The
main "install" target now always depends on "install-shared", so we
need to force the DYEXT variable to "none" in order to bypass shared.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/libpcap/libpcap.mk |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index eebfc03..377a60d 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -8,14 +8,11 @@ LIBPCAP_VERSION:=1.1.1
 LIBPCAP_SITE:=http://www.tcpdump.org/release
 LIBPCAP_SOURCE:=libpcap-$(LIBPCAP_VERSION).tar.gz
 LIBPCAP_INSTALL_STAGING:=YES
-# doesn't have an install-strip
-LIBPCAP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" \
-	$(if $(BR2_PREFER_STATIC_LIB),install,install-shared)
-LIBPCAP_INSTALL_STAGING_OPT= DESTDIR="$(STAGING_DIR)" install \
-	$(if $(BR2_PREFER_STATIC_LIB),,install-shared)
 LIBPCAP_DEPENDENCIES:=zlib
 LIBPCAP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst .,$(space),$(firstword $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))))) \
 		  ac_cv_header_linux_wireless_h=yes # configure misdetects this
 LIBPCAP_CONF_OPT:=--disable-yydebug --with-pcap=linux
 
 $(eval $(call AUTOTARGETS,package,libpcap))
+
+LIBPCAP_MAKE += $(if $(BR2_PREFER_STATIC_LIB),DYEXT=none)
-- 
1.7.3.2
