From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jul 2016 15:47:39 +0200
Subject: [Buildroot] [PATCH v3 03/14] package/gcc: fix fortran support
In-Reply-To: <20160703134750.7516-1-s.martin49@gmail.com>
References: <20160703134750.7516-1-s.martin49@gmail.com>
Message-ID: <20160703134750.7516-4-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fortran depends on libquadmath when available, make the buildroot
toolchain option depends on this new hidden symbol,

[Vincent: only do "HOST_GCC_FINAL_USR_LIBS += libquadmath" for i386 and
x86_64, otherwise it will fail saying "libquadmath.a: file not found"]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

---
changes v1->v2:
- none

changes v2->v3:
- s/BR2_I386/BR2_i386/ (Thomas P.)
- use BR2_TOOLCHAIN_HAS_LIBQUADMATH to install the lib
- rephrase commit log
- update dependencies in Config.in
---
 package/gcc/Config.in.host         | 7 +++++++
 package/gcc/gcc-final/gcc-final.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 44a72f1..8a42828 100644
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
+	# on architecture building libqadmath, wchar is required
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
-- 
2.9.0
