From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Aug 2014 21:36:52 +0200
Subject: [Buildroot] [git commit] systemd: fix endian detection for powerpc
Message-ID: <20140831193851.99AA49D573@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24534eb40aeb20d708b0163da8d1839041686845
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/d53/d5305af6e47da7a577e391c96328ca952c149cd1/

Apply two patches from upstream git to fix powerpc endian detection. These patches
are already part of systemd v216, so they should be dropped when the package
is bumped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...k-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch |  116 ++++++++++++++++++++
 ...icitly-include-endian.h-wherever-we-want-.patch |   53 +++++++++
 2 files changed, 169 insertions(+), 0 deletions(-)

diff --git a/package/systemd/systemd-04-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch b/package/systemd/systemd-04-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch
new file mode 100644
index 0000000..ca1af53
--- /dev/null
+++ b/package/systemd/systemd-04-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch
@@ -0,0 +1,116 @@
+From 4f4b92ba7ae9c56cb0f181d5f95d709e085b8bd5 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Fri, 11 Jul 2014 15:56:16 +0200
+Subject: [PATCH] always check for __BYTE_ORDER == __BIG_ENDIAN when checking
+ for endianess
+
+Let's always stick to glibc's way to determine byte order, and not mix
+autoconf-specific checks with gcc checks.
+---
+ src/shared/architecture.h | 12 ++++++------
+ src/shared/gpt.h          |  4 ++--
+ src/shared/time-dst.c     |  6 +++---
+ 3 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/src/shared/architecture.h b/src/shared/architecture.h
+index 4821d5d..58e97e5 100644
+--- a/src/shared/architecture.h
++++ b/src/shared/architecture.h
+@@ -80,7 +80,7 @@ Architecture uname_architecture(void);
+ #  define native_architecture() ARCHITECTURE_X86
+ #  define LIB_ARCH_TUPLE "i386-linux-gnu"
+ #elif defined(__powerpc64__)
+-#  if defined(WORDS_BIGENDIAN)
++#  if __BYTE_ORDER == __BIG_ENDIAN
+ #    define native_architecture() ARCHITECTURE_PPC64
+ #    define LIB_ARCH_TUPLE "ppc64-linux-gnu"
+ #  else
+@@ -88,7 +88,7 @@ Architecture uname_architecture(void);
+ #    error "Missing LIB_ARCH_TUPLE for PPC64LE"
+ #  endif
+ #elif defined(__powerpc__)
+-#  if defined(WORDS_BIGENDIAN)
++#  if __BYTE_ORDER == __BIG_ENDIAN
+ #    define native_architecture() ARCHITECTURE_PPC
+ #    define LIB_ARCH_TUPLE "powerpc-linux-gnu"
+ #  else
+@@ -117,7 +117,7 @@ Architecture uname_architecture(void);
+ #  define native_architecture() ARCHITECTURE_SPARC
+ #  define LIB_ARCH_TUPLE "sparc-linux-gnu"
+ #elif defined(__mips64__)
+-#  if defined(WORDS_BIGENDIAN)
++#  if __BYTE_ORDER == __BIG_ENDIAN
+ #    define native_architecture() ARCHITECTURE_MIPS64
+ #    error "Missing LIB_ARCH_TUPLE for MIPS64"
+ #  else
+@@ -125,7 +125,7 @@ Architecture uname_architecture(void);
+ #    error "Missing LIB_ARCH_TUPLE for MIPS64_LE"
+ #  endif
+ #elif defined(__mips__)
+-#  if defined(WORDS_BIGENDIAN)
++#  if __BYTE_ORDER == __BIG_ENDIAN
+ #    define native_architecture() ARCHITECTURE_MIPS
+ #    define LIB_ARCH_TUPLE "mips-linux-gnu"
+ #  else
+@@ -136,7 +136,7 @@ Architecture uname_architecture(void);
+ #  define native_architecture() ARCHITECTURE_ALPHA
+ #  define LIB_ARCH_TUPLE "alpha-linux-gnu"
+ #elif defined(__aarch64__)
+-#  if defined(WORDS_BIGENDIAN)
++#  if __BYTE_ORDER == __BIG_ENDIAN
+ #    define native_architecture() ARCHITECTURE_ARM64_BE
+ #    define LIB_ARCH_TUPLE "aarch64_be-linux-gnu"
+ #  else
+@@ -144,7 +144,7 @@ Architecture uname_architecture(void);
+ #    define LIB_ARCH_TUPLE "aarch64-linux-gnu"
+ #  endif
+ #elif defined(__arm__)
+-#  if defined(WORDS_BIGENDIAN)
++#  if __BYTE_ORDER == __BIG_ENDIAN
+ #    define native_architecture() ARCHITECTURE_ARM_BE
+ #    if defined(__ARM_EABI__)
+ #      if defined(__ARM_PCS_VFP)
+diff --git a/src/shared/gpt.h b/src/shared/gpt.h
+index 64090e0..278940b 100644
+--- a/src/shared/gpt.h
++++ b/src/shared/gpt.h
+@@ -42,10 +42,10 @@
+ #  define GPT_ROOT_NATIVE GPT_ROOT_X86
+ #endif
+ 
+-#if defined(__aarch64__) && !defined(WORDS_BIGENDIAN)
++#if defined(__aarch64__) && (__BYTE_ORDER != __BIG_ENDIAN)
+ #  define GPT_ROOT_NATIVE GPT_ROOT_ARM_64
+ #  define GPT_ROOT_SECONDARY GPT_ROOT_ARM
+-#elif defined(__arm__) && !defined(WORDS_BIGENDIAN)
++#elif defined(__arm__) && (__BYTE_ORDER != __BIG_ENDIAN)
+ #  define GPT_ROOT_NATIVE GPT_ROOT_ARM
+ #endif
+ 
+diff --git a/src/shared/time-dst.c b/src/shared/time-dst.c
+index ceca2fa..6195b11 100644
+--- a/src/shared/time-dst.c
++++ b/src/shared/time-dst.c
+@@ -207,8 +207,8 @@ read_again:
+                 if (type_idxs[i] >= num_types)
+                         return -EINVAL;
+ 
+-        if (BYTE_ORDER == BIG_ENDIAN ? sizeof(time_t) == 8 && trans_width == 4
+-                                     : sizeof(time_t) == 4 || trans_width == 4) {
++        if (__BYTE_ORDER == __BIG_ENDIAN ? sizeof(time_t) == 8 && trans_width == 4
++                                         : sizeof(time_t) == 4 || trans_width == 4) {
+                 /* Decode the transition times, stored as 4-byte integers in
+                    network (big-endian) byte order.  We work from the end of
+                    the array so as not to clobber the next element to be
+@@ -216,7 +216,7 @@ read_again:
+                 i = num_transitions;
+                 while (i-- > 0)
+                         transitions[i] = decode((char *)transitions + i * 4);
+-        } else if (BYTE_ORDER != BIG_ENDIAN && sizeof(time_t) == 8) {
++        } else if (__BYTE_ORDER != __BIG_ENDIAN && sizeof(time_t) == 8) {
+                 /* Decode the transition times, stored as 8-byte integers in
+                    network (big-endian) byte order.  */
+                 for (i = 0; i < num_transitions; ++i)
+-- 
+2.0.0
+
diff --git a/package/systemd/systemd-05-endian-explicitly-include-endian.h-wherever-we-want-.patch b/package/systemd/systemd-05-endian-explicitly-include-endian.h-wherever-we-want-.patch
new file mode 100644
index 0000000..5c1a9d1
--- /dev/null
+++ b/package/systemd/systemd-05-endian-explicitly-include-endian.h-wherever-we-want-.patch
@@ -0,0 +1,53 @@
+From 6017365a1d0c1c78fc34a7da63768ee5df5da511 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Fri, 11 Jul 2014 16:13:13 +0200
+Subject: [PATCH] endian: explicitly include endian.h wherever we want to use
+ __BYTE_ORDER
+
+---
+ src/libsystemd/sd-bus/bus-protocol.h | 1 +
+ src/shared/architecture.h            | 2 ++
+ src/shared/gpt.h                     | 2 ++
+ 3 files changed, 5 insertions(+)
+
+diff --git a/src/libsystemd/sd-bus/bus-protocol.h b/src/libsystemd/sd-bus/bus-protocol.h
+index 5046d17..4f46468 100644
+--- a/src/libsystemd/sd-bus/bus-protocol.h
++++ b/src/libsystemd/sd-bus/bus-protocol.h
+@@ -21,6 +21,7 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
++#include <endian.h>
+ 
+ /* Endianness */
+ 
+diff --git a/src/shared/architecture.h b/src/shared/architecture.h
+index 58e97e5..38780d1 100644
+--- a/src/shared/architecture.h
++++ b/src/shared/architecture.h
+@@ -21,6 +21,8 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
++#include <endian.h>
++
+ #include "util.h"
+ 
+ /* A cleaned up architecture definition. We don't want to get lost in
+diff --git a/src/shared/gpt.h b/src/shared/gpt.h
+index 278940b..ef3444f 100644
+--- a/src/shared/gpt.h
++++ b/src/shared/gpt.h
+@@ -19,6 +19,8 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
++#include <endian.h>
++
+ #include "sd-id128.h"
+ 
+ /* We only support root disk discovery for x86, x86-64 and ARM for
+-- 
+2.0.0
+
