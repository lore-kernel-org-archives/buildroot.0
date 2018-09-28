From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 28 Sep 2018 19:34:19 +0200
Subject: [Buildroot] [PATCH 1/1] haproxy: fix build with pcre2
Message-ID: <20180928173419.9122-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to customize path to pcre-config or pcre2-config instead of
messing with PCREDIR, PCRE2DIR and PCRE2_LDFLAGS variables

Fixes:
 - http://autobuild.buildroot.net/results/490bc87b43074623d2338cfd2acb77d5de0abaa6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ow-configuration-of-pcre-config-path.patch | 56 +++++++++++++++++++
 package/haproxy/haproxy.mk                    | 15 +----
 2 files changed, 58 insertions(+), 13 deletions(-)
 create mode 100644 package/haproxy/0001-Allow-configuration-of-pcre-config-path.patch

diff --git a/package/haproxy/0001-Allow-configuration-of-pcre-config-path.patch b/package/haproxy/0001-Allow-configuration-of-pcre-config-path.patch
new file mode 100644
index 0000000000..21f36520df
--- /dev/null
+++ b/package/haproxy/0001-Allow-configuration-of-pcre-config-path.patch
@@ -0,0 +1,56 @@
+From f3dcdf6c9ffea4d9b89dca9706a48c44bd76c470 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 28 Sep 2018 19:21:26 +0200
+Subject: [PATCH] Allow configuration of pcre-config path
+
+Add PCRE_CONFIGDIR variable to allow the user to configure path of
+pcre-config or pcre-config2 instead of using the one in his path.
+This is particular useful when cross-compiling.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 382f944f..7c31f1ba 100644
+--- a/Makefile
++++ b/Makefile
+@@ -78,6 +78,7 @@
+ # Other variables :
+ #   DLMALLOC_SRC   : build with dlmalloc, indicate the location of dlmalloc.c.
+ #   DLMALLOC_THRES : should match PAGE_SIZE on every platform (default: 4096).
++#   PCRE_CONFIGDIR : force the path to pcre-config or pcre-config2
+ #   PCREDIR        : force the path to libpcre.
+ #   PCRE_LIB       : force the lib path to libpcre (defaults to $PCREDIR/lib).
+ #   PCRE_INC       : force the include path to libpcre ($PCREDIR/inc)
+@@ -734,7 +735,7 @@ endif
+ # Forcing PCREDIR to an empty string will let the compiler use the default
+ # locations.
+ 
+-PCREDIR	        := $(shell pcre-config --prefix 2>/dev/null || echo /usr/local)
++PCREDIR	        := $(shell $(PCRE_CONFIGDIR)pcre-config --prefix 2>/dev/null || echo /usr/local)
+ ifneq ($(PCREDIR),)
+ PCRE_INC        := $(PCREDIR)/include
+ PCRE_LIB        := $(PCREDIR)/lib
+@@ -759,7 +760,7 @@ endif
+ endif
+ 
+ ifneq ($(USE_PCRE2)$(USE_STATIC_PCRE2)$(USE_PCRE2_JIT),)
+-PCRE2DIR	:= $(shell pcre2-config --prefix 2>/dev/null || echo /usr/local)
++PCRE2DIR	:= $(shell $(PCRE_CONFIGDIR)pcre2-config --prefix 2>/dev/null || echo /usr/local)
+ ifneq ($(PCRE2DIR),)
+ PCRE2_INC       := $(PCRE2DIR)/include
+ PCRE2_LIB       := $(PCRE2DIR)/lib
+@@ -777,7 +778,7 @@ endif
+ endif
+ 
+ 
+-PCRE2_LDFLAGS	:= $(shell pcre2-config --libs$(PCRE2_WIDTH) 2>/dev/null || echo -L/usr/local/lib -lpcre2-$(PCRE2_WIDTH))
++PCRE2_LDFLAGS	:= $(shell $(PCRE_CONFIGDIR)pcre2-config --libs$(PCRE2_WIDTH) 2>/dev/null || echo -L/usr/local/lib -lpcre2-$(PCRE2_WIDTH))
+ 
+ ifeq ($(PCRE2_LDFLAGS),)
+ $(error libpcre2-$(PCRE2_WIDTH) not found)
+-- 
+2.17.1
+
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 5fc7a945b5..a799e69651 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -37,26 +37,15 @@ endif
 endif
 
 # pcre and pcre2 can't be enabled at the same time so prefer pcre2
-# Set PCRE2_DIR as haproxy will otherwise try to use pcre2-config and
-# will default to /usr/local
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 HAPROXY_DEPENDENCIES += pcre2
 HAPROXY_MAKE_OPTS += \
-	PCRE2DIR=$(STAGING_DIR)/usr \
+	PCRE_CONFIGDIR=$(STAGING_DIR)/usr/bin/ \
 	USE_PCRE2=1
-
-# Again, set manually PCRE2_LDFLAGS or default will contain -L/usr/local
-ifeq ($(BR2_PACKAGE_PCRE2_32),y)
-HAPROXY_MAKE_OPTS += PCRE2_LDFLAGS=-lpcre2-32
-else ifeq ($(BR2_PACKAGE_PCRE2_16),y)
-HAPROXY_MAKE_OPTS += PCRE2_LDFLAGS=-lpcre2-16
-else
-HAPROXY_MAKE_OPTS += PCRE2_LDFLAGS=-lpcre2-8
-endif
 else ifeq ($(BR2_PACKAGE_PCRE),y)
 HAPROXY_DEPENDENCIES += pcre
 HAPROXY_MAKE_OPTS += \
-	PCREDIR=$(STAGING_DIR)/usr \
+	PCRE_CONFIGDIR=$(STAGING_DIR)/usr/bin/ \
 	USE_PCRE=1
 endif
 
-- 
2.17.1
