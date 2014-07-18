From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 10:00:41 +0200
Subject: [Buildroot] [git commit] python-numpy: disable on non-supported
	architectures
Message-ID: <20140718080136.0BB869D27D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=153990dfd89a2ae3d453520ef54a0b4c2bfe44ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The numpy/core/include/numpy/npy_cpu.h file has some
architecture-specific definitions, and not all architectures are
supported. This commit makes sure python-numpy cannot be selected on
the architectures that are not supported.

Fixes:

  http://autobuild.buildroot.org/results/327/327c85f5b1849d390fcf0727cf48e621b946571f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-numpy/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 169b91f..3145350 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_PYTHON_NUMPY
 	bool "python-numpy"
+	# Numpy has some CPU specific code
+	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
+		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
+		|| BR2_sh || BR2_sh || BR2_x86_64
 	# numpy needs fenv.h. Available for all architectures in
 	# glibc, but only for x86 and x86-64 in uClibc.
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_i386 || BR2_x86_64
