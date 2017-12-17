From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Dec 2017 19:12:31 +0100
Subject: [Buildroot] [PATCH 1/1] flatbuffers: new package
Message-ID: <20171217181231.13634-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FlatBuffers is an efficient cross platform serialization
library for C++, C#, C, Go, Java, JavaScript, PHP, and
Python. It was originally created at Google for game
development and other performance-critical applications.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/flatbuffers/Config.in        |  9 +++++++++
 package/flatbuffers/flatbuffers.hash |  3 +++
 package/flatbuffers/flatbuffers.mk   | 21 +++++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/flatbuffers/Config.in
 create mode 100644 package/flatbuffers/flatbuffers.hash
 create mode 100644 package/flatbuffers/flatbuffers.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e3f464aba6..ce48b117a3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -620,6 +620,7 @@ F:	package/alljoyn-tcl/
 F:	package/alljoyn-tcl-base/
 F:	package/boinc/
 F:	package/duktape/
+F:	package/flatbuffers/
 F:	package/gtksourceview/
 F:	package/gssdp/
 F:	package/gupnp/
diff --git a/package/Config.in b/package/Config.in
index f86ce9f27c..cae1624cb1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1453,6 +1453,7 @@ menu "Other"
 	source "package/elfutils/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
+	source "package/flatbuffers/Config.in"
 	source "package/gflags/Config.in"
 	source "package/glibmm/Config.in"
 	source "package/glm/Config.in"
diff --git a/package/flatbuffers/Config.in b/package/flatbuffers/Config.in
new file mode 100644
index 0000000000..1793a83fae
--- /dev/null
+++ b/package/flatbuffers/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_FLATBUFFERS
+	bool "flatbuffers"
+	help
+	  FlatBuffers is an efficient cross platform serialization
+	  library for C++, C#, C, Go, Java, JavaScript, PHP, and
+	  Python. It was originally created at Google for game
+	  development and other performance-critical applications.
+
+	  http://google.github.io/flatbuffers/
diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
new file mode 100644
index 0000000000..bd39ca385b
--- /dev/null
+++ b/package/flatbuffers/flatbuffers.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	c45029c0a0f1a88d416af143e34de96b3091642722aa2d8c090916c6d1498c2e	flatbuffers-v1.8.0.tar.gz
+sha256	7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3	LICENSE.txt
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
new file mode 100644
index 0000000000..a176bd1f67
--- /dev/null
+++ b/package/flatbuffers/flatbuffers.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# flatbuffers
+#
+################################################################################
+
+FLATBUFFERS_VERSION = v1.8.0
+FLATBUFFERS_SITE = $(call github,google,flatbuffers,$(FLATBUFFERS_VERSION))
+FLATBUFFERS_LICENSE = Apache-2.0
+FLATBUFFERS_LICENSE_FILES = LICENSE.txt
+FLATBUFFERS_INSTALL_STAGING = YES
+
+FLATBUFFERS_CONF_OPTS += -DFLATBUFFERS_BUILD_TESTS=OFF
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+FLATBUFFERS_CONF_OPTS += -DFLATBUFFERS_BUILD_SHAREDLIB=ON
+else
+FLATBUFFERS_CONF_OPTS += -DFLATBUFFERS_BUILD_SHAREDLIB=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.14.1
