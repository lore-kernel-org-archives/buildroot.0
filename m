From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  1 Jul 2016 18:29:06 +0200
Subject: [Buildroot] [PATCH v2 01/15] package/gcc: fix fortran support
In-Reply-To: <20160701162920.19632-1-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
Message-ID: <20160701162920.19632-2-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fortran depends on libquadmath, which requires a toolchain with wchar
support.

So:
- make sure libquadmath is enable and installed when fortran is enabled;
- propagate the wchar dependency (from libquadmath) to fortran, and add
  a comment when fortran is not available.

[Vincent: only do "HOST_GCC_FINAL_USR_LIBS += libquadmath" for i386 and
x86_64, otherwise it will fail saying "libquadmath.a: file not found"]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

---
changes v1->v2:
- none
---
 package/gcc/Config.in.host         | 4 ++++
 package/gcc/gcc-final/gcc-final.mk | 4 ++++
 package/gcc/gcc.mk                 | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 44a72f1..673b444 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -120,11 +120,15 @@ config BR2_TOOLCHAIN_BUILDROOT_CXX
 
 config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
 	bool "Enable Fortran support"
+	depends on BR2_USE_WCHAR # libquadmath
 	help
 	  Enable this option if you want your toolchain to support the
 	  Fortran language and you want Fortran libraries to be
 	  installed on your target system.
 
+comment "Fortran support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 config BR2_GCC_ENABLE_TLS
 	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	default y
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 78ceeba..f13bc36 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -163,6 +163,10 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)
 HOST_GCC_FINAL_USR_LIBS += libgfortran
+# fortran needs quadmath on x86 and x86_64
+ifeq ($(BR2_I386)$(BR2_x86_64),y)
+HOST_GCC_FINAL_USR_LIBS += libquadmath
+endif
 endif
 
 ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 6e1c02d..e981940 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -109,6 +109,11 @@ endif
 # quadmath support requires wchar
 ifeq ($(BR2_USE_WCHAR),)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath
+else
+# fortran needs quadmath on x86 and x86_64
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN)$(BR2_I386)$(BR2_x86_64),yy)
+HOST_GCC_COMMON_CONF_OPTS += --enable-libquadmath
+endif
 endif
 
 # libsanitizer requires wordexp, not in default uClibc config. Also
-- 
2.9.0
