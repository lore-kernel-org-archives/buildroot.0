From: Dagg Stompler <daggs@gmx.com>
Date: Fri, 24 Jun 2016 21:22:55 +0300
Subject: [Buildroot] [PATCH 3/4 v3] libamcodec: New Package
In-Reply-To: <20160624182256.11909-1-daggs@gmx.com>
References: <20160624182256.11909-1-daggs@gmx.com>
Message-ID: <20160624182256.11909-3-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v2 -> v3:
 - fix sum256 value.
 - fix patch.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/Config.in                                  |  1 +
 ...-fix-makefiles-to-allow-cross-compilation.patch | 96 ++++++++++++++++++++++
 package/libamcodec/Config.in                       | 13 +++
 package/libamcodec/libamcodec.hash                 |  2 +
 package/libamcodec/libamcodec.mk                   | 34 ++++++++
 5 files changed, 146 insertions(+)
 create mode 100644 package/libamcodec/0001-libamcodec-fix-makefiles-to-allow-cross-compilation.patch
 create mode 100644 package/libamcodec/Config.in
 create mode 100644 package/libamcodec/libamcodec.hash
 create mode 100644 package/libamcodec/libamcodec.mk

diff --git a/package/Config.in b/package/Config.in
index 4b8ff60..988d1ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1097,6 +1097,7 @@ endmenu
 
 menu "Multimedia"
 	source "package/bitstream/Config.in"
+	source "package/libamcodec/Config.in"
 	source "package/libass/Config.in"
 	source "package/libbluray/Config.in"
 	source "package/libdcadec/Config.in"
diff --git a/package/libamcodec/0001-libamcodec-fix-makefiles-to-allow-cross-compilation.patch b/package/libamcodec/0001-libamcodec-fix-makefiles-to-allow-cross-compilation.patch
new file mode 100644
index 0000000..743b8a6
--- /dev/null
+++ b/package/libamcodec/0001-libamcodec-fix-makefiles-to-allow-cross-compilation.patch
@@ -0,0 +1,96 @@
+From 09ff48c8f6602996f668c659094651627634a0a9 Mon Sep 17 00:00:00 2001
+From: Dagg Stompler <daggs@gmx.com>
+Date: Fri, 10 Jun 2016 14:24:46 +0300
+Subject: [PATCH] libamcodec: fix makefiles to allow cross compilation.
+
+fix makefiles so it will be possible to cross compile the package
+
+Signed-off-by: Dagg Stompler <daggs@gmx.com>
+---
+ amadec/Makefile    | 8 ++++----
+ amavutils/Makefile | 6 +++---
+ amcodec/Makefile   | 4 ++--
+ amcodec/rules.mk   | 4 ++--
+ 4 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/amadec/Makefile b/amadec/Makefile
+index e9b90bb..734b969 100644
+--- a/amadec/Makefile
++++ b/amadec/Makefile
+@@ -10,14 +10,14 @@ TARGET=libamadec.so
+ 
+ INSTALL_DIR=$(LIB_DIR)/aml_libs
+ 
+-LDFLAGS += -shared -lpthread -lm -lasound -lrt
++override LDFLAGS += -shared -lpthread -lm -lasound -lrt
+ 
+ TOPDIR=$(shell pwd)
+ SRC?=$(TOPDIR)
+ 
+-CFLAGS+=-O2 -fPIC -g
+-CFLAGS+=-I$(SRC) -I$(SRC)/include -I$(SRC)/../amavutils/include -I$(SRC)/../amplayer/player/include -I${HEADERS_DIR} -L${LIB_DIR}
+-CFLAGS+=-DALSA_OUT
++override CFLAGS+=-O2 -fPIC -g
++override CFLAGS+=-I$(SRC) -I$(SRC)/include -I$(SRC)/../amavutils/include -I$(SRC)/../amplayer/player/include -I${HEADERS_DIR} -L${LIB_DIR}
++override CFLAGS+=-DALSA_OUT
+ 
+ ifdef DOLBY_UDC
+     CFLAGS+=-DDOLBY_USE_ARMDEC
+diff --git a/amavutils/Makefile b/amavutils/Makefile
+index eb04bb7..17e7644 100644
+--- a/amavutils/Makefile
++++ b/amavutils/Makefile
+@@ -8,13 +8,13 @@ TARGET=libamavutils.so
+ 
+ INSTALL_DIR=${LIB_DIR}/aml_libs
+ 
+-LDFLAGS += -shared -lpthread -lm -lrt
++override LDFLAGS += -shared -lpthread -lm -lrt
+ 
+ TOPDIR=$(shell pwd)
+ SRC?=$(TOPDIR)
+ 
+-CFLAGS+=-O2 -fPIC -g
+-CFLAGS+=-I$(SRC) -I$(SRC)/include -I$(SRC)/../amcodec/include -L${LIB_DIR} -I$(HEADERS_DIR)
++override CFLAGS+=-O2 -fPIC -g
++override CFLAGS+=-I$(SRC) -I$(SRC)/include -I$(SRC)/../amcodec/include -L${LIB_DIR} -I$(HEADERS_DIR)
+ 
+ 
+ 
+diff --git a/amcodec/Makefile b/amcodec/Makefile
+index 82a9ef0..75bd441 100644
+--- a/amcodec/Makefile
++++ b/amcodec/Makefile
+@@ -27,12 +27,12 @@ TARGET?=libamcodec.so
+ 
+ DIRS=audio_ctl/ codec/
+ 
+-LDFLAGS=  -O2  -L$(LIB_DIR)  -lm -lc  -shared -Wl,--shared -Wl,-soname,$(TARGET)$(LIB_VERSION)
++override LDFLAGS=  -O2  -L$(LIB_DIR)  -lm -lc  -shared -Wl,--shared -Wl,-soname,$(TARGET)$(LIB_VERSION)
+ 
+ #INCLUDE=$(DIRS:%/=-I$(SRC)/%/include)
+ INCLUDE=${SRCTREE}/include/ 
+ #CFLAGS=-O0  -gdwarf-2  -g
+-CFLAGS=-O2 -g  -I$(SRC)/include  -I${SRCTREE}/audio_ctl -I${SRCTREE}/codec -I${SRCTREE}/../amadec/include -fPIC
++override CFLAGS=-O2 -g  -I$(SRC)/include  -I${SRCTREE}/audio_ctl -I${SRCTREE}/codec -I${SRCTREE}/../amadec/include -fPIC
+ 
+ 
+ 
+diff --git a/amcodec/rules.mk b/amcodec/rules.mk
+index e1a298a..2660aed 100644
+--- a/amcodec/rules.mk
++++ b/amcodec/rules.mk
+@@ -2,8 +2,8 @@
+ 
+ 
+ dir_mk=$(Q)echo "MAKE $(1)";\
+-	$(MAKE) -C ${1} -f ${SRCTREE}/depends.mk;\
+-	$(MAKE) -C ${1} -f ${SRCTREE}/dir.mk
++	$(MAKE) -C ${1} -f ${SRCTREE}/depends.mk CFLAGS="$(CFLAGS)";\
++	$(MAKE) -C ${1} -f ${SRCTREE}/dir.mk CFLAGS="$(CFLAGS)"
+ 
+ c_mk=$(Q)echo "CC  $(1)";\
+ 		$(CC) $(CFLAGS)  $(EXT_CFLAGS) -c  $(1) 
+-- 
+2.8.4
+
diff --git a/package/libamcodec/Config.in b/package/libamcodec/Config.in
new file mode 100644
index 0000000..52778ba
--- /dev/null
+++ b/package/libamcodec/Config.in
@@ -0,0 +1,13 @@
+comment "libamcodec needs a toolchain w/ threads"
+	depends on BR2_arm || BR2_aarch64
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_LIBAMCODEC
+	bool "libamcodec"
+	depends on BR2_arm || BR2_aarch64
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	select BR2_PACKAGE_ALSA_LIB
+	help
+	    Interface library for Amlogic media codecs
+
+	    https://github.com/mdrjr/c2_aml_libs.git
diff --git a/package/libamcodec/libamcodec.hash b/package/libamcodec/libamcodec.hash
new file mode 100644
index 0000000..3f40e3d
--- /dev/null
+++ b/package/libamcodec/libamcodec.hash
@@ -0,0 +1,2 @@
+# Locally computed hash
+sha256 5a9ea25341b95c47155012dc7cc0aa08547cc81ca3f61be88bf6fcaebe1ee3c6  libamcodec-ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d.tar.gz
diff --git a/package/libamcodec/libamcodec.mk b/package/libamcodec/libamcodec.mk
new file mode 100644
index 0000000..8da6f33
--- /dev/null
+++ b/package/libamcodec/libamcodec.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# libamcodec
+#
+################################################################################
+
+LIBAMCODEC_VERSION = ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d
+LIBAMCODEC_SITE = $(call github,mdrjr,c2_aml_libs,$(LIBAMCODEC_VERSION))
+LIBAMCODEC_DEPENDENCIES = alsa-lib
+LIBAMCODEC_LICENSE = Unclear
+
+# This package uses the M_PREFIX or PREFIX variables to construct the header and
+# library paths used when compiling
+define LIBAMCODEC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/amavutils M_PREFIX="$(STAGING_DIR)/usr"
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/amadec M_PREFIX="$(STAGING_DIR)/usr"
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/amcodec PREFIX="$(STAGING_DIR)"
+endef
+
+define LIBAMCODEC_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(STAGING_DIR)/usr/lib/libamavutils.so
+	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(STAGING_DIR)/usr/lib/libamadec.so
+	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(STAGING_DIR)/usr/lib/libamcodec.so
+	mkdir -p $(STAGING_DIR)/usr/include/amcodec
+	cp -rf $(@D)/amcodec/include/* $(STAGING_DIR)/usr/include/amcodec
+endef
+
+define LIBAMCODEC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(TARGET_DIR)/usr/lib/libamavutils.so
+	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(TARGET_DIR)/usr/lib/libamadec.so
+	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(TARGET_DIR)/usr/lib/libamcodec.so
+endef
+
+$(eval $(generic-package))
-- 
2.9.0
