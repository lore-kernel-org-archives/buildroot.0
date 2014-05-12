From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 20:23:52 +0200
Subject: [Buildroot] [PATCH] libbluray: needs dynamic library support
Message-ID: <1399919032-9512-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dependency is propagated to XBMC, even though XBMC currently
requires an (e)glibc toolchain, which always have dynamic library
support. This is just in case one day XBMC can be built against
uClibc.

Fixes:

  http://autobuild.buildroot.org/results/3fa/3fae35ebcf14d6f38284d8318f61f9b99998794c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libbluray/Config.in | 4 +++-
 package/xbmc/Config.in      | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libbluray/Config.in b/package/libbluray/Config.in
index 2571f5c..e174773 100644
--- a/package/libbluray/Config.in
+++ b/package/libbluray/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_LIBBLURAY
 	bool "libbluray"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  libbluray is a client library for accessing bluray disks.
 
 	  http://www.videolan.org/developers/libbluray.html
 
-comment "libbluray needs a toolchain w/ threads"
+comment "libbluray needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index ed8872b..1e2f932 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -85,10 +85,14 @@ config BR2_PACKAGE_XBMC_DBUS
 config BR2_PACKAGE_XBMC_LIBBLURAY
 	bool "blu-ray"
 	select BR2_PACKAGE_LIBBLURAY
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Enable Blu-ray input support.
 	  Select this if you want to play back Blu-ray content.
 
+comment "libbluray support needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_XBMC_LIBCEC
 	bool "hdmi cec"
 	depends on !BR2_PREFER_STATIC_LIB # libcec
-- 
1.9.2
