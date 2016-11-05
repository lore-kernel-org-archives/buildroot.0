From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 13:39:49 +0100
Subject: [Buildroot] [git commit branch/next] systemd: bump version to 232
Message-ID: <20161105123954.5F84A8172B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f9381fa55f9de08e4810417094679fb3662149a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- 0002 patch tweaked. There is a hunk that has been removed upstream by
  this commit:
  https://github.com/systemd/systemd/commit/082210c7a837063fd8b520b18c221b42059d7eff
- Patches 0004, 0005 and 0006 were backported from upstream and now they
  are included in this release, so drop them.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...uild-sys-revert-use-of-ln-relative-option.patch | 18 +++---
 ...-export-raw-needs-missing.h-for-O_TMPFILE.patch | 31 -----------
 ...h-add-missing-definitions-for-__O_TMPFILE.patch | 63 ---------------------
 ...basic-fileio-we-always-have-O_TMPFILE-now.patch | 65 ----------------------
 package/systemd/systemd.hash                       |  2 +-
 package/systemd/systemd.mk                         |  2 +-
 6 files changed, 9 insertions(+), 172 deletions(-)

diff --git a/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch b/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
index 18dc987..2c1d929 100644
--- a/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
+++ b/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
@@ -11,25 +11,21 @@ for example).
 
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 [Maxime: refresh the patch]
+[Vincent:
+  refresh the patch, move-to-rootlibdir removed by:
+  https://github.com/systemd/systemd/commit/082210c7a837063fd8b520b18c221b42059d7eff
+]
 Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 ---
- Makefile.am  | 15 +++------------
+ Makefile.am  | 11 ++---------
  configure.ac |  2 --
- 2 files changed, 3 insertions(+), 14 deletions(-)
+ 2 files changed, 2 insertions(+), 11 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
 index 0c27f81..4de1595 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -255,7 +255,7 @@ define move-to-rootlibdir
- 		$(MKDIR_P) $(DESTDIR)$(rootlibdir) && \
- 		so_img_name=$$(readlink $(DESTDIR)$(libdir)/$$libname) && \
- 		rm -f $(DESTDIR)$(libdir)/$$libname && \
--		$(LN_S) --relative -f $(DESTDIR)$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
-+		$(LN_S) -f $(DESTDIR)$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
- 		mv $(DESTDIR)$(libdir)/$$libname.* $(DESTDIR)$(rootlibdir); \
- 	fi
- endef
 @@ -312,9 +312,9 @@ install-aliases-hook:
  	set -- $(SYSTEM_UNIT_ALIASES) && \
  		dir=$(systemunitdir) && $(install-aliases)
diff --git a/package/systemd/0004-importd-export-raw-needs-missing.h-for-O_TMPFILE.patch b/package/systemd/0004-importd-export-raw-needs-missing.h-for-O_TMPFILE.patch
deleted file mode 100644
index bded6bc..0000000
--- a/package/systemd/0004-importd-export-raw-needs-missing.h-for-O_TMPFILE.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 4a6d35237f96d07f3a783c874933f87bf14f93e0 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 28 Aug 2016 16:26:04 +0200
-Subject: [PATCH] importd/export-raw: needs missing.h for O_TMPFILE
-
-O_TMPFILE may be missing from the system headers, so use our fallback
-definition.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Backported from upstream:
-    https://github.com/systemd/systemd/commit/4a6d35237f96d07f3a783c874933f87bf14f93e0
----
- src/import/export-raw.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/import/export-raw.c b/src/import/export-raw.c
-index db06e11..6136b67 100644
---- a/src/import/export-raw.c
-+++ b/src/import/export-raw.c
-@@ -34,6 +34,7 @@
- #include "fd-util.h"
- #include "fileio.h"
- #include "import-common.h"
-+#include "missing.h"
- #include "ratelimit.h"
- #include "string-util.h"
- #include "util.h"
--- 
-2.7.4
-
diff --git a/package/systemd/0005-missing.h-add-missing-definitions-for-__O_TMPFILE.patch b/package/systemd/0005-missing.h-add-missing-definitions-for-__O_TMPFILE.patch
deleted file mode 100644
index 1c5ca05..0000000
--- a/package/systemd/0005-missing.h-add-missing-definitions-for-__O_TMPFILE.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From daad709a7c13c0fac73e407528f96cc876c09629 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 28 Aug 2016 17:26:42 +0200
-Subject: [PATCH] missing.h: add missing definitions for __O_TMPFILE
-
-Currently, a missing __O_TMPFILE was only defined for i386 and x86_64,
-leaving any other architectures with an "old" toolchain fail miserably
-at build time:
-    src/import/export-raw.c: In function 'reflink_snapshot':
-    src/import/export-raw.c:271:26: error: 'O_TMPFILE' undeclared (first use in this function)
-             new_fd = open(d, O_TMPFILE|O_CLOEXEC|O_NOCTTY|O_RDWR, 0600);
-                              ^
-
-__O_TMPFILE (and O_TMPFILE) are available since glibc 2.19. However, a
-lot of existing toolchains are still using glibc-2.18, and some even
-before that, and it is not really possible to update those toolchains.
-
-Instead of defining it only for i386 and x86_64, define __O_TMPFILE
-with the specific values for those archs where it is different from the
-generic value. Use the values as found in the Linux kernel (v4.8-rc3,
-current as of time of commit).
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Backported from upstream:
-    https://github.com/systemd/systemd/commit/daad709a7c13c0fac73e407528f96cc876c09629
----
- src/basic/missing.h | 17 +++++++++++++----
- 1 file changed, 13 insertions(+), 4 deletions(-)
-
-diff --git a/src/basic/missing.h b/src/basic/missing.h
-index f8e0966..13ff51c 100644
---- a/src/basic/missing.h
-+++ b/src/basic/missing.h
-@@ -537,12 +537,21 @@ struct btrfs_ioctl_quota_ctl_args {
- #  define DRM_IOCTL_DROP_MASTER _IO('d', 0x1f)
- #endif
- 
--#if defined(__i386__) || defined(__x86_64__)
--
--/* The precise definition of __O_TMPFILE is arch specific, so let's
-- * just define this on x86 where we know the value. */
-+/* The precise definition of __O_TMPFILE is arch specific; use the
-+ * values defined by the kernel (note: some are hexa, some are octal,
-+ * duplicated as-is from the kernel definitions):
-+ * - alpha, parisc, sparc: each has a specific value;
-+ * - others: they use the "generic" value.
-+ */
- 
- #ifndef __O_TMPFILE
-+#if defined(__alpha__)
-+#define __O_TMPFILE     0100000000
-+#elif defined(__parisc__) || defined(__hppa__)
-+#define __O_TMPFILE     0400000000
-+#elif defined(__sparc__) || defined(__sparc64__)
-+#define __O_TMPFILE     0x2000000
-+#else
- #define __O_TMPFILE     020000000
- #endif
- 
--- 
-2.7.4
-
diff --git a/package/systemd/0006-basic-fileio-we-always-have-O_TMPFILE-now.patch b/package/systemd/0006-basic-fileio-we-always-have-O_TMPFILE-now.patch
deleted file mode 100644
index e0e7209..0000000
--- a/package/systemd/0006-basic-fileio-we-always-have-O_TMPFILE-now.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 1d9ed171788821c21ca900a921833a8e41bf22f3 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Mon, 29 Aug 2016 12:34:50 +0200
-Subject: [PATCH] basic/fileio: we always have O_TMPFILE now
-
-fileio makes use of O_TMPFILE when it is available.
-
-We now always have O_TMPFILE, defined in missing.h if missing
-from the toolchain headers.
-
-Have fileio include missing.h and drop the guards around the
-use of O_TMPFILE.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Backported from upstream:
-    https://github.com/systemd/systemd/commit/1d9ed171788821c21ca900a921833a8e41bf22f3
----
- src/basic/fileio.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/src/basic/fileio.c b/src/basic/fileio.c
-index d642f3d..a5920e7 100644
---- a/src/basic/fileio.c
-+++ b/src/basic/fileio.c
-@@ -37,6 +37,7 @@
- #include "hexdecoct.h"
- #include "log.h"
- #include "macro.h"
-+#include "missing.h"
- #include "parse-util.h"
- #include "path-util.h"
- #include "random-util.h"
-@@ -1280,12 +1281,10 @@ int open_tmpfile_unlinkable(const char *directory, int flags) {
- 
-         /* Returns an unlinked temporary file that cannot be linked into the file system anymore */
- 
--#ifdef O_TMPFILE
-         /* Try O_TMPFILE first, if it is supported */
-         fd = open(directory, flags|O_TMPFILE|O_EXCL, S_IRUSR|S_IWUSR);
-         if (fd >= 0)
-                 return fd;
--#endif
- 
-         /* Fall back to unguessable name + unlinking */
-         p = strjoina(directory, "/systemd-tmp-XXXXXX");
-@@ -1313,7 +1312,6 @@ int open_tmpfile_linkable(const char *target, int flags, char **ret_path) {
-          * which case "ret_path" will be returned as NULL. If not possible a the tempoary path name used is returned in
-          * "ret_path". Use link_tmpfile() below to rename the result after writing the file in full. */
- 
--#ifdef O_TMPFILE
-         {
-                 _cleanup_free_ char *dn = NULL;
- 
-@@ -1329,7 +1327,6 @@ int open_tmpfile_linkable(const char *target, int flags, char **ret_path) {
- 
-                 log_debug_errno(errno, "Failed to use O_TMPFILE on %s: %m", dn);
-         }
--#endif
- 
-         r = tempfn_random(target, NULL, &tmp);
-         if (r < 0)
--- 
-2.7.4
-
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 30e9ef6..0acaa3c 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 899733ad6c157cedbb89aec4efe3bc824dcfd65a1d6f6bebc7b043f7924e39b4 systemd-231.tar.gz
+sha256 1172c7c7d5d72fbded53186e7599d5272231f04cc8b72f9a0fb2c5c20dfc4880  systemd-232.tar.gz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index fb07819..fa07bd0 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 231
+SYSTEMD_VERSION = 232
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPLv2.1+, GPLv2+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
