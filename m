From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  4 Jul 2019 08:06:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/waffle: bump version to 1.6.0
Message-ID: <20190704060635.11984-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0001 which was applied upstream.

Switched _SITE to gitlab according to release notes:
https://lists.freedesktop.org/archives/mesa-announce/2019-June/000520.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ags-from-.pc-files-to-waffle-cflags.patch} |  0
 ...ads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch | 54 -------------------
 package/waffle/waffle.hash                    |  2 +-
 package/waffle/waffle.mk                      |  4 +-
 4 files changed, 3 insertions(+), 57 deletions(-)
 rename package/waffle/{0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch => 0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch} (100%)
 delete mode 100644 package/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch

diff --git a/package/waffle/0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch b/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
similarity index 100%
rename from package/waffle/0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
rename to package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
diff --git a/package/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch b/package/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
deleted file mode 100644
index ef54953e34..0000000000
--- a/package/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 117456752cf9ac1f24d3cfd917ad34f670c244b8 Mon Sep 17 00:00:00 2001
-From: Emil Velikov <emil.l.velikov@gmail.com>
-Date: Thu, 19 Mar 2015 22:26:11 +0000
-Subject: [PATCH] third_party/threads: Use PTHREAD_MUTEX_RECURSIVE by default
-
-PTHREAD_MUTEX_RECURSIVE_NP was used for compatibility with old glibc.
-Although due to the_GNU_SOURCES define the portable,
-PTHREAD_MUTEX_RECURSIVE will be available for Linuxes since at least
-1998. Simplify things giving us compatibility with musl which
-apparently does not provide the non-portable define.
-
-Inspired by almost identical commit in mesa aead7fe2e2b(c11/threads: Use
-PTHREAD_MUTEX_RECURSIVE by default) by Felix Janda.
-
-Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
-Reviewed-by: Chad Versace <chad.versace@intel.com>
-(Romain: cherry picked from commit 3b9b8f5f6d1b99af43e95ec0868404e552a85b73)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- third_party/threads/threads_posix.c | 10 ++++------
- 1 file changed, 4 insertions(+), 6 deletions(-)
-
-diff --git a/third_party/threads/threads_posix.c b/third_party/threads/threads_posix.c
-index 5835e43..e122bf9 100644
---- a/third_party/threads/threads_posix.c
-+++ b/third_party/threads/threads_posix.c
-@@ -26,6 +26,9 @@
-  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-  * DEALINGS IN THE SOFTWARE.
-  */
-+
-+#define _GNU_SOURCE
-+
- #include <stdlib.h>
- #ifndef assert
- #include <assert.h>
-@@ -150,13 +153,8 @@ int mtx_init(mtx_t *mtx, int type)
-       && type != (mtx_try|mtx_recursive))
-         return thrd_error;
-     pthread_mutexattr_init(&attr);
--    if ((type & mtx_recursive) != 0) {
--#if defined(__linux__) || defined(__linux)
--        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
--#else
-+    if ((type & mtx_recursive) != 0)
-         pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
--#endif
--    }
-     pthread_mutex_init(mtx, &attr);
-     pthread_mutexattr_destroy(&attr);
-     return thrd_success;
--- 
-2.14.3
-
diff --git a/package/waffle/waffle.hash b/package/waffle/waffle.hash
index f496927e32..5bb65c9d93 100644
--- a/package/waffle/waffle.hash
+++ b/package/waffle/waffle.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d662f6743f688dc5ea4b7d29f558eb54bd8f57350080f04a006693d22e5d1d5b  waffle-1.5.2.tar.gz
+sha256 b62bdc1c5ddea2f87c10a6d21d3812061e4c588a8a3bb45d9fd3ea3c9bd4fb30  waffle-1.6.0.tar.gz
 sha256 630844d1911c8a1b7b888a1de9097c4860b7e381362fd5aa64141d58ab7ecc9b  LICENSE.txt
diff --git a/package/waffle/waffle.mk b/package/waffle/waffle.mk
index 280e295cb3..02a17f848b 100644
--- a/package/waffle/waffle.mk
+++ b/package/waffle/waffle.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WAFFLE_VERSION = 1.5.2
-WAFFLE_SITE = $(call github,waffle-gl,waffle,v$(WAFFLE_VERSION))
+WAFFLE_VERSION = 1.6.0
+WAFFLE_SITE = https://gitlab.freedesktop.org/mesa/waffle/-/archive/v$(WAFFLE_VERSION)/waffle-v$(WAFFLE_VERSION).tar.bz2
 WAFFLE_INSTALL_STAGING = YES
 WAFFLE_LICENSE = BSD-2-Clause
 WAFFLE_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
