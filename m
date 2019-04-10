From: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 10 Apr 2019 13:17:46 -0700
Subject: [Buildroot] [PATCH v2] package/coreutils: allow building individual
 binaries
Message-ID: <20190410201746.14678-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We add configuration option BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
so that coreutils can be built and installed as individual binaries.
It can be used if the target file system doesn't support symlinks or
symlinks are undesirable.

The approach is modelled after Busybox's similarly named configuration
option.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/coreutils/Config.in    | 18 ++++++++++++++++++
 package/coreutils/coreutils.mk |  8 +++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index 11a6019e820f..a0a84c220a48 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -19,3 +19,21 @@ comment "coreutils needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+
+if BR2_PACKAGE_COREUTILS
+
+config BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
+	bool "Individual binaries"
+	depends on !BR2_STATIC_LIBS
+	help
+	  By default (i.e. with this option disabled), coreutils is
+	  installed as a single binary (Busybox style) called
+	  /usr/bin/coreutils, and all core utilities are symbolic
+	  links to this binary.
+
+	  With this option enabled, each utility is a separate binary.
+
+comment "coreutils individual binaries need a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+endif
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 3e8efbf04706..287b84873a05 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -14,8 +14,14 @@ COREUTILS_LICENSE_FILES = COPYING
 COREUTILS_AUTORECONF = YES
 COREUTILS_GETTEXTIZE = YES
 
-COREUTILS_CONF_OPTS = --disable-rpath --enable-single-binary=symlinks \
+COREUTILS_CONF_OPTS = \
+	--disable-rpath \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
+
+ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),)
+COREUTILS_CONF_OPTS += --enable-single-binary=symlinks
+endif
+
 COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	ac_cv_func_chown_works=yes \
 	ac_cv_func_euidaccess=no \
-- 
2.17.1
