From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 10:48:13 +0100
Subject: [Buildroot] [git commit] package/suricata: bump to version 6.0.0
Message-ID: <20201025093609.E203083F99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f66774568d866e03ccfc2c2a7264990037d3646a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Refresh first patch
- Drop second patch, not needed since
  https://github.com/OISF/suricata/commit/5c725d50502b2a7a747fc04938937b8c6b733aac
- Drop BR2_PACKAGE_GEOIP dependency as suricata switched to GeoIP2, see
  https://github.com/OISF/suricata/commit/a291209e473a261546363f0d9051f1e3b82e699a
- jansson is now a mandatory dependency, see
  https://github.com/OISF/suricata/commit/e49c40428e1b9f7e5dcdb5857c3978d5cb859fd9
- rustc is now a mandatory dependency, see
  https://github.com/OISF/suricata/commit/75429bbe3ea3ff12a9e8e7e863a10ded91cb6de9

EOL date of 4.1 branch is December 31st, 2020.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...n-ensure-proper-shabang-on-python-scripts.patch | 12 ++++----
 ...ac-allow-the-user-to-override-RUST_TARGET.patch | 35 ++++++++++++++++++++++
 ...nfigure.ac-fix-cross-compilation-with-lua.patch | 33 --------------------
 package/suricata/Config.in                         |  4 +++
 package/suricata/suricata.hash                     |  2 +-
 package/suricata/suricata.mk                       | 26 +++++++---------
 6 files changed, 57 insertions(+), 55 deletions(-)

diff --git a/package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch b/package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch
index 4be591be3f..424b30d317 100644
--- a/package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch
+++ b/package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch
@@ -18,6 +18,8 @@ executable.
   - provide proper commit log
 ]
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+[Fabrice: update for 6.0.0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  python/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -27,16 +29,16 @@ index 59d195f29..a41604f72 100644
 --- a/python/Makefile.am
 +++ b/python/Makefile.am
 @@ -6,11 +6,11 @@ EXTRA_DIST =	setup.py \
- if HAVE_PYTHON
+ if HAVE_PYTHON_DISTUTILS
  all-local:
  	cd $(srcdir) && \
--		$(HAVE_PYTHON) setup.py build --build-base $(abs_builddir)
-+		$(HAVE_PYTHON) setup.py build -e "/usr/bin/env python" --build-base $(abs_builddir)
+-		$(HAVE_PYTHON) setup.py build --build-base "$(abs_builddir)"
++		$(HAVE_PYTHON) setup.py build -e "/usr/bin/env python" --build-base "$(abs_builddir)"
  
  install-exec-local:
  	cd $(srcdir) && \
--		$(HAVE_PYTHON) setup.py build --build-base $(abs_builddir) \
-+		$(HAVE_PYTHON) setup.py build -e "/usr/bin/env python" --build-base $(abs_builddir) \
+-		$(HAVE_PYTHON) setup.py build --build-base "$(abs_builddir)" \
++		$(HAVE_PYTHON) setup.py build -e "/usr/bin/env python" --build-base "$(abs_builddir)" \
  		install --prefix $(DESTDIR)$(prefix)
  
  uninstall-local:
diff --git a/package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch b/package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
new file mode 100644
index 0000000000..ec876a6852
--- /dev/null
+++ b/package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
@@ -0,0 +1,35 @@
+From 7ab4d5eb55e1d3900390b76e5f46e80e22d4e80e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 10 Oct 2020 21:34:21 +0200
+Subject: [PATCH] configure.ac: allow the user to override RUST_TARGET
+
+When cross-compiling, RUST_TARGET is not always equal to host_triplet
+(e.g. buildroot) so allow the user to override this default value
+through RUST_TARGET environment variable
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 32c230209..7d7c9373f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2489,7 +2489,12 @@ fi
+     have_rust_vendor="no"
+ 
+     if test "x$cross_compiling" = "xyes"; then
+-      RUST_SURICATA_LIB_XC_DIR="${host_alias}/"
++      if test "x$RUST_TARGET" != "x"; then
++        RUST_SURICATA_LIB_XC_DIR="$RUST_TARGET/"
++        AC_SUBST([RUST_TARGET],["--target $RUST_TARGET"])
++      else
++        RUST_SURICATA_LIB_XC_DIR="${host_alias}/"
++      fi
+     else
+       if test "x$CARGO_BUILD_TARGET" = "x"; then
+         RUST_SURICATA_LIB_XC_DIR=
+-- 
+2.28.0
+
diff --git a/package/suricata/0002-configure.ac-fix-cross-compilation-with-lua.patch b/package/suricata/0002-configure.ac-fix-cross-compilation-with-lua.patch
deleted file mode 100644
index 5c13ac7bec..0000000000
--- a/package/suricata/0002-configure.ac-fix-cross-compilation-with-lua.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 8db38c21b525327305778fcaa232b2a797ffcb82 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 7 May 2020 19:05:23 +0200
-Subject: [PATCH] configure.ac: fix cross-compilation with lua
-
-lua integer size is detected through AC_RUN_IFELSE since
-https://github.com/OISF/suricata/commit/2abcd5d27f29ca37ae31108cc0ea0143fa25d0a1
-
-This breaks cross-compilation and is needed only for rust so disable it
-if rust is not wanted
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not submitted yet]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 127848234..f5f33d42d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2225,7 +2225,7 @@ return 0;
-     AM_CONDITIONAL([HAVE_LUA], [test "x$enable_lua" != "xno"])
- 
-     # If Lua is enabled, test the integer size.
--    if test "x$enable_lua" = "xyes"; then
-+    if test "x$enable_lua" = "xyes" && test "x$enable_rust" = "xyes"; then
-         TMPLIBS="$LIBS"
-         LIBS=""
- 
--- 
-2.26.2
-
diff --git a/package/suricata/Config.in b/package/suricata/Config.in
index 2add34956e..5f7eb21da0 100644
--- a/package/suricata/Config.in
+++ b/package/suricata/Config.in
@@ -1,8 +1,11 @@
 config BR2_PACKAGE_SURICATA
 	bool "suricata"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_JANSSON
 	select BR2_PACKAGE_LIBHTP
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBYAML
@@ -18,5 +21,6 @@ config BR2_PACKAGE_SURICATA
 	  https://suricata-ids.org
 
 comment "suricata needs a toolchain w/ wchar, threads"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 9e79f3a96c..a6cf43fb66 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  3440cd1065b1b3999dc101a37c49321fab2791b38f16e2f7fe27369dd007eea7  suricata-4.1.9.tar.gz
+sha256  3c175a6dee9071141391f64828502cfb6e48dc1a20833e1411fb45be5368923b  suricata-6.0.0.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index d6ae48c1f5..f131fad1be 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,16 +4,18 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 4.1.9
+SURICATA_VERSION = 6.0.0
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
-# We're patching python/Makefile.am
+# 0001-python-ensure-proper-shabang-on-python-scripts.patch
+# 0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
 SURICATA_AUTORECONF = YES
 
 SURICATA_DEPENDENCIES = \
 	host-pkgconf \
-	$(if $(BR2_PACKAGE_JANSSON),jansson) \
+	host-rustc \
+	jansson \
 	$(if $(BR2_PACKAGE_LIBCAP_NG),libcap-ng) \
 	$(if $(BR2_PACKAGE_LIBEVENT),libevent) \
 	libhtp \
@@ -24,12 +26,14 @@ SURICATA_DEPENDENCIES = \
 	pcre \
 	$(if $(BR2_PACKAGE_XZ),xz)
 
-SURICATA_CONF_ENV = ac_cv_path_HAVE_SPHINXBUILD=no
+SURICATA_CONF_ENV = \
+	ac_cv_path_HAVE_SPHINXBUILD=no \
+	CARGO_HOME=$(HOST_DIR)/share/cargo \
+	RUST_TARGET=$(RUSTC_TARGET_NAME)
 
 SURICATA_CONF_OPTS = \
 	--disable-gccprotect \
 	--disable-pie \
-	--disable-rust \
 	--disable-suricata-update \
 	--enable-non-bundled-htp
 
@@ -46,19 +50,9 @@ else
 SURICATA_CONF_OPTS += --disable-libmagic
 endif
 
-# --disable-libgeoip disables libgeoip when --enable-geoip is requested.
-# This allows libmaxminddb to be picked up instead of libgeoip when both are
-# installed on the system.
 ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
 SURICATA_DEPENDENCIES += libmaxminddb
-SURICATA_CONF_OPTS += \
-	--enable-geoip \
-	--disable-libgeoip
-else ifeq ($(BR2_PACKAGE_GEOIP),y)
-SURICATA_DEPENDENCIES += geoip
-SURICATA_CONF_OPTS += \
-	--enable-geoip \
-	--enable-libgeoip
+SURICATA_CONF_OPTS += --enable-geoip
 else
 SURICATA_CONF_OPTS += --disable-geoip
 endif
