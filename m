From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Oct 2013 11:15:10 -0300
Subject: [Buildroot] [PATCH 2/3] boost: add host variant
In-Reply-To: <1381760111-1271-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381760111-1271-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381760111-1271-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/boost/boost.mk | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index a745ce1..8f2c2db 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -11,11 +11,19 @@ BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSIO
 BOOST_INSTALL_STAGING = YES
 
 TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion)
+HOST_CC_VERSION = $(shell $(HOSTCC) -dumpversion)
 
 BOOST_DEPENDENCIES =
 
 BOOST_FLAGS =
 
+# keep host variant as minimal as possible
+HOST_BOOST_FLAGS = --without-icu \
+	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
+	coroutine date_time exception filesystem graph graph_parallel \
+	iostreams locale log math mpi program_options python random regex \
+	serialization signals system test thread timer wave)
+
 # atomic library compile only with upstream version, wait for next release
 BOOST_WITHOUT_FLAGS = python atomic
 
@@ -52,6 +60,9 @@ ifeq ($(BR2_PACKAGE_BOOST_IOSTREAMS),y)
 BOOST_DEPENDENCIES += bzip2 zlib
 endif
 
+HOST_BOOST_OPT += toolset=gcc threading=multi variant=release link=shared \
+	runtime-link=shared
+
 BOOST_OPT += toolset=gcc \
 	     threading=multi \
 	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
@@ -76,6 +87,12 @@ define BOOST_CONFIGURE_CMDS
 	echo "" >> $(@D)/user-config.jam
 endef
 
+define HOST_BOOST_CONFIGURE_CMDS
+	(cd $(@D) && ./bootstrap.sh $(HOST_BOOST_FLAGS))
+	echo "using gcc : $(HOST_CC_VERSION) : $(HOSTCXX) : <cxxflags>\"$(HOST_CXXFLAGS)\" <linkflags>\"$(HOST_LDFLAGS)\" ;" > $(@D)/user-config.jam
+	echo "" >> $(@D)/user-config.jam
+endef
+
 define BOOST_INSTALL_TARGET_CMDS
 	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
 	--user-config=$(@D)/user-config.jam \
@@ -84,6 +101,21 @@ define BOOST_INSTALL_TARGET_CMDS
 	--layout=system install )
 endef
 
+define HOST_BOOST_BUILD_CMDS
+	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
+	--user-config=$(@D)/user-config.jam \
+	$(HOST_BOOST_OPT) \
+	--prefix=$(HOST_DIR)/usr )
+endef
+
+define HOST_BOOST_INSTALL_CMDS
+	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
+	--user-config=$(@D)/user-config.jam \
+	$(HOST_BOOST_OPT) \
+	--prefix=$(HOST_DIR)/usr \
+	--layout=system install )
+endef
+
 define BOOST_INSTALL_STAGING_CMDS
 	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -d+1 \
 	--user-config=$(@D)/user-config.jam \
@@ -93,3 +125,4 @@ define BOOST_INSTALL_STAGING_CMDS
 endef
 
 $(eval $(generic-package))
+$(eval $(host-autotools-package))
-- 
1.8.1.5
