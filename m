From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:53:51 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_03/36=5D_package/libfdt=3A_new_pac?=
	=?utf-8?q?kage?=
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-3-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libfdt allows one to manipulate a Flat Device Tree.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                                  |    1 +
 package/libfdt/Config.in                           |    6 ++
 .../libfdt/libfdt-install-missing-headers.patch    |   22 ++++++++
 package/libfdt/libfdt-separate-lib-install.patch   |   22 ++++++++
 package/libfdt/libfdt.mk                           |   56 ++++++++++++++++++++
 5 files changed, 107 insertions(+), 0 deletions(-)
 create mode 100644 package/libfdt/Config.in
 create mode 100644 package/libfdt/libfdt-install-missing-headers.patch
 create mode 100644 package/libfdt/libfdt-separate-lib-install.patch
 create mode 100644 package/libfdt/libfdt.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..f139e29 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -375,6 +375,7 @@ source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
 source "package/libfreefare/Config.in"
+source "package/libfdt/Config.in"
 source "package/libftdi/Config.in"
 source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
diff --git a/package/libfdt/Config.in b/package/libfdt/Config.in
new file mode 100644
index 0000000..fe215b3
--- /dev/null
+++ b/package/libfdt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBFDT
+	bool "libfdt"
+	help
+	  libfdt if a library to manipulate Flat Device Trees.
+	  
+	  http://git.jdl.com/gitweb/?p=dtc.git  (no home page)
diff --git a/package/libfdt/libfdt-install-missing-headers.patch b/package/libfdt/libfdt-install-missing-headers.patch
new file mode 100644
index 0000000..b15d376
--- /dev/null
+++ b/package/libfdt/libfdt-install-missing-headers.patch
@@ -0,0 +1,22 @@
+libfdt: install missing header
+
+Previously, only two headers were installed: libfdt.h and fdt.h.
+But libfdt.h also #includes libfdt_env.h, which was not installed.
+
+Install this missing header too.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/libfdt/Makefile.libfdt b/libfdt/Makefile.libfdt
+index d55a6f8..94c1e35 100644
+--- a/libfdt/Makefile.libfdt
++++ b/libfdt/Makefile.libfdt
+@@ -4,7 +4,7 @@
+ # be easily embeddable into other systems of Makefiles.
+ #
+ LIBFDT_soname = libfdt.$(SHAREDLIB_EXT).1
+-LIBFDT_INCLUDES = fdt.h libfdt.h
++LIBFDT_INCLUDES = fdt.h libfdt.h libfdt_env.h
+ LIBFDT_VERSION = version.lds
+ LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c
+ LIBFDT_OBJS = $(LIBFDT_SRCS:%.c=%.o)
diff --git a/package/libfdt/libfdt-separate-lib-install.patch b/package/libfdt/libfdt-separate-lib-install.patch
new file mode 100644
index 0000000..5a0157d
--- /dev/null
+++ b/package/libfdt/libfdt-separate-lib-install.patch
@@ -0,0 +1,22 @@
+Makefile: add a rule to only install libfdt
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/Makefile b/Makefile
+index 1169e6c..39e7190 100644
+--- a/Makefile
++++ b/Makefile
+@@ -156,10 +156,12 @@ endif
+ # intermediate target and building them again "for real"
+ .SECONDARY: $(DTC_GEN_SRCS) $(CONVERT_GEN_SRCS)
+ 
+-install: all $(SCRIPTS)
++install: all $(SCRIPTS) libfdt_install
+ 	@$(VECHO) INSTALL
+ 	$(INSTALL) -d $(DESTDIR)$(BINDIR)
+ 	$(INSTALL) $(BIN) $(SCRIPTS) $(DESTDIR)$(BINDIR)
++
++libfdt_install: libfdt
+ 	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
+ 	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
+ 	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
diff --git a/package/libfdt/libfdt.mk b/package/libfdt/libfdt.mk
new file mode 100644
index 0000000..6824576
--- /dev/null
+++ b/package/libfdt/libfdt.mk
@@ -0,0 +1,56 @@
+#-----------------------------------------------------------------------------
+# Package description
+
+LIBFDT_VERSION         = v1.3.0
+LIBFDT_SITE            = git://git.jdl.com/software/dtc.git
+LIBFDT_LICENSE         = GPLv2+/BSD-2c
+LIBFDT_LICENSE_FILES   = README.license GPL
+# Note: the dual-license only applies to the library.
+#       The DT compiler (dtc) is GPLv2+, but we do not install it (yet?).
+LIBFDT_INSTALL_STAGING = YES
+
+#----------------------------------------------------------------------------
+# Package build process
+
+define LIBFDT_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" \
+	                 AR="$(TARGET_AR)" \
+	                 PREFIX=/usr       \
+	                 libfdt
+endef
+
+#?libfdt_install is our own install rule added by our patch
+define LIBFDT_INSTALL_STAGING_CMDS
+	$(MAKE) CC="$(TARGET_CC)" AR="$(TARGET_AR)" -C $(@D) \
+	        DESTDIR=$(STAGING_DIR) PREFIX=/usr           \
+	        libfdt_install
+endef
+
+# libfdt does not have any uninstall rule
+define LIBFDT_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/lib/libfdt.a
+	rm -f $(STAGING_DIR)/usr/lib/libfdt*.so*
+	rm -f $(STAGING_DIR)/usr/include/libfdt*.h
+	rm -f $(STAGING_DIR)/usr/include/fdt.h
+endef
+
+# Usually, mode 0644 is enough for libraries (shared or static), but the
+# buildroot documentation dsays 0755, so be dumb and follow the docs. ;-p
+# And on target, we only require the SONAME-named library, not all the
+# symlinks, but:
+#   - libfdt's Makefile does not offer such a rule,
+#   - other buildroot packages do install lib symlinks,
+# so do as all others do.
+define LIBFDT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libfdt/libfdt*.so* $(TARGET_DIR)/usr/lib
+endef
+
+define LIBFDT_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/lib/libfdt*.so*
+endef
+
+define LIBFDT_CLEAN_CMDS
+	$(MAKE) -C $(@D) libfdt_clean
+endef
+
+$(eval $(generic-package))
-- 
1.7.2.5
