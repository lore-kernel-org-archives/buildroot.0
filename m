From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Oct 2020 22:19:16 +0200
Subject: [Buildroot] [PATCH 2/2] package/mpdecimal: fix static build
In-Reply-To: <20201016201916.2082927-1-fontaine.fabrice@gmail.com>
References: <20201016201916.2082927-1-fontaine.fabrice@gmail.com>
Message-ID: <20201016201916.2082927-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update patch to take into account the new libmpdec++ library

Fixes:
 - http://autobuild.buildroot.org/results/40e50ffd00dacbaa697cde67846e0fc570069f56

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ort-for-enable-disable-shared-static.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch b/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch
index 4b60013840..60d6b4bb02 100644
--- a/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch
+++ b/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch
@@ -9,6 +9,8 @@ that building the shared library can be disabled in pure static
 library contexts.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Fabrice: update for 2.5.0 (add libmpdec++)]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  Makefile.in          |  6 ++++++
  configure.ac         | 13 +++++++++++++
@@ -42,6 +44,20 @@ index 2c91891..0c44f36 100644
  	$(INSTALL) -d -m 755 $(DESTDIR)$(docdir)
  	cp -R doc/* $(DESTDIR)$(docdir)
  
+@@ -74,9 +80,13 @@ install_libcxx: install_lib
+ 	$(INSTALL) -d -m 755 $(DESTDIR)$(includedir)
+ 	$(INSTALL) -m 644 libmpdec++/decimal.hh $(DESTDIR)$(includedir)
+ 	$(INSTALL) -d -m 755 $(DESTDIR)$(libdir)
++ifeq ($(BUILD_STATIC),yes)
+ 	$(INSTALL) -m 644 libmpdec++/$(LIBSTATIC_CXX) $(DESTDIR)$(libdir)
++endif
++ifeq ($(BUILD_SHARED),yes)
+ 	$(INSTALL) -m 755 libmpdec++/$(LIBSHARED_CXX) $(DESTDIR)$(libdir)
+ 	cd $(DESTDIR)$(libdir) && ln -sf $(LIBSHARED_CXX) $(LIBSONAME_CXX) && ln -sf $(LIBSHARED_CXX) $(LIBNAME_CXX)
++endif
+ 	cp -R doc/libmpdec++ $(DESTDIR)$(docdir)
+ 
+ 
 diff --git a/configure.ac b/configure.ac
 index 7ee8f86..2b3e505 100644
 --- a/configure.ac
@@ -96,6 +112,36 @@ index d9619a3..985c73c 100644
  
  
  OBJS := basearith.o context.o constants.o convolute.o crt.o mpdecimal.o \
+diff --git a/libmpdec/Makefile.in b/libmpdec/Makefile.in
+index d9619a3..985c73c 100644
+--- a/libmpdec++/Makefile.in
++++ b/libmpdec++/Makefile.in
+@@ -13,6 +13,8 @@ LIBSTATIC_CXX = @LIBSTATIC_CXX@
+ LIBNAME_CXX = @LIBNAME_CXX@
+ LIBSONAME_CXX = @LIBSONAME_CXX@
+ LIBSHARED_CXX = @LIBSHARED_CXX@
++BUILD_SHARED = @BUILD_SHARED@
++BUILD_STATIC = @BUILD_STATIC@
+ 
+ CXX = @CXX@
+ LDXX = @LDXX@
+@@ -39,8 +41,15 @@ ifeq ($(MAKECMDGOALS), profile_use)
+   MPD_LDXXFLAGS += $(MPD_PUSE)
+ endif
+ 
++ifeq ($(BUILD_SHARED),yes)
++TARGETS += $(LIBSHARED_CXX)
++endif
++
++ifeq ($(BUILD_STATIC),yes)
++TARGETS += $(LIBSTATIC_CXX)
++endif
+ 
+-default: $(LIBSTATIC_CXX) $(LIBSHARED_CXX)
++default: $(TARGETS)
+ 
+ 
+ OBJS := decimal.o
 -- 
 2.1.0
 
-- 
2.28.0
