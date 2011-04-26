From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Apr 2011 20:58:30 +0200
Subject: [Buildroot] [git commit] libcap: bump to version 2.20
Message-ID: <20110426190218.224B082A63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=efae605c88deb15d9c50fd67bdd80f46a78b06c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump libcap to version 2.20 and adjust style to match buildroot's
defacto standard.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...system.patch => libcap-2.20-build-system.patch} |   41 +++++++++-----------
 package/libcap/libcap.mk                           |   30 ++++++++++-----
 2 files changed, 38 insertions(+), 33 deletions(-)
 rename package/libcap/{libcap-2.19-build-system.patch => libcap-2.20-build-system.patch} (57%)

diff --git a/package/libcap/libcap-2.19-build-system.patch b/package/libcap/libcap-2.20-build-system.patch
similarity index 57%
rename from package/libcap/libcap-2.19-build-system.patch
rename to package/libcap/libcap-2.20-build-system.patch
index f548726..397aff2 100644
--- a/package/libcap/libcap-2.19-build-system.patch
+++ b/package/libcap/libcap-2.20-build-system.patch
@@ -1,9 +1,14 @@
-diff -Nura libcap-2.19.orig/Make.Rules libcap-2.19/Make.Rules
---- libcap-2.19.orig/Make.Rules	2010-01-13 23:04:58.000000000 -0300
-+++ libcap-2.19/Make.Rules	2010-12-28 16:44:18.164052748 -0300
-@@ -45,25 +45,26 @@
+Avoid the libcap buildsys forcing CC/CFLAGS/LDFLAGS/AR/RANLIB
+Also install the shared lib +x
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura libcap-2.20/Make.Rules libcap-2.20-build/Make.Rules
+--- libcap-2.20/Make.Rules	2011-01-19 02:06:44.000000000 -0300
++++ libcap-2.20-build/Make.Rules	2011-04-19 14:07:53.544903094 -0300
+@@ -47,25 +47,25 @@
  KERNEL_HEADERS := $(topdir)/libcap/include
- IPATH += -I$(topdir)/libcap/include -I$(KERNEL_HEADERS)
+ IPATH += -fPIC -I$(topdir)/libcap/include -I$(KERNEL_HEADERS)
  
 -CC := gcc
 -CFLAGS := -O2
@@ -13,12 +18,12 @@ diff -Nura libcap-2.19.orig/Make.Rules libcap-2.19/Make.Rules
 -RANLIB := ranlib
 +CC ?= gcc
 +CFLAGS ?= -O2
-+CC_FOR_BUILD ?= $(CC)
-+CFLAGS_FOR_BUILD ?= $(CFLAGS)
++BUILD_CC ?= $(CC)
++BUILD_CFLAGS ?= $(CFLAGS) $(IPATH)
 +AR ?= ar
 +RANLIB ?= ranlib
  DEBUG = -g #-DDEBUG
- WARNINGS=-fPIC -Wall -Wwrite-strings \
+ WARNINGS=-Wall -Wwrite-strings \
          -Wpointer-arith -Wcast-qual -Wcast-align \
          -Wstrict-prototypes -Wmissing-prototypes \
          -Wnested-externs -Winline -Wshadow
@@ -29,25 +34,15 @@ diff -Nura libcap-2.19.orig/Make.Rules libcap-2.19/Make.Rules
  SYSTEM_HEADERS = /usr/include
  INCS=$(topdir)/libcap/include/sys/capability.h
  LDFLAGS += -L$(topdir)/libcap
- CFLAGS += -Dlinux $(WARNINGS) $(DEBUG) $(IPATH)
+ CFLAGS += -Dlinux $(WARNINGS) $(DEBUG)
 -PAM_CAP := $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
-+CFLAGS_FOR_BUILD += $(IPATH)
-+PAM_CAP := no
++PAM_CAP = no
  INDENT := $(shell if [ -n "$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
  DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
  LIBATTR := yes
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
+diff -Nura libcap-2.20/libcap/Makefile libcap-2.20-build/libcap/Makefile
+--- libcap-2.20/libcap/Makefile	2010-08-08 19:26:04.000000000 -0300
++++ libcap-2.20-build/libcap/Makefile	2011-04-19 14:08:29.377146094 -0300
 @@ -65,7 +65,7 @@
  	install -m 0644 include/sys/capability.h $(INCDIR)/sys
  	mkdir -p -m 0755 $(LIBDIR)
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index d4f8f17..458f8e8 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -1,27 +1,37 @@
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
+LIBCAP_DEPENDENCIES = host-libcap
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
