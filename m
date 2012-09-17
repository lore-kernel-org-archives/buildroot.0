From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Sep 2012 21:27:21 +0200
Subject: [Buildroot] [PATCH] poco: fix parallel build failure
In-Reply-To: <983f847ed905297a7f8e78b258e482c71b13232a.1346227179.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 29 Aug 2012 11:04:05 +0300")
References: <983f847ed905297a7f8e78b258e482c71b13232a.1346227179.git.baruch@tkos.co.il>
Message-ID: <87pq5ko3fq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> This added patch should fix
 Baruch> http://autobuild.buildroot.net/results/1bf7e51ef30af9bbf5e423e80ef07212b83bdaf8/.

 Baruch> CROSSENV is now required also in the install stages to prevent
 Baruch> a rebuild using the host native toolchain.

Sorry, this doesn't actually work. We now have

http://autobuild.buildroot.net/results/1cca8b4115674f12884bcbc0c680efed0fb939ae/

Which is because poco now gets rebuilt at the install staging/target
steps, where we're not passing MYSQL_LIBDIR/INCDIR as all the .o targets
are considered out of date because of the phony objdirs prerequisite.

I don't right away see a clean solution to it (you could use order-only
('|') rules, but it isn't really pretty), so I simply reverted this and
just changed the build step to use MAKE1.

Feel free to submit a correct patch insted.


 Baruch> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 Baruch> ---
 Baruch> I've never encountered this build failure on my machine, so I can't verify the 
 Baruch> fix. If this patch is accepted, and we won't get these failures on the 
 Baruch> autobuild machines, I'll try to upstream this patch.

 Baruch>  package/poco/poco-fix-parallel-build.patch |   71 ++++++++++++++++++++++++++++
 Baruch>  package/poco/poco.mk                       |    6 ++-
 Baruch>  2 files changed, 75 insertions(+), 2 deletions(-)
 Baruch>  create mode 100644 package/poco/poco-fix-parallel-build.patch

 Baruch> diff --git a/package/poco/poco-fix-parallel-build.patch b/package/poco/poco-fix-parallel-build.patch
 Baruch> new file mode 100644
 Baruch> index 0000000..39a1e3e
 Baruch> --- /dev/null
 Baruch> +++ b/package/poco/poco-fix-parallel-build.patch
 Baruch> @@ -0,0 +1,71 @@
 Baruch> +poco: fix parallel build
 Baruch> +
 Baruch> +The makefile rule for generating objects implicitly depends on the existence
 Baruch> +of the containing directory. The makefile dependecies do not reflect this,
 Baruch> +however. Instead, the final compilation producs depend on one of libdirs,
 Baruch> +bindirs, or static_bindirs, which in turn depend on objdirs. This breaks
 Baruch> +parallel build since the objdirs target may not complete before the object
 Baruch> +files build starts as follows (abbreviated):
 Baruch> +
 Baruch> +make[2]: Entering directory `/home/test/test/output/build/poco-1.4.3p1/Zip'
 Baruch> +mkdir -p /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/release_static
 Baruch> +mkdir -p /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/debug_static
 Baruch> +mkdir -p /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/release_shared
 Baruch> +mkdir -p /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/debug_shared
 Baruch> +** Compiling src/AutoDetectStream.cpp (release, shared)
 Baruch> +...
 Baruch> +Assembler messages:
 Baruch> +Fatal error: can't create /home/test/test/output/build/poco-1.4.3p1/Zip/obj/Linux/powerpc/release_shared/AutoDetectStream.o: No such file or directory
 Baruch> +
 Baruch> +Add direct dependency on the objects directories to fix this.
 Baruch> +
 Baruch> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 Baruch> +---
 Baruch> +
 Baruch> +diff -Nur poco-1.4.3p1-all.orig/build/rules/compile poco-1.4.3p1-all/build/rules/compile
 Baruch> +--- poco-1.4.3p1-all.orig/build/rules/compile	2012-01-23 16:12:26.000000000 +0200
 Baruch> ++++ poco-1.4.3p1-all/build/rules/compile	2012-08-28 13:10:17.000000000 +0300
 Baruch> +@@ -33,35 +32,35 @@
 Baruch> + #
 Baruch> + # Rules for compiling
 Baruch> + #	
 Baruch> +-$(OBJPATH_DEBUG_STATIC)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d
 Baruch> ++$(OBJPATH_DEBUG_STATIC)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d objdirs
 Baruch> + 	@echo "** Compiling" $< "(debug, static)"
 Baruch> + 	$(CXX) $(INCLUDE) $(CXXFLAGS) $(DEBUGOPT_CXX) $(STATICOPT_CXX) -c $< -o $@
 Baruch> + 
 Baruch> +-$(OBJPATH_RELEASE_STATIC)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d
 Baruch> ++$(OBJPATH_RELEASE_STATIC)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d objdirs
 Baruch> + 	@echo "** Compiling" $< "(release, static)"
 Baruch> + 	$(CXX) $(INCLUDE) $(CXXFLAGS) $(RELEASEOPT_CXX) $(STATICOPT_CXX) -c $< -o $@
 Baruch> + 
 Baruch> +-$(OBJPATH_DEBUG_STATIC)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d
 Baruch> ++$(OBJPATH_DEBUG_STATIC)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d objdirs
 Baruch> + 	@echo "** Compiling" $< "(debug, static)"
 Baruch> + 	$(CC) $(INCLUDE) $(CFLAGS) $(DEBUGOPT_CC) $(STATICOPT_CC) -c $< -o $@
 Baruch> + 
 Baruch> +-$(OBJPATH_RELEASE_STATIC)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d
 Baruch> ++$(OBJPATH_RELEASE_STATIC)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d objdirs
 Baruch> + 	@echo "** Compiling" $< "(release, static)"
 Baruch> + 	$(CC) $(INCLUDE) $(CFLAGS) $(RELEASEOPT_CC) $(STATICOPT_CC) -c $< -o $@
 Baruch> + 
 Baruch> +-$(OBJPATH_DEBUG_SHARED)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d
 Baruch> ++$(OBJPATH_DEBUG_SHARED)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d objdirs
 Baruch> + 	@echo "** Compiling" $< "(debug, shared)"
 Baruch> + 	$(CXX) $(INCLUDE) $(CXXFLAGS) $(DEBUGOPT_CXX) $(SHAREDOPT_CXX) -c $< -o $@
 Baruch> + 
 Baruch> +-$(OBJPATH_RELEASE_SHARED)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d
 Baruch> ++$(OBJPATH_RELEASE_SHARED)/%.o: $(SRCDIR)/%.cpp $(DEPPATH)/%.d objdirs
 Baruch> + 	@echo "** Compiling" $< "(release, shared)"
 Baruch> + 	$(CXX) $(INCLUDE) $(CXXFLAGS) $(RELEASEOPT_CXX) $(SHAREDOPT_CXX) -c $< -o $@
 Baruch> + 
 Baruch> +-$(OBJPATH_DEBUG_SHARED)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d
 Baruch> ++$(OBJPATH_DEBUG_SHARED)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d objdirs
 Baruch> + 	@echo "** Compiling" $< "(debug, shared)"
 Baruch> + 	$(CC) $(INCLUDE) $(CFLAGS) $(DEBUGOPT_CC) $(SHAREDOPT_CC) -c $< -o $@
 Baruch> + 
 Baruch> +-$(OBJPATH_RELEASE_SHARED)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d
 Baruch> ++$(OBJPATH_RELEASE_SHARED)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d objdirs
 Baruch> + 	@echo "** Compiling" $< "(release, shared)"
 Baruch> + 	$(CC) $(INCLUDE) $(CFLAGS) $(RELEASEOPT_CC) $(SHAREDOPT_CC) -c $< -o $@
 Baruch> + 
 Baruch> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
 Baruch> index f74c2b1..c73d6b6 100644
 Baruch> --- a/package/poco/poco.mk
 Baruch> +++ b/package/poco/poco.mk
 Baruch> @@ -50,11 +50,13 @@ define POCO_BUILD_CMDS
 Baruch>  endef
 
 Baruch>  define POCO_INSTALL_STAGING_CMDS
 Baruch> -	$(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) install -C $(@D)
 Baruch> +	$(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) \
 Baruch> +		CROSSENV=$(TARGET_CROSS) install -C $(@D)
 Baruch>  endef
 
 Baruch>  define POCO_INSTALL_TARGET_CMDS
 Baruch> -	$(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) install -C $(@D)
 Baruch> +	$(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) \
 Baruch> +		CROSSENV=$(TARGET_CROSS) install -C $(@D)
 Baruch>  endef
 
 Baruch>  $(eval $(generic-package))
 Baruch> -- 
 Baruch> 1.7.10.4

 Baruch> _______________________________________________
 Baruch> buildroot mailing list
 Baruch> buildroot at busybox.net
 Baruch> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
