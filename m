From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 19 Oct 2019 20:42:49 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfont2: fix libbsd
 detection
Message-ID: <20191019184044.9A7F482957@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b39b5760a3aa9ef70caca45d2585816ddbca252b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previous patch defined HAVE_LIBBSD even if strlcat function was present
in libc leading to build errors due to inclusion of bsd/string.h:
https://gitlab.freedesktop.org/xorg/lib/libxfont/blob/master/src/util/replace.h#L50

AC_SEARCH_LIBS is defined as
"Search for a library defining function if it's not already available."
https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Libraries.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-define-HAVE_LIBBSD-when-libbsd-was-found.patch | 25 ++++++++++------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/package/x11r7/xlib_libXfont2/0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch b/package/x11r7/xlib_libXfont2/0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch
index ae2462e55d..51e7225be6 100644
--- a/package/x11r7/xlib_libXfont2/0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch
+++ b/package/x11r7/xlib_libXfont2/0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch
@@ -1,30 +1,27 @@
-From 10202b813f86e3f4d477fd82ee7fceac3bc2ebd0 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 13 Oct 2019 21:21:28 +0200
+From 5fceeeb0d1cdccdb2870f65444f2965344f3b8b9 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 19 Oct 2019 09:32:41 +0200
 Subject: [PATCH] configure: define HAVE_LIBBSD when libbsd was found
 
-Source of the patch:
-http://lists.busybox.net/pipermail/buildroot/2019-October/261510.html
-
 Patch sent upstream:
 https://gitlab.freedesktop.org/xorg/lib/libxfont/merge_requests/6
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- configure.ac | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index f507c28..131713d 100644
+index f507c28..cc7ca91 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -52,7 +52,8 @@ AC_CHECK_HEADERS([endian.h poll.h sys/poll.h])
- 
+@@ -53,6 +53,9 @@ AC_CHECK_HEADERS([endian.h poll.h sys/poll.h])
  # Checks for library functions.
  AC_CHECK_FUNCS([poll readlink])
--AC_SEARCH_LIBS([strlcat], [bsd])
-+AC_SEARCH_LIBS([strlcat], [bsd],
-+  [AC_DEFINE(HAVE_LIBBSD,1,[Has libbsd])])
+ AC_SEARCH_LIBS([strlcat], [bsd])
++if test "$ac_cv_search_strlcat" = "-lbsd"; then
++  AC_DEFINE(HAVE_LIBBSD,1,[Has libbsd])
++fi
  AC_CONFIG_LIBOBJ_DIR([src/util])
  AC_REPLACE_FUNCS([reallocarray strlcat strlcpy])
  
