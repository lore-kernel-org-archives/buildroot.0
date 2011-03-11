From: Chih-Min Chao <cmchao@gmail.com>
Date: Fri, 11 Mar 2011 16:13:35 +0800
Subject: [Buildroot] [PATCH 9/9] boost : new package
In-Reply-To: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
References: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
Message-ID: <1299831215-26466-9-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/Config.in       |    1 +
 package/boost/Config.in |   81 +++++++++++++++++++++++++++++++++
 package/boost/boost.mk  |  113 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 195 insertions(+), 0 deletions(-)
 create mode 100644 package/boost/Config.in
 create mode 100644 package/boost/boost.mk

diff --git a/package/Config.in b/package/Config.in
index eefcde8..91a8aa3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -324,6 +324,7 @@ endmenu
 
 menu "Other"
 source "package/argp-standalone/Config.in"
+source "package/boost/Config.in"
 source "package/libatomic_ops/Config.in"
 source "package/libcap/Config.in"
 source "package/libdaemon/Config.in"
diff --git a/package/boost/Config.in b/package/boost/Config.in
new file mode 100644
index 0000000..c0e3b7b
--- /dev/null
+++ b/package/boost/Config.in
@@ -0,0 +1,81 @@
+config BR2_PACKAGE_BOOST
+	bool "boost"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  A well-knownd C++ library
+	  http://www.boost.org
+
+if BR2_PACKAGE_BOOST
+
+config BR2_PACKAGE_BOOST_DATETIME
+	bool "enable date_time library"
+	default n
+
+config BR2_PACKAGE_BOOST_FILESYSTEM
+	bool "enable filesystem library"
+	default n
+
+config BR2_PACKAGE_BOOST_GRAPH
+	bool "enable graph library"
+	default n
+
+config BR2_PACKAGE_BOOST_GRAPH_PARALLEL
+	bool "enable graph_parallel library"
+	default n
+
+config BR2_PACKAGE_BOOST_IOSTREAMS
+	bool "enable iostreams library"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_BZIP2
+	default n
+
+config BR2_PACKAGE_BOOST_MATH
+	bool "enable math library"
+	default n
+
+config BR2_PACKAGE_BOOST_MPI
+	bool "enable mpi library"
+	default n
+
+config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	bool "enable program_options library"
+	default n
+
+config BR2_PACKAGE_BOOST_PYTHON
+	bool "enable python library"
+	select BR2_PACKAGE_PYTHON
+	default n
+
+config BR2_PACKAGE_BOOST_RANDOM
+	bool "enable random library"
+	default n
+
+config BR2_PACKAGE_BOOST_REGEX
+	bool "enable regex library"
+	default n
+
+config BR2_PACKAGE_BOOST_SERIALIZATION
+	bool "enable serialization library"
+	default n
+
+config BR2_PACKAGE_BOOST_SIGNALS
+	bool "enable signals library"
+	default n
+
+config BR2_PACKAGE_BOOST_SYSTEM
+	bool "enable system library"
+	default n
+
+config BR2_PACKAGE_BOOST_TEST
+	bool "enable test library"
+	default n
+
+config BR2_PACKAGE_BOOST_THREAD
+	bool "enable thread library"
+	default n
+
+config BR2_PACKAGE_BOOST_WAVE
+	bool "enable wave library"
+	default n
+
+endif #BR2_PACKAGE_BOOST
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
new file mode 100644
index 0000000..7186010
--- /dev/null
+++ b/package/boost/boost.mk
@@ -0,0 +1,113 @@
+#############################################################
+#
+# bzip2
+#
+#############################################################
+BOOST_VERSION:=1_46_0
+BOOST_VERSION2:=1.46.0
+BOOST_SOURCE:=boost_$(BOOST_VERSION).tar.bz2
+BOOST_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/boost/
+#BOOST_INSTALL_STAGING=YES
+
+ifneq ($(BR2_PACKAGE_BOOST_DATETIME),y)
+BOOST_LIB_CONF += --without-date_time
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_FILESYSTEM),y)
+BOOST_LIB_CONF += --without-filesystem
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_GRAPH),y)
+BOOST_LIB_CONF += --without-graph
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),y)
+BOOST_LIB_CONF += --without-graph_parallel
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_IOSTREAMS),y)
+BOOST_LIB_CONF += --without-iostreams
+else
+BOOST_DEPENDENCIES += zlib bzip2
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_MATH),y)
+BOOST_LIB_CONF += --without-math
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_MPI),y)
+BOOST_LIB_CONF += --without-mpi
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),y)
+BOOST_LIB_CONF += --without-program_options
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_PYTHON),y)
+BOOST_LIB_CONF += --without-python
+else
+BOOST_DEPENDENCIES += python
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_RANDOM),y)
+BOOST_LIB_CONF += --without-random
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_REGEX),y)
+BOOST_LIB_CONF += --without-regex
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_SERIALIZATION),y)
+BOOST_LIB_CONF += --without-serialization
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_SIGNALS),y)
+BOOST_LIB_CONF += --without-signals
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_SYSTEM),y)
+BOOST_LIB_CONF += --without-system
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_TEST),y)
+BOOST_LIB_CONF += --without-test
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_THREAD),y)
+BOOST_LIB_CONF += --without-thread
+endif
+
+ifneq ($(BR2_PACKAGE_BOOST_WAVE),y)
+BOOST_LIB_CONF += --without-wave
+endif
+
+define BOOST_BUILD_CMDS
+	(cd $(@D);\
+		./bootstrap.sh \
+	)
+	$(SED) "s,using gcc,using gcc : $(ARCH) : $(TARGET_CXX),g" $(@D)/project-config.jam
+	$(SED) "s,using python : 2.6 : /usr,using python : $(PYTHON_VERSION_MAJOR) \
+			: $(STAGING_DIR)/usr,g" $(@D)/project-config.jam
+	(cd $(@D); \
+		./bjam $(BOOST_LIB_CONF);\
+	)
+endef
+
+define BOOST_INSTALL_STAGING_CMDS
+	./bjam install --prefix=$(STAGING_DIR)/usr --layout=system
+endef
+
+define BOOST_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		./bjam install --prefix=$(TARGET_DIR)/usr --layout=system $(BOOST_LIB_CONF) ;\
+	)
+endef
+
+define BOOST_CLEAN_CMDS
+	rm -f $(TARGET_DIR)/lib/boost*
+	rm -f $(STAGING_DIR)/lib/boost*
+	rm -f $(TARGET_DIR)/include/boost
+	rm -f $(STAGING_DIR)/include/boost
+endef
+
+$(eval $(call GENTARGETS,package,boost))
-- 
1.7.0.4
