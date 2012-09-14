From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Sep 2012 11:56:06 +0200
Subject: [Buildroot] [git commit] poco: fix parallel build failure
Message-ID: <20120914100312.41CA799640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32f4957b153bdabe7af60d529942aca7d1a4783d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This added patch should fix
http://autobuild.buildroot.net/results/1bf7e51ef30af9bbf5e423e80ef07212b83bdaf8/.

CROSSENV is now required also in the install stages to prevent a rebuild using
the host native toolchain.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/poco/poco-fix-parallel-build.patch |   71 ++++++++++++++++++++++++++++
 package/poco/poco.mk                       |    6 ++-
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco-fix-parallel-build.patch b/package/poco/poco-fix-parallel-build.patch
new file mode 100644
index 0000000..39a1e3e
--- /dev/null
+++ b/package/poco/poco-fix-parallel-build.patch
@@ -0,0 +1,71 @@
+poco: fix parallel build
+
+The makefile rule for generating objects implicitly depends on the existence
+of the containing directory. The makefile dependecies do not reflect this,
+however. Instead, the final compilation producs depend on one of libdirs,
+bindirs, or static_bindirs, which in turn depend on objdirs. This breaks
+parallel build since the objdirs target may not complete before the object
+files build starts as follows (abbreviated):
+
+make[2]: Entering directory `/home/test/test/output/build/poco-1.4.3p1/Zip'
+mkdir -p /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/release_static
+mkdir -p /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/debug_static
+mkdir -p /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/release_shared
+mkdir -p /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/debug_shared
+** Compiling src/AutoDetectStream.cpp (release, shared)
+...
+Assembler messages:
+Fatal error: can't create /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/release_shared/AutoDetectStream.o: No such file or directory
+
+Add direct dependency on the objects directories to fix this.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+diff -Nur poco-1.4.3p1-all.orig/build/rules/compile poco-1.4.3p1-all/build/rules/compile
+--- poco-1.4.3p1-all.orig/build/rules/compile	2012-01-23 16:12:26.000000000 +0200
++++ poco-1.4.3p1-all/build/rules/compile	2012-08-28 13:10:17.000000000 +0300
+@@ -33,35 +32,35 @@
+ #
+ # Rules for compiling
+ #	
+-$(OBJPATH_DEBUG_STATIC)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d
++$(OBJPATH_DEBUG_STATIC)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d objdirs
+ 	@echo "** Compiling" $< "(debug, static)"
+ 	$(CXX) $(INCLUDE) $(CXXFLAGS) $(DEBUGOPT_CXX) $(STATICOPT_CXX) -c $< -o $@
+ 
+-$(OBJPATH_RELEASE_STATIC)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d
++$(OBJPATH_RELEASE_STATIC)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d objdirs
+ 	@echo "** Compiling" $< "(release, static)"
+ 	$(CXX) $(INCLUDE) $(CXXFLAGS) $(RELEASEOPT_CXX) $(STATICOPT_CXX) -c $< -o $@
+ 
+-$(OBJPATH_DEBUG_STATIC)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d
++$(OBJPATH_DEBUG_STATIC)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d objdirs
+ 	@echo "** Compiling" $< "(debug, static)"
+ 	$(CC) $(INCLUDE) $(CFLAGS) $(DEBUGOPT_CC) $(STATICOPT_CC) -c $< -o $@
+ 
+-$(OBJPATH_RELEASE_STATIC)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d
++$(OBJPATH_RELEASE_STATIC)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d objdirs
+ 	@echo "** Compiling" $< "(release, static)"
+ 	$(CC) $(INCLUDE) $(CFLAGS) $(RELEASEOPT_CC) $(STATICOPT_CC) -c $< -o $@
+ 
+-$(OBJPATH_DEBUG_SHARED)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d
++$(OBJPATH_DEBUG_SHARED)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d objdirs
+ 	@echo "** Compiling" $< "(debug, shared)"
+ 	$(CXX) $(INCLUDE) $(CXXFLAGS) $(DEBUGOPT_CXX) $(SHAREDOPT_CXX) -c $< -o $@
+ 
+-$(OBJPATH_RELEASE_SHARED)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d
++$(OBJPATH_RELEASE_SHARED)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d objdirs
+ 	@echo "** Compiling" $< "(release, shared)"
+ 	$(CXX) $(INCLUDE) $(CXXFLAGS) $(RELEASEOPT_CXX) $(SHAREDOPT_CXX) -c $< -o $@
+ 
+-$(OBJPATH_DEBUG_SHARED)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d
++$(OBJPATH_DEBUG_SHARED)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d objdirs
+ 	@echo "** Compiling" $< "(debug, shared)"
+ 	$(CC) $(INCLUDE) $(CFLAGS) $(DEBUGOPT_CC) $(SHAREDOPT_CC) -c $< -o $@
+ 
+-$(OBJPATH_RELEASE_SHARED)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d
++$(OBJPATH_RELEASE_SHARED)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d objdirs
+ 	@echo "** Compiling" $< "(release, shared)"
+ 	$(CC) $(INCLUDE) $(CFLAGS) $(RELEASEOPT_CC) $(SHAREDOPT_CC) -c $< -o $@
+ 
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 69ef314..5b8bdbf 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -51,11 +51,13 @@ define POCO_BUILD_CMDS
 endef
 
 define POCO_INSTALL_STAGING_CMDS
-	$(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) install -C $(@D)
+	$(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) \
+		CROSSENV=$(TARGET_CROSS) install -C $(@D)
 endef
 
 define POCO_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) install -C $(@D)
+	$(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) \
+		CROSSENV=$(TARGET_CROSS) install -C $(@D)
 endef
 
 $(eval $(generic-package))
