From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 22:58:26 +0200
Subject: [Buildroot] [git commit] libcofi: disable for static-only builds
Message-ID: <20160807205907.29A5681E40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95682636b801fa9d3e6a2d282e247a498341fb47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libcofi package unconditionally builds a shared library, so we need
to make it unavailable on BR2_STATIC_LIBS=y configurations.

Fixes:

  http://autobuild.buildroot.net/results/329c09bf123cd5b6dbcfff6251ba7a2c7cce50b8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
