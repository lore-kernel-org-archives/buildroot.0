From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 20 Oct 2013 23:30:05 +0200
Subject: [Buildroot] [PATCH v3 1/1] trace-cmd: use pkg-config instead of
	python-config
Message-ID: <52644B5D.7090704@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


trace-cmd use python-config to find out which headers
and libraries should be used to link against the Python libraries.
By default, python-config returns paths that are inappropriate for
cross-compilation.

This patch replaces python-config with pkg-config as a workaround.

Add PYTHON_VERS to build trace-cmd with python2 or python3

Fixes:
http://autobuild.buildroot.net/results/980/980875810528ac1dee34b8c268d9b3c40b2e35ec/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: Add python3 support

v1: rework python dependency
    add host-swig dependency
    disable python support if python package is not selected

v0: initial review

 ...e-use-pkg-config-instead-of-python-config.patch | 43 ++++++++++++++++++++++
 package/trace-cmd/trace-cmd.mk                     | 13 +++++++
 2 files changed, 56 insertions(+)
 create mode 100644 package/trace-cmd/trace-cmd-0001-Makefile-use-pkg-config-instead-of-python-config.patch

diff --git a/package/trace-cmd/trace-cmd-0001-Makefile-use-pkg-config-instead-of-python-config.patch
b/package/trace-cmd/trace-cmd-0001-Makefile-use-pkg-config-instead-of-python-config.patch
new file mode 100644
index 0000000..e44a4f4
--- /dev/null
+++ b/package/trace-cmd/trace-cmd-0001-Makefile-use-pkg-config-instead-of-python-config.patch
@@ -0,0 +1,43 @@
+
+trace-cmd use python-config to find out which headers
+and libraries should be used to link against the Python libraries.
+By default, python-config returns paths that are inappropriate for
+cross-compilation.
+
+Add PYTHON_VERS to build trace-cmd with python2 or python3
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 83329ca..23b70d8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -80,8 +80,10 @@ ifndef NO_PYTHON
+ PYTHON		:= ctracecmd.so
+ PYTHON_GUI	:= ctracecmd.so ctracecmdgui.so
+
++PYTHON_VERS ?= python
++
+ # Can build python?
+-ifeq ($(shell sh -c "python-config --includes > /dev/null 2>&1 && echo y"), y)
++ifeq ($(shell sh -c "pkg-config --cflags $(PYTHON_VERS) > /dev/null 2>&1 && echo y"), y)
+ 	PYTHON_PLUGINS := plugin_python.so
+ 	BUILD_PYTHON := $(PYTHON) $(PYTHON_PLUGINS)
+ 	PYTHON_SO_INSTALL := ctracecmd.install
+@@ -546,8 +548,8 @@ clean:
+
+ ##### PYTHON STUFF #####
+
+-PYTHON_INCLUDES = `python-config --includes`
+-PYTHON_LDFLAGS = `python-config --ldflags` \
++PYTHON_INCLUDES = `pkg-config --cflags $(PYTHON_VERS)`
++PYTHON_LDFLAGS = `pkg-config --libs $(PYTHON_VERS)` \
+ 		$(shell python -c "import distutils.sysconfig; print distutils.sysconfig.get_config_var('LINKFORSHARED')")
+ PYGTK_CFLAGS = `pkg-config --cflags pygtk-2.0`
+
+--
+1.8.4
+
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 7a750f9..c248bfc 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -11,6 +11,18 @@ TRACE_CMD_INSTALL_STAGING = YES
 TRACE_CMD_LICENSE = GPLv2 LGPLv2.1
 TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB

+TRACE_CMD_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+TRACE_CMD_DEPENDENCIES += python host-swig
+TRACE_CMD_MAKE_OPTS = PYTHON_LIB=python
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+TRACE_CMD_DEPENDENCIES += python3 host-swig
+TRACE_CMD_MAKE_OPTS = PYTHON_LIB=python3
+else
+TRACE_CMD_MAKE_OPTS += NO_PYTHON=1
+endif
+
 # trace-cmd already defines _LARGEFILE64_SOURCE when necessary,
 # redefining it on the command line causes build problems.
 TRACE_CMD_CFLAGS=$(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS)) -D_GNU_SOURCE
@@ -18,6 +30,7 @@ TRACE_CMD_CFLAGS=$(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS)) -D_GNU_SOU
 define TRACE_CMD_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TRACE_CMD_CFLAGS)" \
+		$(TRACE_CMD_MAKE_OPTS) \
 		-C $(@D) all
 endef

-- 
1.8.4
