From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Sep 2013 23:20:47 +0200
Subject: [Buildroot] [PATCH 4/4] trace-cmd: improve Python support
In-Reply-To: <1380576047-21001-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1380576047-21001-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1380576047-21001-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unless NO_PYTHON is defined, the trace-cmd build system calls the host
python and tries to use it, causing build failures. So we now pass
NO_PYTHON properly when Python is not available for the target.

Fixes:

  http://autobuild.buildroot.net/results/1c4567a230940a5287d03e2a5c2c7afbdc64cd36/build-end.log

We also fix the trace-cmd build to properly link against the target
Python library, when Python is enabled for the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../trace-cmd-0001-support-for-python-config.patch | 48 ++++++++++++++++++++++
 package/trace-cmd/trace-cmd.mk                     | 13 ++++++
 2 files changed, 61 insertions(+)
 create mode 100644 package/trace-cmd/trace-cmd-0001-support-for-python-config.patch

diff --git a/package/trace-cmd/trace-cmd-0001-support-for-python-config.patch b/package/trace-cmd/trace-cmd-0001-support-for-python-config.patch
new file mode 100644
index 0000000..dc9d1d2
--- /dev/null
+++ b/package/trace-cmd/trace-cmd-0001-support-for-python-config.patch
@@ -0,0 +1,48 @@
+From 1fb959ec7c2e7f1d663db3125f190ead2f3be91c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 23 Sep 2013 17:55:00 +0200
+Subject: [PATCH] Support for PYTHON_CONFIG
+
+This patch adds support for a PYTHON_CONFIG variable, which can be
+overriden from the make command line. In cross-compilation cases, it
+allows to override which python-config program should be used to find
+the Python headers and libraries.
+
+We also remove the flags added from the distutils LINKFORSHARED
+variable, as they come from the host build, and are anyway already
+provided by the python-config --ldflags option.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 83329ca..5c5c71b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -81,7 +81,8 @@ PYTHON		:= ctracecmd.so
+ PYTHON_GUI	:= ctracecmd.so ctracecmdgui.so
+ 
+ # Can build python?
+-ifeq ($(shell sh -c "python-config --includes > /dev/null 2>&1 && echo y"), y)
++PYTHON_CONFIG = python-config
++ifeq ($(shell sh -c "$(PYTHON_CONFIG) --includes > /dev/null 2>&1 && echo y"), y)
+ 	PYTHON_PLUGINS := plugin_python.so
+ 	BUILD_PYTHON := $(PYTHON) $(PYTHON_PLUGINS)
+ 	PYTHON_SO_INSTALL := ctracecmd.install
+@@ -546,9 +547,8 @@ clean:
+ 
+ ##### PYTHON STUFF #####
+ 
+-PYTHON_INCLUDES = `python-config --includes`
+-PYTHON_LDFLAGS = `python-config --ldflags` \
+-		$(shell python -c "import distutils.sysconfig; print distutils.sysconfig.get_config_var('LINKFORSHARED')")
++PYTHON_INCLUDES = `$(PYTHON_CONFIG) --includes`
++PYTHON_LDFLAGS = `$(PYTHON_CONFIG) --ldflags`
+ PYGTK_CFLAGS = `pkg-config --cflags pygtk-2.0`
+ 
+ ctracecmd.so: $(TCMD_LIB_OBJS) ctracecmd.i
+-- 
+1.8.1.2
+
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 7a750f9..191eb6d 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -15,9 +15,22 @@ TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB
 # redefining it on the command line causes build problems.
 TRACE_CMD_CFLAGS=$(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS)) -D_GNU_SOURCE
 
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),)
+TRACE_CMD_MAKE_OPTS += NO_PYTHON=1
+else ifeq ($(BR2_PACKAGE_PYTHON),y)
+TRACE_CMD_DEPENDENCIES += python host-swig
+TRACE_CMD_MAKE_OPTS += \
+	PYTHON_CONFIG=$(STAGING_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)-config
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+TRACE_CMD_DEPENDENCIES += python3 host-swig
+TRACE_CMD_MAKE_OPTS += \
+	PYTHON_CONFIG=$(STAGING_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
+endif
+
 define TRACE_CMD_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TRACE_CMD_CFLAGS)" \
+		$(TRACE_CMD_MAKE_OPTS) \
 		-C $(@D) all
 endef
 
-- 
1.8.1.2
