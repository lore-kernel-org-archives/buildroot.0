From: Dagg <daggs@gmx.com>
Date: Sat,  4 Jun 2016 16:44:29 +0300
Subject: [Buildroot] [PATCH v3] libamcodec: New Package
Message-ID: <20160604134429.4980-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v2 -> v3:
 - properly pass variables when possible.
 - use proper full destination path.

Signed-off-by: Dagg <daggs@gmx.com>
---
 package/Config.in                                  |  1 +
 package/libamcodec/0001-fix_flags_in_makefile.patch    | 70 ++++++++++++++++++++++
 package/libamcodec/Config.in                       | 13 ++++
 package/libamcodec/libamcodec.hash                 |  2 +
 package/libamcodec/libamcodec.mk                   | 33 ++++++++++
 5 files changed, 119 insertions(+)
 create mode 100644 package/libamcodec/0001-fix_flags_in_makefile.patch
 create mode 100644 package/libamcodec/Config.in
 create mode 100644 package/libamcodec/libamcodec.hash
 create mode 100644 package/libamcodec/libamcodec.mk

diff --git a/package/Config.in b/package/Config.in
index 6c6a562..0a56070 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1074,6 +1074,7 @@ endmenu
 
 menu "Multimedia"
 	source "package/bitstream/Config.in"
+	source "package/libamcodec/Config.in"
 	source "package/libass/Config.in"
 	source "package/libbluray/Config.in"
 	source "package/libdcadec/Config.in"
diff --git a/package/libamcodec/0001-fix_flags_in_makefile.patch b/package/libamcodec/0001-fix_flags_in_makefile.patch
new file mode 100644
index 0000000..e64c4d7
--- /dev/null
+++ b/package/libamcodec/0001-fix_flags_in_makefile.patch
@@ -0,0 +1,70 @@
+--- a/amcodec/Makefile	2016-06-02 12:06:53.000000000 +0300
++++ b/amcodec/Makefile	2016-06-02 12:07:34.000000000 +0300
+@@ -27,12 +27,12 @@ TARGET?=libamcodec.so
+ 
+ DIRS=audio_ctl/ codec/
+ 
+-LDFLAGS=  -O2  -L$(LIB_DIR)  -lm -lc  -shared -Wl,--shared -Wl,-soname,$(TARGET)$(LIB_VERSION)
++override LDFLAGS+=  -O2  -L$(LIB_DIR)  -lm -lc  -shared -Wl,--shared -Wl,-soname,$(TARGET)$(LIB_VERSION)
+ 
+ #INCLUDE=$(DIRS:%/=-I$(SRC)/%/include)
+ INCLUDE=${SRCTREE}/include/ 
+ #CFLAGS=-O0  -gdwarf-2  -g
+-CFLAGS=-O2 -g  -I$(SRC)/include  -I${SRCTREE}/audio_ctl -I${SRCTREE}/codec -I${SRCTREE}/../amadec/include -fPIC
++override CFLAGS+=-O2 -g  -I$(SRC)/include  -I${SRCTREE}/audio_ctl -I${SRCTREE}/codec -I${SRCTREE}/../amadec/include -fPIC
+ 
+ 
+ 
+--- a/amavutils/Makefile	2016-06-02 11:48:11.000000000 +0300
++++ b/amavutils/Makefile	2016-06-02 11:46:14.000000000 +0300
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
+--- a/amadec/Makefile	2016-06-02 12:03:48.000000000 +0300
++++ b/amadec/Makefile	2016-06-02 12:04:11.000000000 +0300
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
+--- a/amcodec/rules.mk	2016-06-04 15:49:31.000000000 +0300
++++ b/amcodec/rules.mk	2016-06-04 15:49:41.000000000 +0300
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
index 0000000..3a0055f
--- /dev/null
+++ b/package/libamcodec/libamcodec.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 44580255c63bde1544b1376bc8d33f73ef0c634afda5065455a01b77f6e2729b  libamcodec-ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d.tar.gz
diff --git a/package/libamcodec/libamcodec.mk b/package/libamcodec/libamcodec.mk
new file mode 100644
index 0000000..1e0bcb6
--- /dev/null
+++ b/package/libamcodec/libamcodec.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# libamcodec
+#
+################################################################################
+
+LIBAMCODEC_VERSION = ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d
+LIBAMCODEC_SITE = $(call github,mdrjr,c2_aml_libs,$(LIBAMCODEC_VERSION))
+LIBAMCODEC_DEPENDENCIES = alsa-lib
+
+# This package uses the M_PREFIX variable to construct the header and
+# # library paths used when compiling
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
2.8.3
