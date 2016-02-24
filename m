From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Feb 2016 14:38:48 -0300
Subject: [Buildroot] [PATCH v2] zmqpp: bmp to version 4.1.2
Message-ID: <1456335528-14127-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop 0001-add-cstdlib-header-to-ensure-EXIT_FAILURE-presence.patch since
it's already upstream.

Rebase shared/static build patches - these look unnecessary if we switch
to cmake-package, however it seems to require the zmq package switches
to cmake-package as well since static library naming looks different,
which might be a problem for users.

Also set the minimum required version of gcc to 4.7.x since the code now
requires c++1x.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
v2: adjust patch install step for shared=y

 ...w-building-shared-or-static-library-only.patch} | 56 +++++++++++-----------
 ...ib-header-to-ensure-EXIT_FAILURE-presence.patch | 30 ------------
 ...Install-static-library-for-static-builds.patch} | 17 ++++---
 package/zmqpp/Config.in                            |  8 ++--
 package/zmqpp/zmqpp.hash                           |  3 +-
 package/zmqpp/zmqpp.mk                             |  4 +-
 6 files changed, 45 insertions(+), 73 deletions(-)
 rename package/zmqpp/{0002-Allow-building-shared-or-static-library-only.patch => 0001-Allow-building-shared-or-static-library-only.patch} (52%)
 delete mode 100644 package/zmqpp/0001-add-cstdlib-header-to-ensure-EXIT_FAILURE-presence.patch
 rename package/zmqpp/{0003-Install-static-library-for-static-builds.patch => 0002-Install-static-library-for-static-builds.patch} (60%)

diff --git a/package/zmqpp/0002-Allow-building-shared-or-static-library-only.patch b/package/zmqpp/0001-Allow-building-shared-or-static-library-only.patch
similarity index 52%
rename from package/zmqpp/0002-Allow-building-shared-or-static-library-only.patch
rename to package/zmqpp/0001-Allow-building-shared-or-static-library-only.patch
index 4eabf23..70caee8 100644
--- a/package/zmqpp/0002-Allow-building-shared-or-static-library-only.patch
+++ b/package/zmqpp/0001-Allow-building-shared-or-static-library-only.patch
@@ -1,42 +1,43 @@
-From 4c83dd96d1f92627ecdb6b6ed80b8c278aea82f7 Mon Sep 17 00:00:00 2001
+From 02ad67e60ef698ee47f6ee53b36e5b89c2fd71e7 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Fri, 20 Nov 2015 19:51:50 +0100
-Subject: [PATCH] Allow building shared or static library only
+Date: Wed, 24 Feb 2016 10:07:11 -0300
+Subject: [PATCH 1/2] Allow building shared or static library only
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
+[Gustavo: update for 4.1.2]
+
 Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
- Makefile | 19 ++++++++++++++++---
- 1 file changed, 16 insertions(+), 3 deletions(-)
+ Makefile | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 7d63077..90c7059 100644
+index 9df5996..86c8fac 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -57,6 +57,9 @@ LIBRARY_ARCHIVE = lib$(LIBRARY_NAME).a
- CLIENT_TARGET   = $(LIBRARY_NAME)
- TESTS_TARGET    = $(LIBRARY_NAME)-tests
+@@ -79,6 +79,8 @@ ifeq ($(UNAME_S),Darwin)
+ endif
+ 
  
-+BUILD_SHARED   ?= yes
 +BUILD_SHARED   ?= yes
 +
  CONFIG_FLAGS =
  ifeq ($(CONFIG),debug)
  	CONFIG_FLAGS = -g -fno-inline -ftemplate-depth-1000
-@@ -71,7 +74,7 @@ ifneq (,$(findstring $(CONFIG),release loadtest))
+@@ -93,13 +95,22 @@ ifneq (,$(findstring $(CONFIG),release loadtest))
  	CONFIG_FLAGS = -O3 -funroll-loops -ffast-math -finline-functions -fomit-frame-pointer -DNO_DEBUG_LOG -DNO_TRACE_LOG -DNDEBUG
  endif
  
--COMMON_FLAGS = -MMD -std=c++0x -pipe -Wall -fPIC \
-+COMMON_FLAGS = -MMD -std=c++0x -pipe -Wall \
+-COMMON_FLAGS = -MMD -std=c++11 -pipe -Wall -fPIC \
++COMMON_FLAGS = -MMD -std=c++11 -pipe -Wall \
  	-DBUILD_ENV=$(CONFIG) \
- 	-DBUILD_VERSION='"$(APP_VERSION)"' \
- 	-DBUILD_VERSION_MAJOR=$(VERSION_MAJOR) \
-@@ -82,6 +85,15 @@ COMMON_FLAGS = -MMD -std=c++0x -pipe -Wall -fPIC \
+ 	-DBUILD_DATESTAMP='$(APP_DATESTAMP)' \
+ 	-DBUILD_LIBRARY_NAME='"$(LIBRARY_NAME)"' \
  	-DBUILD_CLIENT_NAME='"$(CLIENT_TARGET)"' \
- 	-I$(SRC_PATH)
+ 	-I$(SRC_PATH) $(CUSTOM_INCLUDE_PATH)
  
 +ifeq ($(BUILD_SHARED),yes)
 +COMMON_FLAGS += -fPIC
@@ -49,20 +50,21 @@ index 7d63077..90c7059 100644
 +
  COMMON_LIBS = -lzmq
  
- LIBRARY_LIBS =  
-@@ -125,9 +137,11 @@ check: $(LIBRARY_SHARED) $(LIBRARY_ARCHIVE) test
- 
- install:
+ LIBRARY_LIBS =
+@@ -147,10 +158,11 @@ install:
+ 	mkdir -p $(INCLUDEDIR)/$(LIBRARY_DIR)
+ 	mkdir -p $(LIBDIR)
  	install -m 644 $(ALL_LIBRARY_INCLUDES) $(INCLUDEDIR)/$(LIBRARY_DIR)
 +ifeq ($(BUILD_SHARED),yes)
- 	install -m 755 $(BUILD_PATH)/$(LIBRARY_SHARED).$(VERSION_MAJOR) $(LIBDIR)/$(LIBRARY_SHARED).$(APP_VERSION)
- 	ln -sf $(LIBRARY_SHARED).$(APP_VERSION) $(LIBDIR)/$(LIBRARY_SHARED).$(VERSION_MAJOR)
- 	ln -sf $(LIBRARY_SHARED).$(APP_VERSION) $(LIBDIR)/$(LIBRARY_SHARED)
+ 	install -m 755 $(BUILD_PATH)/$(LIBRARY_VERSION_SHARED) $(LIBDIR)/$(LIBRARY_FULL_VERSION_SHARED)
+-	install -m 755 $(BUILD_PATH)/$(LIBRARY_ARCHIVE) $(LIBDIR)/$(LIBRARY_ARCHIVE)
+ 	ln -sf $(LIBRARY_FULL_VERSION_SHARED) $(LIBDIR)/$(LIBRARY_VERSION_SHARED)
+ 	ln -sf $(LIBRARY_FULL_VERSION_SHARED) $(LIBDIR)/$(LIBRARY_SHARED)
 +endif
  	if [ -f $(BUILD_PATH)/$(CLIENT_TARGET) ]; then install -m 755 $(BUILD_PATH)/$(CLIENT_TARGET) $(BINDIR); fi
  	$(LDCONFIG)
  	@echo "use make installcheck to test the install"
-@@ -148,7 +162,7 @@ clean:
+@@ -172,7 +184,7 @@ clean:
  
  client: $(CLIENT_TARGET)
  
@@ -71,11 +73,11 @@ index 7d63077..90c7059 100644
  
  #
  # BUILD Targets
-@@ -187,4 +201,3 @@ test: $(TESTS_TARGET)
+@@ -211,4 +223,3 @@ test: $(TESTS_TARGET)
  $(OBJECT_PATH)/%.o: $(SRC_PATH)/%.cpp
  	-mkdir -p $(dir $@)
  	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(COMMON_FLAGS) $(CONFIG_FLAGS) -c -o $@ $<
 -
 -- 
-2.6.2
+2.4.10
 
diff --git a/package/zmqpp/0001-add-cstdlib-header-to-ensure-EXIT_FAILURE-presence.patch b/package/zmqpp/0001-add-cstdlib-header-to-ensure-EXIT_FAILURE-presence.patch
deleted file mode 100644
index 1458eca..0000000
--- a/package/zmqpp/0001-add-cstdlib-header-to-ensure-EXIT_FAILURE-presence.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2c9271fa662b98e2a451b859f2506edf5f91c9bf Mon Sep 17 00:00:00 2001
-From: Lionel Orry <lionel.orry@gmail.com>
-Date: Fri, 15 May 2015 11:27:57 +0200
-Subject: [PATCH] add cstdlib header to ensure EXIT_FAILURE presence
-
-Using some cross-compiling toolchains, EXIT_FAILURE is not always
-properly defined without this inclusion.
-
-Add myself to AUTHORS.
-
-Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
----
- src/client/main.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/client/main.cpp b/src/client/main.cpp
-index 082c06b..760f01a 100644
---- a/src/client/main.cpp
-+++ b/src/client/main.cpp
-@@ -3,6 +3,7 @@
-  *      Author: @benjamg
-  */
- 
-+#include <cstdlib>
- #include <array>
- #include <iostream>
- #include <tuple>
--- 
-2.1.0
-
diff --git a/package/zmqpp/0003-Install-static-library-for-static-builds.patch b/package/zmqpp/0002-Install-static-library-for-static-builds.patch
similarity index 60%
rename from package/zmqpp/0003-Install-static-library-for-static-builds.patch
rename to package/zmqpp/0002-Install-static-library-for-static-builds.patch
index c4ce2d2..402f85e 100644
--- a/package/zmqpp/0003-Install-static-library-for-static-builds.patch
+++ b/package/zmqpp/0002-Install-static-library-for-static-builds.patch
@@ -1,23 +1,26 @@
-From 1637443262cc861a161fd7c734bc0610a340335b Mon Sep 17 00:00:00 2001
+From 283676e2e8f15bedca20c3d94caeecfdebe11ffd Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Mon, 23 Nov 2015 22:53:09 +0100
-Subject: [PATCH] Install static library for static builds
+Subject: [PATCH 2/2] Install static library for static builds
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
+[Gustavo: update for 4.1.2]
+
 Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
  Makefile | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile b/Makefile
-index 90c7059..abed6fa 100644
+index 86c8fac..fbaff63 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -142,6 +142,9 @@ ifeq ($(BUILD_SHARED),yes)
- 	ln -sf $(LIBRARY_SHARED).$(APP_VERSION) $(LIBDIR)/$(LIBRARY_SHARED).$(VERSION_MAJOR)
- 	ln -sf $(LIBRARY_SHARED).$(APP_VERSION) $(LIBDIR)/$(LIBRARY_SHARED)
+@@ -163,6 +163,9 @@ ifeq ($(BUILD_SHARED),yes)
+ 	ln -sf $(LIBRARY_FULL_VERSION_SHARED) $(LIBDIR)/$(LIBRARY_VERSION_SHARED)
+ 	ln -sf $(LIBRARY_FULL_VERSION_SHARED) $(LIBDIR)/$(LIBRARY_SHARED)
  endif
 +ifeq ($(BUILD_STATIC),yes)
 +	install -m 755 $(BUILD_PATH)/$(LIBRARY_ARCHIVE) $(LIBDIR)/$(LIBRARY_ARCHIVE)
@@ -26,5 +29,5 @@ index 90c7059..abed6fa 100644
  	$(LDCONFIG)
  	@echo "use make installcheck to test the install"
 -- 
-2.6.2
+2.4.10
 
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 0379224..602425f 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ZMQPP
 	bool "zmqpp"
-	# c++0x support
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	# c++1x support
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
@@ -14,9 +14,9 @@ config BR2_PACKAGE_ZMQPP
 
 	  http://github.com/benjamg/zmqpp
 
-comment "zmqpp needs a toolchain w/ C++, wchar, threads, gcc >= 4.6"
+comment "zmqpp needs a toolchain w/ C++, wchar, threads, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
 if BR2_PACKAGE_ZMQPP
 
diff --git a/package/zmqpp/zmqpp.hash b/package/zmqpp/zmqpp.hash
index 7bca39f..63c6a34 100644
--- a/package/zmqpp/zmqpp.hash
+++ b/package/zmqpp/zmqpp.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256	92cb5bf7e1df8b99792fe1eb530bf91fced9c2d14159007bec011bb1b8248269  zmqpp-3.2.0.tar.gz
-sha256	0b76169a48a0ba9dd581b63787b4852f3922de0c22b7a325cab688c1bafb3dd7  260a9304f6c74272bd3c396f6cca685657b4aff1.patch
+sha256	831ad02df64034268d910c30f9fb1b1e631ad810182951af9d7d622650831eb5  zmqpp-4.1.2.tar.gz
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index 0bb6bbe..18da709 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-ZMQPP_VERSION = 3.2.0
+ZMQPP_VERSION = 4.1.2
 ZMQPP_SITE = $(call github,zeromq,zmqpp,$(ZMQPP_VERSION))
 ZMQPP_INSTALL_STAGING = YES
 ZMQPP_DEPENDENCIES = zeromq
 ZMQPP_LICENSE = MIT
 ZMQPP_LICENSE_FILES = LICENSE
-ZMQPP_PATCH = https://github.com/zeromq/zmqpp/commit/260a9304f6c74272bd3c396f6cca685657b4aff1.patch
-
 ZMQPP_MAKE_OPTS = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
 ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
 
-- 
2.4.10
