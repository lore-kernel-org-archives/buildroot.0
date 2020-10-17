From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 14:30:45 +0200
Subject: [Buildroot] [git commit] package/mpdecimal: add optional C++
 dependency
Message-ID: <20201017121937.231C983B22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b44d310e9dafc086dfff0a170277c5d06e8c593
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 2.5.0 enables the new libmpdec++ library by default:
http://www.bytereef.org/mpdecimal/changelog.html#version-2-5-0

Adapt the existing patch, to allow static build of this C++ library.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - meld the C++-enabling and the static-patch commits into one
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-support-for-enable-disable-shared-static.patch | 46 ++++++++++++++++++++++
 package/mpdecimal/mpdecimal.mk                     |  6 +++
 2 files changed, 52 insertions(+)

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
 
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index 00aa98e693..fa310a2274 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -22,4 +22,10 @@ MPDECIMAL_CONF_ENV += MACHINE=ansi32
 endif
 endif
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+MPDECIMAL_CONF_OPTS += --enable-cxx
+else
+MPDECIMAL_CONF_OPTS += --disable-cxx
+endif
+
 $(eval $(autotools-package))
