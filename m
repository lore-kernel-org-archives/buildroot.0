From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 11 Mar 2015 13:13:23 +0100
Subject: [Buildroot] [PATCH v6 3/3] GNURadio: new package
In-Reply-To: <1426076003-12088-1-git-send-email-gwenj@trabucayre.com>
References: <1426076003-12088-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <1426076003-12088-3-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
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
 .../0001-suppress-boost_unitest-detection.patch    | 32 ++++++++++++
 package/gnuradio/Config.in                         | 46 +++++++++++++++++
 package/gnuradio/gnuradio.hash                     |  2 +
 package/gnuradio/gnuradio.mk                       | 59 ++++++++++++++++++++++
 5 files changed, 140 insertions(+)
 create mode 100644 package/gnuradio/0001-suppress-boost_unitest-detection.patch
 create mode 100644 package/gnuradio/Config.in
 create mode 100644 package/gnuradio/gnuradio.hash
 create mode 100644 package/gnuradio/gnuradio.mk

diff --git a/package/Config.in b/package/Config.in
index cab9382..5d9e540 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1043,6 +1043,7 @@ menu "Miscellaneous"
 	source "package/clamav/Config.in"
 	source "package/collectd/Config.in"
 	source "package/empty/Config.in"
+	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
 	source "package/haveged/Config.in"
 	source "package/mcrypt/Config.in"
diff --git a/package/gnuradio/0001-suppress-boost_unitest-detection.patch b/package/gnuradio/0001-suppress-boost_unitest-detection.patch
new file mode 100644
index 0000000..ab8411b
--- /dev/null
+++ b/package/gnuradio/0001-suppress-boost_unitest-detection.patch
@@ -0,0 +1,32 @@
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
+@@ -541,7 +541,7 @@ endif(ENABLE_STATIC_LIBS)
+ ########################################################################
+ 
+ 
+-if(Boost_FOUND)
++if(Boost_FOUND AND BUILD_TEST)
+ 
+     set_source_files_properties(
+         ${CMAKE_CURRENT_SOURCE_DIR}/testqa.cc PROPERTIES
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
new file mode 100644
index 0000000..a95c704
--- /dev/null
+++ b/package/gnuradio/Config.in
@@ -0,0 +1,46 @@
+comment "gnuradio needs a toolchain w/ C++, IPV6, threads, largefile, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+			!BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
+			!BR2_INET_IPV6
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
index 0000000..a25b466
--- /dev/null
+++ b/package/gnuradio/gnuradio.hash
@@ -0,0 +1,2 @@
+# From http://gnuradio.org/redmine/projects/gnuradio/files
+md5	b4a917a548f41ce25c6c88f9bc864bca	gnuradio-3.7.5.tar.gz
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
new file mode 100644
index 0000000..e503911
--- /dev/null
+++ b/package/gnuradio/gnuradio.mk
@@ -0,0 +1,59 @@
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
+# gnuradio prevents doing an in-source-tree build
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
+ifeq ($(BR2_ARM_CPU_ARMV7A),y)
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
