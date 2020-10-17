From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 23:58:21 +0200
Subject: [Buildroot] [git commit] package/transmission: drop second patch
Message-ID: <20201017214703.655AB83A5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad933f9119340f0d11415b9bc3433d0de3681aa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

transmission in version 3.00 is building fine on musl and upstream
thinks that this patch is not needed anymore:
https://github.com/transmission/transmission/pull/1156

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...tp-include.patch => 0002-fix-utp-include.patch} |  0
 .../transmission/0002-musl-missing-header.patch    | 36 ----------------------
 2 files changed, 36 deletions(-)

diff --git a/package/transmission/0003-fix-utp-include.patch b/package/transmission/0002-fix-utp-include.patch
similarity index 100%
rename from package/transmission/0003-fix-utp-include.patch
rename to package/transmission/0002-fix-utp-include.patch
diff --git a/package/transmission/0002-musl-missing-header.patch b/package/transmission/0002-musl-missing-header.patch
deleted file mode 100644
index ebb74cbffb..0000000000
--- a/package/transmission/0002-musl-missing-header.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Fix musl build
-
-Downloaded from
-https://cgit.gentoo.org/proj/musl.git/tree/net-p2p/transmission/files/transmission-2.84-musl-missing-header.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-
-libtransmission/transmission.h: add missing <sys/types.h>
-
-transmission.h and several files including it, like bitfield.c and fdlimits.h
-make reference to ssize_t, off_t and other types defined in <sys/types.h> but
-never include the header.  By including <sys/types.h> in transmission.h, the
-required type definitions are propagated to all files that need them.
-
-Not including <sys/types.h> on glibc and uClibc systems does not pose a problem
-because of the way the headers stack in those C Standard Libraries, but on musl
-excluding <sys/types.h> leads to compile time failure.
-
-For the POSIX specs, see
-
-http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/sys_types.h.html
-
-Signed-of-by: Anthony G. Basile <blueness@gentoo.org>
-
-diff -Naur transmission-2.84.orig/libtransmission/transmission.h transmission-2.84/libtransmission/transmission.h
---- transmission-2.84.orig/libtransmission/transmission.h	2014-07-01 13:09:01.682910744 -0400
-+++ transmission-2.84/libtransmission/transmission.h	2015-07-19 03:11:07.379219181 -0400
-@@ -28,6 +28,7 @@
- 
- #include <inttypes.h> /* uintN_t */
- #include <time.h> /* time_t */
-+#include <sys/types.h>
- 
- #ifdef WIN32
-  #define __USE_MINGW_ANSI_STDIO 1
