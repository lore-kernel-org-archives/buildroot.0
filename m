From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2014 22:11:40 +0100
Subject: [Buildroot] [git commit] transmission: fix uTP enabled build with
	ccache
Message-ID: <20140218211443.673919CA8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a0776b9d6ae327ce36e4d331a5f58b1851ea912
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Transmission would incorrectly determine the C++ compiler when ccache is
enabled, causing a build with uTP to fail at the configure step.
This patch adds a patch against transmission, fixing the problem.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...transmission-02-fix-cxx-check-with-ccache.patch |   44 ++++++++++++++++++++
 package/transmission/transmission.mk               |    1 +
 2 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/transmission/transmission-02-fix-cxx-check-with-ccache.patch b/package/transmission/transmission-02-fix-cxx-check-with-ccache.patch
new file mode 100644
index 0000000..750bdb8
--- /dev/null
+++ b/package/transmission/transmission-02-fix-cxx-check-with-ccache.patch
@@ -0,0 +1,44 @@
+transmission: fix incorrect check of CXX when ccache is enabled
+
+When ccache is enabled, the configure script is called with
+CXX="/path/to/ccache /path/to/cxx". The AC_PROG_CXX correctly deals with
+this, but the transmission-specific extra checks on CXX do not. It uses
+AC_CHECK_PROG, which takes the first word of CXX (ccache) only.
+
+This patch removes the seemingly unneeded extra checks, and additionally
+replaces HAVE_CXX=yes/no with a direct check on CXX, as it is only used in
+one place.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+Upstream-status: submitted: https://trac.transmissionbt.com/ticket/5612
+
+---
+
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -69,15 +69,6 @@ AC_SUBST(LIBAPPINDICATOR_MINIMUM)
+ 
+ AC_PROG_CC
+ AC_PROG_CXX
+-if test "x$CXX" != "x"; then # CXX is set...
+-  if test -f "$CXX"; then # maybe it's an absolute path passed in env variables...
+-    AC_MSG_CHECKING([for $CXX])
+-    HAVE_CXX="yes"
+-    AC_MSG_RESULT([$HAVE_CXX])
+-  else
+-    AC_CHECK_PROG([HAVE_CXX],[$CXX],[yes],[no])
+-  fi
+-fi
+ AC_C_INLINE
+ if test "x$GCC" = "xyes" ; then
+ 
+@@ -216,7 +207,7 @@ AC_CHECK_LIB([rt],
+ 
+ AC_MSG_CHECKING([??TP])
+ build_utp="no"
+-if test "x$HAVE_CXX" = "xyes" ; then
++if test "x$CXX" != "x" ; then
+     have_utp="yes"
+ else
+     have_utp="no"
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index a08e7ef..4be223a 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -14,6 +14,7 @@ TRANSMISSION_DEPENDENCIES = \
 	libevent \
 	openssl \
 	zlib
+TRANSMISSION_AUTORECONF = YES
 
 TRANSMISSION_CONF_OPT = \
 	--disable-libnotify \
