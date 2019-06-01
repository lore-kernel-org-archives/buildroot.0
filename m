From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 15:05:44 +0200
Subject: [Buildroot] [git commit] package/alsa-lib: bump to version 1.1.9
Message-ID: <20190602201238.4B7B0811FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8cb594bc8ce07e22e247972a417d53fd56e10fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch 0002 which is included in the new version.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nditionally-enable-libdl-in-AM_PATH_ALSA-.patch | 49 ----------------------
 package/alsa-lib/alsa-lib.hash                     |  2 +-
 package/alsa-lib/alsa-lib.mk                       |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/package/alsa-lib/0002-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch b/package/alsa-lib/0002-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch
deleted file mode 100644
index 3aab64e5e8..0000000000
--- a/package/alsa-lib/0002-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 2aba563bd077fda94fb9c2c33002ee0ac119b345 Mon Sep 17 00:00:00 2001
-From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-Date: Fri, 13 Apr 2018 09:13:46 +0200
-Subject: [PATCH] alsa-lib: conditionally enable libdl in AM_PATH_ALSA m4 macro
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The AM_PATH_ALSA macro in utils/alsa.m4 unconditionally uses -ldl. This
-breaks compilation of alsa-utils (and probably other packages using this
-macro) for targets that do not support dynamic loading, such as for
-Blackfin FLAT binaries.
-
-This patch updates the macro to check if dlopen is available, and use that
-result to conditionally add -ldl to the list of libraries.
-
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-[J??rg: update for 1.1.6]
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
-Upstream: http://mailman.alsa-project.org/pipermail/alsa-devel/2018-November/141377.html
----
- utils/alsa.m4 | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/utils/alsa.m4 b/utils/alsa.m4
-index e12310df..a5c5a292 100644
---- a/utils/alsa.m4
-+++ b/utils/alsa.m4
-@@ -44,6 +44,8 @@ if test "$alsa_inc_prefix" != "" ; then
- fi
- AC_MSG_RESULT($ALSA_CFLAGS)
- 
-+AC_CHECK_LIB(c, dlopen, LIBDL="", [AC_CHECK_LIB(dl, dlopen, LIBDL="-ldl")])
-+
- dnl add any special lib dirs
- AC_MSG_CHECKING(for ALSA LDFLAGS)
- if test "$alsa_prefix" != "" ; then
-@@ -52,7 +54,7 @@ if test "$alsa_prefix" != "" ; then
- fi
- 
- dnl add the alsa library
--ALSA_LIBS="$ALSA_LIBS -lasound -lm -ldl -lpthread"
-+ALSA_LIBS="$ALSA_LIBS -lasound -lm $LIBDL -lpthread"
- LIBS="$ALSA_LIBS $LIBS"
- AC_MSG_RESULT($ALSA_LIBS)
- 
--- 
-2.14.3
-
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 4373a2a592..54b2a27ddf 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 9d6000b882a3b2df56300521225d69717be6741b71269e488bb20a20783bdc09  alsa-lib-1.1.7.tar.bz2
+sha256 488373aef5396682f3a411a6d064ae0ad196b9c96269d0bb912fbdeec94b994b  alsa-lib-1.1.9.tar.bz2
 sha256 32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256 bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 9de45d2089..fecf7d7cfa 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.1.7
+ALSA_LIB_VERSION = 1.1.9
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
