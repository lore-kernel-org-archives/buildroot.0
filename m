From: Allan W. Nielsen <a@awn.dk>
Date: Fri, 23 Sep 2011 10:50:51 +0200
Subject: [Buildroot] [PATCH] boost: New package added. Version 1.47
Message-ID: <1316767851-26889-1-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/Config.in       |    1 +
 package/boost/Config.in |  102 ++++++++++++++++++++++++++++
 package/boost/boost.mk  |  169 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 272 insertions(+), 0 deletions(-)
 create mode 100644 package/boost/Config.in
 create mode 100644 package/boost/boost.mk

diff --git a/package/Config.in b/package/Config.in
index 12fd0dc..88aaf2d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -340,6 +340,7 @@ endmenu
 menu "Other"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
+source "package/boost/Config.in"
 source "package/libatomic_ops/Config.in"
 source "package/libcap/Config.in"
 source "package/libdaemon/Config.in"
diff --git a/package/boost/Config.in b/package/boost/Config.in
new file mode 100644
index 0000000..8b095c7
--- /dev/null
+++ b/package/boost/Config.in
@@ -0,0 +1,102 @@
+config BR2_PACKAGE_BOOST
+	bool "boost"
+	select BR2_PACKAGE_BZIP2
+        select BR2_PACKAGE_ZLIB
+	help
+	  A general purpose c++ library
+
+	  http://www.boost.org/
+
+menu "Boost libraries"
+	depends on BR2_PACKAGE_BOOST
+
+config BR2_PACKAGE_BOOST_MULTITHREADED
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-multithreaded"
+        help
+            Build the boost libraries as multithreaded
+
+config BR2_PACKAGE_BOOST_CHRONO
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-chrono"
+
+config BR2_PACKAGE_BOOST_DATE_TIME 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-date_time"
+
+config BR2_PACKAGE_BOOST_EXCEPTION
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-exception"
+
+config BR2_PACKAGE_BOOST_FILESYSTEM 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-filesystem"
+
+config BR2_PACKAGE_BOOST_GRAPH 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-graph"
+
+config BR2_PACKAGE_BOOST_GRAPH_PARALLEL 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-graph_parallel"
+
+config BR2_PACKAGE_BOOST_ICU
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-icu"
+
+config BR2_PACKAGE_BOOST_IOSTREAMS 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-iostreams"
+
+config BR2_PACKAGE_BOOST_MATH 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-math"
+
+config BR2_PACKAGE_BOOST_MPI
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-mpi"
+
+config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-program_options"
+
+config BR2_PACKAGE_BOOST_PYTHON
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-python"
+
+config BR2_PACKAGE_BOOST_RANDOM 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-random"
+
+config BR2_PACKAGE_BOOST_REGEX 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-regex"
+
+config BR2_PACKAGE_BOOST_SERIALIZATION 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-serialization"
+
+config BR2_PACKAGE_BOOST_SIGNALS 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-signals"
+
+config BR2_PACKAGE_BOOST_SYSTEM 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-system"
+
+config BR2_PACKAGE_BOOST_TEST 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-test"
+
+config BR2_PACKAGE_BOOST_THREAD 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-thread"
+
+config BR2_PACKAGE_BOOST_WAVE 
+	depends on BR2_PACKAGE_BOOST
+	bool "boost-wave"
+
+
+endmenu
+
+
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
new file mode 100644
index 0000000..39ad78e
--- /dev/null
+++ b/package/boost/boost.mk
@@ -0,0 +1,169 @@
+#############################################################
+#
+# Boost
+#
+#############################################################
+
+BOOST_VERSION = 1.47.0
+BOOST_FILE_VERSION=$(shell echo $(BOOST_VERSION) | sed -e s/\\\./_/g)
+BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
+BOOST_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/boost
+
+TARGET_CC_VERSION = $(shell $(TARGET_CC) --version | head -n 1 | perl -pe "s/^.+?([\d\.]+)[^ ]+$$/\1/g" )
+
+BOOST_DEPENDENCIES=bzip2
+BOOST_DEPENDENCIES+=zlib
+
+BOOST_FLAGS =
+BOOST_WITHOUT_FLAGS =
+
+ifneq ($(BR2_PACKAGE_BOOST_CHRONO),y)
+BOOST_WITHOUT_FLAGS+=chrono
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_DATE_TIME),y)
+BOOST_WITHOUT_FLAGS+=date_time
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_EXCEPTION),y)
+BOOST_WITHOUT_FLAGS+=exception
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_FILESYSTEM),y)
+BOOST_WITHOUT_FLAGS+=filesystem
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_GRAPH),y)
+BOOST_WITHOUT_FLAGS+=graph
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),y)
+BOOST_WITHOUT_FLAGS+=graph_parallel
+endif
+
+ifeq ($(BR2_PACKAGE_BOOST_ICU),y)
+BOOST_FLAGS+=--with-icu
+BOOST_DEPENDENCIES+=icu
+else
+BOOST_FLAGS+=--without-icu
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_IOSTREAMS),y)
+BOOST_WITHOUT_FLAGS+=iostreams
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_MATH),y)
+BOOST_WITHOUT_FLAGS+=math
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_MPI),y)
+BOOST_WITHOUT_FLAGS+=mpi
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),y)
+BOOST_WITHOUT_FLAGS+=program_options
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_PYTHON),y)
+BOOST_WITHOUT_FLAGS+=python
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_RANDOM),y)
+BOOST_WITHOUT_FLAGS+=random
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_REGEX),y)
+BOOST_WITHOUT_FLAGS+=regex
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_SERIALIZATION),y)
+BOOST_WITHOUT_FLAGS+=serialization
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_SIGNALS),y)
+BOOST_WITHOUT_FLAGS+=signals
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_SYSTEM),y)
+BOOST_WITHOUT_FLAGS+=system
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_TEST),y)
+BOOST_WITHOUT_FLAGS+=test
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_THREAD),y)
+BOOST_WITHOUT_FLAGS+=thread
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_WAVE),y)
+BOOST_WITHOUT_FLAGS+=wave
+endif
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+BOOST_VARIANT=debug
+else
+BOOST_VARIANT=release
+endif
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+BOOST_LINK=static
+else
+BOOST_LINK=shared
+endif
+
+ifeq ($(BR2_PACKAGE_BOOST_MULTITHREADED),y)
+BOOST_MULTI=multi
+else
+BOOST_MULTI=single
+endif
+
+BOOST_WITHOUT_FLAGS_COMMASEPERATED = $(shell echo $(BOOST_WITHOUT_FLAGS) | tr ' ' ',')
+BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPERATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPERATED))
+
+define BOOST_CONFIGURE_CMDS
+	(cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
+	echo "#!/bin/sh" > $(@D)/gcc-wrap
+	echo "$(TARGET_CXX) \$$@" >> $(@D)/gcc-wrap
+	chmod +x $(@D)/gcc-wrap
+	echo "using gcc : $(TARGET_CC_VERSION) : \"$(@D)/gcc-wrap\" : <cxxflags>\"$(TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
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
+
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
+define BOOST_REMOVE_HDRS
+	rm -rf $(TARGET_DIR)/usr/include/boost
+endef
+
+define BOOST_STRIP
+	find $(TARGET_DIR)/usr/lib -name "libboost*" -type f -exec $(STRIPCMD) {} \;
+endef
+
+BOOST_POST_INSTALL_TARGET_HOOKS += BOOST_REMOVE_HDRS
+ifneq ("$(BR2_ENABLE_DEBUG)",y)
+BOOST_POST_INSTALL_TARGET_HOOKS += BOOST_STRIP
+endif
+
+$(eval $(call GENTARGETS,package,boost))
+
-- 
1.7.3.4
