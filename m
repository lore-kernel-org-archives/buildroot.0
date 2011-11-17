From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 17 Nov 2011 20:42:04 +0100
Subject: [Buildroot] [PATCH 5 of 5 v2] python: allow reduced installation
In-Reply-To: <patchbomb.1321557989@devws108>
References: <patchbomb.1321557989@devws108>
Message-ID: <3fb04c960d0e58ea5bb1.1321557994@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

# HG changeset patch
# User Thomas De Schampheleire <thomas.de_schampheleire@alcatel-lucent.com>
# Date 1318517171 -7200
# Node ID 3fb04c960d0e58ea5bb10ecbed382fc1c41c39eb
# Parent  97f99d539f586caa866009c9702596c63f3637fe
python: allow reduced installation

A default python installation takes more than 13M of disk space on target.
The python library takes about 4,5M, and the other 9M is occupied by various
modules in /usr/lib/python2.7. A usable installation doesn't need such a large
module directory. A minimal configuration with only those modules needed to
start an interactive session requires only about 450K, plus the python
library itself.

This patch adds an option to reduce the number of installed python modules to
the bare minimum. Additional modules to install can be specified in the config
file as a string.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
As an example, to be able to run the 'dstat' tool, I had to add the following
extra modules:
BR2_PACKAGE_PYTHON_REDUCED_EXTRA_MODULES="__future__.pyc sched.pyc heapq.pyc
bisect.pyc collections.pyc keyword.pyc getopt.pyc fnmatch.pyc getpass.pyc
glob.pyc time.so itertools.so operator.so resource.so _collections.so"

 package/python/Config.in |  18 ++++++++++++++++++
 package/python/python.mk |  28 +++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -95,4 +95,22 @@ config BR2_PACKAGE_PYTHON_ZLIB
 
 endmenu
 
+
+config BR2_PACKAGE_PYTHON_REDUCED
+	bool "reduced python installation"
+	help
+	  Select this option to greatly reduce the number of python modules that are
+	  installed on target (from approx. 9M to 400K). Only the modules needed to
+	  start an interactive python session are installed by default.
+	  You can install additional modules by specifying them in
+	  BR2_PACKAGE_PYTHON_REDUCED_EXTRA_MODULES.
+
+config BR2_PACKAGE_PYTHON_REDUCED_EXTRA_MODULES
+	string "extra modules to include in reduced python installation"
+	depends on BR2_PACKAGE_PYTHON_REDUCED
+	help
+	  To install additional modules in a reduced Python installation,
+	  specify them here, space-separated. This list should only include the
+	  file name, not the directory part.
+
 endif
diff --git a/package/python/python.mk b/package/python/python.mk
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -144,12 +144,14 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_DEVFILES
 endif
 
+PYTHON_TARGET_DIR=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
+
 #
 # Remove useless files. In the config/ directory, only the Makefile
 # and the pyconfig.h files are needed at runtime.
 #
 define PYTHON_REMOVE_USELESS_FILES
-	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config/ \
+	for i in `find $(PYTHON_TARGET_DIR)/config/ \
 		-type f -not -name pyconfig.h -a -not -name Makefile` ; do \
 		rm -f $$i ; \
 	done
@@ -157,6 +159,30 @@ endef
 
 PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_USELESS_FILES
 
+#
+# Reduced Python installation: remove unneeded modules
+#
+ifeq ($(BR2_PACKAGE_PYTHON_REDUCED),y)
+PYTHON_REDUCED_MINIMAL_MODULES=$(patsubst %,%.pyc,\
+	site os stat posixpath genericpath warnings linecache types UserDict \
+	_abcoll abc _weakrefset copy_reg sysconfig re sre_compile sre_parse \
+	sre_constants) \
+	$(call qstrip,$(BR2_PACKAGE_PYTHON_REDUCED_EXTRA_MODULES))
+PYTHON_REDUCED_MINIMAL_DIRS=config
+
+PYTHON_REDUCED_FIND_CMD=find $(PYTHON_TARGET_DIR)
+PYTHON_REDUCED_FIND_CMD+=\( $(call finddirclauses,$(PYTHON_TARGET_DIR),$(PYTHON_REDUCED_MINIMAL_DIRS)) \) -prune -o
+PYTHON_REDUCED_FIND_CMD += -type f -not \( $(call findfileclauses,$(PYTHON_REDUCED_MINIMAL_MODULES)) \) -print
+
+define PYTHON_REDUCE_INSTALLATION
+	for i in `$(PYTHON_REDUCED_FIND_CMD)`; do \
+		rm -f $$i ; \
+	done
+endef
+
+PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REDUCE_INSTALLATION
+endif
+
 PYTHON_AUTORECONF = YES
 
 $(eval $(call AUTOTARGETS))
