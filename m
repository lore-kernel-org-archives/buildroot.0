From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 13 Apr 2018 09:28:24 +0200
Subject: [Buildroot] [PATCH 1/2] alsa-lib: bump to version 1.1.6
Message-ID: <20180413072825.14512-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Regenerate patches using git as patch 0002 didn't applied and the others were
fuzzy.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/alsa-lib/0001-no-mmu.patch            | 40 +++++++++-----
 package/alsa-lib/0002-dlmisc.patch            | 54 +++++++++----------
 ...-conditional-enabling-of-libdl-in-m4.patch | 17 +++++-
 package/alsa-lib/alsa-lib.hash                |  2 +-
 package/alsa-lib/alsa-lib.mk                  |  2 +-
 5 files changed, 73 insertions(+), 42 deletions(-)

diff --git a/package/alsa-lib/0001-no-mmu.patch b/package/alsa-lib/0001-no-mmu.patch
index 2ae0f67158..0114e29d64 100644
--- a/package/alsa-lib/0001-no-mmu.patch
+++ b/package/alsa-lib/0001-no-mmu.patch
@@ -1,14 +1,27 @@
+From fac9e178f0d221c33efa579f54f6456156570088 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Fri, 13 Apr 2018 09:02:37 +0200
+Subject: [PATCH 1/3] no mmu
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 Don't use fork() on noMMU platforms
 
-[Gustavo: update patch for 1.0.28]
+[J?rg: update patch for 1.1.6]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac         |  2 ++
+ src/pcm/pcm_direct.c | 10 +++++++++-
+ 2 files changed, 11 insertions(+), 1 deletion(-)
 
-Index: alsa-lib-1.0.26/configure.ac
-===================================================================
---- alsa-lib-1.0.26.orig/configure.ac	2012-09-06 10:55:14.000000000 +0200
-+++ alsa-lib-1.0.26/configure.ac	2013-03-09 16:22:08.000000000 +0100
-@@ -66,6 +66,8 @@
- AM_CONDITIONAL(ALSA_HSEARCH_R, [test "x$HAVE_HSEARCH_R" != xyes])
+diff --git a/configure.ac b/configure.ac
+index cce195ae..0c852434 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -51,6 +51,8 @@ dnl Checks for library functions.
+ AC_PROG_GCC_TRADITIONAL
  AC_CHECK_FUNCS([uselocale])
  
 +AC_CHECK_FUNC([fork])
@@ -16,11 +29,11 @@ Index: alsa-lib-1.0.26/configure.ac
  SAVE_LIBRARY_VERSION
  AC_SUBST(LIBTOOL_VERSION_INFO)
  
-Index: alsa-lib-1.0.26/src/pcm/pcm_direct.c
-===================================================================
---- alsa-lib-1.0.26.orig/src/pcm/pcm_direct.c	2012-09-06 10:55:14.000000000 +0200
-+++ alsa-lib-1.0.26/src/pcm/pcm_direct.c	2013-03-09 16:22:51.000000000 +0100
-@@ -424,13 +424,21 @@
+diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
+index 2b07eff9..4dc3ea26 100644
+--- a/src/pcm/pcm_direct.c
++++ b/src/pcm/pcm_direct.c
+@@ -431,13 +431,21 @@ int snd_pcm_direct_server_create(snd_pcm_direct_t *dmix)
  		close(dmix->server_fd);
  		return ret;
  	}
@@ -43,3 +56,6 @@ Index: alsa-lib-1.0.26/src/pcm/pcm_direct.c
  		if (ret == 0)
  			server_job(dmix);
  		_exit(EXIT_SUCCESS);
+-- 
+2.17.0
+
diff --git a/package/alsa-lib/0002-dlmisc.patch b/package/alsa-lib/0002-dlmisc.patch
index 24b7230cae..bf8c970283 100644
--- a/package/alsa-lib/0002-dlmisc.patch
+++ b/package/alsa-lib/0002-dlmisc.patch
@@ -1,3 +1,11 @@
+From 0400d018fc7c71ac628bcce608656febe16e0f77 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Fri, 13 Apr 2018 09:11:23 +0200
+Subject: [PATCH 2/3] dlmisc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 alsa-lib: provide dummy definitions of RTLD_* if necessary
 
 The FLAT GNU toolchain (e.g. blackfin) doesn't include the dlfcn.h header
@@ -6,47 +14,36 @@ definitions for parameters RTLD_GLOBAL / RTLD_NOW which are normally
 provided by dlfcn.h.
 
 Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
+[J?rg: update for 1.1.6]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 [Thomas: don't add separate dlmisc.h, move dummy defs to global.h]
 Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+---
+ modules/mixer/simple/sbasedl.c | 4 +++-
+ src/mixer/simple_abst.c        | 3 +++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
 
-diff --git a/include/global.h b/include/global.h
---- a/include/global.h
-+++ b/include/global.h
-@@ -97,6 +97,16 @@ extern struct snd_dlsym_link *snd_dlsym_
- /** \brief Returns the version of a dynamic symbol as a string. */
- #define SND_DLSYM_VERSION(version) __STRING(version)
- 
-+/* RTLD_NOW and RTLD_GLOBAL (used for 'mode' in snd_dlopen) are not defined
-+ * on all arches (e.g. blackfin), so provide a dummy definition here. */
-+#ifndef RTLD_NOW
-+#define RTLD_NOW 0
-+#endif
-+
-+#ifndef RTLD_GLOBAL
-+#define RTLD_GLOBAL 0
-+#endif
-+
- void *snd_dlopen(const char *file, int mode);
- void *snd_dlsym(void *handle, const char *name, const char *version);
- int snd_dlclose(void *handle);
 diff --git a/modules/mixer/simple/sbasedl.c b/modules/mixer/simple/sbasedl.c
+index d8cbf0f1..daa0ab30 100644
 --- a/modules/mixer/simple/sbasedl.c
 +++ b/modules/mixer/simple/sbasedl.c
-@@ -27,7 +27,9 @@
+@@ -27,8 +27,10 @@
  #include <fcntl.h>
  #include <sys/ioctl.h>
  #include <math.h>
-+#include "config.h"
+-#include <dlfcn.h>
+ #include "config.h"
 +#ifdef HAVE_DLFCN
- #include <dlfcn.h>
++#include <dlfcn.h>
 +#endif
--#include "config.h"
  #include "asoundlib.h"
  #include "mixer_abst.h"
+ #include "sbase.h"
 diff --git a/src/mixer/simple_abst.c b/src/mixer/simple_abst.c
+index 9c61cb58..0ca58fe0 100644
 --- a/src/mixer/simple_abst.c
 +++ b/src/mixer/simple_abst.c
-@@ -34,7 +34,9 @@
+@@ -34,7 +34,10 @@
  #include <fcntl.h>
  #include <sys/ioctl.h>
  #include <math.h>
@@ -54,6 +51,9 @@ diff --git a/src/mixer/simple_abst.c b/src/mixer/simple_abst.c
 +#ifdef HAVE_DLFCN
  #include <dlfcn.h>
 +#endif
--#include "config.h"
- #include "asoundlib.h"
+ #include "mixer_local.h"
  #include "mixer_simple.h"
+ 
+-- 
+2.17.0
+
diff --git a/package/alsa-lib/0003-conditional-enabling-of-libdl-in-m4.patch b/package/alsa-lib/0003-conditional-enabling-of-libdl-in-m4.patch
index c533419baa..42ecaee61d 100644
--- a/package/alsa-lib/0003-conditional-enabling-of-libdl-in-m4.patch
+++ b/package/alsa-lib/0003-conditional-enabling-of-libdl-in-m4.patch
@@ -1,3 +1,11 @@
+From b7aec21cdec1fc2c18c91ae47d54b3acf56ea378 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Fri, 13 Apr 2018 09:13:46 +0200
+Subject: [PATCH 3/3] conditional enabling of libdl in m4
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 alsa-lib: conditionally enable libdl in AM_PATH_ALSA m4 macro
 
 The AM_PATH_ALSA macro in utils/alsa.m4 unconditionally uses -ldl. This
@@ -8,11 +16,15 @@ Blackfin FLAT binaries.
 This patch updates the macro to check if dlopen is available, and use that
 result to conditionally add -ldl to the list of libraries.
 
+[J?rg: update for 1.1.6]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-
 ---
+ utils/alsa.m4 | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/utils/alsa.m4 b/utils/alsa.m4
+index e12310df..a5c5a292 100644
 --- a/utils/alsa.m4
 +++ b/utils/alsa.m4
 @@ -44,6 +44,8 @@ if test "$alsa_inc_prefix" != "" ; then
@@ -33,3 +45,6 @@ diff --git a/utils/alsa.m4 b/utils/alsa.m4
  LIBS="$ALSA_LIBS $LIBS"
  AC_MSG_RESULT($ALSA_LIBS)
  
+-- 
+2.17.0
+
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 885309386e..d2434380bd 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 f4f68ad3c6da36b0b5241ac3c798a7a71e0e97d51f972e9f723b3f20a9650ae6  alsa-lib-1.1.5.tar.bz2
+sha256 5f2cd274b272cae0d0d111e8a9e363f08783329157e8dd68b3de0c096de6d724  alsa-lib-1.1.6.tar.bz2
 sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
 sha256 bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 3235502089..39be1bf005 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.1.5
+ALSA_LIB_VERSION = 1.1.6
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
-- 
2.17.0
