From: John Keeping <john@keeping.me.uk>
Date: Tue,  5 Jan 2016 12:15:15 +0000
Subject: [Buildroot] [PATCH] bluez5_utils: bump to version 5.37
Message-ID: <1451996115-23241-1-git-send-email-john@keeping.me.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: John Keeping <john@metanate.com>

Both patches are now included upstream.

Signed-off-by: John Keeping <john@metanate.com>
---
 .../0001-Link-mcaptest-with-lrt-when-needed.patch  | 54 ----------------------
 .../0002-src-shared-ecc.c-include-config.h.patch   | 33 -------------
 package/bluez5_utils/bluez5_utils.hash             |  2 +-
 package/bluez5_utils/bluez5_utils.mk               |  2 +-
 4 files changed, 2 insertions(+), 89 deletions(-)
 delete mode 100644 package/bluez5_utils/0001-Link-mcaptest-with-lrt-when-needed.patch
 delete mode 100644 package/bluez5_utils/0002-src-shared-ecc.c-include-config.h.patch

diff --git a/package/bluez5_utils/0001-Link-mcaptest-with-lrt-when-needed.patch b/package/bluez5_utils/0001-Link-mcaptest-with-lrt-when-needed.patch
deleted file mode 100644
index a36e285..0000000
--- a/package/bluez5_utils/0001-Link-mcaptest-with-lrt-when-needed.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 54b8977c2f854d04f9c6383e2cac76ea4cde3eaa Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 29 Dec 2014 12:23:41 +0100
-Subject: [PATCH] Link mcaptest with -lrt when needed
-
-The mcaptest tool uses the profiles/health/mcap.c source file, which
-calls clock_getres(). This function is defined in librt in some C
-libraries, so mcaptest should be linked against librt when needed,
-otherwise one gets link failures such as:
-
-ld: profiles/health/mcap.o: undefined reference to symbol 'clock_getres@@GLIBC_2.2.5'
-ld: note: 'clock_getres@@GLIBC_2.2.5' is defined in DSO [...]/sysroot/lib64/librt.so.1 so try adding it to the linker command line
-[...]/sysroot/lib64/librt.so.1: could not read symbols: Invalid operation
-collect2: error: ld returned 1 exit status
-Makefile:4184: recipe for target 'tools/mcaptest' failed
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.tools | 2 +-
- configure.ac   | 5 +++++
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.tools b/Makefile.tools
-index bc827fe..fef3db5 100644
---- a/Makefile.tools
-+++ b/Makefile.tools
-@@ -195,7 +195,7 @@ tools_mcaptest_SOURCES = tools/mcaptest.c \
- 				btio/btio.h btio/btio.c \
- 				src/log.c src/log.h \
- 				profiles/health/mcap.h profiles/health/mcap.c
--tools_mcaptest_LDADD = lib/libbluetooth-internal.la @GLIB_LIBS@
-+tools_mcaptest_LDADD = lib/libbluetooth-internal.la @GLIB_LIBS@ @RT_LIBS@
- 
- dist_man_MANS += tools/hciattach.1 tools/hciconfig.1 \
- 			tools/hcitool.1 tools/hcidump.1 \
-diff --git a/configure.ac b/configure.ac
-index 4739c10..b0afba6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -54,6 +54,11 @@ AC_CHECK_LIB(pthread, pthread_create, dummy=yes,
- AC_CHECK_LIB(dl, dlopen, dummy=yes,
- 			AC_MSG_ERROR(dynamic linking loader is required))
- 
-+AC_SEARCH_LIBS([clock_getres], [rt],
-+			[test "$ac_cv_search_clock_getres" = "none required" ||
-+			RT_LIBS=$ac_cv_search_clock_getres])
-+AC_SUBST([RT_LIBS])
-+
- PKG_CHECK_MODULES(GLIB, glib-2.0 >= 2.28, dummy=yes,
- 				AC_MSG_ERROR(GLib >= 2.28 is required))
- AC_SUBST(GLIB_CFLAGS)
--- 
-2.1.0
-
diff --git a/package/bluez5_utils/0002-src-shared-ecc.c-include-config.h.patch b/package/bluez5_utils/0002-src-shared-ecc.c-include-config.h.patch
deleted file mode 100644
index f339c88..0000000
--- a/package/bluez5_utils/0002-src-shared-ecc.c-include-config.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3c5a93d0be4457120d17da70918f9eb8799d6c52 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 1 Jan 2015 22:33:34 +0100
-Subject: [PATCH] src/shared/ecc.c: include <config.h>
-
-The ecc.c file forgets to include <config.h>. This causes build
-failures with certain C libraries, because ecc.c uses O_CLOEXEC, which
-is only available when _GNU_SOURCE is defined. And _GNU_SOURCE gets
-defined by <config.h>, so it should be included.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/shared/ecc.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/shared/ecc.c b/src/shared/ecc.c
-index 33c4187..41be02b 100644
---- a/src/shared/ecc.c
-+++ b/src/shared/ecc.c
-@@ -24,6 +24,10 @@
-  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  */
- 
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
-+#endif
-+
- #include <fcntl.h>
- #include <unistd.h>
- #include <sys/types.h>
--- 
-2.1.0
-
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 8bddb71..75c53b3 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  fbf33cebc76f8c81f28f0d67c71a8a1ec4b04b087460ec7353f7e0c207a1f981    bluez-5.27.tar.xz
+sha256  c14ba9ddcb0055522073477b8fd8bf1ddf5d219e75fdfd4699b7e0ce5350d6b0    bluez-5.37.tar.xz
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index cd3849a..1308e4e 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ5_UTILS_VERSION = 5.27
+BLUEZ5_UTILS_VERSION = 5.37
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-- 
2.7.0.rc0.76.g531d676
