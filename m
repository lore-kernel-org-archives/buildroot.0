From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 22:40:49 +0100
Subject: [Buildroot] fortran support
In-Reply-To: <54F8CA2A.7050002@utexas.edu>
References: <54F8CA2A.7050002@utexas.edu>
Message-ID: <20150305224049.3c577eb9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Kessler,

On Thu, 05 Mar 2015 15:27:06 -0600, David Kessler wrote:

> How can I go about adding the Fortran compiler to my cross compile 
> toolchain? I'm currently using the Buildroot toolchain but Fortran has 
> been deprecated for some time now.  Is there a way that I can add the 
> arm Fortran compiler to the toolchain built by Buildroot, perhaps as a 
> package or something?

This shouldn't be too difficult I believe. You need to adjust the gcc
package to enable the fortran language, and make sure the fortran
runtime library is copied to the target.

Here is a completely untested (not even compile tested) attempt at
adding some basic Fortran support to the gcc package:

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index e07d881..3609588 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -108,6 +108,13 @@ config BR2_TOOLCHAIN_BUILDROOT_CXX
          C++ language and you want C++ libraries to be installed on
          your target system.
 
+config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
+       bool "Enable Fortran support"
+       help
+         Enable this option if you want your toolchain to support the
+         Fortran language and you want Fortran libraries to be
+         installed on your target system.
+
 config BR2_GCC_ENABLE_TLS
        bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
        default y
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index c014bc5..087bdec 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -44,6 +44,7 @@ endef
 # Languages supported by the cross-compiler
 GCC_FINAL_CROSS_LANGUAGES-y = c
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
+GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
 GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
 
 HOST_GCC_FINAL_CONF_OPTS = \
@@ -126,6 +127,10 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 HOST_GCC_FINAL_USR_LIBS += libstdc++
 endif
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)
+HOST_GCC_FINAL_USR_LIBS += libfortran
+endif
+
 ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
 HOST_GCC_FINAL_USR_LIBS += libgomp
 endif

Let me know if this somewhat works, and please submit a patch once/if
you get this working!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
