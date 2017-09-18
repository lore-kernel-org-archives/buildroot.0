From: Erik Tideman <erik.tideman@faltcom.se>
Date: Mon, 18 Sep 2017 12:35:18 +0200
Subject: [Buildroot] [PATCH] flatbuffers: new package
Message-ID: <1505730918-17857-1-git-send-email-erik.tideman@faltcom.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 DEVELOPERS                           |  3 +++
 package/Config.in                    |  1 +
 package/flatbuffers/Config.in        | 13 +++++++++++++
 package/flatbuffers/flatbuffers.hash |  2 ++
 package/flatbuffers/flatbuffers.mk   | 23 +++++++++++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 package/flatbuffers/Config.in
 create mode 100644 package/flatbuffers/flatbuffers.hash
 create mode 100644 package/flatbuffers/flatbuffers.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 21eafc9..bfac488 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -533,6 +533,9 @@ F:	package/xdotool/
 N:	Erik Stromdahl <erik.stromdahl@gmail.com>
 F:	package/mxsldr/
 
+N:	Erik Tideman <erik.tideman@faltcom.se>
+F:	package/flatbuffers/
+
 N:	Ernesto L. Williams Jr <realcontrols@gmail.com>
 F:	package/szip/
 
diff --git a/package/Config.in b/package/Config.in
index 48d1381..991a565 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1412,6 +1412,7 @@ menu "Other"
 	source "package/elfutils/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
+	source "package/flatbuffers/Config.in"
 	source "package/gflags/Config.in"
 	source "package/glibmm/Config.in"
 	source "package/glm/Config.in"
diff --git a/package/flatbuffers/Config.in b/package/flatbuffers/Config.in
new file mode 100644
index 0000000..b3a9941
--- /dev/null
+++ b/package/flatbuffers/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_FLATBUFFERS
+	bool "flatbuffers"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  FlatBuffers is an efficient cross platform serialization
+	  library for C++, C#, C, Go, Java, JavaScript, PHP, and
+	  Python. It was originally created at Google for game
+	  development and other performance-critical applications.
+	  It is available as Open Source on GitHub under the Apache
+	  license, v2 (see LICENSE.txt).
+
+	  https://google.github.io/flatbuffers/index.html
diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
new file mode 100644
index 0000000..15deeb7
--- /dev/null
+++ b/package/flatbuffers/flatbuffers.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 0f8dcdcfbbaba034756f97e4f9946a3784399b578f1b60c8deee3c85fafa3089  flatbuffers-v1.7.1.tar.gz
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
new file mode 100644
index 0000000..7e3eb36
--- /dev/null
+++ b/package/flatbuffers/flatbuffers.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# flatbuffers
+#
+################################################################################
+
+FLATBUFFERS_VERSION = v1.7.1
+FLATBUFFERS_SITE = $(call github,google,flatbuffers,$(FLATBUFFERS_VERSION))
+FLATBUFFERS_LICENSE = Apache-2.0
+FLATBUFFERS_LICENSE_FILES = COPYING
+FLATBUFFERS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_STATIC_LIBS),y)
+FLATBUFFERS_CONF_OPTS += -DFLATBUFFERS_BUILD_SHAREDLIB=OFF
+else
+FLATBUFFERS_CONF_OPTS += -DFLATBUFFERS_BUILD_SHAREDLIB=TRUE
+endif
+
+FLATBUFFERS_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="-std=c++11" \
+	-DFLATBUFFERS_BUILD_TESTS=FALSE
+
+$(eval $(cmake-package))
-- 
2.7.4
