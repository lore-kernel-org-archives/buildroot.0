From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 18:44:57 +0200
Subject: [Buildroot] [git commit] package/trace-cmd: bump to version 2.3.2
Message-ID: <20140608164616.682969CF36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4277731ee406bb817c796593644d469c3445a74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The first patch "use-pkg-config-instead-of-python-config" has been applied
upstream.

The flag _GNU_SOURCE is now always defined in Makefile, so it can be removed
from trace-cmd.mk

CPPFLAGS are appended to CFLAGS and are used to add extra flags, but the flag
_LARGEFILE64_SOURCE in TARGET_CPPFLAGS is already defined in source files,
which causes a build error. As for CFLAGS, we fix this by filtering out our
definition of _LARGEFILE64_SOURCE from the CPPFLAGS before passing them to the
trace-cmd Makefile.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...h => trace-cmd-0001-Fix-ptrace-detection.patch} |    0
 ...e-use-pkg-config-instead-of-python-config.patch |   43 --------------------
 package/trace-cmd/trace-cmd.mk                     |   10 ++++-
 3 files changed, 8 insertions(+), 45 deletions(-)

diff --git a/package/trace-cmd/trace-cmd-0002-Fix-ptrace-detection.patch b/package/trace-cmd/trace-cmd-0001-Fix-ptrace-detection.patch
similarity index 100%
rename from package/trace-cmd/trace-cmd-0002-Fix-ptrace-detection.patch
rename to package/trace-cmd/trace-cmd-0001-Fix-ptrace-detection.patch
diff --git a/package/trace-cmd/trace-cmd-0001-Makefile-use-pkg-config-instead-of-python-config.patch b/package/trace-cmd/trace-cmd-0001-Makefile-use-pkg-config-instead-of-python-config.patch
deleted file mode 100644
index 6fed42c..0000000
--- a/package/trace-cmd/trace-cmd-0001-Makefile-use-pkg-config-instead-of-python-config.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-
-trace-cmd use python-config to find out which headers
-and libraries should be used to link against the Python libraries.
-By default, python-config returns paths that are inappropriate for
-cross-compilation.
-
-Add PYTHON_VERS to build trace-cmd with python2 or python3
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Makefile | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 83329ca..23b70d8 100644
---- a/Makefile
-+++ b/Makefile
-@@ -80,8 +80,10 @@ ifndef NO_PYTHON
- PYTHON		:= ctracecmd.so
- PYTHON_GUI	:= ctracecmd.so ctracecmdgui.so
-
-+PYTHON_VERS ?= python
-+
- # Can build python?
--ifeq ($(shell sh -c "python-config --includes > /dev/null 2>&1 && echo y"), y)
-+ifeq ($(shell sh -c "pkg-config --cflags $(PYTHON_VERS) > /dev/null 2>&1 && echo y"), y)
- 	PYTHON_PLUGINS := plugin_python.so
- 	BUILD_PYTHON := $(PYTHON) $(PYTHON_PLUGINS)
- 	PYTHON_SO_INSTALL := ctracecmd.install
-@@ -546,8 +548,8 @@ clean:
-
- ##### PYTHON STUFF #####
-
--PYTHON_INCLUDES = `python-config --includes`
--PYTHON_LDFLAGS = `python-config --ldflags` \
-+PYTHON_INCLUDES = `pkg-config --cflags $(PYTHON_VERS)`
-+PYTHON_LDFLAGS = `pkg-config --libs $(PYTHON_VERS)` \
- 		$(shell python -c "import distutils.sysconfig; print distutils.sysconfig.get_config_var('LINKFORSHARED')")
- PYGTK_CFLAGS = `pkg-config --cflags pygtk-2.0`
-
---
-1.8.4
-
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 9a1ba71..02836ce 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = trace-cmd-v2.2.1
+TRACE_CMD_VERSION = trace-cmd-v2.3.2
 TRACE_CMD_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/rostedt/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_INSTALL_STAGING = YES
@@ -25,11 +25,17 @@ endif
 
 # trace-cmd already defines _LARGEFILE64_SOURCE when necessary,
 # redefining it on the command line causes build problems.
-TRACE_CMD_CFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS)) -D_GNU_SOURCE
+TRACE_CMD_CFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
+
+# trace-cmd use CPPFLAGS to add some extra flags.
+# But like for CFLAGS, $(TARGET_CPPFLAGS) contains _LARGEFILE64_SOURCE
+# that causes build problems.
+TRACE_CMD_CPPFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CPPFLAGS))
 
 define TRACE_CMD_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TRACE_CMD_CFLAGS)" \
+		CPPFLAGS="$(TRACE_CMD_CPPFLAGS)" \
 		$(TRACE_CMD_MAKE_OPTS) \
 		-C $(@D) all
 endef
