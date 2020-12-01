From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 22:47:29 +0100
Subject: [Buildroot] [git commit branch/next] package/kmsxx: bump version to
 5489056 and convert to meson build
Message-ID: <20201201213224.0949282B85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4146241624045c8b3dd785aaefd3e0795ff1281d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- remove 0001-fix-compiler-errors-with-gcc-10.patch
  (upstream)

- remove 0002-added-include-string-to-card.h-to-follow-gcc10-porti.patch
  (upstream)

- convert to meson

- add patch to use system fmt instead of git submodule (fixes
  configure 'ERROR: Include dir ext/fmt/include does not exist.')

- add patch to use system pybind11 instead of git submodule (fixes
  configure 'ERROR: Include dir ext/pybind11/include does not exist.')

- add patch to use python only if pykms is enabled (fixes
  configure 'ERROR: Dependency "pybind11" not found, tried pkgconfig')

- add optional libevdev dependency (needed for utils/kmstouch)

- update LICENSE file hash (replaced short copyright notice and
  link to  http://mozilla.org/MPL/2.0/ with complete license text)

- lift toolchain headers requirement to at least 4.11 (include
  linux/dma-buf.h)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fix-compiler-errors-with-gcc-10.patch     | 35 ----------
 .../0001-meson-add-use-system-fmt-option.patch     | 46 ++++++++++++++
 ...g-to-card.h-to-follow-gcc10-porting-guide.patch | 25 --------
 ...0002-meson-add-use-system-pybind11-option.patch | 43 +++++++++++++
 ...on-only-build-py-in-case-pykms-is-enabled.patch | 48 ++++++++++++++
 package/kmsxx/Config.in                            |  7 +-
 package/kmsxx/kmsxx.hash                           |  4 +-
 package/kmsxx/kmsxx.mk                             | 74 +++++++++-------------
 8 files changed, 172 insertions(+), 110 deletions(-)

diff --git a/package/kmsxx/0001-fix-compiler-errors-with-gcc-10.patch b/package/kmsxx/0001-fix-compiler-errors-with-gcc-10.patch
deleted file mode 100644
index 6ec080af97..0000000000
--- a/package/kmsxx/0001-fix-compiler-errors-with-gcc-10.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From aa54634ce7cbbfc844de945e73a9f34cdcb9bb12 Mon Sep 17 00:00:00 2001
-From: Peter Trompeter <christoph@zen.fritz.box>
-Date: Fri, 15 May 2020 15:20:47 +0200
-Subject: [PATCH] fix compiler errors with gcc 10
-
-[Retrieved from:
-https://github.com/tomba/kmsxx/commit/aa54634ce7cbbfc844de945e73a9f34cdcb9bb12]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- kms++/inc/kms++/pixelformats.h | 1 +
- kms++util/src/opts.cpp         | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/kms++/inc/kms++/pixelformats.h b/kms++/inc/kms++/pixelformats.h
-index 784717d..4e73d5d 100644
---- a/kms++/inc/kms++/pixelformats.h
-+++ b/kms++/inc/kms++/pixelformats.h
-@@ -2,6 +2,7 @@
- 
- #include <cstdint>
- #include <string>
-+#include <stdexcept>
- 
- namespace kms
- {
-diff --git a/kms++util/src/opts.cpp b/kms++util/src/opts.cpp
-index afef452..5a14b84 100644
---- a/kms++util/src/opts.cpp
-+++ b/kms++util/src/opts.cpp
-@@ -1,4 +1,5 @@
- #include <algorithm>
-+#include <stdexcept>
- 
- #include <unistd.h>
- #include <getopt.h>
diff --git a/package/kmsxx/0001-meson-add-use-system-fmt-option.patch b/package/kmsxx/0001-meson-add-use-system-fmt-option.patch
new file mode 100644
index 0000000000..e9d67b1202
--- /dev/null
+++ b/package/kmsxx/0001-meson-add-use-system-fmt-option.patch
@@ -0,0 +1,46 @@
+From 61db7d5520f50564da8f2c9ac952eadb31f70727 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 29 Nov 2020 11:13:41 +0100
+Subject: [PATCH] meson: add use-system-fmt option
+
+[Upstream: https://github.com/tomba/kmsxx/pull/60]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ meson.build       | 10 +++++++---
+ meson_options.txt |  2 ++
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 9652009..29080f4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -31,9 +31,13 @@ endif
+ 
+ add_global_link_arguments(link_arguments, language : 'cpp')
+ 
+-libfmt_includes = include_directories('ext/fmt/include')
+-libfmt_dep = declare_dependency(include_directories : libfmt_includes,
+-                                compile_args : '-DFMT_HEADER_ONLY')
++if get_option('use-system-fmt')
++    libfmt_dep = dependency('fmt')
++else
++    libfmt_includes = include_directories('ext/fmt/include')
++    libfmt_dep = declare_dependency(include_directories : libfmt_includes,
++                                    compile_args : '-DFMT_HEADER_ONLY')
++endif
+ 
+ pybind11_includes = include_directories('ext/pybind11/include')
+ pybind11_dep = declare_dependency(include_directories : pybind11_includes)
+diff --git a/meson_options.txt b/meson_options.txt
+index cd854ab..48176a8 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -3,3 +3,5 @@ option('pykms', type : 'feature', value : 'auto')
+ option('omap', type : 'feature', value : 'auto')
+ option('static-libc', type : 'boolean', value : false)
+ option('utils', type : 'boolean', value : true)
++
++option('use-system-fmt', type : 'boolean', value : false)
+-- 
+2.29.2
+
diff --git a/package/kmsxx/0002-added-include-string-to-card.h-to-follow-gcc10-porting-guide.patch b/package/kmsxx/0002-added-include-string-to-card.h-to-follow-gcc10-porting-guide.patch
deleted file mode 100644
index a326577b04..0000000000
--- a/package/kmsxx/0002-added-include-string-to-card.h-to-follow-gcc10-porting-guide.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From b53f9d383c9189a897c44cd88a8fc1b871fdc8a2 Mon Sep 17 00:00:00 2001
-From: Tobias Off <sebastianoff@web.de>
-Date: Thu, 8 Oct 2020 22:37:55 +0200
-Subject: [PATCH] added #include <string> to card.h to follow gcc10 porting
- guide
-
-[Retrieved (and backported) from:
-https://github.com/tomba/kmsxx/commit/b53f9d383c9189a897c44cd88a8fc1b871fdc8a2]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- kms++/inc/kms++/card.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/kms++/inc/kms++/card.h b/kms++/inc/kms++/card.h
-index 0a7eaaf..f60b184 100644
---- a/kms++/inc/kms++/card.h
-+++ b/kms++/inc/kms++/card.h
-@@ -4,6 +4,7 @@
- #include <cstdint>
- #include <vector>
- #include <map>
-+#include <string>
- 
- #include "decls.h"
- #include "pipeline.h"
diff --git a/package/kmsxx/0002-meson-add-use-system-pybind11-option.patch b/package/kmsxx/0002-meson-add-use-system-pybind11-option.patch
new file mode 100644
index 0000000000..be58b65b42
--- /dev/null
+++ b/package/kmsxx/0002-meson-add-use-system-pybind11-option.patch
@@ -0,0 +1,43 @@
+From 27f15549ce67194e4152c57db2b762b7a443b4c7 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 29 Nov 2020 11:14:41 +0100
+Subject: [PATCH] meson: add use-system-pybind11 option
+
+[Upstream: https://github.com/tomba/kmsxx/pull/60]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ meson.build       | 8 ++++++--
+ meson_options.txt | 1 +
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 29080f4..4b3e7c3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -39,8 +39,12 @@ else
+                                     compile_args : '-DFMT_HEADER_ONLY')
+ endif
+ 
+-pybind11_includes = include_directories('ext/pybind11/include')
+-pybind11_dep = declare_dependency(include_directories : pybind11_includes)
++if get_option('use-system-pybind11')
++    pybind11_dep = dependency('pybind11')
++else
++    pybind11_includes = include_directories('ext/pybind11/include')
++    pybind11_dep = declare_dependency(include_directories : pybind11_includes)
++endif
+ 
+ libdrmomap_dep = dependency('libdrm_omap', required : get_option('omap'))
+ 
+diff --git a/meson_options.txt b/meson_options.txt
+index 48176a8..095c6f2 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -5,3 +5,4 @@ option('static-libc', type : 'boolean', value : false)
+ option('utils', type : 'boolean', value : true)
+ 
+ option('use-system-fmt', type : 'boolean', value : false)
++option('use-system-pybind11', type : 'boolean', value : false)
+-- 
+2.29.2
+
diff --git a/package/kmsxx/0003-meson-only-build-py-in-case-pykms-is-enabled.patch b/package/kmsxx/0003-meson-only-build-py-in-case-pykms-is-enabled.patch
new file mode 100644
index 0000000000..a908521381
--- /dev/null
+++ b/package/kmsxx/0003-meson-only-build-py-in-case-pykms-is-enabled.patch
@@ -0,0 +1,48 @@
+From 0ef36b2e22c2ac0331b3096b7adc69fb08044048 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 29 Nov 2020 11:37:26 +0100
+Subject: [PATCH] meson: only build py in case pykms is enabled
+
+[Upstream: https://github.com/tomba/kmsxx/pull/60]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ meson.build | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 4b3e7c3..1810b17 100644
+--- a/meson.build
++++ b/meson.build
+@@ -39,11 +39,13 @@ else
+                                     compile_args : '-DFMT_HEADER_ONLY')
+ endif
+ 
+-if get_option('use-system-pybind11')
+-    pybind11_dep = dependency('pybind11')
+-else
+-    pybind11_includes = include_directories('ext/pybind11/include')
+-    pybind11_dep = declare_dependency(include_directories : pybind11_includes)
++if get_option('pykms').enabled()
++    if get_option('use-system-pybind11')
++        pybind11_dep = dependency('pybind11')
++    else
++        pybind11_includes = include_directories('ext/pybind11/include')
++        pybind11_dep = declare_dependency(include_directories : pybind11_includes)
++    endif
+ endif
+ 
+ libdrmomap_dep = dependency('libdrm_omap', required : get_option('omap'))
+@@ -55,7 +57,9 @@ if get_option('utils')
+     subdir('utils')
+ endif
+ 
+-subdir('py')
++if get_option('pykms').enabled()
++    subdir('py')
++endif
+ 
+ if get_option('kmscube')
+     subdir('kmscube')
+-- 
+2.29.2
+
diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
index 1d174c18b1..6e4d1e61a1 100644
--- a/package/kmsxx/Config.in
+++ b/package/kmsxx/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_KMSXX
 	bool "kms++"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 # linux/dma-buf.h
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_LIBDRM
 	help
 	  libkms++ is a C++11 library for kernel mode setting.
@@ -21,6 +22,6 @@ config BR2_PACKAGE_KMSXX_INSTALL_TESTS
 
 endif
 
-comment "kms++ needs a toolchain w/ threads, C++, gcc >= 4.8, headers >= 3.8"
+comment "kms++ needs a toolchain w/ threads, C++, gcc >= 4.8, headers >= 4.11"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
diff --git a/package/kmsxx/kmsxx.hash b/package/kmsxx/kmsxx.hash
index b8d06ac478..1eeb1e6a7e 100644
--- a/package/kmsxx/kmsxx.hash
+++ b/package/kmsxx/kmsxx.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  28892e50c1d1c83fddff9ec683e3bdbd465f5032d0014ceeab43563b813807e1  kmsxx-cb0786049f960f2bd383617151b01318e02e9ff9.tar.gz
-sha256  022b4d51da34a380d74dc24eea8e2c4e1a4c8776a52171f8d9e941cf56daf888  LICENSE
+sha256  4a682328b03c28ff1f6cfcafc48d30c3feb5ef98ed07e5dd3bbd9e6a1d4a47cc  kmsxx-548905611c130ea9d31929a0caf7a198d8bac462.tar.gz
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 829beb1d68..fd40ff8e73 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -4,62 +4,46 @@
 #
 ################################################################################
 
-KMSXX_VERSION = cb0786049f960f2bd383617151b01318e02e9ff9
+KMSXX_VERSION = 548905611c130ea9d31929a0caf7a198d8bac462
 KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
 KMSXX_LICENSE = MPL-2.0
 KMSXX_LICENSE_FILES = LICENSE
 KMSXX_INSTALL_STAGING = YES
-KMSXX_DEPENDENCIES = libdrm host-pkgconf
-KMSXX_CONF_OPTS = -DKMSXX_ENABLE_PYTHON=OFF
-
-KMSXX_CXXFLAGS = $(TARGET_CXXFLAGS)
+KMSXX_DEPENDENCIES = fmt libdrm host-pkgconf
+KMSXX_CONF_OPTS = \
+	-Dkmscube=false \
+	-Dpykms=disabled \
+	-Domap=disabled \
+	-Duse-system-fmt=true \
+	-Duse-system-pybind11=true
+
+ifeq ($(BR2_STATIC_LIBS),y)
+KMSXX_CONF_OPTS += -Dstatic-libc=true
+else
+KMSXX_CONF_OPTS += -Dstatic-libc=false
+endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-KMSXX_CXXFLAGS += -O0
+KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
 endif
 
-KMSXX_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(KMSXX_CXXFLAGS)"
-
 ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
-KMSXX_TESTS = \
-	fbtest kmsblank kmscapture \
-	kmsprint kmstest kmsview wbcap \
-	wbm2m
-
-define KMSXX_INSTALL_TARGET_TESTS
-	$(foreach t,$(KMSXX_TESTS),\
-		$(INSTALL) -D -m 0755 $(@D)/bin/$(t) \
+KMSXX_CONF_OPTS += -Dutils=true
+# extra handling for some utils not installed by default
+KMSXX_EXTRA_UTILS = kmsview kmscapture omap-wbcap omap-wbm2m
+ifeq ($(BR2_PACKAGE_LIBEVDEV),y)
+KMSXX_DEPENDENCIES += libevdev
+KMSXX_EXTRA_UTILS += kmstouch
+endif
+define KMSXX_INSTALL_EXTRA_UTILS
+	$(foreach t,$(KMSXX_EXTRA_UTILS),\
+		$(INSTALL) -D -m 0755 $(@D)/build/utils/$(t) \
 			$(TARGET_DIR)/usr/bin/$(t)
 	)
 endef
+KMSXX_POST_INSTALL_TARGET_HOOKS += KMSXX_INSTALL_EXTRA_UTILS
+else
+KMSXX_CONF_OPTS += -Dutils=false
 endif
 
-KMSXX_LIBS = kms++ kms++util
-
-define KMSXX_INSTALL_TARGET_CMDS
-	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),
-		$(foreach l,$(KMSXX_LIBS),\
-			$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
-				$(TARGET_DIR)/usr/lib/lib$(l).so
-		)
-	)
-	$(KMSXX_INSTALL_TARGET_TESTS)
-endef
-
-# kmsxx only builds shared or static libraries, so when
-# BR2_SHARED_STATIC_LIBS=y, we don't have any static library to
-# install
-define KMSXX_INSTALL_STAGING_CMDS
-	$(foreach l,$(KMSXX_LIBS),\
-		$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),
-			$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
-				$(STAGING_DIR)/usr/lib/lib$(l).so)
-		$(if $(BR2_STATIC_LIBS),
-			$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).a \
-				$(STAGING_DIR)/usr/lib/lib$(l).a)
-		mkdir -p $(STAGING_DIR)/usr/include/$(l)
-		cp -dpfr $(@D)/$(l)/inc/$(l)/* $(STAGING_DIR)/usr/include/$(l)/
-	)
-endef
-
-$(eval $(cmake-package))
+$(eval $(meson-package))
