From: RJ Ascani <rj.ascani@gmail.com>
Date: Fri, 28 Jul 2017 11:04:59 -0700
Subject: [Buildroot] [PATCH v2] azmq: Add new package
In-Reply-To: <20170721191140.29980-1-rj.ascani@gmail.com>
References: <20170721191140.29980-1-rj.ascani@gmail.com>
Message-ID: <20170728180459.32667-1-rj.ascani@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The azmq library provides Boost Asio style bindings for ZeroMQ. This
library is built on top of ZeroMQ's standard C interface and is intended
to work well with C++ applications which use the Boost libraries in
general, and Asio in particular.

Signed-off-by: RJ Ascani <rj.ascani@gmail.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 ...Conditionally-disable-test-and-doc-builds.patch | 43 ++++++++++++++++++++++
 package/azmq/Config.in                             | 28 ++++++++++++++
 package/azmq/azmq.hash                             |  3 ++
 package/azmq/azmq.mk                               | 18 +++++++++
 6 files changed, 96 insertions(+)
 create mode 100644 package/azmq/0001-Conditionally-disable-test-and-doc-builds.patch
 create mode 100644 package/azmq/Config.in
 create mode 100644 package/azmq/azmq.hash
 create mode 100644 package/azmq/azmq.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e01c1bade..51186a630 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1420,6 +1420,9 @@ N:	Rico Bachmann <bachmann@tofwerk.com>
 F:	package/apr-util/
 F:	package/subversion/
 
+N:	RJ Ascani <rj.ascani@gmail.com>
+F:	package/azmq/
+
 N:	Rodrigo Rebello <rprebello@gmail.com>
 F:	package/chocolate-doom/
 F:	package/irssi/
diff --git a/package/Config.in b/package/Config.in
index 484c75327..e6168d776 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1274,6 +1274,7 @@ menu "Networking"
 	source "package/alljoyn-base/Config.in"
 	source "package/alljoyn-tcl/Config.in"
 	source "package/alljoyn-tcl-base/Config.in"
+	source "package/azmq/Config.in"
 	source "package/azure-iot-sdk-c/Config.in"
 	source "package/batman-adv/Config.in"
 	source "package/c-ares/Config.in"
diff --git a/package/azmq/0001-Conditionally-disable-test-and-doc-builds.patch b/package/azmq/0001-Conditionally-disable-test-and-doc-builds.patch
new file mode 100644
index 000000000..98975d27e
--- /dev/null
+++ b/package/azmq/0001-Conditionally-disable-test-and-doc-builds.patch
@@ -0,0 +1,43 @@
+From d960f93fb52e373f76cfedbee5f4fb0c5276856a Mon Sep 17 00:00:00 2001
+From: RJ Ascani <rj.ascani@gmail.com>
+Date: Thu, 20 Jul 2017 15:53:40 -0700
+Subject: [PATCH] Conditionally disable test and doc builds
+
+Signed-off-by: RJ Ascani <rj.ascani@gmail.com>
+---
+ CMakeLists.txt | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5b5b9cc..97006a4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -49,7 +49,9 @@ include_directories(${Boost_INCLUDE_DIRS}
+                     ${ZeroMQ_INCLUDE_DIRS}
+                     ${PROJECT_SOURCE_DIR})
+
+-enable_testing()
++if (BUILD_TESTING)
++    enable_testing()
++endif()
+
+ macro(add_catch_test name)
+     if (TEST_REPORT_FORMAT)
+@@ -59,8 +61,12 @@ macro(add_catch_test name)
+     endif()
+ endmacro()
+
+-add_subdirectory(test)
+-add_subdirectory(doc)
++if (BUILD_TESTING)
++    add_subdirectory(test)
++endif()
++if (BUILD_DOC)
++    add_subdirectory(doc)
++endif()
+
+ install(DIRECTORY ${PROJECT_SOURCE_DIR}/azmq
+         DESTINATION include)
+--
+2.13.3
+
diff --git a/package/azmq/Config.in b/package/azmq/Config.in
new file mode 100644
index 000000000..422a05883
--- /dev/null
+++ b/package/azmq/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_AZMQ
+	bool "azmq"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_USE_WCHAR # boost
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
+	select BR2_PACKAGE_ZEROMQ
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_LOG
+	select BR2_PACKAGE_BOOST_RANDOM
+	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
+	help
+	  This library provides Boost Asio style bindings for ZeroMQ.
+
+	  https://github.com/zeromq/azmq
+
+comment "azmq needs a toolchain w/ C++11, wchar and threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+
+comment "azmq needs exception_ptr"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/azmq/azmq.hash b/package/azmq/azmq.hash
new file mode 100644
index 000000000..d3993f498
--- /dev/null
+++ b/package/azmq/azmq.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+# https://github.com/zeromq/azmq/archive/v1.0.tar.gz
+sha256 c204c731bcb7810ca3a2c5515e88974ef2ff8d0589e60a897dc238b369180e7b  azmq-v1.0.tar.gz
diff --git a/package/azmq/azmq.mk b/package/azmq/azmq.mk
new file mode 100644
index 000000000..427ad0f5b
--- /dev/null
+++ b/package/azmq/azmq.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# azmq
+#
+################################################################################
+
+AZMQ_VERSION = v1.0
+AZMQ_SITE = $(call github,zeromq,azmq,$(AZMQ_VERSION))
+AZMQ_DEPENDENCIES = boost zeromq
+AZMQ_LICENSE = BSL-1.0
+AZMQ_LICENSE_FILES = LICENSE-BOOST_1_0
+
+# AZMQ is a header only library, so it does not need to be installed on the
+# target.
+AZMQ_INSTALL_STAGING = YES
+AZMQ_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.13.3
