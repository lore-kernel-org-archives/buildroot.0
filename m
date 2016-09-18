From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 16:03:43 +0200
Subject: [Buildroot] [git commit] package/systemd: fix build with old
	toolchains
Message-ID: <20160918140432.168058080F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01e807f0d8dd411643e4f0939a5b8623bfbe9518
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Toolchains using glibc-2.18 or older do not define O_TMPFILE, which
causes build failures on some archs.

systemd has a definition for O_TMPFILE if it is missing, but only
defines it for i386 or x86_64. Furthermore, the header defining it is
not included everywhere O_TMPFILE is used.

Fix that with three patches backported from upstream:
  - include the needed header where it is needed (he!),
  - define O_TMPFILE for all archs, according to linux-4.8rc3,
  - no longer guard against undefined O_TMPFILE in fileio.

Upstream merge commit:
    https://github.com/systemd/systemd/commit/4a13100c6a5a0a4b793e90bd43d21c3696c42d46

Fixes:

  http://autobuild.buildroot.net/results/b0067e72ffcbbe1db9ef49ab297cece951345aeb/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-export-raw-needs-missing.h-for-O_TMPFILE.patch | 31 +++++++++++
 ...h-add-missing-definitions-for-__O_TMPFILE.patch | 63 +++++++++++++++++++++
 ...basic-fileio-we-always-have-O_TMPFILE-now.patch | 65 ++++++++++++++++++++++
 3 files changed, 159 insertions(+)

diff --git a/package/systemd/0004-importd-export-raw-needs-missing.h-for-O_TMPFILE.patch b/package/systemd/0004-importd-export-raw-needs-missing.h-for-O_TMPFILE.patch
new file mode 100644
index 0000000..bded6bc
--- /dev/null
+++ b/package/systemd/0004-importd-export-raw-needs-missing.h-for-O_TMPFILE.patch
@@ -0,0 +1,31 @@
+From 4a6d35237f96d07f3a783c874933f87bf14f93e0 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 28 Aug 2016 16:26:04 +0200
+Subject: [PATCH] importd/export-raw: needs missing.h for O_TMPFILE
+
+O_TMPFILE may be missing from the system headers, so use our fallback
+definition.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Backported from upstream:
+    https://github.com/systemd/systemd/commit/4a6d35237f96d07f3a783c874933f87bf14f93e0
+---
+ src/import/export-raw.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/import/export-raw.c b/src/import/export-raw.c
+index db06e11..6136b67 100644
+--- a/src/import/export-raw.c
++++ b/src/import/export-raw.c
+@@ -34,6 +34,7 @@
+ #include "fd-util.h"
+ #include "fileio.h"
+ #include "import-common.h"
++#include "missing.h"
+ #include "ratelimit.h"
+ #include "string-util.h"
+ #include "util.h"
+-- 
+2.7.4
+
diff --git a/package/systemd/0005-missing.h-add-missing-definitions-for-__O_TMPFILE.patch b/package/systemd/0005-missing.h-add-missing-definitions-for-__O_TMPFILE.patch
new file mode 100644
index 0000000..1c5ca05
--- /dev/null
+++ b/package/systemd/0005-missing.h-add-missing-definitions-for-__O_TMPFILE.patch
@@ -0,0 +1,63 @@
+From daad709a7c13c0fac73e407528f96cc876c09629 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 28 Aug 2016 17:26:42 +0200
+Subject: [PATCH] missing.h: add missing definitions for __O_TMPFILE
+
+Currently, a missing __O_TMPFILE was only defined for i386 and x86_64,
+leaving any other architectures with an "old" toolchain fail miserably
+at build time:
+    src/import/export-raw.c: In function 'reflink_snapshot':
+    src/import/export-raw.c:271:26: error: 'O_TMPFILE' undeclared (first use in this function)
+             new_fd = open(d, O_TMPFILE|O_CLOEXEC|O_NOCTTY|O_RDWR, 0600);
+                              ^
+
+__O_TMPFILE (and O_TMPFILE) are available since glibc 2.19. However, a
+lot of existing toolchains are still using glibc-2.18, and some even
+before that, and it is not really possible to update those toolchains.
+
+Instead of defining it only for i386 and x86_64, define __O_TMPFILE
+with the specific values for those archs where it is different from the
+generic value. Use the values as found in the Linux kernel (v4.8-rc3,
+current as of time of commit).
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Backported from upstream:
+    https://github.com/systemd/systemd/commit/daad709a7c13c0fac73e407528f96cc876c09629
+---
+ src/basic/missing.h | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/src/basic/missing.h b/src/basic/missing.h
+index f8e0966..13ff51c 100644
+--- a/src/basic/missing.h
++++ b/src/basic/missing.h
+@@ -537,12 +537,21 @@ struct btrfs_ioctl_quota_ctl_args {
+ #  define DRM_IOCTL_DROP_MASTER _IO('d', 0x1f)
+ #endif
+ 
+-#if defined(__i386__) || defined(__x86_64__)
+-
+-/* The precise definition of __O_TMPFILE is arch specific, so let's
+- * just define this on x86 where we know the value. */
++/* The precise definition of __O_TMPFILE is arch specific; use the
++ * values defined by the kernel (note: some are hexa, some are octal,
++ * duplicated as-is from the kernel definitions):
++ * - alpha, parisc, sparc: each has a specific value;
++ * - others: they use the "generic" value.
++ */
+ 
+ #ifndef __O_TMPFILE
++#if defined(__alpha__)
++#define __O_TMPFILE     0100000000
++#elif defined(__parisc__) || defined(__hppa__)
++#define __O_TMPFILE     0400000000
++#elif defined(__sparc__) || defined(__sparc64__)
++#define __O_TMPFILE     0x2000000
++#else
+ #define __O_TMPFILE     020000000
+ #endif
+ 
+-- 
+2.7.4
+
diff --git a/package/systemd/0006-basic-fileio-we-always-have-O_TMPFILE-now.patch b/package/systemd/0006-basic-fileio-we-always-have-O_TMPFILE-now.patch
new file mode 100644
index 0000000..e0e7209
--- /dev/null
+++ b/package/systemd/0006-basic-fileio-we-always-have-O_TMPFILE-now.patch
@@ -0,0 +1,65 @@
+From 1d9ed171788821c21ca900a921833a8e41bf22f3 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Mon, 29 Aug 2016 12:34:50 +0200
+Subject: [PATCH] basic/fileio: we always have O_TMPFILE now
+
+fileio makes use of O_TMPFILE when it is available.
+
+We now always have O_TMPFILE, defined in missing.h if missing
+from the toolchain headers.
+
+Have fileio include missing.h and drop the guards around the
+use of O_TMPFILE.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Backported from upstream:
+    https://github.com/systemd/systemd/commit/1d9ed171788821c21ca900a921833a8e41bf22f3
+---
+ src/basic/fileio.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/basic/fileio.c b/src/basic/fileio.c
+index d642f3d..a5920e7 100644
+--- a/src/basic/fileio.c
++++ b/src/basic/fileio.c
+@@ -37,6 +37,7 @@
+ #include "hexdecoct.h"
+ #include "log.h"
+ #include "macro.h"
++#include "missing.h"
+ #include "parse-util.h"
+ #include "path-util.h"
+ #include "random-util.h"
+@@ -1280,12 +1281,10 @@ int open_tmpfile_unlinkable(const char *directory, int flags) {
+ 
+         /* Returns an unlinked temporary file that cannot be linked into the file system anymore */
+ 
+-#ifdef O_TMPFILE
+         /* Try O_TMPFILE first, if it is supported */
+         fd = open(directory, flags|O_TMPFILE|O_EXCL, S_IRUSR|S_IWUSR);
+         if (fd >= 0)
+                 return fd;
+-#endif
+ 
+         /* Fall back to unguessable name + unlinking */
+         p = strjoina(directory, "/systemd-tmp-XXXXXX");
+@@ -1313,7 +1312,6 @@ int open_tmpfile_linkable(const char *target, int flags, char **ret_path) {
+          * which case "ret_path" will be returned as NULL. If not possible a the tempoary path name used is returned in
+          * "ret_path". Use link_tmpfile() below to rename the result after writing the file in full. */
+ 
+-#ifdef O_TMPFILE
+         {
+                 _cleanup_free_ char *dn = NULL;
+ 
+@@ -1329,7 +1327,6 @@ int open_tmpfile_linkable(const char *target, int flags, char **ret_path) {
+ 
+                 log_debug_errno(errno, "Failed to use O_TMPFILE on %s: %m", dn);
+         }
+-#endif
+ 
+         r = tempfn_random(target, NULL, &tmp);
+         if (r < 0)
+-- 
+2.7.4
+
