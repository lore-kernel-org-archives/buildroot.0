From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Dec 2016 18:22:00 +0100
Subject: [Buildroot] [PATCH] package/weston: fix build on ancient glibc
Message-ID: <1482168120-7386-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build with ancient glibces.

Fixes:
    http://autobuild.buildroot.net/results/bce/bcecdbbce4a99eb1e9bfbf519857bf94d8952037/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...onfigure-search-for-lib-with-clock_getres.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/weston/0003-configure-search-for-lib-with-clock_getres.patch

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
-- 
2.7.4
