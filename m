From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 16 Sep 2015 10:49:52 +1200
Subject: [Buildroot] [PATCHv3] micropython: new package
In-Reply-To: <CAFOYHZBmchw4SpcVDLGnM4TfYrsSHN2-OHRHQyR=FpHXziYu=w@mail.gmail.com>
References: <CAFOYHZBmchw4SpcVDLGnM4TfYrsSHN2-OHRHQyR=FpHXziYu=w@mail.gmail.com>
Message-ID: <1442357392-17531-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Micro Python is a lean and fast implementation of the Python 3
programming language that is optimised to run on a microcontroller.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
Hi Buildroot,
    
Thought you might be interested in mircopython a minimal python 3
implementation. It's designed for micro controllers but is also well suited
to other general purpose embedded CPUs.
    
Cheers,
Chris
    
Changes since v1:
- Add dependency on host-pkgconf.
- Use $(TARGET_MAKE_ENV) in make invocation for micropython
  (micropython-lib doesn't need it because it doesn't use anything setup by
  it).
- Override PREFIX to install to /usr/bin instead of /usr/local/bin
- Update/add some comments.
    
Changes since v2:
- Use $(TARGET_MAKE_ENV) in micropython-lib for consistency
- Update LICENSE for micropython-lib (thanks to Vincent for the shell
  snippet that saved me having to check them manually).
- Add patch to take the version number from the package instead of from the
  buildroot git repository.

 package/Config.in                          |  2 ++
 package/micropython-lib/Config.in          |  7 +++++++
 package/micropython-lib/micropython-lib.mk | 17 +++++++++++++++++
 package/micropython/0001-fix-version.patch | 14 ++++++++++++++
 package/micropython/Config.in              |  8 ++++++++
 package/micropython/micropython.mk         | 27 +++++++++++++++++++++++++++
 6 files changed, 75 insertions(+)
 create mode 100644 package/micropython-lib/Config.in
 create mode 100644 package/micropython-lib/micropython-lib.mk
 create mode 100644 package/micropython/0001-fix-version.patch
 create mode 100644 package/micropython/Config.in
 create mode 100644 package/micropython/micropython.mk

diff --git a/package/Config.in b/package/Config.in
index fc35f12..986fe16 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -509,6 +509,8 @@ menu "Lua libraries/modules"
 endmenu
 endif
 	source "package/lutok/Config.in"
+	source "package/micropython/Config.in"
+	source "package/micropython-lib/Config.in"
 	source "package/moarvm/Config.in"
 	source "package/mono/Config.in"
 if BR2_PACKAGE_MONO
diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Config.in
new file mode 100644
index 0000000..a7e017b
--- /dev/null
+++ b/package/micropython-lib/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MICROPYTHON_LIB
+	bool "micropython-lib"
+	depends on BR2_PACKAGE_MICROPYTHON
+	help
+	  Core Python libraries ported to MicroPython.
+
+	  http://micropython.org
diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
new file mode 100644
index 0000000..4445306
--- /dev/null
+++ b/package/micropython-lib/micropython-lib.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# micropython-lib
+#
+################################################################################
+MICROPYTHON_LIB_VERSION = v0.5
+MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
+MICROPYTHON_LIB_LICENSE = Python software foundation license v2 (some modules), MIT (everything else)
+MICROPYTHON_LIB_LICENSE_FILES = LICENSE
+
+define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=$(TARGET_DIR)/usr/lib/micropython \
+		install
+endef
+
+$(eval $(generic-package))
diff --git a/package/micropython/0001-fix-version.patch b/package/micropython/0001-fix-version.patch
new file mode 100644
index 0000000..e2cad58
--- /dev/null
+++ b/package/micropython/0001-fix-version.patch
@@ -0,0 +1,14 @@
+diff -Naur micropython-v1.4.5-old/py/makeversionhdr.py micropython-v1.4.5/py/makeversionhdr.py
+--- micropython-v1.4.5-old/py/makeversionhdr.py	2015-08-12 00:42:30.000000000 +1200
++++ micropython-v1.4.5/py/makeversionhdr.py	2015-09-16 10:21:06.698962836 +1200
+@@ -70,9 +70,7 @@
+ 
+ def make_version_header(filename):
+     # Get version info using git, with fallback to docs/conf.py
+-    info = get_version_info_from_git()
+-    if info is None:
+-        info = get_version_info_from_docs_conf()
++    info = get_version_info_from_docs_conf()
+ 
+     git_tag, git_hash, ver = info
+ 
diff --git a/package/micropython/Config.in b/package/micropython/Config.in
new file mode 100644
index 0000000..ec47463
--- /dev/null
+++ b/package/micropython/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MICROPYTHON
+	bool "micropython"
+	select BR2_PACKAGE_LIBFFI
+	help
+	  Micro Python is a lean and fast implementation of the Python 3
+	  programming language that is optimised to run on a microcontroller.
+
+	  http://micropython.org
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
new file mode 100644
index 0000000..75a517d
--- /dev/null
+++ b/package/micropython/micropython.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# micropython
+#
+################################################################################
+MICROPYTHON_VERSION = v1.4.5
+MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
+MICROPYTHON_LICENSE = MIT
+MICROPYTHON_LICENSE_FILES = LICENSE
+MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
+
+# Use fallback implementation for exception handling on architectures that don't
+# have explicit support.
+ifeq ($(BR2_powerpc),y)
+MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
+endif
+
+define MICROPYTHON_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
+		CROSS_COMPILE=$(TARGET_CROSS) \
+		DESTDIR=$(TARGET_DIR) \
+		PREFIX=$(TARGET_DIR)/usr \
+		CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
+		install
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
