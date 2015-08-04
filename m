From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  4 Aug 2015 11:57:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/poco: bump to version 1.6.1
Message-ID: <1438682248-29767-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:
  * switch from sourceforge to github
  * remove hash (github-helper)
  * remove upstream applied patches
  * re-number remaining patches
  * add patch to fix build issue with `--bundled` config option

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/poco/0001-aarch64.patch                    | 39 ----------
 ...-poco-add-the-staging-path-to-search-path.patch | 38 ++++++++++
 package/poco/0002-add-cross-build-config.patch     | 82 ----------------------
 .../0002-poco-don-t-build-debug-libraries.patch    | 33 +++++++++
 ...nflicting-declaration-with-unbundled-pcre.patch | 56 +++++++++++++++
 package/poco/0003-add-staging-search-path.patch    | 23 ------
 package/poco/0004-dont-build-debug-libs.patch      | 19 -----
 package/poco/poco.hash                             |  4 +-
 package/poco/poco.mk                               | 10 ++-
 9 files changed, 133 insertions(+), 171 deletions(-)
 delete mode 100644 package/poco/0001-aarch64.patch
 create mode 100644 package/poco/0001-poco-add-the-staging-path-to-search-path.patch
 delete mode 100644 package/poco/0002-add-cross-build-config.patch
 create mode 100644 package/poco/0002-poco-don-t-build-debug-libraries.patch
 create mode 100644 package/poco/0003-Fix-conflicting-declaration-with-unbundled-pcre.patch
 delete mode 100644 package/poco/0003-add-staging-search-path.patch
 delete mode 100644 package/poco/0004-dont-build-debug-libs.patch

diff --git a/package/poco/0001-aarch64.patch b/package/poco/0001-aarch64.patch
deleted file mode 100644
index f629f7b..0000000
--- a/package/poco/0001-aarch64.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 37899eda9563d9134cb5864751b6432cabfaac3e Mon Sep 17 00:00:00 2001
-From: Will Newton <will.newton@linaro.org>
-Date: Tue, 21 May 2013 22:11:05 +0100
-Subject: [PATCH] Foundation/include/Poco/Platform.h: Add support for AArch64.
-
-Add support for big and little endian AArch64 preprocessor defines.
----
- Foundation/include/Poco/Platform.h | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/Foundation/include/Poco/Platform.h b/Foundation/include/Poco/Platform.h
-index f34f277..8ddb4cb 100644
---- a/Foundation/include/Poco/Platform.h
-+++ b/Foundation/include/Poco/Platform.h
-@@ -145,6 +145,7 @@
- #define POCO_ARCH_S390    0x0c
- #define POCO_ARCH_SH      0x0d
- #define POCO_ARCH_NIOS2   0x0e
-+#define POCO_ARCH_AARCH64 0x0f
- 
- 
- #if defined(__ALPHA) || defined(__alpha) || defined(__alpha__) || defined(_M_ALPHA)
-@@ -207,7 +208,12 @@
- 	#else
- 		#define POCO_ARCH_BIG_ENDIAN 1
- 	#endif
--
-+#elif defined(__AARCH64EL__)
-+	#define POCO_ARCH POCO_ARCH_AARCH64
-+	#define POCO_ARCH_LITTLE_ENDIAN 1
-+#elif defined(__AARCH64EB__)
-+	#define POCO_ARCH POCO_ARCH_AARCH64
-+	#define POCO_ARCH_BIG_ENDIAN 1
- #endif
- 
- 
--- 
-1.8.1.4
-
diff --git a/package/poco/0001-poco-add-the-staging-path-to-search-path.patch b/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
new file mode 100644
index 0000000..5695b62
--- /dev/null
+++ b/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
@@ -0,0 +1,38 @@
+From b8417607ec8840e6a1e27cf03b6958c794a33e49 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 4 Aug 2015 10:14:00 +0200
+Subject: [PATCH 1/2] poco: add the staging path to search path
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Add the mysql headers and client libraries to the search path of the
+preprocessor and the linker. The $MYSQL_LIBDIR / $MYSQL_INCIDR variables
+must be set from the make command line.
+
+[Peter: Remove host dirs, add MYSQL_INCDIR]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[J?rg: Update to version 1.6.1 from github]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ Data/MySQL/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Data/MySQL/Makefile b/Data/MySQL/Makefile
+index 0b18ca5..094e807 100644
+--- a/Data/MySQL/Makefile
++++ b/Data/MySQL/Makefile
+@@ -8,8 +8,8 @@
+ 
+ include $(POCO_BASE)/build/rules/global
+ 
+-SYSLIBS += -L/usr/local/lib$(LIB64SUFFIX)/mysql -L/usr/lib$(LIB64SUFFIX)/mysql -L/usr/mysql/lib$(LIB64SUFFIX) -L/usr/mysql/lib$(LIB64SUFFIX)/mysql -L/usr/local/mysql/lib$(LIB64SUFFIX) -lmysqlclient
+-INCLUDE += -I/usr/local/include/mysql/ -I/usr/include/mysql/ -I/usr/mysql/include/mysql -I/usr/local/mysql/include
++SYSLIBS += -L$(MYSQL_LIBDIR) -lmysqlclient
++INCLUDE += -I$(MYSQL_INCDIR)
+ SYSFLAGS += -DTHREADSAFE -DNO_TCL
+ 
+ objects = Binder Extractor SessionImpl Connector \
+-- 
+2.5.0
+
diff --git a/package/poco/0002-add-cross-build-config.patch b/package/poco/0002-add-cross-build-config.patch
deleted file mode 100644
index a087838..0000000
--- a/package/poco/0002-add-cross-build-config.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From: Baruch Siach <baruch@tkos.co.il>
-Subject: [PATCH] poco: add Linux configuration file for generic cross build
-
-This patch adds the Linux-CrossEnv config file to poco. This file is identical
-to the Linux one, except the added CROSSENV variable that allows setting of
-the toolchain prefix.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-diff -Nuar poco-1.4.1p1-dist/build/config/Linux-CrossEnv poco-1.4.1p1/build/config/Linux-CrossEnv
---- poco-1.4.1p1-dist/build/config/Linux-CrossEnv	1970-01-01 02:00:00.000000000 +0200
-+++ poco-1.4.1p1/build/config/Linux-CrossEnv	2011-08-02 18:51:03.682047719 +0300
-@@ -0,0 +1,69 @@
-+#
-+# Linux
-+#
-+# Make settings for cross compiled Linux
-+#
-+#
-+
-+#
-+# General Settings
-+#
-+LINKMODE ?= SHARED
-+
-+#
-+# Define Tools
-+#
-+CC      = $(CROSSENV)gcc
-+CXX     = $(CROSSENV)g++
-+LINK    = $(CXX)
-+LIB     = $(CROSSENV)ar -cr
-+RANLIB  = $(CROSSENV)ranlib
-+SHLIB   = $(CXX) -shared -Wl,-soname,$(notdir $@) -o $@
-+SHLIBLN = $(POCO_BASE)/build/script/shlibln
-+STRIP   = $(CROSSENV)strip
-+DEP     = $(POCO_BASE)/build/script/makedepend.gcc 
-+SHELL   = sh
-+RM      = rm -rf
-+CP      = cp
-+MKDIR   = mkdir -p
-+
-+#
-+# Extension for Shared Libraries
-+#
-+SHAREDLIBEXT     = .so.$(target_version)
-+SHAREDLIBLINKEXT = .so
-+
-+#
-+# Compiler and Linker Flags
-+#
-+CFLAGS          = 
-+CFLAGS32        =
-+CFLAGS64        =
-+CXXFLAGS        = -Wall -Wno-sign-compare
-+CXXFLAGS32      =
-+CXXFLAGS64      =
-+LINKFLAGS       =
-+LINKFLAGS32     =
-+LINKFLAGS64     =
-+STATICOPT_CC    =
-+STATICOPT_CXX   =
-+STATICOPT_LINK  = -static
-+SHAREDOPT_CC    = -fPIC
-+SHAREDOPT_CXX   = -fPIC
-+SHAREDOPT_LINK  = -Wl,-rpath,$(LIBPATH)
-+DEBUGOPT_CC     = -g -D_DEBUG
-+DEBUGOPT_CXX    = -g -D_DEBUG
-+DEBUGOPT_LINK   = -g
-+RELEASEOPT_CC   = -O2 -DNDEBUG
-+RELEASEOPT_CXX  = -O2 -DNDEBUG
-+RELEASEOPT_LINK = -O2
-+
-+#
-+# System Specific Flags
-+#
-+SYSFLAGS = -D_XOPEN_SOURCE=500 -D_REENTRANT -D_THREAD_SAFE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DPOCO_HAVE_FD_EPOLL
-+
-+#
-+# System Specific Libraries
-+#
-+SYSLIBS  = -lpthread -ldl -lrt
diff --git a/package/poco/0002-poco-don-t-build-debug-libraries.patch b/package/poco/0002-poco-don-t-build-debug-libraries.patch
new file mode 100644
index 0000000..11bb7e9
--- /dev/null
+++ b/package/poco/0002-poco-don-t-build-debug-libraries.patch
@@ -0,0 +1,33 @@
+From e84c85cfa6742becbd4f82047ce92290bb3ec19a Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 4 Aug 2015 10:15:17 +0200
+Subject: [PATCH 2/2] poco: don't build debug libraries
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Remove the debug libraries build dependency from the default target.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[J?rg: Update to version 1.6.1 from github]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ build/rules/compile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/rules/compile b/build/rules/compile
+index 1945e3c..e0d7fbc 100644
+--- a/build/rules/compile
++++ b/build/rules/compile
+@@ -14,7 +14,7 @@
+ 
+ all: $(DEFAULT_TARGET)
+ all_static: static_debug static_release
+-all_shared: shared_debug shared_release
++all_shared: shared_release
+ all_debug: static_debug shared_debug
+ all_release: static_release shared_release
+ 
+-- 
+2.5.0
+
diff --git a/package/poco/0003-Fix-conflicting-declaration-with-unbundled-pcre.patch b/package/poco/0003-Fix-conflicting-declaration-with-unbundled-pcre.patch
new file mode 100644
index 0000000..669e53a
--- /dev/null
+++ b/package/poco/0003-Fix-conflicting-declaration-with-unbundled-pcre.patch
@@ -0,0 +1,56 @@
+From 4e1165e1081e75de842567b16ae963cbed54e2a3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 4 Aug 2015 11:09:12 +0200
+Subject: [PATCH 3/3] Fix conflicting declaration with unbundled pcre
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Building poco 1.6.1 with the `--unbundled` config options fails due to an
+conflicting declaration of `pcre`:
+
+```sh
+In file included from src/RegularExpression.cpp:21:0:
+/usr/include/pcre.h:325:26: error: conflicting declaration ?typedef struct real_pcre pcre?
+ typedef struct real_pcre pcre;
+                          ^
+In file included from src/RegularExpression.cpp:17:0:
+include/Poco/RegularExpression.h:37:34: note: previous declaration as ?typedef struct real_pcre8_or_16 pcre?
+  typedef struct real_pcre8_or_16 pcre;
+```
+
+Upstream status:
+https://github.com/pocoproject/poco/pull/897
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ Foundation/include/Poco/RegularExpression.h | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/Foundation/include/Poco/RegularExpression.h b/Foundation/include/Poco/RegularExpression.h
+index e1bc063..989ed52 100644
+--- a/Foundation/include/Poco/RegularExpression.h
++++ b/Foundation/include/Poco/RegularExpression.h
+@@ -26,7 +26,9 @@
+ #include "Poco/Foundation.h"
+ #include <vector>
+ 
+-
++#if defined(POCO_UNBUNDLED)
++#include <pcre.h>
++#else
+ //
+ // Copy these definitions from pcre.h
+ // to avoid pulling in the entire header file
+@@ -37,7 +39,7 @@ extern "C"
+ 	typedef struct real_pcre8_or_16 pcre;
+ 	struct pcre_extra;
+ }
+-
++#endif
+ 
+ namespace Poco {
+ 
+-- 
+2.5.0
+
diff --git a/package/poco/0003-add-staging-search-path.patch b/package/poco/0003-add-staging-search-path.patch
deleted file mode 100644
index a9397b4..0000000
--- a/package/poco/0003-add-staging-search-path.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From: Baruch Siach <baruch@tkos.co.il>
-Subject: [PATCH] poco: add the staging path to search path
-
-Add the mysql headers and client libraries to the search path of the
-preprocessor and the linker. The $MYSQL_LIBDIR / $MYSQL_INCIDR variables
-must be set from the make command line.
-
-[Peter: Remove host dirs, add MYSQL_INCDIR]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---- 
---- poco-1.4.4-all-dist/Data/MySQL/Makefile	2012-09-20 01:30:42.000000000 +0300
-+++ poco-1.4.4-all/Data/MySQL/Makefile	2012-10-11 14:36:10.343153420 +0200
-@@ -8,8 +8,8 @@
- 
- include $(POCO_BASE)/build/rules/global
- 
--SYSLIBS += -L/usr/local/lib$(LIB64SUFFIX)/mysql -L/usr/lib$(LIB64SUFFIX)/mysql -L/usr/mysql/lib$(LIB64SUFFIX)/mysql -L/usr/local/mysql/lib$(LIB64SUFFIX) -lmysqlclient
--INCLUDE += -I/usr/local/include/mysql/ -I/usr/include/mysql -I/usr/mysql/include/mysql -I/usr/local/mysql/include
-+SYSLIBS += -L$(MYSQL_LIBDIR) -lmysqlclient
-+INCLUDE += -I$(MYSQL_INCDIR)
- SYSFLAGS += -DTHREADSAFE -DNO_TCL
- 
- objects = Binder Extractor SessionImpl Connector \
diff --git a/package/poco/0004-dont-build-debug-libs.patch b/package/poco/0004-dont-build-debug-libs.patch
deleted file mode 100644
index 7480963..0000000
--- a/package/poco/0004-dont-build-debug-libs.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-From: Baruch Siach <baruch@tkos.co.il>
-Subject: [PATCH] poco: don't build debug libraries
-
-Remove the debug libraries build dependency from the default target.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
---- poco-1.4.1p1-dist/build/rules/compile	2011-02-09 11:12:24.000000000 +0200
-+++ poco-1.4.1p1/build/rules/compile	2011-08-03 07:51:42.946044176 +0300
-@@ -14,7 +14,7 @@
- 
- all: $(DEFAULT_TARGET)
- all_static: static_debug static_release
--all_shared: shared_debug shared_release
-+all_shared: shared_release
- all_debug: static_debug shared_debug
- all_release: static_release shared_release
- 
diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 957293d..806f5b7 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  6791c35e790b055ae9c55abe0bccc453e9616f0183d85a1eeea69ad084e994fe  poco-1.4.6p1-all.tar.gz
+# No hash for poco, comes from the github-helper:
+none  xxx  poco-poco-1.6.1-release.tar.gz
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 7233d43..580ee9e 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-POCO_VERSION_MAJOR = 1.4.6
-POCO_VERSION = $(POCO_VERSION_MAJOR)p1
-POCO_SOURCE = poco-$(POCO_VERSION)-all.tar.gz
-POCO_SITE = http://downloads.sourceforge.net/project/poco/sources/poco-$(POCO_VERSION_MAJOR)
+POCO_VERSION = poco-1.6.1-release
+POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION))
 POCO_LICENSE = Boost-v1.0
 POCO_LICENSE_FILES = LICENSE
 POCO_INSTALL_STAGING = YES
@@ -41,7 +39,7 @@ endif
 
 define POCO_CONFIGURE_CMDS
 	(cd $(@D); ./configure \
-		--config=Linux-CrossEnv	\
+		--config=Linux		\
 		--prefix=/usr		\
 		--omit="$(POCO_OMIT)"	\
 		$(POCO_CONF_OPTS)	\
@@ -51,7 +49,7 @@ define POCO_CONFIGURE_CMDS
 endef
 
 define POCO_BUILD_CMDS
-	$(MAKE1) POCO_TARGET_OSARCH=$(ARCH) CROSSENV=$(TARGET_CROSS) \
+	$(MAKE1) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
 		MYSQL_LIBDIR=$(STAGING_DIR)/usr/lib/mysql \
 		MYSQL_INCDIR=$(STAGING_DIR)/usr/include/mysql -C $(@D)
 endef
-- 
2.5.0
