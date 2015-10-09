From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 15:34:02 +0200
Subject: [Buildroot] [git commit] python-numpy: introduce ARCH_SUPPORTS
	hidden variable
Message-ID: <20151009205547.30A7D81EF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb9014b329175b02d49db91105ba58a17b757c50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages selects python-numpy. This package has a some CPU specific
code. To simplify and avoid duplicate dependencies this patch introduce an
hidden ARCH_SUPPORTS variable.

[Thomas: fix the definition of the new option to make sure its value
is actually 'y' when a supported architecture is used.]

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-numpy/Config.in |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index f8170f8..f7822ef 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -1,9 +1,13 @@
-config BR2_PACKAGE_PYTHON_NUMPY
-	bool "python-numpy"
+config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	bool
 	# Numpy has some CPU specific code
-	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
+	default y if BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
 		|| BR2_sh || BR2_x86_64
+
+config BR2_PACKAGE_PYTHON_NUMPY
+	bool "python-numpy"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	help
 	  NumPy is the fundamental package for scientific computing
 	  with Python.
