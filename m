From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Dec 2016 21:09:46 +0100
Subject: [Buildroot] [git commit] package/weston: fix build on ancient glibc
Message-ID: <20161219201013.F2A0580156@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cf7d259a725bf3164716c0d78f7f89c8330e7a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build with ancient glibces.

Fixes:
    http://autobuild.buildroot.net/results/bce/bcecdbbce4a99eb1e9bfbf519857bf94d8952037/

[Peter: patches configure.ac, so add WESTON_AUTORECONF = YES]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...onfigure-search-for-lib-with-clock_getres.patch | 47 ++++++++++++++++++++++
 package/weston/weston.mk                           |  2 +
 2 files changed, 49 insertions(+)

diff --git a/package/weston/0003-configure-search-for-lib-with-clock_getres.patch b/package/weston/0003-configure-search-for-lib-with-clock_getres.patch
new file mode 100644
index 0000000..a8ad9ea
--- /dev/null
+++ b/package/weston/0003-configure-search-for-lib-with-clock_getres.patch
@@ -0,0 +1,47 @@
+From e269012c4b919624ca92d80afd1d6a6f5399e041 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Mon, 19 Dec 2016 18:07:07 +0100
+Subject: [PATCH] configure: search for lib with clock_getres()
+
+Like clock_gettime(), clock_getres() is in -lrt for glibc < 2.17.
+Add a check for it, like is done for clock_gettime().
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Upstream status: submitted
+https://lists.freedesktop.org/archives/wayland-devel/2016-December/032354.html
+---
+ Makefile.am  | 1 +
+ configure.ac | 3 ++-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 2219e3d..53f8f51 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -190,6 +190,7 @@ weston_CFLAGS = $(AM_CFLAGS) $(COMPOSITOR_CFLAGS) $(LIBUNWIND_CFLAGS)
+ weston_LDADD = libshared.la libweston- at LIBWESTON_MAJOR@.la \
+ 	$(COMPOSITOR_LIBS) $(LIBUNWIND_LIBS) \
+ 	$(DLOPEN_LIBS) $(LIBINPUT_BACKEND_LIBS) \
++	$(CLOCK_GETRES_LIBS) \
+ 	-lm
+ 
+ weston_SOURCES = 					\
+diff --git a/configure.ac b/configure.ac
+index 1e251bf..604f51b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -88,8 +88,9 @@ PKG_PROG_PKG_CONFIG()
+ 
+ WESTON_SEARCH_LIBS([DLOPEN], [dl], [dlopen])
+ 
+-# In old glibc versions (< 2.17) clock_gettime() is in librt
++# In old glibc versions (< 2.17) clock_gettime() and clock_getres() are in librt
+ WESTON_SEARCH_LIBS([CLOCK_GETTIME], [rt], [clock_gettime])
++WESTON_SEARCH_LIBS([CLOCK_GETRES], [rt], [clock_getres])
+ 
+ AC_CHECK_DECL(SFD_CLOEXEC,[],
+ 	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile weston")],
+-- 
+2.7.4
+
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 7d348dc..89e16f1 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -9,6 +9,8 @@ WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
+# configure.ac patched by 0003-configure-search-for-lib-with-clock_getres.patch
+WESTON_AUTORECONF = YES
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 	libxkbcommon pixman libpng jpeg mtdev udev cairo libinput \
