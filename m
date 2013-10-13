From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 14 Oct 2013 00:26:54 +0200
Subject: [Buildroot] [PATCH 1/1] trace-cmd: use pkg-config instead of
	python-config
Message-ID: <525B1E2E.2040209@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Add missing python dependency.
Makefile use host's python-config, which seems breaks powerpc and arm build.
Replaces python-config with pkg-config.
Add pkg-config as dependency.

Fixes:
http://autobuild.buildroot.net/results/980/980875810528ac1dee34b8c268d9b3c40b2e35ec/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
Note: Makefile use swig which is not available in buildroot.

 package/trace-cmd/Config.in                        |  2 ++
 ...e-use-pkg-config-instead-of-python-config.patch | 34 ++++++++++++++++++++++
 package/trace-cmd/trace-cmd.mk                     |  2 ++
 3 files changed, 38 insertions(+)
 create mode 100644 package/trace-cmd/trace-cmd-0001-Makefile-use-pkg-config-instead-of-python-config.patch

diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
index 8d79304..96ed63a 100644
--- a/package/trace-cmd/Config.in
+++ b/package/trace-cmd/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_TRACE_CMD
 	bool "trace-cmd"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PKG_CONFIG
 	help
 	  Command line reader for ftrace.

diff --git a/package/trace-cmd/trace-cmd-0001-Makefile-use-pkg-config-instead-of-python-config.patch
b/package/trace-cmd/trace-cmd-0001-Makefile-use-pkg-config-instead-of-python-config.patch
new file mode 100644
index 0000000..a1f8c4b
--- /dev/null
+++ b/package/trace-cmd/trace-cmd-0001-Makefile-use-pkg-config-instead-of-python-config.patch
@@ -0,0 +1,34 @@
+Makefile: use pkg-config instead of python-config
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 83329ca..5605fbf 100644
+--- a/Makefile
++++ b/Makefile
+@@ -81,7 +81,7 @@ PYTHON		:= ctracecmd.so
+ PYTHON_GUI	:= ctracecmd.so ctracecmdgui.so
+
+ # Can build python?
+-ifeq ($(shell sh -c "python-config --includes > /dev/null 2>&1 && echo y"), y)
++ifeq ($(shell sh -c "pkg-config --cflags python > /dev/null 2>&1 && echo y"), y)
+ 	PYTHON_PLUGINS := plugin_python.so
+ 	BUILD_PYTHON := $(PYTHON) $(PYTHON_PLUGINS)
+ 	PYTHON_SO_INSTALL := ctracecmd.install
+@@ -546,8 +546,8 @@ clean:
+
+ ##### PYTHON STUFF #####
+
+-PYTHON_INCLUDES = `python-config --includes`
+-PYTHON_LDFLAGS = `python-config --ldflags` \
++PYTHON_INCLUDES = `pkg-config --cflags python`
++PYTHON_LDFLAGS = `pkg-config --libs python` \
+ 		$(shell python -c "import distutils.sysconfig; print distutils.sysconfig.get_config_var('LINKFORSHARED')")
+ PYGTK_CFLAGS = `pkg-config --cflags pygtk-2.0`
+
+--
+1.8.4
+
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 7a750f9..cd6ba20 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -11,6 +11,8 @@ TRACE_CMD_INSTALL_STAGING = YES
 TRACE_CMD_LICENSE = GPLv2 LGPLv2.1
 TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB

+TRACE_CMD_DEPENDENCIES = python pkg-config
+
 # trace-cmd already defines _LARGEFILE64_SOURCE when necessary,
 # redefining it on the command line causes build problems.
 TRACE_CMD_CFLAGS=$(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS)) -D_GNU_SOURCE
-- 
1.8.4
