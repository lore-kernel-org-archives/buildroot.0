From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 13:40:54 +0200
Subject: [Buildroot] [PATCH 1/1] zmqpp: bump to version 4.2.0
Message-ID: <20180520114054.18909-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Merge both patches in a single one and slighlty update it to keep
  current behavior (BUILD_STATIC set to yes by default) to be able to
  send it upstream: https://github.com/zeromq/zmqpp/pull/218. Patch has
  been merged upstream.
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ow-building-shared-or-static-library-only.patch | 51 +++++++++++++---------
 ...-Install-static-library-for-static-builds.patch | 33 --------------
 package/zmqpp/zmqpp.hash                           |  3 +-
 package/zmqpp/zmqpp.mk                             |  2 +-
 4 files changed, 33 insertions(+), 56 deletions(-)
 delete mode 100644 package/zmqpp/0002-Install-static-library-for-static-builds.patch

diff --git a/package/zmqpp/0001-Allow-building-shared-or-static-library-only.patch b/package/zmqpp/0001-Allow-building-shared-or-static-library-only.patch
index 70caee8162..04fad80f32 100644
--- a/package/zmqpp/0001-Allow-building-shared-or-static-library-only.patch
+++ b/package/zmqpp/0001-Allow-building-shared-or-static-library-only.patch
@@ -1,33 +1,42 @@
-From 02ad67e60ef698ee47f6ee53b36e5b89c2fd71e7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Wed, 24 Feb 2016 10:07:11 -0300
-Subject: [PATCH 1/2] Allow building shared or static library only
+From 93005632eca13d8eda409f6e9496fd5dd69e75b0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 4 May 2018 18:38:31 +0200
+Subject: [PATCH] Allow building shared or static library only
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-[Gustavo: update for 4.1.2]
+Patchs retrieved from:
+ - https://git.buildroot.net/buildroot/tree/package/zmqpp/0001-Allow-building-shared-or-static-library-only.patch
+ - https://git.buildroot.net/buildroot/tree/package/zmqpp/0002-Install-static-library-for-static-builds.patch
 
+Both patches have been merged in a single one and slightly updated to
+keep default behavior of building and installing static library
+(BUILD_STATIC is set to yes by default)
+
+[Upstream status: merged (https://github.com/zeromq/zmqpp/pull/218)]
 Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
- Makefile | 19 +++++++++++++++----
- 1 file changed, 15 insertions(+), 4 deletions(-)
+ Makefile | 24 ++++++++++++++++++++----
+ 1 file changed, 20 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 9df5996..86c8fac 100644
+index 689acaa..e43054c 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -79,6 +79,8 @@ ifeq ($(UNAME_S),Darwin)
+@@ -81,6 +81,9 @@ ifeq ($(UNAME_S),Darwin)
  endif
  
  
 +BUILD_SHARED   ?= yes
++BUILD_STATIC   ?= yes
 +
  CONFIG_FLAGS =
  ifeq ($(CONFIG),debug)
  	CONFIG_FLAGS = -g -fno-inline -ftemplate-depth-1000
-@@ -93,13 +95,22 @@ ifneq (,$(findstring $(CONFIG),release loadtest))
+@@ -95,13 +98,22 @@ ifneq (,$(findstring $(CONFIG),release loadtest))
  	CONFIG_FLAGS = -O3 -funroll-loops -ffast-math -finline-functions -fomit-frame-pointer -DNO_DEBUG_LOG -DNO_TRACE_LOG -DNDEBUG
  endif
  
@@ -51,20 +60,25 @@ index 9df5996..86c8fac 100644
  COMMON_LIBS = -lzmq
  
  LIBRARY_LIBS =
-@@ -147,10 +158,11 @@ install:
- 	mkdir -p $(INCLUDEDIR)/$(LIBRARY_DIR)
+@@ -150,11 +162,15 @@ install:
  	mkdir -p $(LIBDIR)
+ 	mkdir -p $(PKGCONFIGDIR)
  	install -m 644 $(ALL_LIBRARY_INCLUDES) $(INCLUDEDIR)/$(LIBRARY_DIR)
-+ifeq ($(BUILD_SHARED),yes)
- 	install -m 755 $(BUILD_PATH)/$(LIBRARY_VERSION_SHARED) $(LIBDIR)/$(LIBRARY_FULL_VERSION_SHARED)
+-	install -m 755 $(BUILD_PATH)/$(LIBRARY_VERSION_SHARED) $(LIBDIR)/$(LIBRARY_FULL_VERSION_SHARED)
 -	install -m 755 $(BUILD_PATH)/$(LIBRARY_ARCHIVE) $(LIBDIR)/$(LIBRARY_ARCHIVE)
+ 	install -m 755 $(BUILD_PATH)/$(PKGCONFIG_FILE) $(PKGCONFIGDIR)/$(PKGCONFIG_FILE)
++ifeq ($(BUILD_SHARED),yes)
++	install -m 755 $(BUILD_PATH)/$(LIBRARY_VERSION_SHARED) $(LIBDIR)/$(LIBRARY_FULL_VERSION_SHARED)
  	ln -sf $(LIBRARY_FULL_VERSION_SHARED) $(LIBDIR)/$(LIBRARY_VERSION_SHARED)
  	ln -sf $(LIBRARY_FULL_VERSION_SHARED) $(LIBDIR)/$(LIBRARY_SHARED)
++endif
++ifeq ($(BUILD_STATIC),yes)
++	install -m 755 $(BUILD_PATH)/$(LIBRARY_ARCHIVE) $(LIBDIR)/$(LIBRARY_ARCHIVE)
 +endif
  	if [ -f $(BUILD_PATH)/$(CLIENT_TARGET) ]; then install -m 755 $(BUILD_PATH)/$(CLIENT_TARGET) $(BINDIR); fi
  	$(LDCONFIG)
  	@echo "use make installcheck to test the install"
-@@ -172,7 +184,7 @@ clean:
+@@ -176,7 +192,7 @@ clean:
  
  client: $(CLIENT_TARGET)
  
@@ -73,11 +87,6 @@ index 9df5996..86c8fac 100644
  
  #
  # BUILD Targets
-@@ -211,4 +223,3 @@ test: $(TESTS_TARGET)
- $(OBJECT_PATH)/%.o: $(SRC_PATH)/%.cpp
- 	-mkdir -p $(dir $@)
- 	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(COMMON_FLAGS) $(CONFIG_FLAGS) -c -o $@ $<
--
 -- 
-2.4.10
+2.14.1
 
diff --git a/package/zmqpp/0002-Install-static-library-for-static-builds.patch b/package/zmqpp/0002-Install-static-library-for-static-builds.patch
deleted file mode 100644
index 402f85e263..0000000000
--- a/package/zmqpp/0002-Install-static-library-for-static-builds.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 283676e2e8f15bedca20c3d94caeecfdebe11ffd Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Mon, 23 Nov 2015 22:53:09 +0100
-Subject: [PATCH 2/2] Install static library for static builds
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-[Gustavo: update for 4.1.2]
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- Makefile | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 86c8fac..fbaff63 100644
---- a/Makefile
-+++ b/Makefile
-@@ -163,6 +163,9 @@ ifeq ($(BUILD_SHARED),yes)
- 	ln -sf $(LIBRARY_FULL_VERSION_SHARED) $(LIBDIR)/$(LIBRARY_VERSION_SHARED)
- 	ln -sf $(LIBRARY_FULL_VERSION_SHARED) $(LIBDIR)/$(LIBRARY_SHARED)
- endif
-+ifeq ($(BUILD_STATIC),yes)
-+	install -m 755 $(BUILD_PATH)/$(LIBRARY_ARCHIVE) $(LIBDIR)/$(LIBRARY_ARCHIVE)
-+endif
- 	if [ -f $(BUILD_PATH)/$(CLIENT_TARGET) ]; then install -m 755 $(BUILD_PATH)/$(CLIENT_TARGET) $(BINDIR); fi
- 	$(LDCONFIG)
- 	@echo "use make installcheck to test the install"
--- 
-2.4.10
-
diff --git a/package/zmqpp/zmqpp.hash b/package/zmqpp/zmqpp.hash
index 63c6a34f0c..c440b2aca2 100644
--- a/package/zmqpp/zmqpp.hash
+++ b/package/zmqpp/zmqpp.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	831ad02df64034268d910c30f9fb1b1e631ad810182951af9d7d622650831eb5  zmqpp-4.1.2.tar.gz
+sha256 c1d4587df3562f73849d9e5f8c932ca7dcfc7d8bec31f62d7f35073ef81f4d29  zmqpp-4.2.0.tar.gz
+sha256 fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index e57f7de4ea..801766a7d8 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZMQPP_VERSION = 4.1.2
+ZMQPP_VERSION = 4.2.0
 ZMQPP_SITE = $(call github,zeromq,zmqpp,$(ZMQPP_VERSION))
 ZMQPP_INSTALL_STAGING = YES
 ZMQPP_DEPENDENCIES = zeromq
-- 
2.14.1
