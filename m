From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 23:42:18 +0100
Subject: [Buildroot] [PATCH] python-libconfig: disable on musl
Message-ID: <1488148938-15671-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The python-libconfig package fails to build with musl with very weird
errors coming all the way from Boost Python, which nobody ever
bothered to fix. It's time to disable this package on musl to avoid
the repetitive build failures.

Fixes:

  http://autobuild.buildroot.net/results/f0f6cdc8c38c024772615d5e677b0f4ad63ef7ec

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-libconfig/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/python-libconfig/Config.in b/package/python-libconfig/Config.in
index 7cc5f8a..a222f9a 100644
--- a/package/python-libconfig/Config.in
+++ b/package/python-libconfig/Config.in
@@ -1,5 +1,6 @@
-comment "python-libconfig needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "python-libconfig needs a glibc or uClibc toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_TOOLCHAIN_USES_MUSL
 
 config BR2_PACKAGE_PYTHON_LIBCONFIG
 	bool "python-libconfig"
@@ -8,6 +9,8 @@ config BR2_PACKAGE_PYTHON_LIBCONFIG
 	select BR2_PACKAGE_LIBCONFIG
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# error: invalid use of incomplete type 'struct _IO_FILE'
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Python bindings to the C++ library libconfig
 
-- 
2.7.4
