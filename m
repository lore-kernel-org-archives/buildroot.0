From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 17 May 2021 17:56:28 +0200
Subject: [Buildroot] [PATCHv2 3/3] package/poke: enable uClibc-ng support
In-Reply-To: <20210517155628.267749-1-romain.naour@gmail.com>
References: <20210517155628.267749-1-romain.naour@gmail.com>
Message-ID: <20210517155628.267749-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

poke bundle gnulib that doesn't support the case where
host_os='linux-uclibc'. When cross-compiling, the guessed
answers are mostly wrong and gnulib will try to replace
snprintf with rpl_snprintf. This lead to "undefined reference
to `rpl_snprintf'" errors.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
test-pkg config:
BR2_PACKAGE_POKE=y
BR2_PACKAGE_JSON_C=y
---
 package/poke/Config.in |  4 +---
 package/poke/poke.mk   | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/package/poke/Config.in b/package/poke/Config.in
index d3334dfdd4..762ed0221d 100644
--- a/package/poke/Config.in
+++ b/package/poke/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_POKE
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # less
 	depends on BR2_USE_WCHAR # needs wctomb
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # gnulib
 	select BR2_PACKAGE_BDWGC
 	select BR2_PACKAGE_LESS # runtime
 	select BR2_PACKAGE_READLINE
@@ -24,6 +23,5 @@ config BR2_PACKAGE_POKE
 
 	  https://www.gnu.org/software/poke/
 
-comment "poke needs a glibc or musl toolchain w/ NPTL, wchar"
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+comment "poke needs a toolchain w/ NPTL, wchar"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
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
-- 
2.31.1
