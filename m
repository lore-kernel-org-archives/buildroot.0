From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 13 Mar 2015 09:24:10 +0100
Subject: [Buildroot] [PATCH v7 3/3] GNURadio: new package
In-Reply-To: <1426235050-3482-1-git-send-email-gwenj@trabucayre.com>
References: <1426235050-3482-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <1426235050-3482-3-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v6 -> v7:
* add detection boost unit_test_framework to avoid build failure if
 BUILD_TEST is set and unit_test_framework not available.
* comment indentation.
* Locally calculated sha256.
* suppress redundant comment.
* use hf/neon optimization only if target CPU is an ARMV7A and NEON available.
Changes v5 -> v6:
* GNURADIO_SUPPORTS_IN_SOURCE_BUILD = no -> GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
Changes v4 -> v5:
* GNURadio -> gnuradio.
* help for all options.
* rename patch, add signed-off and a comment.
* dependencies comment.
* typo. 
* better workaround to avoid compile fails when neon is enabled.
* indentation.
* better options handlings.
Changes v2 -> v3:
* move comment at the beginning of the file.
* add a patch to suppress boost-test dependency.
* move python dependencies in the specific option.
* use stable archive instead of git.
* add hook specific for ARM for using neon if available (without this hook volk
  fails to build).
Changes v1 -> v2:
* overload _BUILDDIR variable to specify build directory
---
 package/Config.in                                  |  1 +
 .../0001-suppress-boost_unitest-detection.patch    | 40 +++++++++++++++
 package/gnuradio/Config.in                         | 46 +++++++++++++++++
 package/gnuradio/gnuradio.hash                     |  5 ++
 package/gnuradio/gnuradio.mk                       | 58 ++++++++++++++++++++++
 5 files changed, 150 insertions(+)
 create mode 100644 package/gnuradio/0001-suppress-boost_unitest-detection.patch
 create mode 100644 package/gnuradio/Config.in
 create mode 100644 package/gnuradio/gnuradio.hash
 create mode 100644 package/gnuradio/gnuradio.mk

diff --git a/package/Config.in b/package/Config.in
index a37e519..0761111 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1044,6 +1044,7 @@ menu "Miscellaneous"
 	source "package/clamav/Config.in"
 	source "package/collectd/Config.in"
 	source "package/empty/Config.in"
+	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
 	source "package/haveged/Config.in"
 	source "package/mcrypt/Config.in"
diff --git a/package/gnuradio/0001-suppress-boost_unitest-detection.patch b/package/gnuradio/0001-suppress-boost_unitest-detection.patch
new file mode 100644
index 0000000..7663881
--- /dev/null
+++ b/package/gnuradio/0001-suppress-boost_unitest-detection.patch
@@ -0,0 +1,40 @@
+By default, the boost test option is mandatory for build environment
+detection. 
+This patch suppress this dependency and allows the test part only if
+build_test is enabled at the Buildroot level.
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+Index: gnuradio-3.7.5/volk/cmake/VolkBoost.cmake
+===================================================================
+--- gnuradio-3.7.5.orig/volk/cmake/VolkBoost.cmake
++++ gnuradio-3.7.5/volk/cmake/VolkBoost.cmake
+@@ -29,7 +29,6 @@ set(__INCLUDED_VOLK_BOOST_CMAKE TRUE)
+ set(BOOST_REQUIRED_COMPONENTS
+     filesystem
+     system
+-    unit_test_framework
+     program_options
+ )
+ 
+Index: gnuradio-3.7.5/volk/lib/CMakeLists.txt
+===================================================================
+--- gnuradio-3.7.5.orig/volk/lib/CMakeLists.txt
++++ gnuradio-3.7.5/volk/lib/CMakeLists.txt
+@@ -540,8 +540,9 @@ endif(ENABLE_STATIC_LIBS)
+ # Build the QA test application
+ ########################################################################
+ 
++find_package(Boost "1.35" COMPONENTS "unit_test_framework")
+ 
+-if(Boost_FOUND)
++if(Boost_FOUND AND BUILD_TEST)
+ 
+     set_source_files_properties(
+         ${CMAKE_CURRENT_SOURCE_DIR}/testqa.cc PROPERTIES
+@@ -558,4 +559,4 @@ if(Boost_FOUND)
+     target_link_libraries(test_all volk ${Boost_LIBRARIES})
+     add_test(qa_volk_test_all test_all)
+ 
+-endif(Boost_FOUND)
++endif(Boost_FOUND AND BUILD_TEST)
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
new file mode 100644
index 0000000..e32fc27
--- /dev/null
+++ b/package/gnuradio/Config.in
@@ -0,0 +1,46 @@
+comment "gnuradio needs a toolchain w/ C++, IPV6, threads, largefile, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
+		!BR2_INET_IPV6
+
+config BR2_PACKAGE_GNURADIO
+	bool "gnuradio"
+	depends on BR2_INET_IPV6 # boost
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE # boost
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # use fork()
+	depends on BR2_USE_WCHAR # boost
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
+	help
+	  GNU Radio is a free & open-source software development toolkit
+	  that provides signal processing blocks to implement software
+	  radios. It can be used with readily-available low-cost external
+	  RF hardware to create software-defined radios, or without
+	  hardware in a simulation-like environment. It is widely used in
+	  hobbyist, academic and commercial environments to support both
+	  wireless communications research and real-world radio systems.
+
+	  http://gnuradio.org/
+
+if BR2_PACKAGE_GNURADIO
+
+config BR2_PACKAGE_GNURADIO_BLOCKS
+	bool "blocks support"
+	help
+	  GNU Radio basic block library
+
+config BR2_PACKAGE_GNURADIO_PYTHON
+	bool "python support"
+	select BR2_PACKAGE_BOOST_PYTHON
+	select BR2_PACKAGE_PYTHON
+	help
+	  Enable python component
+
+endif
diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
new file mode 100644
index 0000000..d34dd55
--- /dev/null
+++ b/package/gnuradio/gnuradio.hash
@@ -0,0 +1,5 @@
+# From http://gnuradio.org/redmine/projects/gnuradio/files
+md5	b4a917a548f41ce25c6c88f9bc864bca	gnuradio-3.7.5.tar.gz
+
+# Locally calculated:
+sha256 467f62190687a34f9faa18be8d650e28d7046b94070b1b6d94355c28beb76243  gnuradio-3.7.5.tar.gz
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
new file mode 100644
index 0000000..72b4ff9
--- /dev/null
+++ b/package/gnuradio/gnuradio.mk
@@ -0,0 +1,58 @@
+################################################################################
+#
+# gnuradio
+#
+################################################################################
+
+GNURADIO_VERSION = 3.7.5
+GNURADIO_SITE = http://gnuradio.org/redmine/attachments/download/792
+GNURADIO_LICENSE = GPLv3+
+GNURADIO_LICENSE_FILES = COPYING
+
+GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
+
+# host-python-cheetah is needed for volk to compile
+GNURADIO_DEPENDENCIES = \
+		host-python-cheetah \
+		host-swig \
+		boost
+
+GNURADIO_CONF_OPTS = \
+		-DENABLE_DEFAULT=OFF \
+		-DENABLE_VOLK=ON \
+		-DENABLE_GNURADIO_RUNTIME=ON
+
+#For third-party blocks,  the gnuradio libraries are mandatory at 
+# compile time.
+GNURADIO_INSTALL_STAGING = YES
+
+# Yes, this is silly, because -march is already known by the compiler
+# with the internal toolchain, and passed by the external wrapper for
+# external toolchains. Nonetheless, gnuradio does some matching on the
+# CFLAGS to decide whether to build the NEON functions or not, and
+# wants to see the string 'armv7' in the CFLAGS.
+ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_ARM_CPU_HAS_NEON),yy)
+GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="-march=armv7-a"
+endif
+
+# As soon as -mfpu=neon is supported by the compiler, gnuradio will try
+# to use it. But having NEON support in the compiler doesn't necessarily
+# mean we have NEON support in our CPU.
+ifeq ($(BR2_ARM_CPU_HAS_NEON),)
+GNURADIO_CONF_OPTS += -Dhave_mfpu_neon=0
+endif
+
+ifeq ($(BR2_PACKAGE_GNURADIO_BLOCKS),y)
+GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
+GNURADIO_DEPENDENCIES += python
+GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.0.5
