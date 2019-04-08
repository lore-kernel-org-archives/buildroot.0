From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  8 Apr 2019 22:34:49 +0200
Subject: [Buildroot] [PATCH v4 2/2] libdrm: change to meson build system
In-Reply-To: <20190408203449.16279-1-ps.report@gmx.net>
References: <20190408203449.16279-1-ps.report@gmx.net>
Message-ID: <20190408203449.16279-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove legacy patch
  0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch

- add patch to fix meson atomic ops detection
  0003-meson.build-fix-intel-atomics-detection.patch

- add patch to enable static build
  0004-meson.build-enable-static-build.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - convertion from "LIBDRM_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'"
    is missing (maybe meson gets it right (?) or use LIBDRM_MESON_CFLAGS
    to force it)

Changes v1 -> v2:
  - add 0003-meson.build-fix-intel-atomics-detection.patch to fix
    sparc compile

Changes v2 -> v3:
  - fix 0003-meson.build-fix-intel-atomics-detection.patch (linking
    needs main)
  - add 0004-meson.build-enable-static-build.patch to enable static
    compile

Changes v3 -> v4:
  - rebased on current master (suggested by Thomas Petazzoni)
---
 ...le.am-use-pkg-config-to-discover-lib.patch | 162 -----------------
 ...on.build-fix-intel-atomics-detection.patch |  35 ++++
 ...0004-meson.build-enable-static-build.patch | 169 ++++++++++++++++++
 package/libdrm/libdrm.mk                      |  71 ++++----
 4 files changed, 236 insertions(+), 201 deletions(-)
 delete mode 100644 package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
 create mode 100644 package/libdrm/0003-meson.build-fix-intel-atomics-detection.patch
 create mode 100644 package/libdrm/0004-meson.build-enable-static-build.patch

diff --git a/package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch b/package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
deleted file mode 100644
index 0fbe77ef7c..0000000000
--- a/package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From 57d544ff2f96a26cac07d5be00ff7b67678ae7b8 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 18 Dec 2017 13:08:39 +0100
-Subject: [PATCH] configure/Makefile.am: use pkg-config to discover
- libatomic_ops
-
-The configure script currently tests the availability of libatomic_ops
-by checking the presence of atomic_ops.h. While this is good enough as
-an availability test, it is not sufficient as on some platforms,
-libatomic_ops provides an actual shared library against which we
-should be linked to access libatomic_ops functionality.
-
-Therefore, we instead use PKG_CHECK_MODULES() to test the availability
-of libatomic_ops. Besides testing its availability, this also fills in
-the ATOMIC_OPS_LIBS variable with the list of libraries we need to
-link with to use libatomic_ops.
-
-All Mesa drivers that include xf86atomic.h have been updated to link
-against ATOMIC_OPS_LIBS.
-
-Of course, if we're not using libatomic_ops, ATOMIC_OPS_LIBS is empty,
-and we don't link against it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Bernd: PKG_CHECK_MODULES should not fail when libatomic_ops is missing]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- amdgpu/Makefile.am    | 2 +-
- configure.ac          | 2 +-
- etnaviv/Makefile.am   | 3 ++-
- freedreno/Makefile.am | 3 ++-
- intel/Makefile.am     | 3 ++-
- nouveau/Makefile.am   | 2 +-
- omap/Makefile.am      | 2 +-
- radeon/Makefile.am    | 2 +-
- tegra/Makefile.am     | 2 +-
- 9 files changed, 12 insertions(+), 9 deletions(-)
-
-diff --git a/amdgpu/Makefile.am b/amdgpu/Makefile.am
-index a1b0d05c..b2bcceff 100644
---- a/amdgpu/Makefile.am
-+++ b/amdgpu/Makefile.am
-@@ -36,7 +36,7 @@ AM_CPPFLAGS = -DAMDGPU_ASIC_ID_TABLE=\"${libdrmdatadir}/amdgpu.ids\"
- libdrm_amdgpu_la_LTLIBRARIES = libdrm_amdgpu.la
- libdrm_amdgpu_ladir = $(libdir)
- libdrm_amdgpu_la_LDFLAGS = -version-number 1:0:0 -no-undefined
--libdrm_amdgpu_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
-+libdrm_amdgpu_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@ @ATOMIC_OPS_LIBS@
-
- libdrm_amdgpu_la_SOURCES = $(LIBDRM_AMDGPU_FILES)
- amdgpu_asic_id.lo: $(top_srcdir)/data/amdgpu.ids
-diff --git a/configure.ac b/configure.ac
-index 35378b33..501d0871 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -247,7 +247,7 @@ AC_CACHE_CHECK([for native atomic primitives], drm_cv_atomic_primitives, [
- 					  ]],[[]])], [drm_cv_atomic_primitives="Intel"],[])
-
- 	if test "x$drm_cv_atomic_primitives" = "xnone"; then
--		AC_CHECK_HEADER([atomic_ops.h], drm_cv_atomic_primitives="libatomic-ops")
-+		PKG_CHECK_MODULES(ATOMIC_OPS, [atomic_ops], drm_cv_atomic_primitives="libatomic-ops", true)
- 	fi
-
- 	# atomic functions defined in <atomic.h> & libc on Solaris
-diff --git a/etnaviv/Makefile.am b/etnaviv/Makefile.am
-index be96ba86..669cf14f 100644
---- a/etnaviv/Makefile.am
-+++ b/etnaviv/Makefile.am
-@@ -12,7 +12,8 @@ libdrm_etnaviv_la_LDFLAGS = -version-number 1:0:0 -no-undefined
- libdrm_etnaviv_la_LIBADD = \
- 	../libdrm.la \
- 	@PTHREADSTUBS_LIBS@ \
--	@CLOCK_LIB@
-+	@CLOCK_LIB@ \
-+	@ATOMIC_OPS_LIBS@
-
- libdrm_etnaviv_la_SOURCES = $(LIBDRM_ETNAVIV_FILES)
-
-diff --git a/freedreno/Makefile.am b/freedreno/Makefile.am
-index cbb0d031..238407e3 100644
---- a/freedreno/Makefile.am
-+++ b/freedreno/Makefile.am
-@@ -14,7 +14,8 @@ libdrm_freedreno_la_LDFLAGS = -version-number 1:0:0 -no-undefined
- libdrm_freedreno_la_LIBADD = \
- 	../libdrm.la \
- 	@PTHREADSTUBS_LIBS@ \
--	@CLOCK_LIB@
-+	@CLOCK_LIB@ \
-+	@ATOMIC_OPS_LIBS@
-
- libdrm_freedreno_la_SOURCES = $(LIBDRM_FREEDRENO_FILES)
- if HAVE_FREEDRENO_KGSL
-diff --git a/intel/Makefile.am b/intel/Makefile.am
-index c52e8c08..f3635a64 100644
---- a/intel/Makefile.am
-+++ b/intel/Makefile.am
-@@ -38,7 +38,8 @@ libdrm_intel_la_LDFLAGS = -version-number 1:0:0 -no-undefined
- libdrm_intel_la_LIBADD = ../libdrm.la \
- 	@PTHREADSTUBS_LIBS@ \
- 	@PCIACCESS_LIBS@ \
--	@CLOCK_LIB@
-+	@CLOCK_LIB@ \
-+	@ATOMIC_OPS_LIBS@
-
- libdrm_intel_la_SOURCES = $(LIBDRM_INTEL_FILES)
-
-diff --git a/nouveau/Makefile.am b/nouveau/Makefile.am
-index 344a8445..a4e6a78b 100644
---- a/nouveau/Makefile.am
-+++ b/nouveau/Makefile.am
-@@ -10,7 +10,7 @@ AM_CFLAGS = \
- libdrm_nouveau_la_LTLIBRARIES = libdrm_nouveau.la
- libdrm_nouveau_ladir = $(libdir)
- libdrm_nouveau_la_LDFLAGS = -version-number 2:0:0 -no-undefined
--libdrm_nouveau_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
-+libdrm_nouveau_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@ @ATOMIC_OPS_LIBS@
-
- libdrm_nouveau_la_SOURCES = $(LIBDRM_NOUVEAU_FILES)
-
-diff --git a/omap/Makefile.am b/omap/Makefile.am
-index 599bb9de..524afee3 100644
---- a/omap/Makefile.am
-+++ b/omap/Makefile.am
-@@ -7,7 +7,7 @@ AM_CFLAGS = \
- libdrm_omap_la_LTLIBRARIES = libdrm_omap.la
- libdrm_omap_ladir = $(libdir)
- libdrm_omap_la_LDFLAGS = -version-number 1:0:0 -no-undefined
--libdrm_omap_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
-+libdrm_omap_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@ @ATOMIC_OPS_LIBS@
-
- libdrm_omap_la_SOURCES = omap_drm.c
-
-diff --git a/radeon/Makefile.am b/radeon/Makefile.am
-index e2415314..c27d3c75 100644
---- a/radeon/Makefile.am
-+++ b/radeon/Makefile.am
-@@ -33,7 +33,7 @@ AM_CFLAGS = \
- libdrm_radeon_la_LTLIBRARIES = libdrm_radeon.la
- libdrm_radeon_ladir = $(libdir)
- libdrm_radeon_la_LDFLAGS = -version-number 1:0:1 -no-undefined
--libdrm_radeon_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
-+libdrm_radeon_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@ @ATOMIC_OPS_LIBS@
-
- libdrm_radeon_la_SOURCES = $(LIBDRM_RADEON_FILES)
-
-diff --git a/tegra/Makefile.am b/tegra/Makefile.am
-index fb40be55..12abe8c4 100644
---- a/tegra/Makefile.am
-+++ b/tegra/Makefile.am
-@@ -9,7 +9,7 @@ AM_CFLAGS = \
- libdrm_tegra_ladir = $(libdir)
- libdrm_tegra_la_LTLIBRARIES = libdrm_tegra.la
- libdrm_tegra_la_LDFLAGS = -version-number 0:0:0 -no-undefined
--libdrm_tegra_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
-+libdrm_tegra_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@ @ATOMIC_OPS_LIBS@
-
- libdrm_tegra_la_SOURCES = \
- 	private.h \
---
-2.14.3
-
diff --git a/package/libdrm/0003-meson.build-fix-intel-atomics-detection.patch b/package/libdrm/0003-meson.build-fix-intel-atomics-detection.patch
new file mode 100644
index 0000000000..fe02328f3a
--- /dev/null
+++ b/package/libdrm/0003-meson.build-fix-intel-atomics-detection.patch
@@ -0,0 +1,35 @@
+From 00f6ac3c24f36fa07fa93f4a89ee873edf125098 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 16 Jul 2018 23:01:40 +0200
+Subject: [PATCH] meson.build: fix intel atomics detection
+
+Use the stronger compiler.link() test (instead of the weaker
+compiler.compile()) to fix the intel atomics detection.
+
+Fixes false positive in case of sparc compile (buildroot toolchain).
+
+Upstream suggested: https://lists.freedesktop.org/archives/dri-devel/2018-July/183885.html
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 9b443a5..3c8afb6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -49,9 +49,10 @@ intel_atomics = false
+ lib_atomics = false
+
+ dep_atomic_ops = dependency('atomic_ops', required : false)
+-if cc.compiles('''
++if cc.links('''
+     int atomic_add(int *i) { return __sync_add_and_fetch (i, 1); }
+     int atomic_cmpxchg(int *i, int j, int k) { return __sync_val_compare_and_swap (i, j, k); }
++    int main() { }
+     ''',
+     name : 'Intel Atomics')
+   intel_atomics = true
+--
+2.18.0
+
diff --git a/package/libdrm/0004-meson.build-enable-static-build.patch b/package/libdrm/0004-meson.build-enable-static-build.patch
new file mode 100644
index 0000000000..1054788127
--- /dev/null
+++ b/package/libdrm/0004-meson.build-enable-static-build.patch
@@ -0,0 +1,169 @@
+From d58a32776e08e193c24f7bb192daf72b66fbe550 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 18 Jul 2018 21:35:18 +0200
+Subject: [PATCH] meson.build: enable static build
+
+Use meson library instead of shared_library to enable static build.
+
+Upstream suggested: https://lists.freedesktop.org/archives/dri-devel/2018-July/183886.html
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ amdgpu/meson.build    | 2 +-
+ etnaviv/meson.build   | 2 +-
+ exynos/meson.build    | 2 +-
+ freedreno/meson.build | 2 +-
+ intel/meson.build     | 2 +-
+ libkms/meson.build    | 2 +-
+ meson.build           | 2 +-
+ nouveau/meson.build   | 2 +-
+ omap/meson.build      | 2 +-
+ radeon/meson.build    | 2 +-
+ tegra/meson.build     | 2 +-
+ 11 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/amdgpu/meson.build b/amdgpu/meson.build
+index f39d7bf..1b4b0be 100644
+--- a/amdgpu/meson.build
++++ b/amdgpu/meson.build
+@@ -21,7 +21,7 @@
+
+ datadir_amdgpu = join_paths(get_option('prefix'), get_option('datadir'), 'libdrm')
+
+-libdrm_amdgpu = shared_library(
++libdrm_amdgpu = library(
+   'drm_amdgpu',
+   [
+     files(
+diff --git a/etnaviv/meson.build b/etnaviv/meson.build
+index ca2aa54..a0d994e 100644
+--- a/etnaviv/meson.build
++++ b/etnaviv/meson.build
+@@ -19,7 +19,7 @@
+ # SOFTWARE.
+
+
+-libdrm_etnaviv = shared_library(
++libdrm_etnaviv = library(
+   'drm_etnaviv',
+   [
+     files(
+diff --git a/exynos/meson.build b/exynos/meson.build
+index 30d3640..fd14f3a 100644
+--- a/exynos/meson.build
++++ b/exynos/meson.build
+@@ -18,7 +18,7 @@
+ # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ # SOFTWARE.
+
+-libdrm_exynos = shared_library(
++libdrm_exynos = library(
+   'drm_exynos',
+   [files('exynos_drm.c', 'exynos_fimg2d.c'), config_file],
+   c_args : warn_c_args,
+diff --git a/freedreno/meson.build b/freedreno/meson.build
+index 015b7fb..6c8a6a7 100644
+--- a/freedreno/meson.build
++++ b/freedreno/meson.build
+@@ -39,7 +39,7 @@ if with_freedreno_kgsl
+   )
+ endif
+
+-libdrm_freedreno = shared_library(
++libdrm_freedreno = library(
+   'drm_freedreno',
+   [files_freedreno, config_file],
+   c_args : warn_c_args,
+diff --git a/intel/meson.build b/intel/meson.build
+index 53c7fce..14cabd3 100644
+--- a/intel/meson.build
++++ b/intel/meson.build
+@@ -18,7 +18,7 @@
+ # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ # SOFTWARE.
+
+-libdrm_intel = shared_library(
++libdrm_intel = library(
+   'drm_intel',
+   [
+     files(
+diff --git a/libkms/meson.build b/libkms/meson.build
+index 86d1a4e..9d21e4c 100644
+--- a/libkms/meson.build
++++ b/libkms/meson.build
+@@ -41,7 +41,7 @@ if with_exynos
+   libkms_include += include_directories('../exynos')
+ endif
+
+-libkms = shared_library(
++libkms = library(
+   'kms',
+   [files_libkms, config_file],
+   c_args : warn_c_args,
+diff --git a/meson.build b/meson.build
+index 3c8afb6..7aa5f8c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -279,7 +279,7 @@ add_project_arguments('-include', 'config.h', language : 'c')
+ inc_root = include_directories('.')
+ inc_drm = include_directories('include/drm')
+
+-libdrm = shared_library(
++libdrm = library(
+   'drm',
+   [files(
+      'xf86drm.c', 'xf86drmHash.c', 'xf86drmRandom.c', 'xf86drmSL.c',
+diff --git a/nouveau/meson.build b/nouveau/meson.build
+index 51c9a71..acba048 100644
+--- a/nouveau/meson.build
++++ b/nouveau/meson.build
+@@ -19,7 +19,7 @@
+ # SOFTWARE.
+
+
+-libdrm_nouveau = shared_library(
++libdrm_nouveau = library(
+   'drm_nouveau',
+   [files( 'nouveau.c', 'pushbuf.c', 'bufctx.c', 'abi16.c'), config_file],
+   c_args : warn_c_args,
+diff --git a/omap/meson.build b/omap/meson.build
+index e57b8f5..6cffb99 100644
+--- a/omap/meson.build
++++ b/omap/meson.build
+@@ -18,7 +18,7 @@
+ # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ # SOFTWARE.
+
+-libdrm_omap = shared_library(
++libdrm_omap = library(
+   'drm_omap',
+   [files('omap_drm.c'), config_file],
+   include_directories : [inc_root, inc_drm],
+diff --git a/radeon/meson.build b/radeon/meson.build
+index b08c744..2f45ff7 100644
+--- a/radeon/meson.build
++++ b/radeon/meson.build
+@@ -19,7 +19,7 @@
+ # SOFTWARE.
+
+
+-libdrm_radeon = shared_library(
++libdrm_radeon = library(
+   'drm_radeon',
+   [
+     files(
+diff --git a/tegra/meson.build b/tegra/meson.build
+index 1f5c74b..8d0cfa9 100644
+--- a/tegra/meson.build
++++ b/tegra/meson.build
+@@ -18,7 +18,7 @@
+ # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ # SOFTWARE.
+
+-libdrm_tegra = shared_library(
++libdrm_tegra = library(
+   'drm_tegra',
+   [files('tegra.c'), config_file],
+   include_directories : [inc_root, inc_drm],
+--
+2.18.0
+
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index cc7350c10e..f57806bc6b 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -10,114 +10,107 @@ LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
 LIBDRM_INSTALL_STAGING = YES

-# patch 0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
-# touching configure.ac/Makefile.am (and host-xutil_util-macros dependency)
-LIBDRM_AUTORECONF = YES
-
 LIBDRM_DEPENDENCIES = \
 	libpthread-stubs \
-	host-pkgconf \
-	host-xutil_util-macros
+	host-pkgconf

 LIBDRM_CONF_OPTS = \
-	--disable-cairo-tests \
-	--disable-manpages
-
-LIBDRM_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+	-Dcairo-tests=false \
+	-Dmanpages=false

 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
-LIBDRM_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DAO_NO_SPARC_V9"
+LIBDRM_MESON_CFLAGS += "\"-DAO_NO_SPARC_V9\","
 endif
 endif

 ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
-LIBDRM_CONF_OPTS += --enable-intel
+LIBDRM_CONF_OPTS += -Dintel=true
 LIBDRM_DEPENDENCIES += libpciaccess
 else
-LIBDRM_CONF_OPTS += --disable-intel
+LIBDRM_CONF_OPTS += -Dintel=false
 endif

 ifeq ($(BR2_PACKAGE_LIBDRM_RADEON),y)
-LIBDRM_CONF_OPTS += --enable-radeon
+LIBDRM_CONF_OPTS += -Dradeon=true
 else
-LIBDRM_CONF_OPTS += --disable-radeon
+LIBDRM_CONF_OPTS += -Dradeon=false
 endif

 ifeq ($(BR2_PACKAGE_LIBDRM_AMDGPU),y)
-LIBDRM_CONF_OPTS += --enable-amdgpu
+LIBDRM_CONF_OPTS += -Damdgpu=true
 else
-LIBDRM_CONF_OPTS += --disable-amdgpu
+LIBDRM_CONF_OPTS += -Damdgpu=false
 endif

 ifeq ($(BR2_PACKAGE_LIBDRM_NOUVEAU),y)
-LIBDRM_CONF_OPTS += --enable-nouveau
+LIBDRM_CONF_OPTS += -Dnouveau=true
 else
-LIBDRM_CONF_OPTS += --disable-nouveau
+LIBDRM_CONF_OPTS += -Dnouveau=false
 endif

 ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
-LIBDRM_CONF_OPTS += --enable-vmwgfx
+LIBDRM_CONF_OPTS += -Dvmwgfx=true
 else
-LIBDRM_CONF_OPTS += --disable-vmwgfx
+LIBDRM_CONF_OPTS += -Dvmwgfx=false
 endif

 ifeq ($(BR2_PACKAGE_LIBDRM_OMAP),y)
-LIBDRM_CONF_OPTS += --enable-omap-experimental-api
+LIBDRM_CONF_OPTS += -Domap=true
 else
-LIBDRM_CONF_OPTS += --disable-omap-experimental-api
+LIBDRM_CONF_OPTS += -Domap=false
 endif

 ifeq ($(BR2_PACKAGE_LIBDRM_ETNAVIV),y)
-LIBDRM_CONF_OPTS += --enable-etnaviv-experimental-api
+LIBDRM_CONF_OPTS += -Detnaviv=true
 else
-LIBDRM_CONF_OPTS += --disable-etnaviv-experimental-api
+LIBDRM_CONF_OPTS += -Detnaviv=false
 endif

 ifeq ($(BR2_PACKAGE_LIBDRM_EXYNOS),y)
-LIBDRM_CONF_OPTS += --enable-exynos-experimental-api
+LIBDRM_CONF_OPTS += -Dexynos=true
 else
-LIBDRM_CONF_OPTS += --disable-exynos-experimental-api
+LIBDRM_CONF_OPTS += -Dexynos=false
 endif

 ifeq ($(BR2_PACKAGE_LIBDRM_FREEDRENO),y)
-LIBDRM_CONF_OPTS += --enable-freedreno
+LIBDRM_CONF_OPTS += -Dfreedreno=true
 else
-LIBDRM_CONF_OPTS += --disable-freedreno
+LIBDRM_CONF_OPTS += -Dfreedreno=false
 endif

 ifeq ($(BR2_PACKAGE_LIBDRM_TEGRA),y)
-LIBDRM_CONF_OPTS += --enable-tegra-experimental-api
+LIBDRM_CONF_OPTS += -Dtegra=true
 else
-LIBDRM_CONF_OPTS += --disable-tegra-experimental-api
+LIBDRM_CONF_OPTS += -Dtegra=false
 endif

 ifeq ($(BR2_PACKAGE_LIBDRM_VC4),y)
-LIBDRM_CONF_OPTS += --enable-vc4
+LIBDRM_CONF_OPTS += -Dvc4=true
 else
-LIBDRM_CONF_OPTS += --disable-vc4
+LIBDRM_CONF_OPTS += -Dvc4=false
 endif

 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBDRM_CONF_OPTS += --enable-udev
+LIBDRM_CONF_OPTS += -Dudev=true
 LIBDRM_DEPENDENCIES += udev
 else
-LIBDRM_CONF_OPTS += --disable-udev
+LIBDRM_CONF_OPTS += -Dudev=false
 endif

 ifeq ($(BR2_PACKAGE_VALGRIND),y)
-LIBDRM_CONF_OPTS += --enable-valgrind
+LIBDRM_CONF_OPTS += -Dvalgrind=true
 LIBDRM_DEPENDENCIES += valgrind
 else
-LIBDRM_CONF_OPTS += --disable-valgrind
+LIBDRM_CONF_OPTS += -Dvalgrind=false
 endif

 ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
-LIBDRM_CONF_OPTS += --enable-install-test-programs
+LIBDRM_CONF_OPTS += -Dinstall-test-programs=true
 ifeq ($(BR2_PACKAGE_CUNIT),y)
 LIBDRM_DEPENDENCIES += cunit
 endif
 endif

-$(eval $(autotools-package))
+$(eval $(meson-package))
--
2.21.0
