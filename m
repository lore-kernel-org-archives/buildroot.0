From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] libcap: new package
Message-ID: <20100409142123.1B21F20E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7ec49b9af7eef4cb43615e58e7f166fddaae94e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed as a dependency of cdrkit, which contains genisomage, useful
for generating ISO9660 filesystem images.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                             |    1 +
 package/libcap/Config.in                      |   10 +++++
 package/libcap/libcap-2.19-build-system.patch |   55 +++++++++++++++++++++++++
 package/libcap/libcap.mk                      |   27 ++++++++++++
 4 files changed, 93 insertions(+), 0 deletions(-)
 create mode 100644 package/libcap/Config.in
 create mode 100644 package/libcap/libcap-2.19-build-system.patch
 create mode 100644 package/libcap/libcap.mk

diff --git a/package/Config.in b/package/Config.in
index a742063..f3f4213 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -295,6 +295,7 @@ source "package/libupnp/Config.in"
 endmenu
 
 menu "Other"
+source "package/libcap/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
diff --git a/package/libcap/Config.in b/package/libcap/Config.in
new file mode 100644
index 0000000..f1fc8fa
--- /dev/null
+++ b/package/libcap/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBCAP
+	bool "libcap"
+	help
+	 This library implements the user-space interfaces to the
+	 POSIX 1003.1e capabilities available in Linux kernels. These
+	 capabilities are a partitioning of the all powerful root
+	 privilege into a set of distinct privileges.
+
+	 http://sites.google.com/site/fullycapable/
+
diff --git a/package/libcap/libcap-2.19-build-system.patch b/package/libcap/libcap-2.19-build-system.patch
new file mode 100644
index 0000000..42a5518
--- /dev/null
+++ b/package/libcap/libcap-2.19-build-system.patch
@@ -0,0 +1,55 @@
+---
+ Make.Rules      |   15 ++++++++-------
+ libcap/Makefile |    2 +-
+ 2 files changed, 9 insertions(+), 8 deletions(-)
+
+Index: libcap-2.19/Make.Rules
+===================================================================
+--- libcap-2.19.orig/Make.Rules
++++ libcap-2.19/Make.Rules
+@@ -45,24 +45,25 @@
+ KERNEL_HEADERS := $(topdir)/libcap/include
+ IPATH += -I$(topdir)/libcap/include -I$(KERNEL_HEADERS)
+ 
+-CC := gcc
+-CFLAGS := -O2
+-BUILD_CC := $(CC)
+-BUILD_CFLAGS := $(CFLAGS) $(IPATH)
+-AR := ar
+-RANLIB := ranlib
++CC ?= gcc
++CFLAGS ?= -O2
++CC_FOR_BUILD ?= $(CC)
++CFLAGS_FOR_BUILD ?= $(CFLAGS)
++AR ?= ar
++RANLIB ?= ranlib
+ DEBUG = -g #-DDEBUG
+ WARNINGS=-fPIC -Wall -Wwrite-strings \
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
+ CFLAGS += -Dlinux $(WARNINGS) $(DEBUG) $(IPATH)
++CFLAGS_FOR_BUILD += $(IPATH)
+ PAM_CAP := $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
+ INDENT := $(shell if [ -n "$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
+ DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
+Index: libcap-2.19/libcap/Makefile
+===================================================================
+--- libcap-2.19.orig/libcap/Makefile
++++ libcap-2.19/libcap/Makefile
+@@ -33,7 +33,7 @@
+ endif
+ 
+ _makenames: _makenames.c cap_names.list.h
+-	$(BUILD_CC) $(BUILD_CFLAGS) $< -o $@
++	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $< -o $@
+ 
+ cap_names.h: _makenames
+ 	./_makenames > cap_names.h
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
new file mode 100644
index 0000000..3ea5e51
--- /dev/null
+++ b/package/libcap/libcap.mk
@@ -0,0 +1,27 @@
+LIBCAP_VERSION=2.19
+LIBCAP_SOURCE=libcap-$(LIBCAP_VERSION).tar.bz2
+LIBCAP_SITE=http://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/
+LIBCAP_INSTALL_STAGING=YES
+
+define LIBCAP_BUILD_CMDS
+ $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) LIBATTR=no
+endef
+
+define LIBCAP_INSTALL_STAGING_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(STAGING_DIR) install
+endef
+
+define LIBCAP_INSTALL_TARGET_CMDS
+ install -D $(STAGING_DIR)/usr/lib/libcap.so.* $(TARGET_DIR)/usr/lib
+endef
+
+define HOST_LIBCAP_BUILD_CMDS
+ $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) LIBATTR=no
+endef
+
+define HOST_LIBCAP_INSTALL_CMDS
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(HOST_DIR) install
+endef
+
+$(eval $(call GENTARGETS,package,libcap))
+$(eval $(call GENTARGETS,package,libcap,host))
-- 
1.6.3.3
