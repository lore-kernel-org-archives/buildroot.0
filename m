From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 22:41:37 +0100
Subject: [Buildroot] [git commit] flatbuffers: new package
Message-ID: <20180115215235.4A2D0839C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f32fa207bd4a1cdb91e35550e4f96b4f556ce7cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FlatBuffers is an efficient cross platform serialization
library for C++, C#, C, Go, Java, JavaScript, PHP, and
Python. It was originally created at Google for game
development and other performance-critical applications.

http://google.github.io/flatbuffers/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/flatbuffers/Config.in        | 14 ++++++++++++++
 package/flatbuffers/flatbuffers.hash |  3 +++
 package/flatbuffers/flatbuffers.mk   | 23 +++++++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c77763..5589e85 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -622,6 +622,7 @@ F:	package/alljoyn-base/
 F:	package/alljoyn-tcl/
 F:	package/alljoyn-tcl-base/
 F:	package/boinc/
+F:	package/flatbuffers/
 F:	package/gtksourceview/
 F:	package/gssdp/
 F:	package/gupnp/
diff --git a/package/Config.in b/package/Config.in
index 9625dae..c3a2e38 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1458,6 +1458,7 @@ menu "Other"
 	source "package/elfutils/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
+	source "package/flatbuffers/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gflags/Config.in"
 	source "package/glibmm/Config.in"
diff --git a/package/flatbuffers/Config.in b/package/flatbuffers/Config.in
new file mode 100644
index 0000000..9927382
--- /dev/null
+++ b/package/flatbuffers/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_FLATBUFFERS
+	bool "flatbuffers"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  FlatBuffers is an efficient cross platform serialization
+	  library for C++, C#, C, Go, Java, JavaScript, PHP, and
+	  Python. It was originally created at Google for game
+	  development and other performance-critical applications.
+
+	  http://google.github.io/flatbuffers/
+
+comment "flatbuffers needs a toolchain w/ C++, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
new file mode 100644
index 0000000..bd39ca3
--- /dev/null
+++ b/package/flatbuffers/flatbuffers.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	c45029c0a0f1a88d416af143e34de96b3091642722aa2d8c090916c6d1498c2e	flatbuffers-v1.8.0.tar.gz
+sha256	7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3	LICENSE.txt
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
new file mode 100644
index 0000000..2b640ec
--- /dev/null
+++ b/package/flatbuffers/flatbuffers.mk
@@ -0,0 +1,23 @@
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
+FLATBUFFERS_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="-std=c++11" \
+	-DFLATBUFFERS_BUILD_TESTS=OFF
+
+ifeq ($(BR2_STATIC_LIBS),y)
+FLATBUFFERS_CONF_OPTS += -DFLATBUFFERS_BUILD_SHAREDLIB=OFF
+else
+FLATBUFFERS_CONF_OPTS += -DFLATBUFFERS_BUILD_SHAREDLIB=ON
+endif
+
+$(eval $(cmake-package))
