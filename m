From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 16:58:11 +0200
Subject: [Buildroot] [git commit] package/gcc: fix fortran support
Message-ID: <20160703145820.67F7D81E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5077bdd939a44815976ffa36e9f30a15935aeac2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fortran depends on libquadmath when available, make the buildroot
toolchain option depends on this new hidden symbol,

[Vincent: only do "HOST_GCC_FINAL_USR_LIBS += libquadmath" for i386 and
x86_64, otherwise it will fail saying "libquadmath.a: file not found"]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host         | 7 +++++++
 package/gcc/gcc-final/gcc-final.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 44a72f1..7d09b51 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -118,8 +118,15 @@ config BR2_TOOLCHAIN_BUILDROOT_CXX
 	  C++ language and you want C++ libraries to be installed on
 	  your target system.
 
+comment "Fortran support needs a toolchain w/ wchar"
+	depends on BR2_TOOLCHAIN_HAS_LIBQUADMATH
+	depends on !BR2_USE_WCHAR # libquadmath
+
 config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
 	bool "Enable Fortran support"
+	# on architecture building libquadmath, wchar is required
+	depends on !BR2_TOOLCHAIN_HAS_LIBQUADMATH || \
+		(BR2_TOOLCHAIN_HAS_LIBQUADMATH && BR2_USE_WCHAR)
 	help
 	  Enable this option if you want your toolchain to support the
 	  Fortran language and you want Fortran libraries to be
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 78ceeba..284d34c 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -163,6 +163,10 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)
 HOST_GCC_FINAL_USR_LIBS += libgfortran
+# fortran needs quadmath on x86 and x86_64
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBQUADMATH),y)
+HOST_GCC_FINAL_USR_LIBS += libquadmath
+endif
 endif
 
 ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
