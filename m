From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 20 Nov 2015 21:54:41 +0100
Subject: [Buildroot] [PATCH 3/3] package/zmqpp: fix static build issues
In-Reply-To: <1448052881-29222-1-git-send-email-joerg.krause@embedded.rocks>
References: <1448052881-29222-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1448052881-29222-3-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefile for zmqpp builds both shared and static libraries and the client
binary. This leads to several build issues in pure static library contexts:
  * R_ARM_TLS_LE32 relocation not permitted in shared object
  * relocation R_ARC_32_ME against `_ZSt7nothrow' can not be used when making
    a shared object; recompile with -fPIC

We add a minimal patch to add some basic handling of building a shared or a
static library only.

Additionally, disable the client for static only builds.

Fixes:
http://autobuild.buildroot.net/results/345/345771eb488c60585e388fbbf4490df936e88e19/
http://autobuild.buildroot.net/results/21b/21b6912c70a5c300bdabde53bee6a1d9cc3bbb02/
http://autobuild.buildroot.net/results/d98/d9882d2ba00da16f76cea6d86a84cd4815ebbba2/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...imal-support-for-disabling-shared-library.patch | 75 ++++++++++++++++++++++
 package/zmqpp/Config.in                            |  5 +-
 package/zmqpp/zmqpp.mk                             |  6 +-
 3 files changed, 83 insertions(+), 3 deletions(-)
 create mode 100644 package/zmqpp/0002-Add-minimal-support-for-disabling-shared-library.patch

diff --git a/package/zmqpp/0002-Add-minimal-support-for-disabling-shared-library.patch b/package/zmqpp/0002-Add-minimal-support-for-disabling-shared-library.patch
new file mode 100644
index 0000000..c0d4e8f
--- /dev/null
+++ b/package/zmqpp/0002-Add-minimal-support-for-disabling-shared-library.patch
@@ -0,0 +1,75 @@
+From 547d707370c128f223a6147de6b012a83a9fc3f3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Fri, 20 Nov 2015 19:51:50 +0100
+Subject: [PATCH 2/2] Add minimal support for disabling shared library
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ Makefile | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7d63077..2e9aed3 100644
+--- a/Makefile
++++ b/Makefile
+@@ -71,7 +71,7 @@ ifneq (,$(findstring $(CONFIG),release loadtest))
+ 	CONFIG_FLAGS = -O3 -funroll-loops -ffast-math -finline-functions -fomit-frame-pointer -DNO_DEBUG_LOG -DNO_TRACE_LOG -DNDEBUG
+ endif
+ 
+-COMMON_FLAGS = -MMD -std=c++0x -pipe -Wall -fPIC \
++COMMON_FLAGS = -MMD -std=c++0x -pipe -Wall \
+ 	-DBUILD_ENV=$(CONFIG) \
+ 	-DBUILD_VERSION='"$(APP_VERSION)"' \
+ 	-DBUILD_VERSION_MAJOR=$(VERSION_MAJOR) \
+@@ -82,6 +82,10 @@ COMMON_FLAGS = -MMD -std=c++0x -pipe -Wall -fPIC \
+ 	-DBUILD_CLIENT_NAME='"$(CLIENT_TARGET)"' \
+ 	-I$(SRC_PATH)
+ 
++ifeq ($(BUILD_SHARED),yes)
++COMMON_FLAGS += -fPIC
++endif
++
+ COMMON_LIBS = -lzmq
+ 
+ LIBRARY_LIBS =  
+@@ -125,9 +129,11 @@ check: $(LIBRARY_SHARED) $(LIBRARY_ARCHIVE) test
+ 
+ install:
+ 	install -m 644 $(ALL_LIBRARY_INCLUDES) $(INCLUDEDIR)/$(LIBRARY_DIR)
++ifeq ($(BUILD_SHARED),yes)
+ 	install -m 755 $(BUILD_PATH)/$(LIBRARY_SHARED).$(VERSION_MAJOR) $(LIBDIR)/$(LIBRARY_SHARED).$(APP_VERSION)
+ 	ln -sf $(LIBRARY_SHARED).$(APP_VERSION) $(LIBDIR)/$(LIBRARY_SHARED).$(VERSION_MAJOR)
+ 	ln -sf $(LIBRARY_SHARED).$(APP_VERSION) $(LIBDIR)/$(LIBRARY_SHARED)
++endif
+ 	if [ -f $(BUILD_PATH)/$(CLIENT_TARGET) ]; then install -m 755 $(BUILD_PATH)/$(CLIENT_TARGET) $(BINDIR); fi
+ 	$(LDCONFIG)
+ 	@echo "use make installcheck to test the install"
+@@ -148,7 +154,7 @@ clean:
+ 
+ client: $(CLIENT_TARGET)
+ 
+-library: $(LIBRARY_SHARED) $(LIBRARY_ARCHIVE)
++library: $(if $(BUILD_SHARED),$(LIBRARY_SHARED)) $(LIBRARY_ARCHIVE)
+ 
+ #
+ # BUILD Targets
+@@ -160,7 +166,7 @@ $(LIBRARY_SHARED): $(ALL_LIBRARY_OBJECTS)
+ $(LIBRARY_ARCHIVE): $(ALL_LIBRARY_OBJECTS)
+ 	$(AR) crf $(BUILD_PATH)/$@ $^
+ 
+-$(CLIENT_TARGET): $(LIBRARY_SHARED) $(LIBRARY_ARCHIVE) $(ALL_CLIENT_OBJECTS)
++$(CLIENT_TARGET): $(if $(BUILD_SHARED),$(LIBRARY_SHARED)) $(LIBRARY_ARCHIVE) $(ALL_CLIENT_OBJECTS)
+ 	$(LD) $(LDFLAGS) -o $(BUILD_PATH)/$@ $(ALL_CLIENT_OBJECTS) $(CLIENT_LIBS) $(COMMON_LIBS)
+ 
+ $(TESTS_TARGET): $(LIBRARY_SHARED) $(LIBRARY_ARCHIVE) $(ALL_TEST_OBJECTS)
+@@ -187,4 +193,3 @@ test: $(TESTS_TARGET)
+ $(OBJECT_PATH)/%.o: $(SRC_PATH)/%.cpp
+ 	-mkdir -p $(dir $@)
+ 	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(COMMON_FLAGS) $(CONFIG_FLAGS) -c -o $@ $<
+-
+-- 
+2.6.2
+
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index a10602f..0379224 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -22,6 +22,7 @@ if BR2_PACKAGE_ZMQPP
 
 config BR2_PACKAGE_ZMQPP_CLIENT
 	bool "zmqpp client"
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST
@@ -30,8 +31,8 @@ config BR2_PACKAGE_ZMQPP_CLIENT
 	  Build and install the zmqpp client, a command line tool that can be
 	  used to listen or send to zeromq sockets.
 
-comment "zmqpp client needs a toolchain w/ threads"
+comment "zmqpp client needs a toolchain w/ dynamic library, threads"
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 endif
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index e506eaf..77ff209 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -19,10 +19,14 @@ ifeq ($(BR2_PACKAGE_ZMQPP_CLIENT),y)
 ZMQPP_DEPENDENCIES += boost
 endif
 
+ifeq ($(BR2_SHARED_LIBS),y)
+TARGET_CONFIGURE_OPTS += BUILD_SHARED=yes
+endif
+
 define ZMQPP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		LDFLAGS="$(ZMQPP_LDFLAGS)" \
-		$(ZMQPP_MAKE_OPTS) $(if $(BR2_PACKAGE_ZMQPP_CLIENT),all) -C $(@D)
+		$(ZMQPP_MAKE_OPTS) $(if $(BR2_PACKAGE_ZMQPP_CLIENT),client,library) -C $(@D)
 endef
 
 define ZMQPP_INSTALL_TARGET_CMDS
-- 
2.6.2
