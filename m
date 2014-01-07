From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 7 Jan 2014 17:24:11 +0000
Subject: [Buildroot] [PATCH] cryptsetup: Link against -lrt for clock_gettime
Message-ID: <1389115451-4096-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Applying an upstream patch to fix clock_gettime undefined reference
errors.

Upstream patch URL:
   https://code.google.com/p/cryptsetup/source/detail?r=3ba95a822f70ff1e8141230bc2830ae46346486b

Fixes:
   http://autobuild.buildroot.net/results/bed/bed37fac9bc54d3dbe956e4af632a044a5829acd/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../cryptsetup-0001-clock-gettime-fix.patch        |   23 ++++++++++++++++++++
 package/cryptsetup/cryptsetup.mk                   |    1 +
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/cryptsetup/cryptsetup-0001-clock-gettime-fix.patch

diff --git a/package/cryptsetup/cryptsetup-0001-clock-gettime-fix.patch b/package/cryptsetup/cryptsetup-0001-clock-gettime-fix.patch
new file mode 100644
index 0000000..933cbc8
--- /dev/null
+++ b/package/cryptsetup/cryptsetup-0001-clock-gettime-fix.patch
@@ -0,0 +1,23 @@
+Link against -lrt for clock_gettime
+
+Fix undefined reference to `clock_gettime' error.
+This is required since commit f3e398afc549 "Rewrite cipher benchmark loop.".
+
+Below is the build error report:
+http://autobuild.buildroot.net/results/9ca/9cad1cf49ee6b5c58d8260ee33beef2e6c1ad
+a4d/build-end.log
+
+Signed-off-by: Axel Lin <axel.lin@ingics.com>
+Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
+--- cryptsetup-1.6.3/configure.ac.orig	2014-01-07 16:56:18.732323597 +0000
++++ cryptsetup-1.6.3/configure.ac	2014-01-07 16:56:46.314759741 +0000
+@@ -49,7 +49,8 @@ AC_CHECK_LIB(uuid, uuid_clear, ,[AC_MSG_
+ AC_SUBST(UUID_LIBS, $LIBS)
+ LIBS=$saved_LIBS
+ 
+-AC_CHECK_FUNCS([posix_memalign])
++AC_SEARCH_LIBS([clock_gettime],[rt posix4])
++AC_CHECK_FUNCS([posix_memalign clock_gettime])
+ 
+ if test "x$enable_largefile" = "xno" ; then
+   AC_MSG_ERROR([Building with --disable-largefile is not supported, it can cause data corruption.])
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 6ea3aae..6a54527 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -12,6 +12,7 @@ CRYPTSETUP_DEPENDENCIES = lvm2 popt e2fsprogs libgcrypt host-pkgconf \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 CRYPTSETUP_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
+CRYPTSETUP_AUTORECONF = YES
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
-- 
1.7.1
