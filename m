From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 12:32:17 +0100
Subject: [Buildroot] [git commit] alsa-lib: fix build when dynamic load is
	not supported (e.g. blackfin FLAT)
Message-ID: <20140223113404.CB21E9B7F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d911f9b7bd7beac94a3255b29ebe432405d511f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The FLAT GNU toolchain doesn't include the dlfcn.h header file.
Provide the necessary declarations (RTLD_*) to make alsa-lib happy.

Fixes
http://autobuild.buildroot.org/results/706/7069e1f43cbed745d65f7dd9904a3fff034530ac/build-end.log

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
[Thomas: change sequence number from 003 to 0003, update patch and commit
         message ]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/alsa-lib-0003-dlmisc.patch |   57 +++++++++++++++++++++++++++
 1 files changed, 57 insertions(+), 0 deletions(-)

diff --git a/package/alsa-lib/alsa-lib-0003-dlmisc.patch b/package/alsa-lib/alsa-lib-0003-dlmisc.patch
new file mode 100644
index 0000000..05dc70e
--- /dev/null
+++ b/package/alsa-lib/alsa-lib-0003-dlmisc.patch
@@ -0,0 +1,57 @@
+alsa-lib: provide dummy definitions of RTLD_* if necessary
+
+The FLAT GNU toolchain (e.g. blackfin) doesn't include the dlfcn.h header
+file, so we need to guard that include. Additionally, provide dummy
+definitions for parameters RTLD_GLOBAL / RTLD_NOW which are normally
+provided by dlfcn.h.
+
+Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
+[Thomas: don't add separate dlmisc.h, move dummy defs to global.h]
+Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+
+diff --git a/include/global.h b/include/global.h
+--- a/include/global.h
++++ b/include/global.h
+@@ -97,6 +97,16 @@ extern struct snd_dlsym_link *snd_dlsym_
+ /** \brief Returns the version of a dynamic symbol as a string. */
+ #define SND_DLSYM_VERSION(version) __STRING(version)
+ 
++/* RTLD_NOW and RTLD_GLOBAL (used for 'mode' in snd_dlopen) are not defined
++ * on all arches (e.g. blackfin), so provide a dummy definition here. */
++#ifndef RTLD_NOW
++#define RTLD_NOW 0
++#endif
++
++#ifndef RTLD_GLOBAL
++#define RTLD_GLOBAL 0
++#endif
++
+ void *snd_dlopen(const char *file, int mode);
+ void *snd_dlsym(void *handle, const char *name, const char *version);
+ int snd_dlclose(void *handle);
+diff --git a/modules/mixer/simple/sbasedl.c b/modules/mixer/simple/sbasedl.c
+--- a/modules/mixer/simple/sbasedl.c
++++ b/modules/mixer/simple/sbasedl.c
+@@ -27,7 +27,9 @@
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
+ #include <math.h>
++#ifdef HAVE_LIBDL
+ #include <dlfcn.h>
++#endif
+ #include "config.h"
+ #include "asoundlib.h"
+ #include "mixer_abst.h"
+diff --git a/src/mixer/simple_abst.c b/src/mixer/simple_abst.c
+--- a/src/mixer/simple_abst.c
++++ b/src/mixer/simple_abst.c
+@@ -34,7 +34,9 @@
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
+ #include <math.h>
++#ifdef HAVE_LIBDL
+ #include <dlfcn.h>
++#endif
+ #include "config.h"
+ #include "asoundlib.h"
+ #include "mixer_simple.h"
