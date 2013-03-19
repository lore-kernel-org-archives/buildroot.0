From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Mar 2013 20:29:47 +0100
Subject: [Buildroot] [PATCH v4 14/21] qt5/qt5jsbackend: new package
In-Reply-To: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1363721394-14973-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                              |    1 +
 package/qt5/qt5jsbackend/Config.in                 |   10 +++++
 ...t5jsbackend-dont-import-bz2-python-module.patch |   29 ++++++++++++++
 .../qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch |   33 ++++++++++++++++
 package/qt5/qt5jsbackend/qt5jsbackend.mk           |   41 ++++++++++++++++++++
 5 files changed, 114 insertions(+)
 create mode 100644 package/qt5/qt5jsbackend/Config.in
 create mode 100644 package/qt5/qt5jsbackend/qt5jsbackend-dont-import-bz2-python-module.patch
 create mode 100644 package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch
 create mode 100644 package/qt5/qt5jsbackend/qt5jsbackend.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 3979fa5..8a4ed53 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -16,6 +16,7 @@ menuconfig BR2_PACKAGE_QT5
 if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
+source "package/qt5/qt5jsbackend/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5jsbackend/Config.in b/package/qt5/qt5jsbackend/Config.in
new file mode 100644
index 0000000..89d5067
--- /dev/null
+++ b/package/qt5/qt5jsbackend/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT5JSBACKEND
+	bool "qt5jsbackend"
+	select BR2_PACKAGE_QT5BASE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5jsbackend module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5jsbackend/qt5jsbackend-dont-import-bz2-python-module.patch b/package/qt5/qt5jsbackend/qt5jsbackend-dont-import-bz2-python-module.patch
new file mode 100644
index 0000000..08f343e
--- /dev/null
+++ b/package/qt5/qt5jsbackend/qt5jsbackend-dont-import-bz2-python-module.patch
@@ -0,0 +1,29 @@
+Only import bz2 python module when needed
+
+The js2c.py script imports the bz2 module unconditionnally, which
+would require us to build the bzip2 support in host-python. Since in
+fact bzip2 support is not technically used when building this package,
+we ensure that the bz2 module is only imported when needed.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/3rdparty/v8/tools/js2c.py
+===================================================================
+--- a/src/3rdparty/v8/tools/js2c.py
++++ b/src/3rdparty/v8/tools/js2c.py
+@@ -33,7 +33,6 @@
+ 
+ import os, re, sys, string
+ import jsmin
+-import bz2
+ 
+ 
+ def ToCAsciiArray(lines):
+@@ -344,6 +343,7 @@
+   else:
+     raw_sources_declaration = RAW_SOURCES_COMPRESSION_DECLARATION
+     if env['COMPRESSION'] == 'bz2':
++      import bz2
+       all_sources = bz2.compress("".join(all_sources))
+     total_length = len(all_sources)
+     sources_data = ToCArray(all_sources)
diff --git a/package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch b/package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch
new file mode 100644
index 0000000..50a6dbc
--- /dev/null
+++ b/package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch
@@ -0,0 +1,33 @@
+Fix build on uClibc
+
+Patch taken from https://code.google.com/p/v8/source/detail?r=12094.
+
+Review URL: https://chromiumcodereview.appspot.com/10784012
+Patch from Remi Duraffort <remi.duraffort@st.com>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: qt5jsbackend-5.0.0/src/3rdparty/v8/src/platform-linux.cc
+===================================================================
+--- qt5jsbackend-5.0.0.orig/src/3rdparty/v8/src/platform-linux.cc	2012-12-18 20:04:01.000000000 +0100
++++ qt5jsbackend-5.0.0/src/3rdparty/v8/src/platform-linux.cc	2013-03-03 20:31:46.000000000 +0100
+@@ -1030,7 +1030,8 @@
+   sample->fp = reinterpret_cast<Address>(mcontext.gregs[REG_RBP]);
+ #elif V8_HOST_ARCH_ARM
+ // An undefined macro evaluates to 0, so this applies to Android's Bionic also.
+-#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
++#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3) && \
++     !defined(__UCLIBC__))
+   sample->pc = reinterpret_cast<Address>(mcontext.gregs[R15]);
+   sample->sp = reinterpret_cast<Address>(mcontext.gregs[R13]);
+   sample->fp = reinterpret_cast<Address>(mcontext.gregs[R11]);
+@@ -1038,7 +1039,8 @@
+   sample->pc = reinterpret_cast<Address>(mcontext.arm_pc);
+   sample->sp = reinterpret_cast<Address>(mcontext.arm_sp);
+   sample->fp = reinterpret_cast<Address>(mcontext.arm_fp);
+-#endif  // (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
++#endif  // (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3) &&
++        // !defined(__UCLIBC__))
+ #elif V8_HOST_ARCH_MIPS
+   sample->pc = reinterpret_cast<Address>(mcontext.pc);
+   sample->sp = reinterpret_cast<Address>(mcontext.gregs[29]);
diff --git a/package/qt5/qt5jsbackend/qt5jsbackend.mk b/package/qt5/qt5jsbackend/qt5jsbackend.mk
new file mode 100644
index 0000000..74c19be
--- /dev/null
+++ b/package/qt5/qt5jsbackend/qt5jsbackend.mk
@@ -0,0 +1,41 @@
+#############################################################
+#
+# qt5jsbackend
+#
+#############################################################
+
+QT5JSBACKEND_VERSION = $(QT5_VERSION)
+QT5JSBACKEND_SITE = http://releases.qt-project.org/qt5/$(QT5JSBACKEND_VERSION)/submodules_tar/
+QT5JSBACKEND_SOURCE = qtjsbackend-opensource-src-$(QT5JSBACKEND_VERSION).tar.xz
+QT5JSBACKEND_DEPENDENCIES = qt5base
+QT5JSBACKEND_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5JSBACKEND_CONFIGURE_OPTS += -opensource -confirm-license
+QT5JSBACKEND_LICENSE = LGPLv2.1 or GPLv3.0
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for
+# qt5script.
+else
+QT5JSBACKEND_LICENSE = Commercial license
+QT5JSBACKEND_REDISTRIBUTE = NO
+endif
+
+define QT5JSBACKEND_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5JSBACKEND_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5JSBACKEND_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+define QT5JSBACKEND_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5V8*.so.* $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
