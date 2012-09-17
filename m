From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Sep 2012 21:24:49 +0200
Subject: [Buildroot] [git commit] Revert "poco: fix parallel build failure"
Message-ID: <20120917192730.D4FB399680@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52975d89daa00d8e7ccc5aad5c0b02fd745bb1d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 32f4957b153bdabe7af60d529942aca7d1a4783d.

Adding the phony objdir target as a prerequisite of all the .o targets
doesn't work, as they are then always considered out of date, leading
to poco getting rebuilt (without the proper MYSQL_{INC,LIB}DIR settings)
at staging-install / target-install time.

Instead simply use MAKE1 for the build step.

Fixes http://autobuild.buildroot.net/results/1cca8b4115674f12884bcbc0c680efed0fb939ae

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/poco/poco-fix-parallel-build.patch |   71 ----------------------------
 package/poco/poco.mk                       |    8 +--
 2 files changed, 3 insertions(+), 76 deletions(-)

diff --git a/package/poco/poco-fix-parallel-build.patch b/package/poco/poco-fix-parallel-build.patch
deleted file mode 100644
index 39a1e3e..0000000
--- a/package/poco/poco-fix-parallel-build.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-poco: fix parallel build
-
-The makefile rule for generating objects implicitly depends on the existence
-of the containing directory. The makefile dependecies do not reflect this,
-however. Instead, the final compilation producs depend on one of libdirs,
-bindirs, or static_bindirs, which in turn depend on objdirs. This breaks
-parallel build since the objdirs target may not complete before the object
-files build starts as follows (abbreviated):
-
-make[2]: Entering directory `/home/test/test/output/build/poco-1.4.3p1/Zip'
-mkdir -p /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/release_static
-mkdir -p /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/debug_static
-mkdir -p /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/release_shared
-mkdir -p /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/debug_shared
-** Compiling src/AutoDetectStream.cpp (release, shared)
-...
-Assembler messages:
-Fatal error: can't create /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/release_shared/AutoDetectStream.o: No such file or directory
-
-Add direct dependency on the objects directories to fix this.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
-diff -Nur poco-1.4.3p1-all.orig/build/rules/compile poco-1.4.3p1-all/build/rules/compile
---- poco-1.4.3p1-all.orig/build/rules/compile	2012-01-23 16:12:26.000000000 +0200
-+++ poco-1.4.3p1-all/build/rules/compile	2012-08-28 13:10:17.000000000 +0300
-@@ -33,35 +32,35 @@
- #
- # Rules for compiling
- #	
--$(OBJPATH_DEBUG_STATIC)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d
-+$(OBJPATH_DEBUG_STATIC)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d objdirs
- 	@echo "** Compiling" $< "(debug, static)"
- 	$(CXX) $(INCLUDE) $(CXXFLAGS) $(DEBUGOPT_CXX) $(STATICOPT_CXX) -c $< -o $@
- 
--$(OBJPATH_RELEASE_STATIC)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d
-+$(OBJPATH_RELEASE_STATIC)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d objdirs
- 	@echo "** Compiling" $< "(release, static)"
- 	$(CXX) $(INCLUDE) $(CXXFLAGS) $(RELEASEOPT_CXX) $(STATICOPT_CXX) -c $< -o $@
- 
--$(OBJPATH_DEBUG_STATIC)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d
-+$(OBJPATH_DEBUG_STATIC)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d objdirs
- 	@echo "** Compiling" $< "(debug, static)"
- 	$(CC) $(INCLUDE) $(CFLAGS) $(DEBUGOPT_CC) $(STATICOPT_CC) -c $< -o $@
- 
--$(OBJPATH_RELEASE_STATIC)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d
-+$(OBJPATH_RELEASE_STATIC)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d objdirs
- 	@echo "** Compiling" $< "(release, static)"
- 	$(CC) $(INCLUDE) $(CFLAGS) $(RELEASEOPT_CC) $(STATICOPT_CC) -c $< -o $@
- 
--$(OBJPATH_DEBUG_SHARED)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d
-+$(OBJPATH_DEBUG_SHARED)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d objdirs
- 	@echo "** Compiling" $< "(debug, shared)"
- 	$(CXX) $(INCLUDE) $(CXXFLAGS) $(DEBUGOPT_CXX) $(SHAREDOPT_CXX) -c $< -o $@
- 
--$(OBJPATH_RELEASE_SHARED)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d
-+$(OBJPATH_RELEASE_SHARED)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d objdirs
- 	@echo "** Compiling" $< "(release, shared)"
- 	$(CXX) $(INCLUDE) $(CXXFLAGS) $(RELEASEOPT_CXX) $(SHAREDOPT_CXX) -c $< -o $@
- 
--$(OBJPATH_DEBUG_SHARED)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d
-+$(OBJPATH_DEBUG_SHARED)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d objdirs
- 	@echo "** Compiling" $< "(debug, shared)"
- 	$(CC) $(INCLUDE) $(CFLAGS) $(DEBUGOPT_CC) $(SHAREDOPT_CC) -c $< -o $@
- 
--$(OBJPATH_RELEASE_SHARED)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d
-+$(OBJPATH_RELEASE_SHARED)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d objdirs
- 	@echo "** Compiling" $< "(release, shared)"
- 	$(CC) $(INCLUDE) $(CFLAGS) $(RELEASEOPT_CC) $(SHAREDOPT_CC) -c $< -o $@
- 
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 5b8bdbf..eaa93e6 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -45,19 +45,17 @@ define POCO_CONFIGURE_CMDS
 endef
 
 define POCO_BUILD_CMDS
-	$(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSSENV=$(TARGET_CROSS) \
+	$(MAKE1) POCO_TARGET_OSARCH=$(ARCH) CROSSENV=$(TARGET_CROSS) \
 		MYSQL_LIBDIR=$(STAGING_DIR)/usr/lib/mysql \
 		MYSQL_INCDIR=$(STAGING_DIR)/usr/include/mysql -C $(@D)
 endef
 
 define POCO_INSTALL_STAGING_CMDS
-	$(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) \
-		CROSSENV=$(TARGET_CROSS) install -C $(@D)
+	$(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) install -C $(@D)
 endef
 
 define POCO_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) \
-		CROSSENV=$(TARGET_CROSS) install -C $(@D)
+	$(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) install -C $(@D)
 endef
 
 $(eval $(generic-package))
