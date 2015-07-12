From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 16:14:26 +0200
Subject: [Buildroot] [git commit] kismet: mark as not available for static
	builds
Message-ID: <20150712141448.8B2C0817E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2af75321d25c515c325250ecb4476699f3bfdbc4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit a3365ebf72fc34c71e28191f107280b9d7c825a1, and
marks kismet as not available for static builds.

Commit a3365ebf72fc34c71e28191f107280b9d7c825a1 is indeed
insufficient, since kismet uses <dlfcn.h> in two places, both in
kismet_server and kismet_client. And it's fairly unlikely that kismet
will be used in pure static environments, so let's not support this
use case.

Fixes:

  http://autobuild.buildroot.net/results/c24/c24e3e325df9748e9959fe79f7026d24f118dffd/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kismet/Config.in |    6 ++++--
 package/kismet/kismet.mk |    4 ----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 8bbc9a6..7265c63 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -1,12 +1,14 @@
-comment "kismet needs a toolchain w/ threads, C++"
+comment "kismet needs a toolchain w/ threads, C++, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_KISMET
 	bool "kismet"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_LIBPCAP
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 56f6247..64a0ab2 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -15,10 +15,6 @@ KISMET_LICENSE_FILES = debian/copyright
 # We touch configure.in:
 KISMET_AUTORECONF = YES
 
-ifeq ($(BR2_STATIC_LIBS),y)
-KISMET_CONF_ENV = LIBS="-lpcap $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
-endif
-
 ifeq ($(BR2_PACKAGE_PCRE),y)
 KISMET_DEPENDENCIES += pcre
 endif
