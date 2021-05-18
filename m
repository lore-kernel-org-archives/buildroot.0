From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 17:13:47 +0200
Subject: [Buildroot] [git commit branch/next] package/poke: enable uClibc-ng
 support
Message-ID: <20210518144705.1615087ECA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4dc754178b7c24ed129e7e6f8effd555249c941
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

poke bundle gnulib that doesn't support the case where
host_os='linux-uclibc'. When cross-compiling, the guessed
answers are mostly wrong and gnulib will try to replace
snprintf with rpl_snprintf. This lead to "undefined reference
to `rpl_snprintf'" errors.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/poke/Config.in |  6 ++----
 package/poke/poke.mk   | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/package/poke/Config.in b/package/poke/Config.in
index eb2e33d5af..40e7a31bab 100644
--- a/package/poke/Config.in
+++ b/package/poke/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_POKE
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # bdwgc
 	depends on BR2_USE_WCHAR # needs wctomb
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # gnulib
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # less
 	select BR2_PACKAGE_BDWGC
 	select BR2_PACKAGE_LESS # runtime
@@ -24,7 +23,6 @@ config BR2_PACKAGE_POKE
 
 	  https://www.gnu.org/software/poke/
 
-comment "poke needs a glibc or musl toolchain w/ NPTL, wchar"
+comment "poke needs a toolchain w/ NPTL, wchar"
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) \
-		||!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
diff --git a/package/poke/poke.mk b/package/poke/poke.mk
index 7c3c81d93c..406acf15e0 100644
--- a/package/poke/poke.mk
+++ b/package/poke/poke.mk
@@ -16,6 +16,31 @@ POKE_AUTORECONF = YES
 
 POKE_DEPENDENCIES = host-flex host-bison host-pkgconf bdwgc readline
 
+# poke bundle gnulib that doesn't support the case where
+# host_os='linux-uclibc'. When cross-compiling, the guessed
+# answers are mostly wrong and gnulib will try to replace
+# snprintf with rpl_snprintf. This lead to "undefined reference
+# to `rpl_snprintf'" errors.
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+POKE_CONF_ENV = gl_cv_func_printf_positions=yes \
+	gl_cv_func_snprintf_retval_c99=yes \
+	gl_cv_func_printf_sizes_c99=yes \
+	gl_cv_func_printf_infinite_long_double=yes \
+	gl_cv_func_snprintf_retval_c99=yes \
+	gl_cv_func_snprintf_truncation_c99=yes \
+	gl_cv_func_snprintf_usable=yes \
+	gl_cv_func_strerror_0_works=yes \
+	gl_cv_header_working_stdint_h=yes \
+	gl_cv_func_printf_infinite=yes \
+	gl_cv_func_printf_flag_zero=yes \
+	gl_cv_func_printf_enomem=yes \
+	gl_cv_func_printf_directive_f=yes \
+	gl_cv_func_printf_directive_a=yes \
+	gl_cv_func_snprintf_directive_n=yes \
+	gl_cv_func_vsnprintf_posix=yes \
+	gl_cv_func_vsnprintf_zerosize_c99=yes
+endif
+
 POKE_CONF_OPTS = \
 	--disable-gui \
 	--disable-libnbd \
