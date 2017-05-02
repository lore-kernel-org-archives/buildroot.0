From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  1 May 2017 23:01:17 -0500
Subject: [Buildroot] [PATCH 1/1] uboot-tools: disable libfdt swig wrapper
Message-ID: <1493697677-24802-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current tools build assumes the host system
when trying to detect if swig/python are present.
It then uses those tools from the path.

The upstream RFC included this commit set's patch
but offered up discussion on how to cleanly
introduce a better method for detecting swig and
using the tools.  The tools build really needs to
be sysroot and prefix/host dir tools aware.

Upsteam submission for RFC:
https://lists.denx.de/pipermail/u-boot/2017-May/289520.html

Workaround for:
http://autobuild.buildroot.net/results/6d5/6d52ac8bb71012aea6fc4c679691b31a3366728b

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...nditionally-disable-python-libfdt-wrapper.patch | 44 ++++++++++++++++++++++
 package/uboot-tools/uboot-tools.mk                 |  5 +++
 2 files changed, 49 insertions(+)
 create mode 100644 package/uboot-tools/0005-tools-conditionally-disable-python-libfdt-wrapper.patch

diff --git a/package/uboot-tools/0005-tools-conditionally-disable-python-libfdt-wrapper.patch b/package/uboot-tools/0005-tools-conditionally-disable-python-libfdt-wrapper.patch
new file mode 100644
index 0000000..43be380
--- /dev/null
+++ b/package/uboot-tools/0005-tools-conditionally-disable-python-libfdt-wrapper.patch
@@ -0,0 +1,44 @@
+From 4dc3139cc9fa12882792053bdce7b69aca9b91bf Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Mon, 1 May 2017 22:19:57 -0500
+Subject: [PATCH 1/1] tools: conditionally disable python libfdt wrapper
+
+Not all host systems want the default swig to be
+used when building the tools.  Allow for the
+disabling of the wrapper to enable cross-compiling
+of the tools on a host system with swig.
+
+Upsteam submission for RFC:
+https://lists.denx.de/pipermail/u-boot/2017-May/289520.html
+
+Workaround for:
+http://autobuild.buildroot.net/results/6d5/6d52ac8bb71012aea6fc4c679691b31a3366728b
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ tools/Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 2fc4a58..7f6c29d 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -114,6 +114,7 @@ fit_check_sign-objs   := $(dumpimage-mkimage-objs) fit_check_sign.o
+ 
+ # Build a libfdt Python module if swig is available
+ # Use 'sudo apt-get install swig libpython-dev' to enable this
++ifndef CONFIG_TOOLS_PYTHON_WRAPPER_DISABLE
+ hostprogs-y += \
+ 	$(if $(shell which swig 2> /dev/null),_libfdt.so)
+ _libfdt.so-sharedobjs += $(LIBFDT_OBJS)
+@@ -126,6 +127,7 @@ tools/_libfdt.so: $(patsubst %.o,%.c,$(LIBFDT_OBJS)) tools/libfdt_wrap.c
+ 
+ tools/libfdt_wrap.c: $(srctree)/lib/libfdt/libfdt.swig
+ 	swig -python -o $@ $<
++endif
+ 
+ # TODO(sjg@chromium.org): Is this correct on Mac OS?
+ 
+-- 
+1.9.1
+
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 2585c7b..352f53d 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -21,6 +21,11 @@ UBOOT_TOOLS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	STRIP=$(TARGET_STRIP)
 
+# This option was added through an additional patch
+# and allows the disabling of a host python swig
+# detect which as of 2017.5 assumes the host systems swig.
+UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_PYTHON_WRAPPER_DISABLE=y
+
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
 UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y
 UBOOT_TOOLS_DEPENDENCIES += dtc
-- 
1.9.1
