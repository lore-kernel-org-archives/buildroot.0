From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 15 Oct 2013 10:21:45 +0200 (CEST)
Subject: [Buildroot] [PATCH v2 1/1] trace-cmd: use pkg-config instead of
	python-config
In-Reply-To: <525C72AC.4060404@openwide.fr>
Message-ID: <32744150.8838116.1381825305257.JavaMail.root@openwide.fr>
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

Fixes:
http://autobuild.buildroot.net/results/980/980875810528ac1dee34b8c268d9b3c40b2e35ec/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
Note: I'll add python3 support latter.

v1: rework python dependency
    add host-swig dependency
    disable python support if python package is not selected

v0: initial review

 ...e-use-pkg-config-instead-of-python-config.patch | 34 ++++++++++++++++++++++
 package/trace-cmd/trace-cmd.mk                     |  9 ++++++
 2 files changed, 43 insertions(+)
 create mode 100644 package/trace-cmd/trace-cmd-0001-Makefile-use-pkg-config-instead-of-python-config.patch

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
index 7a750f9..dbb2c7f 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -11,6 +11,14 @@ TRACE_CMD_INSTALL_STAGING = YES
 TRACE_CMD_LICENSE = GPLv2 LGPLv2.1
 TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB

+TRACE_CMD_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+TRACE_CMD_DEPENDENCIES += python host-swig
+else
+TRACE_CMD_MAKE_OPTS += NO_PYTHON=1
+endif
+
 # trace-cmd already defines _LARGEFILE64_SOURCE when necessary,
 # redefining it on the command line causes build problems.
 TRACE_CMD_CFLAGS=$(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS)) -D_GNU_SOURCE
@@ -18,6 +26,7 @@ TRACE_CMD_CFLAGS=$(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS)) -D_GNU_SOU
 define TRACE_CMD_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TRACE_CMD_CFLAGS)" \
+		$(TRACE_CMD_MAKE_OPTS) \
 		-C $(@D) all
 endef

-- 
1.8.4
