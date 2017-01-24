From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:37:58 +1300
Subject: [Buildroot] [git commit] package/ortp: bump version to 0.27.0
Message-ID: <20170124093906.101CF81775@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2564c3b321313b52122513c63e62353485ac7128
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ortp now depends on bctoolbox, which means we have to add the C++
dependency of bctoolbox to ortp and its reverse dependencies.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mediastreamer/Config.in | 2 +-
 package/ortp/Config.in          | 6 ++++--
 package/ortp/ortp.hash          | 2 +-
 package/ortp/ortp.mk            | 3 ++-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index 396f7e4..7e62bf2 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MEDIASTREAMER
 	bool "mediastreamer"
 	select BR2_PACKAGE_ORTP
-	depends on BR2_INSTALL_LIBSTDCPP # until fixed
+	depends on BR2_INSTALL_LIBSTDCPP # ortp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
 	help
 	  Mediastreamer is a powerful and lightweighted streaming
diff --git a/package/ortp/Config.in b/package/ortp/Config.in
index 2de3c91..788eaf4 100644
--- a/package/ortp/Config.in
+++ b/package/ortp/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_ORTP
 	bool "oRTP"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_BCTOOLBOX
 	help
 	  oRTP, a Real-time Transport Protocol (RTP,RFC3550) library
 
 	  http://www.linphone.org/eng/documentation/dev/ortp.html
 
-comment "ortp needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "ortp needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ortp/ortp.hash b/package/ortp/ortp.hash
index 8b099a7..c990d96 100644
--- a/package/ortp/ortp.hash
+++ b/package/ortp/ortp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	0deb826b79b1fd329f7638821d5439dc343bc55bb122daa6c90d19116cfe8d9a	ortp-0.25.0.tar.gz
+sha256  eb61a833ab3ad80978d7007411240f46e9b2d1034373b9d9dfaac88c1b6ec0af  ortp-0.27.0.tar.gz
diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index ca4a90d..da17231 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-ORTP_VERSION = 0.25.0
+ORTP_VERSION = 0.27.0
 ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
 
 ORTP_CONF_OPTS = --disable-strict
 ORTP_INSTALL_STAGING = YES
 ORTP_LICENSE = LGPLv2.1+
 ORTP_LICENSE_FILES = COPYING
+ORTP_DEPENDENCIES = bctoolbox
 
 $(eval $(autotools-package))
