From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 21:53:51 +0100
Subject: [Buildroot] [git commit] package/haproxy: bump to version 1.9.1
Message-ID: <20190113211926.D291183667@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14cb4d2ab35b6a94b61888b9ff8b4f0300bbaae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch and tweak haproxy.mk to adapt pcre-config/pcre2-config
workaround with upstream solution.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-Allow-configuration-of-pcre-config-path.patch | 56 ----------------------
 package/haproxy/haproxy.hash                       |  2 +-
 package/haproxy/haproxy.mk                         |  8 ++--
 3 files changed, 5 insertions(+), 61 deletions(-)

diff --git a/package/haproxy/0001-Allow-configuration-of-pcre-config-path.patch b/package/haproxy/0001-Allow-configuration-of-pcre-config-path.patch
deleted file mode 100644
index 21f36520df..0000000000
--- a/package/haproxy/0001-Allow-configuration-of-pcre-config-path.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From f3dcdf6c9ffea4d9b89dca9706a48c44bd76c470 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 28 Sep 2018 19:21:26 +0200
-Subject: [PATCH] Allow configuration of pcre-config path
-
-Add PCRE_CONFIGDIR variable to allow the user to configure path of
-pcre-config or pcre-config2 instead of using the one in his path.
-This is particular useful when cross-compiling.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 382f944f..7c31f1ba 100644
---- a/Makefile
-+++ b/Makefile
-@@ -78,6 +78,7 @@
- # Other variables :
- #   DLMALLOC_SRC   : build with dlmalloc, indicate the location of dlmalloc.c.
- #   DLMALLOC_THRES : should match PAGE_SIZE on every platform (default: 4096).
-+#   PCRE_CONFIGDIR : force the path to pcre-config or pcre-config2
- #   PCREDIR        : force the path to libpcre.
- #   PCRE_LIB       : force the lib path to libpcre (defaults to $PCREDIR/lib).
- #   PCRE_INC       : force the include path to libpcre ($PCREDIR/inc)
-@@ -734,7 +735,7 @@ endif
- # Forcing PCREDIR to an empty string will let the compiler use the default
- # locations.
- 
--PCREDIR	        := $(shell pcre-config --prefix 2>/dev/null || echo /usr/local)
-+PCREDIR	        := $(shell $(PCRE_CONFIGDIR)pcre-config --prefix 2>/dev/null || echo /usr/local)
- ifneq ($(PCREDIR),)
- PCRE_INC        := $(PCREDIR)/include
- PCRE_LIB        := $(PCREDIR)/lib
-@@ -759,7 +760,7 @@ endif
- endif
- 
- ifneq ($(USE_PCRE2)$(USE_STATIC_PCRE2)$(USE_PCRE2_JIT),)
--PCRE2DIR	:= $(shell pcre2-config --prefix 2>/dev/null || echo /usr/local)
-+PCRE2DIR	:= $(shell $(PCRE_CONFIGDIR)pcre2-config --prefix 2>/dev/null || echo /usr/local)
- ifneq ($(PCRE2DIR),)
- PCRE2_INC       := $(PCRE2DIR)/include
- PCRE2_LIB       := $(PCRE2DIR)/lib
-@@ -777,7 +778,7 @@ endif
- endif
- 
- 
--PCRE2_LDFLAGS	:= $(shell pcre2-config --libs$(PCRE2_WIDTH) 2>/dev/null || echo -L/usr/local/lib -lpcre2-$(PCRE2_WIDTH))
-+PCRE2_LDFLAGS	:= $(shell $(PCRE_CONFIGDIR)pcre2-config --libs$(PCRE2_WIDTH) 2>/dev/null || echo -L/usr/local/lib -lpcre2-$(PCRE2_WIDTH))
- 
- ifeq ($(PCRE2_LDFLAGS),)
- $(error libpcre2-$(PCRE2_WIDTH) not found)
--- 
-2.17.1
-
diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index f62c340948..be3451d83b 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256	b17e402578be85e58af7a3eac99b1f675953bea9f67af2e964cf8bdbd1bd3fdf	haproxy-1.8.14.tar.gz
+sha256	ad46312fa1e38763863807d2c9304551c28ad91cff83f0c21a36756913c1c8e1	haproxy-1.9.1.tar.gz
 sha256	0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28	LICENSE
 sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	doc/lgpl.txt
 sha256	ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7	doc/gpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 061a8cbbaf..e382f61f8e 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HAPROXY_VERSION_MAJOR = 1.8
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).14
+HAPROXY_VERSION_MAJOR = 1.9
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).1
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
@@ -48,12 +48,12 @@ endif
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 HAPROXY_DEPENDENCIES += pcre2
 HAPROXY_MAKE_OPTS += \
-	PCRE_CONFIGDIR=$(STAGING_DIR)/usr/bin/ \
+	PCRE2_CONFIG=$(STAGING_DIR)/usr/bin/pcre2-config \
 	USE_PCRE2=1
 else ifeq ($(BR2_PACKAGE_PCRE),y)
 HAPROXY_DEPENDENCIES += pcre
 HAPROXY_MAKE_OPTS += \
-	PCRE_CONFIGDIR=$(STAGING_DIR)/usr/bin/ \
+	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config \
 	USE_PCRE=1
 endif
 
