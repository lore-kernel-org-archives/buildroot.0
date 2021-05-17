From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 17 May 2021 19:53:57 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/iproute2: bump version to 5.12.0
Message-ID: <20210517175357.32742-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport from upstream mailing list patch from Heiko Thiery which fixes
missing {name_to,open_by}_handle_at() on uclibc-ng < 1.0.35.

Drop patch from v5.8.0.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
NOTE: "config.mk: Rerun configure when it is newer than config.mk" [1]
shouldn't be needed. Waiting for test runs.

Kind regards,
Petr

[1] https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=62c88ed9402650823a88c2974efdc39a320dfe7b

 .../0001-devlink-update-include-files.patch   |  55 ---------
 ...-when-name-open-_to_handle_at-is-not.patch | 114 ++++++++++++++++++
 package/iproute2/iproute2.hash                |   2 +-
 package/iproute2/iproute2.mk                  |   2 +-
 4 files changed, 116 insertions(+), 57 deletions(-)
 delete mode 100644 package/iproute2/0001-devlink-update-include-files.patch
 create mode 100644 package/iproute2/0001-lib-fs-fix-issue-when-name-open-_to_handle_at-is-not.patch

diff --git a/package/iproute2/0001-devlink-update-include-files.patch b/package/iproute2/0001-devlink-update-include-files.patch
deleted file mode 100644
index 8cc6e4ec60..0000000000
--- a/package/iproute2/0001-devlink-update-include-files.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 12fafa27c7b306e6c397e858f4d5a8159500f659 Mon Sep 17 00:00:00 2001
-From: Stephen Hemminger <stephen@networkplumber.org>
-Date: Thu, 11 Jun 2020 09:46:46 -0700
-Subject: devlink: update include files
-
-Use the tool iwyu to get more complete list of includes for
-all the bits used by devlink.
-
-This should also fix build with musl libc.
-
-Fixes: c4dfddccef4e ("fix JSON output of mon command")
-Reported-off-by: Dan Robertson <dan@dlrobertson.com>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-
-[Retrieved from:
-https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=12fafa27c7b306e6c397e858f4d5a8159500f659]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- devlink/devlink.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/devlink/devlink.c b/devlink/devlink.c
-index 507972c3..ce2e4676 100644
---- a/devlink/devlink.c
-+++ b/devlink/devlink.c
-@@ -19,18 +19,25 @@
- #include <limits.h>
- #include <errno.h>
- #include <inttypes.h>
-+#include <signal.h>
-+#include <time.h>
-+#include <netinet/in.h>
-+#include <arpa/inet.h>
- #include <sys/sysinfo.h>
- #define _LINUX_SYSINFO_H /* avoid collision with musl header */
- #include <linux/genetlink.h>
- #include <linux/devlink.h>
-+#include <linux/netlink.h>
- #include <libmnl/libmnl.h>
- #include <netinet/ether.h>
-+#include <sys/select.h>
-+#include <sys/socket.h>
- #include <sys/types.h>
- 
- #include "SNAPSHOT.h"
- #include "list.h"
- #include "mnlg.h"
--#include "json_writer.h"
-+#include "json_print.h"
- #include "utils.h"
- #include "namespace.h"
- 
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/iproute2/0001-lib-fs-fix-issue-when-name-open-_to_handle_at-is-not.patch b/package/iproute2/0001-lib-fs-fix-issue-when-name-open-_to_handle_at-is-not.patch
new file mode 100644
index 0000000000..b4e6374874
--- /dev/null
+++ b/package/iproute2/0001-lib-fs-fix-issue-when-name-open-_to_handle_at-is-not.patch
@@ -0,0 +1,114 @@
+From c5b72cc56bf88160bbf477ec8565fed865e7a1c9 Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Sat, 8 May 2021 08:49:26 +0200
+Subject: [PATCH] lib/fs: fix issue when {name,open}_to_handle_at() is not
+ implemented
+
+With commit d5e6ee0dac64 the usage of functions name_to_handle_at() and
+open_by_handle_at() are introduced. But these function are not available
+e.g. in uclibc-ng < 1.0.35. To have a backward compatibility check for the
+availability in the configure script and in case of absence do a direct
+syscall.
+
+Fixes: d5e6ee0dac64 ("ss: introduce cgroup2 cache and helper functions")
+Cc: Dmitry Yakunin <zeil@yandex-team.ru>
+Cc: Petr Vorel <petr.vorel@gmail.com>
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
+Signed-off-by: David Ahern <dsahern@kernel.org>
+[ upstream-status: https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=c5b72cc56bf88160bbf477ec8565fed865e7a1c9 ]
+---
+ configure | 28 ++++++++++++++++++++++++++++
+ lib/fs.c  | 25 +++++++++++++++++++++++++
+ 2 files changed, 53 insertions(+)
+
+diff --git a/configure b/configure
+index 2c363d3b..179eae08 100755
+--- a/configure
++++ b/configure
+@@ -202,6 +202,31 @@ EOF
+     rm -f $TMPDIR/setnstest.c $TMPDIR/setnstest
+ }
+
++check_name_to_handle_at()
++{
++    cat >$TMPDIR/name_to_handle_at_test.c <<EOF
++#define _GNU_SOURCE
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <fcntl.h>
++int main(int argc, char **argv)
++{
++	struct file_handle *fhp;
++	int mount_id, flags, dirfd;
++	char *pathname;
++	name_to_handle_at(dirfd, pathname, fhp, &mount_id, flags);
++	return 0;
++}
++EOF
++    if $CC -I$INCLUDE -o $TMPDIR/name_to_handle_at_test $TMPDIR/name_to_handle_at_test.c >/dev/null 2>&1; then
++        echo "yes"
++        echo "CFLAGS += -DHAVE_HANDLE_AT" >>$CONFIG
++    else
++        echo "no"
++    fi
++    rm -f $TMPDIR/name_to_handle_at_test.c $TMPDIR/name_to_handle_at_test
++}
++
+ check_ipset()
+ {
+     cat >$TMPDIR/ipsettest.c <<EOF
+@@ -492,6 +517,9 @@ fi
+ echo -n "libc has setns: "
+ check_setns
+
++echo -n "libc has name_to_handle_at: "
++check_name_to_handle_at
++
+ echo -n "SELinux support: "
+ check_selinux
+
+diff --git a/lib/fs.c b/lib/fs.c
+index f161d888..05697a7e 100644
+--- a/lib/fs.c
++++ b/lib/fs.c
+@@ -25,11 +25,36 @@
+
+ #include "utils.h"
+
++#ifndef HAVE_HANDLE_AT
++# include <sys/syscall.h>
++#endif
++
+ #define CGROUP2_FS_NAME "cgroup2"
+
+ /* if not already mounted cgroup2 is mounted here for iproute2's use */
+ #define MNT_CGRP2_PATH  "/var/run/cgroup2"
+
++
++#ifndef HAVE_HANDLE_AT
++struct file_handle {
++	unsigned handle_bytes;
++	int handle_type;
++	unsigned char f_handle[];
++};
++
++static int name_to_handle_at(int dirfd, const char *pathname,
++	struct file_handle *handle, int *mount_id, int flags)
++{
++	return syscall(__NR_name_to_handle_at, dirfd, pathname, handle,
++	               mount_id, flags);
++}
++
++static int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags)
++{
++	return syscall(__NR_open_by_handle_at, mount_fd, handle, flags);
++}
++#endif
++
+ /* return mount path of first occurrence of given fstype */
+ static char *find_fs_mount(const char *fs_to_find)
+ {
+--
+2.31.1
+
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index b2a9e21e11..a5d6bf022c 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  725dc7ba94aae54c6f8d4223ca055d9fb4fe89d6994b1c03bfb4411c4dd10f21  iproute2-5.7.0.tar.xz
+sha256  9d268db98a36ee2a0e3ff3b92b2efff66fc1138a51e409bdef6ab3cfe15f326f  iproute2-5.12.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 3460c5c3b3..6cc0dd5210 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.7.0
+IPROUTE2_VERSION = 5.12.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.31.1
