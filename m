From: Vadim Kochan <vadim4j@gmail.com>
Date: Sat, 16 Feb 2019 23:28:35 +0200
Subject: [Buildroot] [PATCH 3/3] package/s6-rc: Allow to integrate s6-rc
 services
In-Reply-To: <20190216212835.25503-1-vadim4j@gmail.com>
References: <20190216212835.25503-1-vadim4j@gmail.com>
Message-ID: <20190216212835.25503-4-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It allows to install s6-rc services by post-build, rootfs-overlay or some
package into /etc/s6/rc/service which will be compiled as s6-rc db as
/etc/s6/rc/compiled-initial. Services are compiled on stage when rootfs overlay
& post-build already performed.

Added rc.init & rc.shutdown scripts which are needed to run s6-rc
services.

This is very basic s6-rc system support which even does not have the
basic stuff like /proc /sys /dev setup, but this might be added in
future work.

All above is only possible if BR2_INIT_S6 is selected.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 ...figure-Allow-to-specify-compiled-base-dir.patch | 76 ++++++++++++++++++++++
 package/s6-rc/rc.init                              |  4 ++
 package/s6-rc/rc.shutdown                          |  3 +
 package/s6-rc/s6-rc.mk                             | 33 ++++++++++
 system/Config.in                                   |  1 +
 5 files changed, 117 insertions(+)
 create mode 100644 package/s6-rc/0001-configure-Allow-to-specify-compiled-base-dir.patch
 create mode 100644 package/s6-rc/rc.init
 create mode 100644 package/s6-rc/rc.shutdown

diff --git a/package/s6-rc/0001-configure-Allow-to-specify-compiled-base-dir.patch b/package/s6-rc/0001-configure-Allow-to-specify-compiled-base-dir.patch
new file mode 100644
index 0000000000..baf1706bb3
--- /dev/null
+++ b/package/s6-rc/0001-configure-Allow-to-specify-compiled-base-dir.patch
@@ -0,0 +1,76 @@
+From cb89562fcec582bbb5bc9a3bf5faf33338e6b535 Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim4j@gmail.com>
+Date: Wed, 13 Feb 2019 03:36:03 +0200
+Subject: [PATCH] configure: Allow to specify compiled base dir
+
+It allows to specify different s6-rc compiled dir (for example
+/etc/s6/rc/compiled), without specifying it as command line argument
+for s6-rc* tools.
+
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+---
+ configure                          | 6 +++++-
+ src/include/s6-rc/s6rc-constants.h | 2 --
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/configure b/configure
+index e3ff39e..562cf05 100755
+--- a/configure
++++ b/configure
+@@ -23,6 +23,7 @@ Fine tuning of the installation directories:
+   --libdir=DIR                  static library files [PREFIX/lib/$package]
+   --includedir=DIR              C header files [PREFIX/include]
+   --livedir=DIR                 default live directory [/run/s6-rc]
++  --compiledir=DIR              default compiled directory [/etc/s6-rc/compiled]
+ 
+  If no --prefix option is given, by default libdir (but not dynlibdir) will be
+  /usr/lib/$package, and includedir will be /usr/include.
+@@ -141,6 +142,7 @@ bindir='$exec_prefix/bin'
+ libdir='$prefix/lib/$package'
+ includedir='$prefix/include'
+ livedir=/run/s6-rc
++compiledir=/etc/s6-rc/compiled
+ sysdeps='$prefix/lib/skalibs/sysdeps'
+ manualsysdeps=false
+ shared=false
+@@ -171,6 +173,7 @@ for arg ; do
+     --libdir=*) libdir=${arg#*=} ;;
+     --includedir=*) includedir=${arg#*=} ;;
+     --livedir=*) livedir=${arg#*=} ;;
++    --compiledir=*) compiledir=${arg#*=} ;;
+     --with-sysdeps=*) sysdeps=${arg#*=} manualsysdeps=true ;;
+     --with-include=*) var=${arg#*=} ; stripdir var ; addincpath="$addincpath -I$var" ;;
+     --with-lib=*) var=${arg#*=} ; stripdir var ; addlibspath="$addlibspath -L$var" ; vpaths="$vpaths $var" ;;
+@@ -214,7 +217,7 @@ fi
+ 
+ # Expand installation directories
+ stripdir prefix
+-for i in exec_prefix dynlibdir libexecdir bindir libdir includedir sysdeps sproot livedir ; do
++for i in exec_prefix dynlibdir libexecdir bindir libdir includedir sysdeps sproot livedir compiledir ; do
+   eval tmp=\${$i}
+   eval $i=$tmp
+   stripdir $i
+@@ -454,6 +457,7 @@ cat <<EOF
+ 
+ #define ${package_macro_name}_VERSION "$version"
+ #define ${package_macro_name}_LIVE_BASE "$livedir"
++#define ${package_macro_name}_COMPILED_BASE "$compiledir"
+ EOF
+ if $slashpackage ; then
+   echo "#define ${package_macro_name}_BINPREFIX \"$bindir/\""
+diff --git a/src/include/s6-rc/s6rc-constants.h b/src/include/s6-rc/s6rc-constants.h
+index 168dac8..833e0a7 100644
+--- a/src/include/s6-rc/s6rc-constants.h
++++ b/src/include/s6-rc/s6rc-constants.h
+@@ -3,8 +3,6 @@
+ #ifndef S6RC_CONSTANTS_H
+ #define S6RC_CONSTANTS_H
+ 
+-#define S6RC_COMPILED_BASE "/etc/s6-rc/compiled"
+-
+ #define S6RC_ONESHOT_RUNNER "s6rc-oneshot-runner"
+ #define S6RC_ONESHOT_RUNNER_LEN (sizeof S6RC_ONESHOT_RUNNER - 1)
+ 
+-- 
+2.14.1
+
diff --git a/package/s6-rc/rc.init b/package/s6-rc/rc.init
new file mode 100644
index 0000000000..6709c6488b
--- /dev/null
+++ b/package/s6-rc/rc.init
@@ -0,0 +1,4 @@
+#! /usr/bin/execlineb -P
+
+if { s6-rc-init /run/service }
+if { s6-rc -t 600000 -- change default }
diff --git a/package/s6-rc/rc.shutdown b/package/s6-rc/rc.shutdown
new file mode 100644
index 0000000000..58d49b5cfd
--- /dev/null
+++ b/package/s6-rc/rc.shutdown
@@ -0,0 +1,3 @@
+#! /usr/bin/execlineb -P
+
+s6-rc -da change
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 222ba139c6..6bba54a28a 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -11,6 +11,13 @@ S6_RC_LICENSE_FILES = COPYING
 S6_RC_INSTALL_STAGING = YES
 S6_RC_DEPENDENCIES = s6
 
+ifeq ($(BR2_INIT_S6),y)
+# Needs s6-rc-compile to create initial rc db, also
+# build after s6-linux-init to rewrite rc.init for run
+# s6-rc services.
+S6_RC_DEPENDENCIES += host-s6-rc s6-linux-init
+endif
+
 S6_RC_CONF_OPTS = \
 	--prefix=/usr \
 	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
@@ -20,6 +27,7 @@ S6_RC_CONF_OPTS = \
 	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
 	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(if $(BR2_INIT_S6),--compiledir=/etc/s6/rc/compiled,) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
 define S6_RC_CONFIGURE_CMDS
@@ -44,6 +52,31 @@ define S6_RC_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
+ifeq ($(BR2_INIT_S6),y)
+
+define S6_RC_PREPARE_INIT_RC
+	mkdir -p $(TARGET_DIR)/etc/s6/rc/service/default
+	echo bundle > $(TARGET_DIR)/etc/s6/rc/service/default/type
+	touch $(TARGET_DIR)/etc/s6/rc/service/default/contents
+
+	mkdir -p $(TARGET_DIR)/etc/s6/rc/compiled-initial
+	ln -sf compiled-initial $(TARGET_DIR)/etc/s6/rc/compiled
+
+	$(INSTALL) -m 0755 $(S6_RC_PKGDIR)/rc.init $(TARGET_DIR)/etc/rc.init
+	$(INSTALL) -m 0755 $(S6_RC_PKGDIR)/rc.shutdown $(TARGET_DIR)/etc/rc.shutdown
+endef
+S6_RC_POST_INSTALL_TARGET_HOOKS += S6_RC_PREPARE_INIT_RC
+
+define S6_RC_FINALIZE_INIT_RC
+	rm -rf $(TARGET_DIR)/etc/s6/rc/compiled-initial
+	$(HOST_DIR)/bin/s6-rc-compile -v 1 \
+		$(TARGET_DIR)/etc/s6/rc/compiled-initial \
+		$(TARGET_DIR)/etc/s6/rc/service
+endef
+S6_RC_ROOTFS_PRE_CMD_HOOKS += S6_RC_FINALIZE_INIT_RC
+
+endif # BR2_INIT_S6
+
 HOST_S6_RC_DEPENDENCIES = host-s6
 
 HOST_S6_RC_CONF_OPTS = \
diff --git a/system/Config.in b/system/Config.in
index 7b99424040..9e4d0783f2 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -124,6 +124,7 @@ comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10"
 config BR2_INIT_S6
 	bool "s6"
 	select BR2_PACKAGE_S6_LINUX_INIT
+	select BR2_PACKAGE_S6_RC
 
 config BR2_INIT_NONE
 	bool "None"
-- 
2.14.1
