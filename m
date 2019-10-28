From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon, 28 Oct 2019 13:36:33 -0300
Subject: [Buildroot] [PATCH] package/gtest: bump to version 1.10.0
Message-ID: <20191028163633.6688-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Drop custom gtest.pc and gmock.pc, already provided.

Add a post-install-staging hook to install the gmock-config script.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/gtest/gmock.pc   | 11 ----------
 package/gtest/gtest.hash |  2 +-
 package/gtest/gtest.mk   | 44 +++++++++++++++++++++++-----------------
 package/gtest/gtest.pc   | 11 ----------
 4 files changed, 26 insertions(+), 42 deletions(-)
 delete mode 100644 package/gtest/gmock.pc
 delete mode 100644 package/gtest/gtest.pc

diff --git a/package/gtest/gmock.pc b/package/gtest/gmock.pc
deleted file mode 100644
index 4c723542af..0000000000
--- a/package/gtest/gmock.pc
+++ /dev/null
@@ -1,11 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${prefix}/lib/
-includedir=${prefix}/include
-
-Name: gmock
-Description: Google C++ Mocking Framework
-Version: 1.8.0
-Libs: -L${libdir} -lgmock
-Libs.private: -lpthread
-Cflags: -I${includedir}
diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index aa42570eb2..082c597780 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8	gtest-1.8.0.tar.gz
+sha256	9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb	gtest-1.10.0.tar.gz
 sha256	9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138	googletest/LICENSE
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index f26098bad7..7f967b8bfb 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GTEST_VERSION = 1.8.0
+GTEST_VERSION = 1.10.0
 GTEST_SITE = $(call github,google,googletest,release-$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
@@ -46,17 +46,9 @@ endif
 
 GTEST_CONF_OPTS += -DBUILD_GTEST=ON
 
-ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
-GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
-else
-GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
-endif
-
-define GTEST_INSTALL_MISSING_FILES
-	$(INSTALL) -D -m 0644 package/gtest/gtest.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/gtest.pc
-	# Generate the gtest-config script manually, since the CMake
-	# build system is not doing it.
+# Generate the gtest-config script manually, since the CMake build system is
+# not doing it.
+define GTEST_INSTALL_GTEST_CONFIG
 	sed 's%@PACKAGE_TARNAME@%gtest%;\
 		s%@PACKAGE_VERSION@%$(GTEST_VERSION)%;\
 		s%@prefix@%$(STAGING_DIR)/usr%;\
@@ -70,16 +62,30 @@ define GTEST_INSTALL_MISSING_FILES
 		> $(STAGING_DIR)/usr/bin/gtest-config
 	chmod +x $(STAGING_DIR)/usr/bin/gtest-config
 endef
-
-GTEST_POST_INSTALL_STAGING_HOOKS = GTEST_INSTALL_MISSING_FILES
+GTEST_POST_INSTALL_STAGING_HOOKS = GTEST_INSTALL_GTEST_CONFIG
 
 ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
-define GTEST_GMOCK_INSTALL_MISSING_FILE
-	$(INSTALL) -D -m 0644 package/gtest/gmock.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/gmock.pc
-endef
+GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
 
-GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_GMOCK_INSTALL_MISSING_FILE
+# Generate the gmock-config script manually, since the CMake build system is
+# not doing it.
+define GTEST_INSTALL_GMOCK_CONFIG
+	sed 's%@PACKAGE_TARNAME@%gmock%;\
+		s%@PACKAGE_VERSION@%$(GTEST_VERSION)%;\
+		s%@prefix@%$(STAGING_DIR)/usr%;\
+		s%@exec_prefix@%$(STAGING_DIR)/usr%;\
+		s%@libdir@%$(STAGING_DIR)/usr/lib%;\
+		s%@includedir@%$(STAGING_DIR)/usr/include%;\
+		s%@bindir@%$(STAGING_DIR)/usr/bin%;\
+		s%@PTHREAD_CFLAGS@%%;\
+		s%@PTHREAD_LIBS@%-lpthread%;' \
+		$(@D)/googlemock/scripts/gmock-config.in \
+		> $(STAGING_DIR)/usr/bin/gmock-config
+	chmod +x $(STAGING_DIR)/usr/bin/gmock-config
+endef
+GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_INSTALL_GMOCK_CONFIG
+else
+GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
 endif
 
 define HOST_GTEST_INSTALL_CMDS
diff --git a/package/gtest/gtest.pc b/package/gtest/gtest.pc
deleted file mode 100644
index 594e79d7c5..0000000000
--- a/package/gtest/gtest.pc
+++ /dev/null
@@ -1,11 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${prefix}/lib/
-includedir=${prefix}/include
-
-Name: gtest
-Description: Google C++ Testing Framework
-Version: 1.8.0
-Libs: -L${libdir} -lgtest
-Libs.private: -lpthread
-Cflags: -I${includedir}
-- 
2.18.1
