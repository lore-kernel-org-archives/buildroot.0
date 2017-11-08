From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Wed,  8 Nov 2017 19:41:14 +0300
Subject: [Buildroot] [PATCH] python-numpy: disable for ARCompact
Message-ID: <20171108164114.1041-1-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package fails when building for ARCompact due to toolchain issue.

Marking this with special comment "#ARC toolchain issues for ARCompact"
as the package is to be enabled as soon as the issue with the ARC toolchain is resolved.
Fixes:
	http://autobuild.buildroot.net/results/4c4/4c4eaa90335756448007ae3c5ae3839fb17d4442//

The same issue appears building "trousers" package for ARCompact.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
CC: Alexey Brodkin <abrodkin@synopsys.com>
CC: arc-buildroot at synopsys.com
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
 package/python-numpy/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 859542f584..403b466417 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -1,13 +1,15 @@
 config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	bool
 	# Numpy has some CPU specific code
-	default y if BR2_arc || BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
-		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
-		|| BR2_sh || BR2_x86_64
+	default y if (BR2_arc && !(BR2_arc770d && BR2_arc750d)) || BR2_aarch64 \
+		|| BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel \
+		|| BR2_powerpc || BR2_powerpc64 || BR2_sh || BR2_x86_64
 
 config BR2_PACKAGE_PYTHON_NUMPY
 	bool "python-numpy"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	#ARC toolchain issues for ARCompact
+	depends on !BR2_arc770d && !BR2_arc750d
 	help
 	  NumPy is the fundamental package for scientific computing
 	  with Python.
-- 
2.11.0
