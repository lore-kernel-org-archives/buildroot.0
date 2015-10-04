From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 4 Oct 2015 16:34:41 +0100
Subject: [Buildroot] [PATCH] python-numpy: re-enable for uClibc
Message-ID: <1443972881-24357-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit b0f025386f6861fdc21e38e3a33b65669276f2c2 a patch was added
to make sure that python-numpy does work in uClibc. This patch was
needed for the x86 architecture, because uClibc in fact does support
fenv for x86. However, we don't turn on this support in our uClibc
config. Because the Config.in depends still allowed uClibc for x86,
this lead to a built failure, which lead to the fix in commit b0f02538.
But since this fix also fixes it for all other (supported)
architectures, we can just remove the !uClibc dependency completely.

This is also propagated to the reverse dependency in opencv3.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/opencv3/Config.in      | 1 -
 package/python-numpy/Config.in | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 137a351..4977925 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -170,7 +170,6 @@ config BR2_PACKAGE_OPENCV3_LIB_PYTHON
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
 		|| BR2_sh || BR2_x86_64 # python-numpy
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_i386 || BR2_x86_64 # python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
 	help
 	  Include opencv_python module into the OpenCV build.
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 1f9938a..f8170f8 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -4,9 +4,6 @@ config BR2_PACKAGE_PYTHON_NUMPY
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
 		|| BR2_sh || BR2_x86_64
-	# numpy needs fenv.h. Available for all architectures in
-	# glibc, but only for x86 and x86-64 in uClibc.
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_i386 || BR2_x86_64
 	help
 	  NumPy is the fundamental package for scientific computing
 	  with Python.
-- 
2.5.3
