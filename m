From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Apr 2011 14:41:56 -0300
Subject: [Buildroot] [PATCH 4/7] libcap: bump to version 2.20
In-Reply-To: <1303321319-16553-1-git-send-email-gustavo@zacarias.com.ar>
References: <1303321319-16553-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1303321319-16553-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump libcap to version 2.20 and adjust style to match buildroot's
defacto standard.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcap/libcap-2.19-build-system.patch |   59 -------------------------
 package/libcap/libcap-2.20-build-system.patch |   54 ++++++++++++++++++++++
 package/libcap/libcap.mk                      |   29 ++++++++----
 3 files changed, 73 insertions(+), 69 deletions(-)
 delete mode 100644 package/libcap/libcap-2.19-build-system.patch
 create mode 100644 package/libcap/libcap-2.20-build-system.patch

diff --git a/package/libcap/libcap-2.19-build-system.patch b/package/libcap/libcap-2.19-build-system.patch
deleted file mode 100644
index f548726..0000000
--- a/package/libcap/libcap-2.19-build-system.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-diff -Nura libcap-2.19.orig/Make.Rules libcap-2.19/Make.Rules
---- libcap-2.19.orig/Make.Rules	2010-01-13 23:04:58.000000000 -0300
-+++ libcap-2.19/Make.Rules	2010-12-28 16:44:18.164052748 -0300
-@@ -45,25 +45,26 @@
- KERNEL_HEADERS := $(topdir)/libcap/include
- IPATH += -I$(topdir)/libcap/include -I$(KERNEL_HEADERS)
- 
--CC := gcc
--CFLAGS := -O2
--BUILD_CC := $(CC)
--BUILD_CFLAGS := $(CFLAGS) $(IPATH)
--AR := ar
--RANLIB := ranlib
-+CC ?= gcc
-+CFLAGS ?= -O2
-+CC_FOR_BUILD ?= $(CC)
-+CFLAGS_FOR_BUILD ?= $(CFLAGS)
-+AR ?= ar
-+RANLIB ?= ranlib
- DEBUG = -g #-DDEBUG
- WARNINGS=-fPIC -Wall -Wwrite-strings \
-         -Wpointer-arith -Wcast-qual -Wcast-align \
-         -Wstrict-prototypes -Wmissing-prototypes \
-         -Wnested-externs -Winline -Wshadow
- LD=$(CC) -Wl,-x -shared
--LDFLAGS := #-g
-+LDFLAGS ?= #-g
- 
- SYSTEM_HEADERS = /usr/include
- INCS=$(topdir)/libcap/include/sys/capability.h
- LDFLAGS += -L$(topdir)/libcap
- CFLAGS += -Dlinux $(WARNINGS) $(DEBUG) $(IPATH)
--PAM_CAP := $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
-+CFLAGS_FOR_BUILD += $(IPATH)
-+PAM_CAP := no
- INDENT := $(shell if [ -n "$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
- DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
- LIBATTR := yes
-diff -Nura libcap-2.19.orig/libcap/Makefile libcap-2.19/libcap/Makefile
---- libcap-2.19.orig/libcap/Makefile	2008-12-04 05:03:12.000000000 -0200
-+++ libcap-2.19/libcap/Makefile	2010-12-28 16:44:33.457052750 -0300
-@@ -33,7 +33,7 @@
- endif
- 
- _makenames: _makenames.c cap_names.list.h
--	$(BUILD_CC) $(BUILD_CFLAGS) $< -o $@
-+	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $< -o $@
- 
- cap_names.h: _makenames
- 	./_makenames > cap_names.h
-@@ -65,7 +65,7 @@
- 	install -m 0644 include/sys/capability.h $(INCDIR)/sys
- 	mkdir -p -m 0755 $(LIBDIR)
- 	install -m 0644 $(STALIBNAME) $(LIBDIR)/$(STALIBNAME)
--	install -m 0644 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
-+	install -m 0755 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
- 	ln -sf $(MINLIBNAME) $(LIBDIR)/$(MAJLIBNAME)
- 	ln -sf $(MAJLIBNAME) $(LIBDIR)/$(LIBNAME)
- ifeq ($(FAKEROOT),)
diff --git a/package/libcap/libcap-2.20-build-system.patch b/package/libcap/libcap-2.20-build-system.patch
new file mode 100644
index 0000000..397aff2
--- /dev/null
+++ b/package/libcap/libcap-2.20-build-system.patch
@@ -0,0 +1,54 @@
+Avoid the libcap buildsys forcing CC/CFLAGS/LDFLAGS/AR/RANLIB
+Also install the shared lib +x
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura libcap-2.20/Make.Rules libcap-2.20-build/Make.Rules
+--- libcap-2.20/Make.Rules	2011-01-19 02:06:44.000000000 -0300
++++ libcap-2.20-build/Make.Rules	2011-04-19 14:07:53.544903094 -0300
+@@ -47,25 +47,25 @@
+ KERNEL_HEADERS := $(topdir)/libcap/include
+ IPATH += -fPIC -I$(topdir)/libcap/include -I$(KERNEL_HEADERS)
+ 
+-CC := gcc
+-CFLAGS := -O2
+-BUILD_CC := $(CC)
+-BUILD_CFLAGS := $(CFLAGS) $(IPATH)
+-AR := ar
+-RANLIB := ranlib
++CC ?= gcc
++CFLAGS ?= -O2
++BUILD_CC ?= $(CC)
++BUILD_CFLAGS ?= $(CFLAGS) $(IPATH)
++AR ?= ar
++RANLIB ?= ranlib
+ DEBUG = -g #-DDEBUG
+ WARNINGS=-Wall -Wwrite-strings \
+         -Wpointer-arith -Wcast-qual -Wcast-align \
+         -Wstrict-prototypes -Wmissing-prototypes \
+         -Wnested-externs -Winline -Wshadow
+ LD=$(CC) -Wl,-x -shared
+-LDFLAGS := #-g
++LDFLAGS ?= #-g
+ 
+ SYSTEM_HEADERS = /usr/include
+ INCS=$(topdir)/libcap/include/sys/capability.h
+ LDFLAGS += -L$(topdir)/libcap
+ CFLAGS += -Dlinux $(WARNINGS) $(DEBUG)
+-PAM_CAP := $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
++PAM_CAP = no
+ INDENT := $(shell if [ -n "$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
+ DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
+ LIBATTR := yes
+diff -Nura libcap-2.20/libcap/Makefile libcap-2.20-build/libcap/Makefile
+--- libcap-2.20/libcap/Makefile	2010-08-08 19:26:04.000000000 -0300
++++ libcap-2.20-build/libcap/Makefile	2011-04-19 14:08:29.377146094 -0300
+@@ -65,7 +65,7 @@
+ 	install -m 0644 include/sys/capability.h $(INCDIR)/sys
+ 	mkdir -p -m 0755 $(LIBDIR)
+ 	install -m 0644 $(STALIBNAME) $(LIBDIR)/$(STALIBNAME)
+-	install -m 0644 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
++	install -m 0755 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
+ 	ln -sf $(MINLIBNAME) $(LIBDIR)/$(MAJLIBNAME)
+ 	ln -sf $(MAJLIBNAME) $(LIBDIR)/$(LIBNAME)
+ ifeq ($(FAKEROOT),)
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index d4f8f17..9357df1 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -1,27 +1,36 @@
-LIBCAP_VERSION=2.19
-LIBCAP_SOURCE=libcap-$(LIBCAP_VERSION).tar.bz2
-LIBCAP_SITE=http://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/
-LIBCAP_INSTALL_STAGING=YES
+#############################################################
+#
+# libcap
+#
+#############################################################
+
+LIBCAP_VERSION = 2.20
+LIBCAP_SITE = http://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
+LIBCAP_INSTALL_STAGING = YES
 
 define LIBCAP_BUILD_CMDS
- $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) LIBATTR=no
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		LIBATTR=no BUILD_CC="$(HOSTCC)" BUILD_CFLAGS="$(HOST_CFLAGS)"
 endef
 
 define LIBCAP_INSTALL_STAGING_CMDS
- $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(STAGING_DIR) prefix=/usr lib=lib install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(STAGING_DIR) \
+		prefix=/usr lib=lib install
 endef
 
 define LIBCAP_INSTALL_TARGET_CMDS
- $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib install
- rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,capsh getpcaps)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(TARGET_DIR) \
+		prefix=/usr lib=lib install
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,capsh getpcaps)
 endef
 
 define HOST_LIBCAP_BUILD_CMDS
- $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) LIBATTR=no
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) LIBATTR=no
 endef
 
 define HOST_LIBCAP_INSTALL_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(HOST_DIR) prefix=/usr lib=lib install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(HOST_DIR) \
+		prefix=/usr lib=lib install
 endef
 
 $(eval $(call GENTARGETS,package,libcap))
-- 
1.7.3.4
