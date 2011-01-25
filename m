From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jan 2011 09:46:58 +0100
Subject: [Buildroot] [PATCH 1/1] tcpdump,
	libpcap: simplify and fix ac_cv_linux_vers
In-Reply-To: <cover.1295945207.git.thomas.petazzoni@free-electrons.com>
References: <cover.1295945207.git.thomas.petazzoni@free-electrons.com>
Message-ID: <397ba8b1856a2465105b4a12e7500e50cc11768c.1295945207.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason, tcpdump and libpcap need to have some information
about the kernel version being used. This information is passed using
the ac_cv_linux_vers autoconf variable.

However, the current value is determined using
BR2_DEFAULT_KERNEL_HEADERS which is only defined when an internal
Buildroot toolchain is used. So it would break with an external
toolchain or the Crosstool-NG backend.

According to Mike Frysinger at
http://lists.busybox.net/pipermail/buildroot/2011-January/040861.html,
this value is only used to determine if the kernel version is 0.x, 1.x
or 2.x, so passing ac_cv_linux_vers=2 is sufficient since Buildroot
only supports the 2.6 kernel anyway.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpcap/libpcap.mk |    2 +-
 package/tcpdump/tcpdump.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index eebfc03..a2d0376 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -14,7 +14,7 @@ LIBPCAP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" \
 LIBPCAP_INSTALL_STAGING_OPT= DESTDIR="$(STAGING_DIR)" install \
 	$(if $(BR2_PREFER_STATIC_LIB),,install-shared)
 LIBPCAP_DEPENDENCIES:=zlib
-LIBPCAP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst .,$(space),$(firstword $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))))) \
+LIBPCAP_CONF_ENV:=ac_cv_linux_vers=2 \
 		  ac_cv_header_linux_wireless_h=yes # configure misdetects this
 LIBPCAP_CONF_OPT:=--disable-yydebug --with-pcap=linux
 
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 8122816..720a29a 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -9,7 +9,7 @@
 TCPDUMP_VERSION:=4.1.1
 TCPDUMP_SITE:=http://www.tcpdump.org/release
 TCPDUMP_SOURCE:=tcpdump-$(TCPDUMP_VERSION).tar.gz
-TCPDUMP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst .,$(space),$(firstword $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS)))))
+TCPDUMP_CONF_ENV:=ac_cv_linux_vers=2
 TCPDUMP_CONF_OPT:=--without-crypto \
 		$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
 TCPDUMP_DEPENDENCIES:=zlib libpcap
-- 
1.7.0.4
