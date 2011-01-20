From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 19 Jan 2011 22:10:29 -0500
Subject: [Buildroot] [PATCH 1/4] libpcap: update static handling
In-Reply-To: <1295493022-4659-1-git-send-email-vapier@gentoo.org>
References: <1295493022-4659-1-git-send-email-vapier@gentoo.org>
Message-ID: <1295493032-4705-1-git-send-email-vapier@gentoo.org>
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
 package/libpcap/libpcap.mk |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index eebfc03..1c5f6e6 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -8,12 +8,8 @@ LIBPCAP_VERSION:=1.1.1
 LIBPCAP_SITE:=http://www.tcpdump.org/release
 LIBPCAP_SOURCE:=libpcap-$(LIBPCAP_VERSION).tar.gz
 LIBPCAP_INSTALL_STAGING:=YES
-# doesn't have an install-strip
-LIBPCAP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" \
-	$(if $(BR2_PREFER_STATIC_LIB),install,install-shared)
-LIBPCAP_INSTALL_STAGING_OPT= DESTDIR="$(STAGING_DIR)" install \
-	$(if $(BR2_PREFER_STATIC_LIB),,install-shared)
 LIBPCAP_DEPENDENCIES:=zlib
+LIBPCAP_MAKE_OPT:=DYEXT=none
 LIBPCAP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst .,$(space),$(firstword $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))))) \
 		  ac_cv_header_linux_wireless_h=yes # configure misdetects this
 LIBPCAP_CONF_OPT:=--disable-yydebug --with-pcap=linux
-- 
1.7.4.rc2
