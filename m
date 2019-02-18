From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 18 Feb 2019 15:05:10 -0500
Subject: [Buildroot] [PATCH 1/1] systemd: bump version to 241
Message-ID: <20190218200510.15320-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also remove patches that have been committed upstream.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 ...cross-compilation-compatible-c-check.patch |  60 -----
 ...ity-fix-build-without-PR_CAP_AMBIENT.patch |  61 ------
 ...e-util.c-fix-build-without-O_TMPFILE.patch |  34 ---
 ...missing_if_link.h-add-IFLA_BOND_MODE.patch |  49 -----
 ...07-missing_syscall.h-include-errno.h.patch |  28 ---
 ...util.c-fix-build-without-F_OFD_SETLK.patch |  34 ---
 ...store-the-iovec-entry-for-process-co.patch | 205 ------------------
 ...t-a-limit-on-the-number-of-fields-1k.patch |  57 -----
 ...mote-verify-entry-length-from-header.patch | 112 ----------
 ...et-a-limit-on-the-number-of-fields-i.patch |  81 -------
 ...var-to-device_path_parse_major_minor.patch | 116 ----------
 package/systemd/systemd.hash                  |   2 +-
 package/systemd/systemd.mk                    |   2 +-
 13 files changed, 2 insertions(+), 839 deletions(-)
 delete mode 100644 package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch
 delete mode 100644 package/systemd/0004-capability-fix-build-without-PR_CAP_AMBIENT.patch
 delete mode 100644 package/systemd/0005-basic-tmpfile-util.c-fix-build-without-O_TMPFILE.patch
 delete mode 100644 package/systemd/0006-missing_if_link.h-add-IFLA_BOND_MODE.patch
 delete mode 100644 package/systemd/0007-missing_syscall.h-include-errno.h.patch
 delete mode 100644 package/systemd/0008-lockfile-util.c-fix-build-without-F_OFD_SETLK.patch
 delete mode 100644 package/systemd/0009-journald-do-not-store-the-iovec-entry-for-process-co.patch
 delete mode 100644 package/systemd/0010-journald-set-a-limit-on-the-number-of-fields-1k.patch
 delete mode 100644 package/systemd/0011-journal-remote-verify-entry-length-from-header.patch
 delete mode 100644 package/systemd/0012-journal-remote-set-a-limit-on-the-number-of-fields-i.patch
 delete mode 100644 package/systemd/0013-Pass-separate-dev_t-var-to-device_path_parse_major_minor.patch

diff --git a/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch b/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch
deleted file mode 100644
index 70d816fae2..0000000000
--- a/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 180a940333c84495015bd5b24d41c1dbfff509f2 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Thu, 27 Dec 2018 09:16:20 +0800
-Subject: [PATCH] meson: use cross compilation compatible c++ check
-
-[james.hilliard1 at gmail.com: backport from upstream commit
-46e63a2a3ed46ce97430ce38e4cc0798c57900eb]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- meson.build             | 4 +---
- src/systemd/meson.build | 3 +--
- src/test/meson.build    | 2 +-
- 3 files changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index b338886..1964b1a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -287,10 +287,8 @@ want_tests = get_option('tests')
- slow_tests = want_tests != 'false' and get_option('slow-tests')
- install_tests = get_option('install-tests')
- 
--cxx = find_program('c++', required : fuzzer_build)
--if cxx.found()
-+if add_languages('cpp', required : fuzzer_build)
-         #  Used only for tests
--        add_languages('cpp')
-         cxx_cmd = ' '.join(meson.get_compiler('cpp').cmd_array())
- else
-         cxx_cmd = ''
-diff --git a/src/systemd/meson.build b/src/systemd/meson.build
-index e0c967e..75c48b0 100644
---- a/src/systemd/meson.build
-+++ b/src/systemd/meson.build
-@@ -52,8 +52,7 @@ if cc.has_argument('-std=iso9899:2017')
-         opts += [['c', '-std=iso9899:2017']]
- endif
- 
--cxx = find_program('c++', required : false)
--if cxx.found()
-+if add_languages('cpp', required : false)
-         opts += [['c++'],
-                  ['c++', '-std=c++98'],
-                  ['c++', '-std=c++11']]
-diff --git a/src/test/meson.build b/src/test/meson.build
-index ea049a6..d9d87e0 100644
---- a/src/test/meson.build
-+++ b/src/test/meson.build
-@@ -957,7 +957,7 @@ tests += [
- 
- ]
- 
--if cxx.found()
-+if cxx_cmd != ''
-         tests += [
-                 [['src/libsystemd/sd-bus/test-bus-vtable-cc.cc'],
-                  [],
--- 
-2.7.4
-
diff --git a/package/systemd/0004-capability-fix-build-without-PR_CAP_AMBIENT.patch b/package/systemd/0004-capability-fix-build-without-PR_CAP_AMBIENT.patch
deleted file mode 100644
index 7b240d1b1a..0000000000
--- a/package/systemd/0004-capability-fix-build-without-PR_CAP_AMBIENT.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 822809d0afd0f984750a61b2391059411afa4333 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 11 Jan 2019 16:07:00 +0100
-Subject: [PATCH] capability: fix build without PR_CAP_AMBIENT
-
-systemd fails to build on kernel without PR_CAP_AMBIENT (< 4.3) since
-https://github.com/systemd/systemd/commit/2a03bb3e65327c73008f1db485ffc75c432dc6b2
-
-To fix this error, include missing_prctl.h in all files using
-PR_CAP_AMBIENT
-
-Fixes:
- - http://autobuild.buildroot.org/results/699c078aa078240c6741da4dbd0871450ceeca92
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/systemd/systemd/pull/11400]
----
- src/basic/capability-util.c | 1 +
- src/test/test-capability.c  | 1 +
- src/test/test-execute.c     | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/src/basic/capability-util.c b/src/basic/capability-util.c
-index a3f3ca9f5..b944ee6ea 100644
---- a/src/basic/capability-util.c
-+++ b/src/basic/capability-util.c
-@@ -13,6 +13,7 @@
- #include "fileio.h"
- #include "log.h"
- #include "macro.h"
-+#include "missing_prctl.h"
- #include "parse-util.h"
- #include "user-util.h"
- #include "util.h"
-diff --git a/src/test/test-capability.c b/src/test/test-capability.c
-index dae85f2f9..3db05878a 100644
---- a/src/test/test-capability.c
-+++ b/src/test/test-capability.c
-@@ -13,6 +13,7 @@
- #include "fd-util.h"
- #include "fileio.h"
- #include "macro.h"
-+#include "missing_prctl.h"
- #include "parse-util.h"
- #include "tests.h"
- #include "util.h"
-diff --git a/src/test/test-execute.c b/src/test/test-execute.c
-index 2115061ad..cea68b8cf 100644
---- a/src/test/test-execute.c
-+++ b/src/test/test-execute.c
-@@ -13,6 +13,7 @@
- #include "fs-util.h"
- #include "macro.h"
- #include "manager.h"
-+#include "missing_prctl.h"
- #include "mkdir.h"
- #include "path-util.h"
- #include "rm-rf.h"
--- 
-2.14.1
-
diff --git a/package/systemd/0005-basic-tmpfile-util.c-fix-build-without-O_TMPFILE.patch b/package/systemd/0005-basic-tmpfile-util.c-fix-build-without-O_TMPFILE.patch
deleted file mode 100644
index 300fc544fd..0000000000
--- a/package/systemd/0005-basic-tmpfile-util.c-fix-build-without-O_TMPFILE.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b1ca50178b97b3b827b0420ec7bdf9cb1d6fec56 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 11 Jan 2019 16:36:06 +0100
-Subject: [PATCH] basic/tmpfile-util.c: fix build without O_TMPFILE
-
-systemd fails to build on kernel without O_TMPFILE (< 3.11) since
-https://github.com/systemd/systemd/commit/dea72eda9cdbfeedd24cbe8c734ad0639bf96cde
-
-To fix this error, include missing_fcntl.h
-
-Fixes:
- - http://autobuild.buildroot.org/results/699c078aa078240c6741da4dbd0871450ceeca92
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/systemd/systemd/pull/11400]
----
- src/basic/tmpfile-util.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/basic/tmpfile-util.c b/src/basic/tmpfile-util.c
-index 669eb2666..bc92d6a6d 100644
---- a/src/basic/tmpfile-util.c
-+++ b/src/basic/tmpfile-util.c
-@@ -8,6 +8,7 @@
- #include "hexdecoct.h"
- #include "macro.h"
- #include "memfd-util.h"
-+#include "missing_fcntl.h"
- #include "missing_syscall.h"
- #include "path-util.h"
- #include "process-util.h"
--- 
-2.14.1
-
diff --git a/package/systemd/0006-missing_if_link.h-add-IFLA_BOND_MODE.patch b/package/systemd/0006-missing_if_link.h-add-IFLA_BOND_MODE.patch
deleted file mode 100644
index ace29be6a5..0000000000
--- a/package/systemd/0006-missing_if_link.h-add-IFLA_BOND_MODE.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 9ab48a9b3bfadca4fbe055ddb4f6fc677ee4ae85 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 11 Jan 2019 17:08:48 +0100
-Subject: [PATCH] missing_if_link.h: add IFLA_BOND_MODE
-
-systemd fails to build on kernel without IFLA_BOND_MODE (< 3.13) since
-https://github.com/systemd/systemd/commit/9714c020fc4cda1823c2a77e3fd08aefa7d78b25
-
-So put back IFLA_BOND_MODE definition
-
-Fixes:
- - http://autobuild.buildroot.org/results/699c078aa078240c6741da4dbd0871450ceeca92
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/systemd/systemd/pull/11400]
----
- meson.build                 | 1 +
- src/basic/missing_if_link.h | 3 +++
- 2 files changed, 4 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index 623c1ad6b..011e44980 100644
---- a/meson.build
-+++ b/meson.build
-@@ -476,6 +476,7 @@ foreach decl : [['ETHTOOL_LINK_MODE_10baseT_Half_BIT',      'linux/ethtool.h'],
-                 ['IFLA_TARGET_NETNSID',                     'linux/if_link.h'],
-                 ['IFLA_NEW_IFINDEX',                        'linux/if_link.h'],
-                 ['IFLA_MAX_MTU',                            'linux/if_link.h'],
-+                ['IFLA_BOND_MODE',                          'linux/if_link.h'],
-                 ['IFLA_BOND_ACTIVE_SLAVE',                  'linux/if_link.h'],
-                 ['IFLA_BOND_AD_INFO',                       'linux/if_link.h'],
-                 ['IFLA_BOND_AD_ACTOR_SYSTEM',               'linux/if_link.h'],
-diff --git a/src/basic/missing_if_link.h b/src/basic/missing_if_link.h
-index 07675426b..761797f56 100644
---- a/src/basic/missing_if_link.h
-+++ b/src/basic/missing_if_link.h
-@@ -110,6 +110,9 @@ enum ipvlan_mode {
- #define IFLA_MAX                51
- #endif
- 
-+#if !HAVE_IFLA_BOND_MODE /* linux at 90af231106c0b8d223c27d35464af95cb3d9cacf (3.13) */
-+#define IFLA_BOND_MODE              1
-+#endif
- #if !HAVE_IFLA_BOND_ACTIVE_SLAVE /* linux at ec76aa49855f6d6fea5e01de179fb57dd47c619d (3.13) */
- #define IFLA_BOND_ACTIVE_SLAVE      2
- #endif
--- 
-2.14.1
-
diff --git a/package/systemd/0007-missing_syscall.h-include-errno.h.patch b/package/systemd/0007-missing_syscall.h-include-errno.h.patch
deleted file mode 100644
index eb5d9eacb7..0000000000
--- a/package/systemd/0007-missing_syscall.h-include-errno.h.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 985d15d636b4d2c7086dbd305369c02756cdbe19 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 11 Jan 2019 17:24:21 +0100
-Subject: [PATCH] missing_syscall.h: include errno.h
-
-This include is needed for errno and ENOSYS
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/systemd/systemd/pull/11400]
----
- src/basic/missing_syscall.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index d5d4b26ac..d1aa32218 100644
---- a/src/basic/missing_syscall.h
-+++ b/src/basic/missing_syscall.h
-@@ -3,6 +3,7 @@
- 
- /* Missing glibc definitions to access certain kernel APIs */
- 
-+#include <errno.h>
- #include <fcntl.h>
- #include <sys/syscall.h>
- #include <sys/types.h>
--- 
-2.14.1
-
diff --git a/package/systemd/0008-lockfile-util.c-fix-build-without-F_OFD_SETLK.patch b/package/systemd/0008-lockfile-util.c-fix-build-without-F_OFD_SETLK.patch
deleted file mode 100644
index 1a1542c706..0000000000
--- a/package/systemd/0008-lockfile-util.c-fix-build-without-F_OFD_SETLK.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From badb5dafa9efc89384d9d2bea5648f7b017204d7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 11 Jan 2019 17:30:32 +0100
-Subject: [PATCH] lockfile-util.c: fix build without F_OFD_SETLK
-
-systemd fails to build on kernel without F_OFD_SETLK since
-https://github.com/systemd/systemd/commit/9714c020fc4cda1823c2a77e3fd08aefa7d78b25
-
-So put include missing_fcntl.h
-
-Fixes:
- - http://autobuild.buildroot.org/results/699c078aa078240c6741da4dbd0871450ceeca92
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/systemd/systemd/pull/11400]
----
- src/shared/lockfile-util.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/shared/lockfile-util.c b/src/shared/lockfile-util.c
-index 4bae23b24..260c2088d 100644
---- a/src/shared/lockfile-util.c
-+++ b/src/shared/lockfile-util.c
-@@ -12,6 +12,7 @@
- #include "fs-util.h"
- #include "lockfile-util.h"
- #include "macro.h"
-+#include "missing_fcntl.h"
- #include "path-util.h"
- 
- int make_lock_file(const char *p, int operation, LockFile *ret) {
--- 
-2.14.1
-
diff --git a/package/systemd/0009-journald-do-not-store-the-iovec-entry-for-process-co.patch b/package/systemd/0009-journald-do-not-store-the-iovec-entry-for-process-co.patch
deleted file mode 100644
index dbf9bb51c3..0000000000
--- a/package/systemd/0009-journald-do-not-store-the-iovec-entry-for-process-co.patch
+++ /dev/null
@@ -1,205 +0,0 @@
-From 084eeb865ca63887098e0945fb4e93c852b91b0f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Wed, 5 Dec 2018 18:38:39 +0100
-Subject: [PATCH] journald: do not store the iovec entry for process
- commandline on stack
-
-This fixes a crash where we would read the commandline, whose length is under
-control of the sending program, and then crash when trying to create a stack
-allocation for it.
-
-CVE-2018-16864
-https://bugzilla.redhat.com/show_bug.cgi?id=1653855
-
-The message actually doesn't get written to disk, because
-journal_file_append_entry() returns -E2BIG.
-
-[james.hilliard1 at gmail.com: backport from upstream commit
-084eeb865ca63887098e0945fb4e93c852b91b0f]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- src/basic/io-util.c           | 10 ++++++++++
- src/basic/io-util.h           |  2 ++
- src/coredump/coredump.c       | 31 +++++++++++--------------------
- src/journal/journald-server.c | 25 +++++++++++++++----------
- 4 files changed, 38 insertions(+), 30 deletions(-)
-
-diff --git a/src/basic/io-util.c b/src/basic/io-util.c
-index 1f64cc9..575398f 100644
---- a/src/basic/io-util.c
-+++ b/src/basic/io-util.c
-@@ -8,6 +8,7 @@
- #include <unistd.h>
- 
- #include "io-util.h"
-+#include "string-util.h"
- #include "time-util.h"
- 
- int flush_fd(int fd) {
-@@ -252,3 +253,12 @@ ssize_t sparse_write(int fd, const void *p, size_t sz, size_t run_length) {
- 
-         return q - (const uint8_t*) p;
- }
-+
-+char* set_iovec_string_field(struct iovec *iovec, size_t *n_iovec, const char *field, const char *value) {
-+        char *x;
-+
-+        x = strappend(field, value);
-+        if (x)
-+                iovec[(*n_iovec)++] = IOVEC_MAKE_STRING(x);
-+        return x;
-+}
-diff --git a/src/basic/io-util.h b/src/basic/io-util.h
-index ed189b5..792a64a 100644
---- a/src/basic/io-util.h
-+++ b/src/basic/io-util.h
-@@ -71,3 +71,5 @@ static inline bool FILE_SIZE_VALID_OR_INFINITY(uint64_t l) {
- #define IOVEC_MAKE(base, len) (struct iovec) IOVEC_INIT(base, len)
- #define IOVEC_INIT_STRING(string) IOVEC_INIT((char*) string, strlen(string))
- #define IOVEC_MAKE_STRING(string) (struct iovec) IOVEC_INIT_STRING(string)
-+
-+char* set_iovec_string_field(struct iovec *iovec, size_t *n_iovec, const char *field, const char *value);
-diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
-index 20c1fb0..db2cf64 100644
---- a/src/coredump/coredump.c
-+++ b/src/coredump/coredump.c
-@@ -1063,19 +1063,10 @@ static int send_iovec(const struct iovec iovec[], size_t n_iovec, int input_fd)
-         return 0;
- }
- 
--static char* set_iovec_field(struct iovec *iovec, size_t *n_iovec, const char *field, const char *value) {
--        char *x;
--
--        x = strappend(field, value);
--        if (x)
--                iovec[(*n_iovec)++] = IOVEC_MAKE_STRING(x);
--        return x;
--}
--
- static char* set_iovec_field_free(struct iovec *iovec, size_t *n_iovec, const char *field, char *value) {
-         char *x;
- 
--        x = set_iovec_field(iovec, n_iovec, field, value);
-+        x = set_iovec_string_field(iovec, n_iovec, field, value);
-         free(value);
-         return x;
- }
-@@ -1125,36 +1116,36 @@ static int gather_pid_metadata(
-                         disable_coredumps();
-                 }
- 
--                set_iovec_field(iovec, n_iovec, "COREDUMP_UNIT=", context[CONTEXT_UNIT]);
-+                set_iovec_string_field(iovec, n_iovec, "COREDUMP_UNIT=", context[CONTEXT_UNIT]);
-         }
- 
-         if (cg_pid_get_user_unit(pid, &t) >= 0)
-                 set_iovec_field_free(iovec, n_iovec, "COREDUMP_USER_UNIT=", t);
- 
-         /* The next few are mandatory */
--        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_PID=", context[CONTEXT_PID]))
-+        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_PID=", context[CONTEXT_PID]))
-                 return log_oom();
- 
--        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_UID=", context[CONTEXT_UID]))
-+        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_UID=", context[CONTEXT_UID]))
-                 return log_oom();
- 
--        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_GID=", context[CONTEXT_GID]))
-+        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_GID=", context[CONTEXT_GID]))
-                 return log_oom();
- 
--        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_SIGNAL=", context[CONTEXT_SIGNAL]))
-+        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_SIGNAL=", context[CONTEXT_SIGNAL]))
-                 return log_oom();
- 
--        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_RLIMIT=", context[CONTEXT_RLIMIT]))
-+        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_RLIMIT=", context[CONTEXT_RLIMIT]))
-                 return log_oom();
- 
--        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_HOSTNAME=", context[CONTEXT_HOSTNAME]))
-+        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_HOSTNAME=", context[CONTEXT_HOSTNAME]))
-                 return log_oom();
- 
--        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_COMM=", context[CONTEXT_COMM]))
-+        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_COMM=", context[CONTEXT_COMM]))
-                 return log_oom();
- 
-         if (context[CONTEXT_EXE] &&
--            !set_iovec_field(iovec, n_iovec, "COREDUMP_EXE=", context[CONTEXT_EXE]))
-+            !set_iovec_string_field(iovec, n_iovec, "COREDUMP_EXE=", context[CONTEXT_EXE]))
-                 return log_oom();
- 
-         if (sd_pid_get_session(pid, &t) >= 0)
-@@ -1222,7 +1213,7 @@ static int gather_pid_metadata(
-                 iovec[(*n_iovec)++] = IOVEC_MAKE_STRING(t);
- 
-         if (safe_atoi(context[CONTEXT_SIGNAL], &signo) >= 0 && SIGNAL_VALID(signo))
--                set_iovec_field(iovec, n_iovec, "COREDUMP_SIGNAL_NAME=SIG", signal_to_string(signo));
-+                set_iovec_string_field(iovec, n_iovec, "COREDUMP_SIGNAL_NAME=SIG", signal_to_string(signo));
- 
-         return 0; /* we successfully acquired all metadata */
- }
-diff --git a/src/journal/journald-server.c b/src/journal/journald-server.c
-index f096725..2a960eb 100644
---- a/src/journal/journald-server.c
-+++ b/src/journal/journald-server.c
-@@ -905,6 +905,7 @@ static void dispatch_message_real(
-                 pid_t object_pid) {
- 
-         char source_time[sizeof("_SOURCE_REALTIME_TIMESTAMP=") + DECIMAL_STR_MAX(usec_t)];
-+        _cleanup_free_ char *cmdline1 = NULL, *cmdline2 = NULL;
-         uid_t journal_uid;
-         ClientContext *o;
- 
-@@ -921,20 +922,23 @@ static void dispatch_message_real(
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->uid, uid_t, uid_is_valid, UID_FMT, "_UID");
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->gid, gid_t, gid_is_valid, GID_FMT, "_GID");
- 
--                IOVEC_ADD_STRING_FIELD(iovec, n, c->comm, "_COMM");
--                IOVEC_ADD_STRING_FIELD(iovec, n, c->exe, "_EXE");
--                IOVEC_ADD_STRING_FIELD(iovec, n, c->cmdline, "_CMDLINE");
--                IOVEC_ADD_STRING_FIELD(iovec, n, c->capeff, "_CAP_EFFECTIVE");
-+                IOVEC_ADD_STRING_FIELD(iovec, n, c->comm, "_COMM"); /* At most TASK_COMM_LENGTH (16 bytes) */
-+                IOVEC_ADD_STRING_FIELD(iovec, n, c->exe, "_EXE"); /* A path, so at most PATH_MAX (4096 bytes) */
- 
--                IOVEC_ADD_SIZED_FIELD(iovec, n, c->label, c->label_size, "_SELINUX_CONTEXT");
-+                if (c->cmdline)
-+                        /* At most _SC_ARG_MAX (2MB usually), which is too much to put on stack.
-+                         * Let's use a heap allocation for this one. */
-+                        cmdline1 = set_iovec_string_field(iovec, &n, "_CMDLINE=", c->cmdline);
- 
-+                IOVEC_ADD_STRING_FIELD(iovec, n, c->capeff, "_CAP_EFFECTIVE"); /* Read from /proc/.../status */
-+                IOVEC_ADD_SIZED_FIELD(iovec, n, c->label, c->label_size, "_SELINUX_CONTEXT");
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->auditid, uint32_t, audit_session_is_valid, "%" PRIu32, "_AUDIT_SESSION");
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->loginuid, uid_t, uid_is_valid, UID_FMT, "_AUDIT_LOGINUID");
- 
--                IOVEC_ADD_STRING_FIELD(iovec, n, c->cgroup, "_SYSTEMD_CGROUP");
-+                IOVEC_ADD_STRING_FIELD(iovec, n, c->cgroup, "_SYSTEMD_CGROUP"); /* A path */
-                 IOVEC_ADD_STRING_FIELD(iovec, n, c->session, "_SYSTEMD_SESSION");
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->owner_uid, uid_t, uid_is_valid, UID_FMT, "_SYSTEMD_OWNER_UID");
--                IOVEC_ADD_STRING_FIELD(iovec, n, c->unit, "_SYSTEMD_UNIT");
-+                IOVEC_ADD_STRING_FIELD(iovec, n, c->unit, "_SYSTEMD_UNIT"); /* Unit names are bounded by UNIT_NAME_MAX */
-                 IOVEC_ADD_STRING_FIELD(iovec, n, c->user_unit, "_SYSTEMD_USER_UNIT");
-                 IOVEC_ADD_STRING_FIELD(iovec, n, c->slice, "_SYSTEMD_SLICE");
-                 IOVEC_ADD_STRING_FIELD(iovec, n, c->user_slice, "_SYSTEMD_USER_SLICE");
-@@ -955,13 +959,14 @@ static void dispatch_message_real(
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->uid, uid_t, uid_is_valid, UID_FMT, "OBJECT_UID");
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->gid, gid_t, gid_is_valid, GID_FMT, "OBJECT_GID");
- 
-+                /* See above for size limits, only ->cmdline may be large, so use a heap allocation for it. */
-                 IOVEC_ADD_STRING_FIELD(iovec, n, o->comm, "OBJECT_COMM");
-                 IOVEC_ADD_STRING_FIELD(iovec, n, o->exe, "OBJECT_EXE");
--                IOVEC_ADD_STRING_FIELD(iovec, n, o->cmdline, "OBJECT_CMDLINE");
--                IOVEC_ADD_STRING_FIELD(iovec, n, o->capeff, "OBJECT_CAP_EFFECTIVE");
-+                if (o->cmdline)
-+                        cmdline2 = set_iovec_string_field(iovec, &n, "OBJECT_CMDLINE=", o->cmdline);
- 
-+                IOVEC_ADD_STRING_FIELD(iovec, n, o->capeff, "OBJECT_CAP_EFFECTIVE");
-                 IOVEC_ADD_SIZED_FIELD(iovec, n, o->label, o->label_size, "OBJECT_SELINUX_CONTEXT");
--
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->auditid, uint32_t, audit_session_is_valid, "%" PRIu32, "OBJECT_AUDIT_SESSION");
-                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->loginuid, uid_t, uid_is_valid, UID_FMT, "OBJECT_AUDIT_LOGINUID");
- 
--- 
-2.7.4
-
diff --git a/package/systemd/0010-journald-set-a-limit-on-the-number-of-fields-1k.patch b/package/systemd/0010-journald-set-a-limit-on-the-number-of-fields-1k.patch
deleted file mode 100644
index df1ed806a4..0000000000
--- a/package/systemd/0010-journald-set-a-limit-on-the-number-of-fields-1k.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 052c57f132f04a3cf4148f87561618da1a6908b4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Wed, 5 Dec 2018 22:45:02 +0100
-Subject: [PATCH] journald: set a limit on the number of fields (1k)
-
-We allocate a iovec entry for each field, so with many short entries,
-our memory usage and processing time can be large, even with a relatively
-small message size. Let's refuse overly long entries.
-
-CVE-2018-16865
-https://bugzilla.redhat.com/show_bug.cgi?id=1653861
-
-What from I can see, the problem is not from an alloca, despite what the CVE
-description says, but from the attack multiplication that comes from creating
-many very small iovecs: (void* + size_t) for each three bytes of input message.
-
-[james.hilliard1 at gmail.com: backport from upstream commit
-052c57f132f04a3cf4148f87561618da1a6908b4]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- src/journal/journald-native.c | 5 +++++
- src/shared/journal-importer.h | 3 +++
- 2 files changed, 8 insertions(+)
-
-diff --git a/src/journal/journald-native.c b/src/journal/journald-native.c
-index e86178e..d0fee2a 100644
---- a/src/journal/journald-native.c
-+++ b/src/journal/journald-native.c
-@@ -141,6 +141,11 @@ static int server_process_entry(
-                 }
- 
-                 /* A property follows */
-+                if (n > ENTRY_FIELD_COUNT_MAX) {
-+                        log_debug("Received an entry that has more than " STRINGIFY(ENTRY_FIELD_COUNT_MAX) " fields, ignoring entry.");
-+                        r = 1;
-+                        goto finish;
-+                }
- 
-                 /* n existing properties, 1 new, +1 for _TRANSPORT */
-                 if (!GREEDY_REALLOC(iovec, m,
-diff --git a/src/shared/journal-importer.h b/src/shared/journal-importer.h
-index 53354b7..7914c0c 100644
---- a/src/shared/journal-importer.h
-+++ b/src/shared/journal-importer.h
-@@ -21,6 +21,9 @@
- #endif
- #define LINE_CHUNK 8*1024u
- 
-+/* The maximum number of fields in an entry */
-+#define ENTRY_FIELD_COUNT_MAX 1024
-+
- struct iovec_wrapper {
-         struct iovec *iovec;
-         size_t size_bytes;
--- 
-2.7.4
-
diff --git a/package/systemd/0011-journal-remote-verify-entry-length-from-header.patch b/package/systemd/0011-journal-remote-verify-entry-length-from-header.patch
deleted file mode 100644
index 7b74a31d35..0000000000
--- a/package/systemd/0011-journal-remote-verify-entry-length-from-header.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 7fdb237f5473cb8fc2129e57e8a0039526dcb4fd Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Fri, 7 Dec 2018 12:47:14 +0100
-Subject: [PATCH] journal-remote: verify entry length from header
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Calling mhd_respond(), which ulimately calls MHD_queue_response() is
-ineffective at point, becuase MHD_queue_response() immediately returns
-MHD_NO signifying an error, because the connection is in state
-MHD_CONNECTION_CONTINUE_SENT.
-
-As Christian Grothoff kindly explained:
-> You are likely calling MHD_queue_repsonse() too late: once you are
-> receiving upload_data, HTTP forces you to process it all. At this time,
-> MHD has already sent "100 continue" and cannot take it back (hence you
-> get MHD_NO!).
->
-> In your request handler, the first time when you are called for a
-> connection (and when hence *upload_data_size == 0 and upload_data ==
-> NULL) you must check the content-length header and react (with
-> MHD_queue_response) based on this (to prevent MHD from automatically
-> generating 100 continue).
-
-If we ever encounter this kind of error, print a warning and immediately
-abort the connection. (The alternative would be to keep reading the data,
-but ignore it, and return an error after we get to the end of data.
-That is possible, but of course puts additional load on both the
-sender and reciever, and doesn't seem important enough just to return
-a good error message.)
-
-Note that sending of the error does not work (the connection is always aborted
-when MHD_queue_response is used with MHD_RESPMEM_MUST_FREE, as in this case)
-with lib??httpd 0.59, but works with 0.61:
-https://src.fedoraproject.org/rpms/libmicrohttpd/pull-request/1
-
-[james.hilliard1 at gmail.com: backport from upstream commit
-7fdb237f5473cb8fc2129e57e8a0039526dcb4fd]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- src/journal-remote/journal-remote-main.c | 34 ++++++++++++++++++++++----------
- 1 file changed, 24 insertions(+), 10 deletions(-)
-
-diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
-index e1748cb..8543dba 100644
---- a/src/journal-remote/journal-remote-main.c
-+++ b/src/journal-remote/journal-remote-main.c
-@@ -221,16 +221,14 @@ static int process_http_upload(
-                                    journal_remote_server_global->seal);
-                 if (r == -EAGAIN)
-                         break;
--                else if (r < 0) {
--                        log_warning("Failed to process data for connection %p", connection);
-+                if (r < 0) {
-                         if (r == -E2BIG)
--                                return mhd_respondf(connection,
--                                                    r, MHD_HTTP_PAYLOAD_TOO_LARGE,
--                                                    "Entry is too large, maximum is " STRINGIFY(DATA_SIZE_MAX) " bytes.");
-+                                log_warning_errno(r, "Entry is too above maximum of %u, aborting connection %p.",
-+                                                  DATA_SIZE_MAX, connection);
-                         else
--                                return mhd_respondf(connection,
--                                                    r, MHD_HTTP_UNPROCESSABLE_ENTITY,
--                                                    "Processing failed: %m.");
-+                                log_warning_errno(r, "Failed to process data, aborting connection %p: %m",
-+                                                  connection);
-+                        return MHD_NO;
-                 }
-         }
- 
-@@ -264,6 +262,7 @@ static int request_handler(
-         const char *header;
-         int r, code, fd;
-         _cleanup_free_ char *hostname = NULL;
-+        size_t len;
- 
-         assert(connection);
-         assert(connection_cls);
-@@ -283,12 +282,27 @@ static int request_handler(
-         if (!streq(url, "/upload"))
-                 return mhd_respond(connection, MHD_HTTP_NOT_FOUND, "Not found.");
- 
--        header = MHD_lookup_connection_value(connection,
--                                             MHD_HEADER_KIND, "Content-Type");
-+        header = MHD_lookup_connection_value(connection, MHD_HEADER_KIND, "Content-Type");
-         if (!header || !streq(header, "application/vnd.fdo.journal"))
-                 return mhd_respond(connection, MHD_HTTP_UNSUPPORTED_MEDIA_TYPE,
-                                    "Content-Type: application/vnd.fdo.journal is required.");
- 
-+        header = MHD_lookup_connection_value(connection, MHD_HEADER_KIND, "Content-Length");
-+        if (!header)
-+                return mhd_respond(connection, MHD_HTTP_LENGTH_REQUIRED,
-+                                   "Content-Length header is required.");
-+        r = safe_atozu(header, &len);
-+        if (r < 0)
-+                return mhd_respondf(connection, r, MHD_HTTP_LENGTH_REQUIRED,
-+                                    "Content-Length: %s cannot be parsed: %m", header);
-+
-+        if (len > ENTRY_SIZE_MAX)
-+                /* When serialized, an entry of maximum size might be slightly larger,
-+                 * so this does not correspond exactly to the limit in journald. Oh well.
-+                 */
-+                return mhd_respondf(connection, 0, MHD_HTTP_PAYLOAD_TOO_LARGE,
-+                                    "Payload larger than maximum size of %u bytes", ENTRY_SIZE_MAX);
-+
-         {
-                 const union MHD_ConnectionInfo *ci;
- 
--- 
-2.7.4
-
diff --git a/package/systemd/0012-journal-remote-set-a-limit-on-the-number-of-fields-i.patch b/package/systemd/0012-journal-remote-set-a-limit-on-the-number-of-fields-i.patch
deleted file mode 100644
index e0aae98d90..0000000000
--- a/package/systemd/0012-journal-remote-set-a-limit-on-the-number-of-fields-i.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From ef4d6abe7c7fab6cbff975b32e76b09feee56074 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Fri, 7 Dec 2018 10:48:10 +0100
-Subject: [PATCH] journal-remote: set a limit on the number of fields in a
- message
-
-Existing use of E2BIG is replaced with ENOBUFS (entry too long), and E2BIG is
-reused for the new error condition (too many fields).
-
-This matches the change done for systemd-journald, hence forming the second
-part of the fix for CVE-2018-16865
-(https://bugzilla.redhat.com/show_bug.cgi?id=1653861).
-
-[james.hilliard1 at gmail.com: backport from upstream commit
-ef4d6abe7c7fab6cbff975b32e76b09feee56074]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- src/journal-remote/journal-remote-main.c | 7 +++++--
- src/journal-remote/journal-remote.c      | 3 +++
- src/shared/journal-importer.c            | 5 ++++-
- 3 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
-index 8543dba..802c3ea 100644
---- a/src/journal-remote/journal-remote-main.c
-+++ b/src/journal-remote/journal-remote-main.c
-@@ -222,9 +222,12 @@ static int process_http_upload(
-                 if (r == -EAGAIN)
-                         break;
-                 if (r < 0) {
--                        if (r == -E2BIG)
--                                log_warning_errno(r, "Entry is too above maximum of %u, aborting connection %p.",
-+                        if (r == -ENOBUFS)
-+                                log_warning_errno(r, "Entry is above the maximum of %u, aborting connection %p.",
-                                                   DATA_SIZE_MAX, connection);
-+                        else if (r == -E2BIG)
-+                                log_warning_errno(r, "Entry with more fields than the maximum of %u, aborting connection %p.",
-+                                                  ENTRY_FIELD_COUNT_MAX, connection);
-                         else
-                                 log_warning_errno(r, "Failed to process data, aborting connection %p: %m",
-                                                   connection);
-diff --git a/src/journal-remote/journal-remote.c b/src/journal-remote/journal-remote.c
-index 3c0916c..1da32c5 100644
---- a/src/journal-remote/journal-remote.c
-+++ b/src/journal-remote/journal-remote.c
-@@ -407,6 +407,9 @@ int journal_remote_handle_raw_source(
-                 log_debug("%zu active sources remaining", s->active);
-                 return 0;
-         } else if (r == -E2BIG) {
-+                log_notice("Entry with too many fields, skipped");
-+                return 1;
-+        } else if (r == -ENOBUFS) {
-                 log_notice("Entry too big, skipped");
-                 return 1;
-         } else if (r == -EAGAIN) {
-diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
-index b0e6192..8638cd3 100644
---- a/src/shared/journal-importer.c
-+++ b/src/shared/journal-importer.c
-@@ -23,6 +23,9 @@ enum {
- };
- 
- static int iovw_put(struct iovec_wrapper *iovw, void* data, size_t len) {
-+        if (iovw->count >= ENTRY_FIELD_COUNT_MAX)
-+                return -E2BIG;
-+
-         if (!GREEDY_REALLOC(iovw->iovec, iovw->size_bytes, iovw->count + 1))
-                 return log_oom();
- 
-@@ -97,7 +100,7 @@ static int get_line(JournalImporter *imp, char **line, size_t *size) {
- 
-                 imp->scanned = imp->filled;
-                 if (imp->scanned >= DATA_SIZE_MAX)
--                        return log_error_errno(SYNTHETIC_ERRNO(E2BIG),
-+                        return log_error_errno(SYNTHETIC_ERRNO(ENOBUFS),
-                                                "Entry is bigger than %u bytes.",
-                                                DATA_SIZE_MAX);
- 
--- 
-2.7.4
-
diff --git a/package/systemd/0013-Pass-separate-dev_t-var-to-device_path_parse_major_minor.patch b/package/systemd/0013-Pass-separate-dev_t-var-to-device_path_parse_major_minor.patch
deleted file mode 100644
index eb7e0a2705..0000000000
--- a/package/systemd/0013-Pass-separate-dev_t-var-to-device_path_parse_major_minor.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From f5855697aa19fb92637e72ab02e4623abe77f288 Mon Sep 17 00:00:00 2001
-From: YunQiang Su <syq@debian.org>
-Date: Tue, 25 Dec 2018 19:01:17 +0800
-Subject: [PATCH] Pass separate dev_t var to device_path_parse_major_minor
-
-MIPS/O32's st_rdev member of struct stat is unsigned long, which
-is 32bit, while dev_t is defined as 64bit, which make some problems
-in device_path_parse_major_minor.
-
-Don't pass st.st_rdev, st_mode to device_path_parse_major_minor,
-while pass 2 seperate variables. The result of stat is alos copied
-out into these 2 variables. Fixes: #11247
-
-[Retrieved from:
-https://github.com/systemd/systemd/commit/f5855697aa19fb92637e72ab02e4623abe77f288]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/core/cgroup.c | 35 ++++++++++++++++++++++-------------
- 1 file changed, 22 insertions(+), 13 deletions(-)
-
-diff --git a/src/core/cgroup.c b/src/core/cgroup.c
-index 7b817dc225e..ed2f331b33e 100644
---- a/src/core/cgroup.c
-+++ b/src/core/cgroup.c
-@@ -396,26 +396,31 @@ static void cgroup_xattr_apply(Unit *u) {
- }
- 
- static int lookup_block_device(const char *p, dev_t *ret) {
--        struct stat st = {};
-+        dev_t rdev, dev = 0;
-+        mode_t mode;
-         int r;
- 
-         assert(p);
-         assert(ret);
- 
--        r = device_path_parse_major_minor(p, &st.st_mode, &st.st_rdev);
-+        r = device_path_parse_major_minor(p, &mode, &rdev);
-         if (r == -ENODEV) { /* not a parsable device node, need to go to disk */
-+                struct stat st;
-                 if (stat(p, &st) < 0)
-                         return log_warning_errno(errno, "Couldn't stat device '%s': %m", p);
-+                rdev = (dev_t)st.st_rdev;
-+                dev = (dev_t)st.st_dev;
-+                mode = st.st_mode;
-         } else if (r < 0)
-                 return log_warning_errno(r, "Failed to parse major/minor from path '%s': %m", p);
- 
--        if (S_ISCHR(st.st_mode)) {
-+        if (S_ISCHR(mode)) {
-                 log_warning("Device node '%s' is a character device, but block device needed.", p);
-                 return -ENOTBLK;
--        } else if (S_ISBLK(st.st_mode))
--                *ret = st.st_rdev;
--        else if (major(st.st_dev) != 0)
--                *ret = st.st_dev; /* If this is not a device node then use the block device this file is stored on */
-+        } else if (S_ISBLK(mode))
-+                *ret = rdev;
-+        else if (major(dev) != 0)
-+                *ret = dev; /* If this is not a device node then use the block device this file is stored on */
-         else {
-                 /* If this is btrfs, getting the backing block device is a bit harder */
-                 r = btrfs_get_block_device(p, ret);
-@@ -436,7 +441,8 @@ static int lookup_block_device(const char *p, dev_t *ret) {
- }
- 
- static int whitelist_device(BPFProgram *prog, const char *path, const char *node, const char *acc) {
--        struct stat st = {};
-+        dev_t rdev;
-+        mode_t mode;
-         int r;
- 
-         assert(path);
-@@ -445,11 +451,12 @@ static int whitelist_device(BPFProgram *prog, const char *path, const char *node
-         /* Some special handling for /dev/block/%u:%u, /dev/char/%u:%u, /run/systemd/inaccessible/chr and
-          * /run/systemd/inaccessible/blk paths. Instead of stat()ing these we parse out the major/minor directly. This
-          * means clients can use these path without the device node actually around */
--        r = device_path_parse_major_minor(node, &st.st_mode, &st.st_rdev);
-+        r = device_path_parse_major_minor(node, &mode, &rdev);
-         if (r < 0) {
-                 if (r != -ENODEV)
-                         return log_warning_errno(r, "Couldn't parse major/minor from device path '%s': %m", node);
- 
-+                struct stat st;
-                 if (stat(node, &st) < 0)
-                         return log_warning_errno(errno, "Couldn't stat device %s: %m", node);
- 
-@@ -457,22 +464,24 @@ static int whitelist_device(BPFProgram *prog, const char *path, const char *node
-                         log_warning("%s is not a device.", node);
-                         return -ENODEV;
-                 }
-+                rdev = (dev_t) st.st_rdev;
-+                mode = st.st_mode;
-         }
- 
-         if (cg_all_unified() > 0) {
-                 if (!prog)
-                         return 0;
- 
--                return cgroup_bpf_whitelist_device(prog, S_ISCHR(st.st_mode) ? BPF_DEVCG_DEV_CHAR : BPF_DEVCG_DEV_BLOCK,
--                                                   major(st.st_rdev), minor(st.st_rdev), acc);
-+                return cgroup_bpf_whitelist_device(prog, S_ISCHR(mode) ? BPF_DEVCG_DEV_CHAR : BPF_DEVCG_DEV_BLOCK,
-+                                                   major(rdev), minor(rdev), acc);
- 
-         } else {
-                 char buf[2+DECIMAL_STR_MAX(dev_t)*2+2+4];
- 
-                 sprintf(buf,
-                         "%c %u:%u %s",
--                        S_ISCHR(st.st_mode) ? 'c' : 'b',
--                        major(st.st_rdev), minor(st.st_rdev),
-+                        S_ISCHR(mode) ? 'c' : 'b',
-+                        major(rdev), minor(rdev),
-                         acc);
- 
-                 /* Changing the devices list of a populated cgroup might result in EINVAL, hence ignore EINVAL here. */
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 9c1a512ce7..dbc575efec 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256	8f15aec1ac926e13a21a04d0ca3fe371f7004951448142a6f8952075c5b5f0b5  	systemd-240.tar.gz
+sha256	b2561a8e1d10a2c248253f0dda31a85dd6d69f2b54177de55e02cd1d2778316e  	systemd-241.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
 sha256	a693f8f654fdf016e2aefe6b30aa6e1211728b8269ab325408a152c6c9b6ebe8	README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7a46a50ed3..79ab0e0556 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 240
+SYSTEMD_VERSION = 241
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
-- 
2.20.1
