From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 22:35:07 +0100
Subject: [Buildroot] [git commit] alsa-lib: fix build on powerpc64 and
	powerpc64le
Message-ID: <20161103213512.4A3038005A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=258cc58294c22e6e3c399929b14fa9192ab38fb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes linker error
http://autobuild.buildroot.net/results/c6272ac900d1a53b976839ac4f50a210b3e6b354

On powerpc64 (and powerpc64le) the build fails due to linker problems
because of an old (2003) workaround for powerpc64, presumably working
around an old toolchain problem that is no longer present. Removing
the workaround allows the build to succeed. A new patch is added for
this.

Additionally, there was a mistake in patch 3: the patch added a test
for HAVE_LIBDL to include/alsa-symbols.h but it was positioned in the
file before config.h was included, so HAVE_LIBDL is never seen as
defined.  The test was also using HAVE_LIBDL (which indicates the
library) rather than HAVE_DLFCN (which indicates the header).

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-lib/0003-dlmisc.patch                 | 10 ++--
 .../0005-remove-powerpc64-workaround.patch         | 67 ++++++++++++++++++++++
 2 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/package/alsa-lib/0003-dlmisc.patch b/package/alsa-lib/0003-dlmisc.patch
index 05dc70e..24b7230 100644
--- a/package/alsa-lib/0003-dlmisc.patch
+++ b/package/alsa-lib/0003-dlmisc.patch
@@ -36,10 +36,11 @@ diff --git a/modules/mixer/simple/sbasedl.c b/modules/mixer/simple/sbasedl.c
  #include <fcntl.h>
  #include <sys/ioctl.h>
  #include <math.h>
-+#ifdef HAVE_LIBDL
++#include "config.h"
++#ifdef HAVE_DLFCN
  #include <dlfcn.h>
 +#endif
- #include "config.h"
+-#include "config.h"
  #include "asoundlib.h"
  #include "mixer_abst.h"
 diff --git a/src/mixer/simple_abst.c b/src/mixer/simple_abst.c
@@ -49,9 +50,10 @@ diff --git a/src/mixer/simple_abst.c b/src/mixer/simple_abst.c
  #include <fcntl.h>
  #include <sys/ioctl.h>
  #include <math.h>
-+#ifdef HAVE_LIBDL
++#include "config.h"
++#ifdef HAVE_DLFCN
  #include <dlfcn.h>
 +#endif
- #include "config.h"
+-#include "config.h"
  #include "asoundlib.h"
  #include "mixer_simple.h"
diff --git a/package/alsa-lib/0005-remove-powerpc64-workaround.patch b/package/alsa-lib/0005-remove-powerpc64-workaround.patch
new file mode 100644
index 0000000..57a369e
--- /dev/null
+++ b/package/alsa-lib/0005-remove-powerpc64-workaround.patch
@@ -0,0 +1,67 @@
+Linking currently fails on powerpc64 and powerpc64le when configured
+with --without-versioned, as follows:
+../src/.libs/libasound.so: undefined reference to `.__snd_pcm_hw_params_set_format_first'
+(And many similar messages.)
+
+This appears to be due to a very old (2003) workaround for powerpc64,
+(introduced by commit 06221f86) in include/alsa-symbols.h which alters
+symbol names. While it was probably necessary at the time, it does not
+appear to be necessary now and removing it fixes the build.
+
+Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
+---
+ include/alsa-symbols.h | 25 ++++---------------------
+ 1 file changed, 4 insertions(+), 21 deletions(-)
+
+diff --git a/include/alsa-symbols.h b/include/alsa-symbols.h
+index 51cb982..0cb0b9f 100644
+--- a/include/alsa-symbols.h
++++ b/include/alsa-symbols.h
+@@ -29,19 +29,10 @@
+ #define INTERNAL_CONCAT2_2(Pre, Post) Pre##Post
+ #define INTERNAL(Name) INTERNAL_CONCAT2_2(__, Name)
+ 
+-#ifdef __powerpc64__
+-# define symbol_version(real, name, version) 			\
+-	__asm__ (".symver " ASM_NAME(#real) "," ASM_NAME(#name) "@" #version);	\
+-	__asm__ (".symver ." ASM_NAME(#real) ",." ASM_NAME(#name) "@" #version)
+-# define default_symbol_version(real, name, version) 		\
+-	__asm__ (".symver " ASM_NAME(#real) "," ASM_NAME(#name) "@@" #version);	\
+-	__asm__ (".symver ." ASM_NAME(#real) ",." ASM_NAME(#name) "@@" #version)
+-#else
+-# define symbol_version(real, name, version) \
+-	__asm__ (".symver " ASM_NAME(#real) "," ASM_NAME(#name) "@" #version)
+-# define default_symbol_version(real, name, version) \
+-	__asm__ (".symver " ASM_NAME(#real) "," ASM_NAME(#name) "@@" #version)
+-#endif
++#define symbol_version(real, name, version) \
++__asm__ (".symver " ASM_NAME(#real) "," ASM_NAME(#name) "@" #version)
++#define default_symbol_version(real, name, version) \
++__asm__ (".symver " ASM_NAME(#real) "," ASM_NAME(#name) "@@" #version)
+ 
+ #ifdef USE_VERSIONED_SYMBOLS
+ #define use_symbol_version(real, name, version) \
+@@ -50,13 +41,6 @@
+ 		default_symbol_version(real, name, version)
+ #else
+ #define use_symbol_version(real, name, version) /* nothing */
+-#ifdef __powerpc64__
+-#define use_default_symbol_version(real, name, version) \
+-	__asm__ (".weak " ASM_NAME(#name)); 			\
+-	__asm__ (".weak ." ASM_NAME(#name)); 			\
+-	__asm__ (".set " ASM_NAME(#name) "," ASM_NAME(#real));		\
+-	__asm__ (".set ." ASM_NAME(#name) ",." ASM_NAME(#real))
+-#else
+ #if defined(__alpha__) || defined(__mips__)
+ #define use_default_symbol_version(real, name, version) \
+         __asm__ (".weak " ASM_NAME(#name)); \
+@@ -67,6 +51,5 @@
+ 	__asm__ (".set " ASM_NAME(#name) "," ASM_NAME(#real))
+ #endif
+ #endif
+-#endif
+ 
+ #endif /* __ALSA_SYMBOLS_H */
+-- 
+2.10.0.297.gf6727b0
+
