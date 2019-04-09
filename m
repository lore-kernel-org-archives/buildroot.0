From: Markus Mayer <mmayer@broadcom.com>
Date: Tue,  9 Apr 2019 15:04:54 -0700
Subject: [Buildroot] [PATCH] package: coreutils: allow building individual
 binaries
Message-ID: <20190409220454.736-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We add configuration option BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
so that coreutils can be built and installed as individual binaries.

The approach is modelled after Busybox's similarly named configuration
option.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/coreutils/Config.in    | 14 ++++++++++++++
 package/coreutils/coreutils.mk |  6 +++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index 11a6019e820f..0142db4bddd1 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -19,3 +19,17 @@ comment "coreutils needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
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
+comment "Coreutils individual binaries need a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 3e8efbf04706..37351663f705 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -14,7 +14,11 @@ COREUTILS_LICENSE_FILES = COPYING
 COREUTILS_AUTORECONF = YES
 COREUTILS_GETTEXTIZE = YES
 
-COREUTILS_CONF_OPTS = --disable-rpath --enable-single-binary=symlinks \
+ifneq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
+	CUSTOM_COREUTILS_CONF_OPTS=--enable-single-binary=symlinks
+endif
+
+COREUTILS_CONF_OPTS = --disable-rpath $(CUSTOM_COREUTILS_CONF_OPTS) \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	ac_cv_func_chown_works=yes \
-- 
2.17.1
