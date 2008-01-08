From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Tue,  8 Jan 2008 04:52:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/3.4.6
Message-ID: <20080108125249.0070F12010C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2008-01-08 04:52:49 -0800 (Tue, 08 Jan 2008)
New Revision: 20822

Log:
fix gcc 3.4.6 and libstdc++ when shared support is disabled, thanks Atle\!

Modified:
   trunk/buildroot/toolchain/gcc/3.4.6/300-libstdc++-pic.patch


Changeset:
Modified: trunk/buildroot/toolchain/gcc/3.4.6/300-libstdc++-pic.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/3.4.6/300-libstdc++-pic.patch	2008-01-08 12:51:36 UTC (rev 20821)
+++ trunk/buildroot/toolchain/gcc/3.4.6/300-libstdc++-pic.patch	2008-01-08 12:52:49 UTC (rev 20822)
@@ -2,21 +2,23 @@
 
 --- gcc/libstdc++-v3/src/Makefile.am
 +++ gcc/libstdc++-v3/src/Makefile.am
-@@ -224,6 +224,10 @@
- 	  @OPT_LDFLAGS@ @SECTION_LDFLAGS@ $(AM_CXXFLAGS) $(LDFLAGS) -o $@
+@@ -209,6 +209,11 @@
+ CXXLINK = $(LIBTOOL) --tag CXX --mode=link $(CXX) \
+ 	  $(OPT_LDFLAGS) $(SECTION_LDFLAGS) $(AM_CXXFLAGS) $(LDFLAGS) -o $@
  
- 
 +install-exec-local:
++ifeq ($(enable_shared),yes)
 +	$(AR) cru libstdc++_pic.a .libs/*.o $(top_builddir)/libsupc++/*.o
 +	$(INSTALL_DATA) libstdc++_pic.a $(DESTDIR)$(toolexeclibdir)
-+
++endif
+ 
  # Added bits to build debug library.
- if GLIBCPP_BUILD_DEBUG
- all-local: build_debug
-
+ if GLIBCXX_BUILD_DEBUG
 --- gcc/libstdc++-v3/src/Makefile.in
 +++ gcc/libstdc++-v3/src/Makefile.in
-@@ -585,7 +585,7 @@
+--- gcc-3.4.6/libstdc++-v3/src/Makefile.in	2004-04-16 21:08:35.000000000 +0200
++++ gcc-3.4.6-patched/libstdc++-v3/src/Makefile.in	2007-11-30 13:33:26.000000000 +0100
+@@ -592,7 +592,7 @@
  
  install-data-am: install-data-local
  
@@ -25,7 +27,7 @@
  
  install-info: install-info-am
  
-@@ -618,6 +618,7 @@
+@@ -625,6 +625,7 @@
  	distclean-tags distdir dvi dvi-am info info-am install \
  	install-am install-data install-data-am install-data-local \
  	install-exec install-exec-am install-info install-info-am \
@@ -33,14 +35,16 @@
  	install-man install-strip install-toolexeclibLTLIBRARIES \
  	installcheck installcheck-am installdirs maintainer-clean \
  	maintainer-clean-generic mostlyclean mostlyclean-compile \
-@@ -707,6 +708,11 @@
+@@ -709,6 +710,13 @@
  install_debug:
  	(cd ${debugdir} && $(MAKE) \
  	toolexeclibdir=$(glibcxx_toolexeclibdir)/debug install)
 +
 +install-exec-local:
++ifeq ($(enable_shared),yes)
 +	$(AR) cru libstdc++_pic.a .libs/*.o $(top_builddir)/libsupc++/*.o
 +	$(INSTALL_DATA) libstdc++_pic.a $(DESTDIR)$(toolexeclibdir)
++endif
 +
  # Tell versions [3.59,3.63) of GNU make to not export all variables.
  # Otherwise a system limit (for SysV at least) may be exceeded.
