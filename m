From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 12 Oct 2017 21:35:56 -0500
Subject: [Buildroot] [PATCH] uboot-tools: bugfix libfdt python build
Message-ID: <20171013023556.25825-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libfdt is using setup.py to perform the build
of it's wrapper.  This is being invoked with the
system's python default vs the HOST_DIR's.  This
patch completes the uboot-tools source update to
support an optional python intepreter override and
for buildroot to supply that value when doing a host
build.

Bug/Feature submitted upstream:
https://lists.denx.de/pipermail/u-boot/2017-October/309250.html

Fixes:
http://autobuild.buildroot.net/results/101/1014a6c2728ef49b332aa3ed169125a0d5a0ae1e/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...libfdt-give-setup-py-optional-interpreter.patch | 31 ++++++++++++++++++++++
 package/uboot-tools/uboot-tools.mk                 |  9 ++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 package/uboot-tools/0004-libfdt-give-setup-py-optional-interpreter.patch

diff --git a/package/uboot-tools/0004-libfdt-give-setup-py-optional-interpreter.patch b/package/uboot-tools/0004-libfdt-give-setup-py-optional-interpreter.patch
new file mode 100644
index 0000000..e6e3783
--- /dev/null
+++ b/package/uboot-tools/0004-libfdt-give-setup-py-optional-interpreter.patch
@@ -0,0 +1,31 @@
+From 95de35336e2a6b4a292b2950dbb092077dcda565 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Thu, 12 Oct 2017 21:05:56 -0500
+Subject: [PATCH] libfdt: give setup.py optional interpreter
+
+If building in a sandboxed environment where a
+alternate python interpreter is desired. Allow
+configuring of the PYTHON variable to specify
+the interpreter to invoke setup.py.
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ tools/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 77706a9..30505dc 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -136,7 +136,7 @@ tools/_libfdt.so: $(LIBFDT_SRCS) $(LIBFDT_SWIG)
+ 		CPPFLAGS="$(_hostc_flags)" OBJDIR=tools \
+ 		SOURCES="$(LIBFDT_SRCS) tools/libfdt.i" \
+ 		SWIG_OPTS="-I$(srctree)/lib/libfdt -I$(srctree)/lib" \
+-		$(libfdt_tree)/pylibfdt/setup.py --quiet build_ext \
++		$(PYTHON) $(libfdt_tree)/pylibfdt/setup.py --quiet build_ext \
+ 			--build-lib tools
+ 
+ ifneq ($(CONFIG_MX23)$(CONFIG_MX28),)
+-- 
+1.8.3.1
+
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 4f39f4a..4fa77ca 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -75,6 +75,12 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
 endef
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+HOST_UBOOT_TOOLS_DEPENDENCIES += host-python3
+else
+HOST_UBOOT_TOOLS_DEPENDENCIES += host-python
+endif
+
 define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/config
 	touch $(@D)/include/config/auto.conf
@@ -95,7 +101,8 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
 endif
 
 define HOST_UBOOT_TOOLS_BUILD_CMDS
-	$(MAKE1) -C $(@D) $(HOST_UBOOT_TOOLS_MAKE_OPTS) tools-only
+	$(MAKE1) -C $(@D) $(HOST_UBOOT_TOOLS_MAKE_OPTS) \
+		PYTHON="$(HOST_DIR)/bin/python" tools-only
 endef
 
 define HOST_UBOOT_TOOLS_INSTALL_CMDS
-- 
1.8.3.1
