From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Nov 2018 23:47:11 +0100
Subject: [Buildroot] [git commit] package/alsa-lib: drop patch
 0002-alsa-lib-provide-dummy-definitions-of-RTLD_-if-neces.patch
Message-ID: <20181107224643.6359781604@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa627bacc2eeffaba9f0287fa039864b2232d60c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The description of this patch was no longer correct: it no longer
provided dummy definitions of RTLD_* macros since commit
ccad7db515fa79d2331e4e949aafb32eca0b5214 ("alsa-lib: bump to version
1.1.6"). All it did is make two <dlfcn.h> inclusions optional.

However, this is no longer needed, since the alsa-lib code base
contains four inclusions of <dlfcn.h>, which are all properly handled:

 - include/local.h, the include is guarded by #ifdef HAVE_LIBDL

 - modules/mixer/simple/sbasedl.c, modules are only built if
   BUILD_MODULES is enabled, and BUILD_MODULES is only enabled if
   HAVE_LIBDL is enabled

 - src/mixer/simple_abst.c, this file is only built if BUILD_MODULES
   is enabled, which itself is only enabled if HAVE_LIBDL is enabled

 - src/pcm/pcm_meter.c, this file is only built if
   BUILD_PCM_PLUGIN_METER is enabled, and this is not enabled if
   HAVE_LIBDL is not enabled.

Conclusion: the patch can be dropped. The third patch is renumbered as
appropriate.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ditionally-enable-libdl-in-AM_PATH_ALSA-.patch} |  0
 ...ovide-dummy-definitions-of-RTLD_-if-neces.patch | 57 ----------------------
 2 files changed, 57 deletions(-)

diff --git a/package/alsa-lib/0003-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch b/package/alsa-lib/0002-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch
similarity index 100%
rename from package/alsa-lib/0003-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch
rename to package/alsa-lib/0002-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch
diff --git a/package/alsa-lib/0002-alsa-lib-provide-dummy-definitions-of-RTLD_-if-neces.patch b/package/alsa-lib/0002-alsa-lib-provide-dummy-definitions-of-RTLD_-if-neces.patch
deleted file mode 100644
index f489f913d9..0000000000
--- a/package/alsa-lib/0002-alsa-lib-provide-dummy-definitions-of-RTLD_-if-neces.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From ff91d50a250e10a419bcd35176f3069161ac33bb Mon Sep 17 00:00:00 2001
-From: Sonic Zhang <sonic.zhang@analog.com>
-Date: Fri, 13 Apr 2018 09:11:23 +0200
-Subject: [PATCH] alsa-lib: provide dummy definitions of RTLD_* if necessary
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The FLAT GNU toolchain (e.g. blackfin) doesn't include the dlfcn.h header
-file, so we need to guard that include. Additionally, provide dummy
-definitions for parameters RTLD_GLOBAL / RTLD_NOW which are normally
-provided by dlfcn.h.
-
-Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
-[Thomas: don't add separate dlmisc.h, move dummy defs to global.h]
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-[J??rg: update for 1.1.6]
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- modules/mixer/simple/sbasedl.c | 4 +++-
- src/mixer/simple_abst.c        | 3 +++
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/modules/mixer/simple/sbasedl.c b/modules/mixer/simple/sbasedl.c
-index d8cbf0f1..daa0ab30 100644
---- a/modules/mixer/simple/sbasedl.c
-+++ b/modules/mixer/simple/sbasedl.c
-@@ -27,8 +27,10 @@
- #include <fcntl.h>
- #include <sys/ioctl.h>
- #include <math.h>
--#include <dlfcn.h>
- #include "config.h"
-+#ifdef HAVE_DLFCN
-+#include <dlfcn.h>
-+#endif
- #include "asoundlib.h"
- #include "mixer_abst.h"
- #include "sbase.h"
-diff --git a/src/mixer/simple_abst.c b/src/mixer/simple_abst.c
-index 9c61cb58..0ca58fe0 100644
---- a/src/mixer/simple_abst.c
-+++ b/src/mixer/simple_abst.c
-@@ -34,7 +34,10 @@
- #include <fcntl.h>
- #include <sys/ioctl.h>
- #include <math.h>
-+#include "config.h"
-+#ifdef HAVE_DLFCN
- #include <dlfcn.h>
-+#endif
- #include "mixer_local.h"
- #include "mixer_simple.h"
- 
--- 
-2.14.3
-
