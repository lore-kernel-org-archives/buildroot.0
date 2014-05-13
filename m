From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 May 2014 23:47:37 +0200
Subject: [Buildroot] [PATCH] libunwind: add patch to fix behavior for ARM <
	v6
Message-ID: <1400017657-12704-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since libatomic_ops does not implement real atomic operations for
ARMv4 and ARMv5, libunwind must define AO_REQUIRE_CAS do indicate it
requires compare-and-swap operations, even if not available as real
atomic operations for the current architecture. In this case,
libatomic_ops will rely on emulated atomic operations, which also
require linking against libatomic_ops, which was until now not done by
libunwind.

This fixes the mysterious ltrace build issue:

  http://autobuild.buildroot.org/results/e1b/e1b330abfa2d80f3f30bc3359428ea429c690eb8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 ...ests.patch => libunwind-01-disable-tests.patch} |  0
 ...Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch | 56 ++++++++++++++++++++++
 package/libunwind/libunwind.mk                     |  1 +
 3 files changed, 57 insertions(+)
 rename package/libunwind/{libunwind-disable-tests.patch => libunwind-01-disable-tests.patch} (100%)
 create mode 100644 package/libunwind/libunwind-02-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch

diff --git a/package/libunwind/libunwind-disable-tests.patch b/package/libunwind/libunwind-01-disable-tests.patch
similarity index 100%
rename from package/libunwind/libunwind-disable-tests.patch
rename to package/libunwind/libunwind-01-disable-tests.patch
diff --git a/package/libunwind/libunwind-02-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch b/package/libunwind/libunwind-02-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
new file mode 100644
index 0000000..2a37ed7
--- /dev/null
+++ b/package/libunwind/libunwind-02-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
@@ -0,0 +1,56 @@
+From 24484e80b3e329c9edee1995e102f8612eedb79c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 13 May 2014 23:32:27 +0200
+Subject: [PATCH] Add AO_REQUIRE_CAS to fix build on ARM < v6
+
+ARM earlier than ARMv6, such as ARMv4 and ARMv5 do not provide
+optimize atomic operations in libatomic_ops. Since libunwind is using
+such operations, it should define AO_REQUIRE_CAS before including
+<atomic_ops.h> so that libatomic_ops knows it should use emulated
+atomic operations instead (even though they are obviously a lot more
+expensive).
+
+Also, while real atomic operations are all inline functions and
+therefore linking against libatomic_ops was not required, the emulated
+atomic operations actually require linking against libatomic_ops, so
+the commented AC_CHECK_LIB test in acinclude.m4 is uncommented to make
+sure we link against libatomic_ops.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ acinclude.m4          | 8 +-------
+ include/libunwind_i.h | 1 +
+ 2 files changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 497f7c2..9c15af1 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -22,11 +22,5 @@ fi])
+ AC_DEFUN([CHECK_ATOMIC_OPS],
+ [dnl Check whether the system has the atomic_ops package installed.
+   AC_CHECK_HEADERS(atomic_ops.h)
+-#
+-# Don't link against libatomic_ops for now.  We don't want libunwind
+-# to depend on libatomic_ops.so.  Fortunately, none of the platforms
+-# we care about so far need libatomic_ops.a (everything is done via
+-# inline macros).
+-#
+-#  AC_CHECK_LIB(atomic_ops, main)
++  AC_CHECK_LIB(atomic_ops, main)
+ ])
+diff --git a/include/libunwind_i.h b/include/libunwind_i.h
+index 23f615e..deabdfd 100644
+--- a/include/libunwind_i.h
++++ b/include/libunwind_i.h
+@@ -95,6 +95,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+ 	(pthread_mutex_unlock != NULL ? pthread_mutex_unlock (l) : 0)
+ 
+ #ifdef HAVE_ATOMIC_OPS_H
++# define AO_REQUIRE_CAS
+ # include <atomic_ops.h>
+ static inline int
+ cmpxchg_ptr (void *addr, void *old, void *new)
+-- 
+1.9.2
+
diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index f573722..48dd0ec 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -9,5 +9,6 @@ LIBUNWIND_SITE = http://download.savannah.gnu.org/releases/libunwind
 LIBUNWIND_INSTALL_STAGING = YES
 LIBUNWIND_LICENSE_FILES = COPYING
 LIBUNWIND_LICENSE = MIT
+LIBUNWIND_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
1.9.2
