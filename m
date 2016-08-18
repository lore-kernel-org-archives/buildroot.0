From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 22:59:38 +0200
Subject: [Buildroot] [PATCH] openmpi: disallow on sparc
Message-ID: <1471553978-8096-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openmpi's configure script refuses to build on Sparc v8 architecture, so
let's disable this package on sparc 32 bits entirely.

Fixes:

 http://autobuild.buildroot.net/results/be6cb8e2437d345b709cf76357a4420e9beadb5c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openmpi/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openmpi/Config.in b/package/openmpi/Config.in
index 9638040..4413c55 100644
--- a/package/openmpi/Config.in
+++ b/package/openmpi/Config.in
@@ -1,5 +1,6 @@
 comment "openmpi needs a toolchain w/ dynamic library, NPTL, wchar, C++"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
 
@@ -10,6 +11,9 @@ config BR2_PACKAGE_OPENMPI
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	# from the configure script: "Sparc v8 target is not supported
+	# in this release of Open MPI"
+	depends on !BR2_sparc
 	help
 	  A High Performance Message Passing Library.
 
-- 
2.7.4
