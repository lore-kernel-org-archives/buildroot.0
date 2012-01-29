From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Jan 2012 00:04:36 +0100
Subject: [Buildroot] [git commit] boost: New package added. Version 1.47
Message-ID: <20120129230528.73EBA90932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f64a740f360439bbab6526b8a08588a57ea8fd52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Config.in tweaks]
Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/boost/Config.in |   79 ++++++++++++++++++++++++++++++++++++++++++++
 package/boost/boost.mk  |   83 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 163 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 65c2a98..eb3abe8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -364,6 +364,7 @@ menu "Other"
 source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
+source "package/boost/Config.in"
 source "package/libatomic_ops/Config.in"
 source "package/libcap/Config.in"
 source "package/libdaemon/Config.in"
diff --git a/package/boost/Config.in b/package/boost/Config.in
new file mode 100644
index 0000000..7598d02
--- /dev/null
+++ b/package/boost/Config.in
@@ -0,0 +1,79 @@
+config BR2_PACKAGE_BOOST
+	bool "boost"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_ZLIB
+	help
+	  A general purpose C++ library
+
+	  http://www.boost.org/
+
+if BR2_PACKAGE_BOOST
+
+config BR2_PACKAGE_BOOST_MULTITHREADED
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	bool "boost-multithreaded"
+	help
+	  Build the boost libraries as multithreaded
+
+config BR2_PACKAGE_BOOST_CHRONO
+	bool "boost-chrono"
+
+config BR2_PACKAGE_BOOST_DATE_TIME
+	bool "boost-date_time"
+
+config BR2_PACKAGE_BOOST_EXCEPTION
+	bool "boost-exception"
+
+config BR2_PACKAGE_BOOST_FILESYSTEM
+	bool "boost-filesystem"
+
+config BR2_PACKAGE_BOOST_GRAPH
+	bool "boost-graph"
+
+config BR2_PACKAGE_BOOST_GRAPH_PARALLEL
+	bool "boost-graph_parallel"
+
+config BR2_PACKAGE_BOOST_ICU
+        select BR2_PACKAGE_ICU
+	bool "boost-icu"
+
+config BR2_PACKAGE_BOOST_IOSTREAMS
+	bool "boost-iostreams"
+
+config BR2_PACKAGE_BOOST_MATH
+	bool "boost-math"
+
+config BR2_PACKAGE_BOOST_MPI
+	bool "boost-mpi"
+
+config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	bool "boost-program_options"
+
+config BR2_PACKAGE_BOOST_RANDOM
+	bool "boost-random"
+
+config BR2_PACKAGE_BOOST_REGEX
+	bool "boost-regex"
+
+config BR2_PACKAGE_BOOST_SERIALIZATION
+	bool "boost-serialization"
+
+config BR2_PACKAGE_BOOST_SIGNALS
+	bool "boost-signals"
+
+config BR2_PACKAGE_BOOST_SYSTEM
+	bool "boost-system"
+
+config BR2_PACKAGE_BOOST_TEST
+	bool "boost-test"
+
+config BR2_PACKAGE_BOOST_THREAD
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	bool "boost-thread"
+
+config BR2_PACKAGE_BOOST_WAVE
+	bool "boost-wave"
+
+endif
+
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
new file mode 100644
index 0000000..4bbc869
--- /dev/null
+++ b/package/boost/boost.mk
@@ -0,0 +1,83 @@
+#############################################################
+#
+# Boost
+#
+#############################################################
+
+BOOST_VERSION = 1.47.0
+BOOST_FILE_VERSION = $(subst .,_,$(BOOST_VERSION))
+BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
+BOOST_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/boost
+BOOST_INSTALL_STAGING = YES
+
+TARGET_CC_VERSION = $(shell $(TARGET_CC) --version | head -n 1 | sed -e "s/.*[[:space:]]\([[:digit:].]\+$$\)/\1/g" )
+
+BOOST_DEPENDENCIES = bzip2 zlib
+
+BOOST_FLAGS =
+BOOST_WITHOUT_FLAGS = python
+
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH),,graph)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),,graph_parallel)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_IOSTREAMS),,iostreams)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_REGEX),,regex)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SERIALIZATION),,serialization)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SIGNALS),,signals)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SYSTEM),,system)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TEST),,test)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_THREAD),,thread)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)
+
+ifeq ($(BR2_PACKAGE_BOOST_ICU),y)
+BOOST_FLAGS += --with-icu
+BOOST_DEPENDENCIES += icu
+else
+BOOST_FLAGS += --without-icu
+endif
+
+BOOST_LINK = $(if $(BR2_PREFER_STATIC_LIB),static,shared)
+BOOST_MULTI = $(if $(BR2_PACKAGE_BOOST_MULTITHREADED),multi,single)
+BOOST_VARIANT = $(if $(BR2_ENABLE_DEBUG),debug,release)
+
+BOOST_WITHOUT_FLAGS_COMMASEPERATED += $(subst $(space),$(comma),$(strip $(BOOST_WITHOUT_FLAGS)))
+BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPERATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPERATED))
+
+define BOOST_CONFIGURE_CMDS
+	(cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
+	echo "using gcc : $(TARGET_CC_VERSION) : \"$(TARGET_CXX)\" : <cxxflags>\"$(TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
+	echo "" >> $(@D)/user-config.jam
+endef
+
+define BOOST_INSTALL_TARGET_CMDS
+	(cd $(@D) && ./b2 -q -d+2 \
+	--user-config=$(@D)/user-config.jam \
+	toolset=gcc \
+	variant=$(BOOST_VARIANT) \
+	link=$(BOOST_LINK) \
+	threading=$(BOOST_MULTI) \
+	runtime-link=$(BOOST_LINK) \
+	--prefix=$(TARGET_DIR)/usr \
+	--layout=system install )
+endef
+
+define BOOST_INSTALL_STAGING_CMDS
+	(cd $(@D) && ./bjam -d+2 \
+	--user-config=$(@D)/user-config.jam \
+	toolset=gcc \
+	variant=$(BOOST_VARIANT) \
+	link=$(BOOST_LINK) \
+	threading=$(BOOST_MULTI) \
+	runtime-link=$(BOOST_LINK) \
+	--prefix=$(STAGING_DIR)/usr \
+	--layout=system install)
+endef
+
+$(eval $(call GENTARGETS))
