From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 May 2014 11:13:26 +0200
Subject: [Buildroot] [git commit] package/transmission: Bump version to 2.83
Message-ID: <20140601083245.4EFC39C779@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06dd1befec3f6cd8c33cfe2345dd832c4abb1cf9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- removed transmission-02-fix-cxx-check-with-ccache.patch
  applied upstream: https://trac.transmissionbt.com/changeset/14256

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...transmission-02-fix-cxx-check-with-ccache.patch |   44 --------------------
 package/transmission/transmission.mk               |    2 +-
 2 files changed, 1 insertions(+), 45 deletions(-)

diff --git a/package/transmission/transmission-02-fix-cxx-check-with-ccache.patch b/package/transmission/transmission-02-fix-cxx-check-with-ccache.patch
deleted file mode 100644
index 750bdb8..0000000
--- a/package/transmission/transmission-02-fix-cxx-check-with-ccache.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-transmission: fix incorrect check of CXX when ccache is enabled
-
-When ccache is enabled, the configure script is called with
-CXX="/path/to/ccache /path/to/cxx". The AC_PROG_CXX correctly deals with
-this, but the transmission-specific extra checks on CXX do not. It uses
-AC_CHECK_PROG, which takes the first word of CXX (ccache) only.
-
-This patch removes the seemingly unneeded extra checks, and additionally
-replaces HAVE_CXX=yes/no with a direct check on CXX, as it is only used in
-one place.
-
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-Upstream-status: submitted: https://trac.transmissionbt.com/ticket/5612
-
----
-
-diff --git a/configure.ac b/configure.ac
---- a/configure.ac
-+++ b/configure.ac
-@@ -69,15 +69,6 @@ AC_SUBST(LIBAPPINDICATOR_MINIMUM)
- 
- AC_PROG_CC
- AC_PROG_CXX
--if test "x$CXX" != "x"; then # CXX is set...
--  if test -f "$CXX"; then # maybe it's an absolute path passed in env variables...
--    AC_MSG_CHECKING([for $CXX])
--    HAVE_CXX="yes"
--    AC_MSG_RESULT([$HAVE_CXX])
--  else
--    AC_CHECK_PROG([HAVE_CXX],[$CXX],[yes],[no])
--  fi
--fi
- AC_C_INLINE
- if test "x$GCC" = "xyes" ; then
- 
-@@ -216,7 +207,7 @@ AC_CHECK_LIB([rt],
- 
- AC_MSG_CHECKING([??TP])
- build_utp="no"
--if test "x$HAVE_CXX" = "xyes" ; then
-+if test "x$CXX" != "x" ; then
-     have_utp="yes"
- else
-     have_utp="no"
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 4be223a..37cc58b 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 2.82
+TRANSMISSION_VERSION = 2.83
 TRANSMISSION_SITE = http://download.transmissionbt.com/files/
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
