From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 May 2020 23:28:27 +0200
Subject: [Buildroot] [git commit] package/mbuffer: do not force c99 mode
Message-ID: <20200507211258.F097290F1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7e1103d1a82a35e8f593eedfda658d73844122f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not force c99 mode to be able to remove both patches and because it
does not seem to be motivated. Indeed, even if the second patch was
sucessfully upstreamed. The first one can't be upstreamed as it raises
the following build falure on Solaris 11 (due to mixing c99 and
_POSIX_C_SOURCE):

 #if defined(STDC_C99) && (defined(_XOPEN_OR_POSIX) && !defined(XPG6))
 #error "Compiler or options invalid for pre-UNIX 03 X/Open applications \
 and pre-2001 POSIX applications"

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...c-properly-get-struct-timespec-definition.patch | 38 ----------------------
 ...configure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch | 38 ----------------------
 package/mbuffer/mbuffer.mk                         |  3 --
 3 files changed, 79 deletions(-)

diff --git a/package/mbuffer/0001-globals.c-properly-get-struct-timespec-definition.patch b/package/mbuffer/0001-globals.c-properly-get-struct-timespec-definition.patch
deleted file mode 100644
index fd14a5d759..0000000000
--- a/package/mbuffer/0001-globals.c-properly-get-struct-timespec-definition.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 1fc7ac1e29eb6a0311d2d4c209f55adb92740d50 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 13 Apr 2020 09:56:16 +0200
-Subject: [PATCH] globals.c: properly get 'struct timespec' definition
-
-'struct timespec' is defined in <time.h>, and according to man
-nanosleep(2), only available if _POSIX_C_SOURCE >= 199309L.
-
-Fixes:
-
-globals.c:90:2: error: storage size of 'Starttime' isn't known
-  Starttime;
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- globals.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/globals.c b/globals.c
-index 5c10312..1c0ce80 100644
---- a/globals.c
-+++ b/globals.c
-@@ -17,10 +17,11 @@
-  *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
-  */
- 
-+#define _POSIX_C_SOURCE 199309L
- #include "dest.h"
- #include "globals.h"
- #include <fcntl.h>
--#include <sys/time.h>
-+#include <time.h>
- 
- dest_t *Dest = 0;
- 
--- 
-2.25.2
-
diff --git a/package/mbuffer/0002-configure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch b/package/mbuffer/0002-configure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch
deleted file mode 100644
index 661586ce02..0000000000
--- a/package/mbuffer/0002-configure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 03db384ff0413d003de271355f59aba8c3f815a1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 21 Apr 2020 14:30:20 +0200
-Subject: [PATCH] configure.in: set AC_USE_SYSTEM_EXTENSIONS
-
-Set AC_USE_SYSTEM_EXTENSIONS so _POSIX_SOURCE will be defined and the
-following build failure will be avoided when building in c89 or c99
-mode:
-
-log.c: In function 'infomsg':
-log.c:123:12: error: 'PIPE_BUF' undeclared (first use in this function)
-   if (s <= PIPE_BUF) {
-            ^~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/5f4e9079b3377a869ec7002a8138b80eb6194bbb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to thomas at maier-komor.de]
----
- configure.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.in b/configure.in
-index 02921c2..aba4af0 100644
---- a/configure.in
-+++ b/configure.in
-@@ -3,6 +3,7 @@ AC_CONFIG_HEADER(config.h)
- 
- AC_CANONICAL_SYSTEM
- AC_EXEEXT
-+AC_USE_SYSTEM_EXTENSIONS
- 
- PACKAGE=mbuffer
- VERSION=20140310
--- 
-2.25.1
-
diff --git a/package/mbuffer/mbuffer.mk b/package/mbuffer/mbuffer.mk
index 324780fe69..f87b2b114f 100644
--- a/package/mbuffer/mbuffer.mk
+++ b/package/mbuffer/mbuffer.mk
@@ -10,9 +10,6 @@ MBUFFER_SITE = http://www.maier-komor.de/software/mbuffer
 MBUFFER_LICENSE = GPL-3.0+
 MBUFFER_LICENSE_FILES = LICENSE
 MBUFFER_CONF_OPTS = --disable-debug
-MBUFFER_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
-# We're patching configure.in
-MBUFFER_AUTORECONF = YES
 
 # we don't need tests & co. so we specify a target
 # so that the others don't get built, e.g idev.so
