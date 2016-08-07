From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Aug 2016 10:20:03 +0200
Subject: [Buildroot] [PATCH] libcofi: disable for static-only builds
Message-ID: <1470558003-19548-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libcofi package unconditionally builds a shared library, so we need
to make it unavailable on BR2_STATIC_LIBS=y configurations.

Fixes:

  http://autobuild.buildroot.net/results/329c09bf123cd5b6dbcfff6251ba7a2c7cce50b8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcofi/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libcofi/Config.in b/package/libcofi/Config.in
index e9914d6..df9ab71 100644
--- a/package/libcofi/Config.in
+++ b/package/libcofi/Config.in
@@ -1,8 +1,14 @@
 config BR2_PACKAGE_LIBCOFI
 	bool "libcofi"
 	depends on BR2_arm
+	# builds a shared library
+	depends on !BR2_STATIC_LIBS
 	help
 	  A replacement for memcpy and memset functionality for the
 	  Raspberry Pi with the intention of gaining greater performance.
 
 	  https://github.com/simonjhall/copies-and-fills
+
+comment "libcofi needs a toolchain w/ dynamic library"
+	depends on BR2_arm
+	depends on BR2_STATIC_LIBS
-- 
2.7.4
