From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:49 -0000
Subject: [Buildroot] [git commit branch/next] gcc: add support for fortran
Message-ID: <20150808105638.1577080428@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c00fd2845e13c55f948ec807bd1ef84fd8b4ab0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: David Kessler <DJKessler@me.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host         |    7 +++++++
 package/gcc/gcc-final/gcc-final.mk |    5 +++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index bd5c13f..3d64b6f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -117,6 +117,13 @@ config BR2_TOOLCHAIN_BUILDROOT_CXX
 	  C++ language and you want C++ libraries to be installed on
 	  your target system.
 
+config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
+	bool "Enable Fortran support"
+	help
+	  Enable this option if you want your toolchain to support the
+	  Fortran language and you want Fortran libraries to be
+	  installed on your target system.
+
 config BR2_GCC_ENABLE_TLS
 	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	default y
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 16bf4ee..86b3c78 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -44,6 +44,7 @@ endef
 # Languages supported by the cross-compiler
 GCC_FINAL_CROSS_LANGUAGES-y = c
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
+GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
 GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
 
 HOST_GCC_FINAL_CONF_OPTS = \
@@ -146,6 +147,10 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 HOST_GCC_FINAL_USR_LIBS += libstdc++
 endif
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)
+HOST_GCC_FINAL_USR_LIBS += libgfortran
+endif
+
 ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
 HOST_GCC_FINAL_USR_LIBS += libgomp
 endif
