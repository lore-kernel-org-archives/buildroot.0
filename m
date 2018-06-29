From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sat, 30 Jun 2018 00:25:50 +0200
Subject: [Buildroot] [PATCH 1/3] systemd: bump to v239
In-Reply-To: <20180629222552.12808-1-jeremy.rosen@smile.fr>
References: <20180629222552.12808-1-jeremy.rosen@smile.fr>
Message-ID: <20180629222552.12808-2-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* remove upstreamed patches
* refresh patch 0002 which didn't apply cleanly
* update patch 0001 to catch more uses of agetty


Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/systemd/0001-fix-getty-unit.patch     |  61 ++++--
 .../0002-install-don-t-use-ln-relative.patch  |  19 +-
 ...-include-libmount-h-in-a-header-file.patch |  75 -------
 .../0005-basic-macros-rename-noreturn.patch   | 201 ------------------
 package/systemd/systemd.hash                  |   2 +-
 package/systemd/systemd.mk                    |   2 +-
 6 files changed, 63 insertions(+), 297 deletions(-)
 delete mode 100644 package/systemd/0004-core-dont-include-libmount-h-in-a-header-file.patch
 delete mode 100644 package/systemd/0005-basic-macros-rename-noreturn.patch

diff --git a/package/systemd/0001-fix-getty-unit.patch b/package/systemd/0001-fix-getty-unit.patch
index b6947626c5..4716679844 100644
--- a/package/systemd/0001-fix-getty-unit.patch
+++ b/package/systemd/0001-fix-getty-unit.patch
@@ -1,21 +1,58 @@
-From 7deb6387aeb07fa4300fa3cf9d6c039dabd120d7 Mon Sep 17 00:00:00 2001
-From: Maxime Ripard <maxime.ripard@free-electrons.com>
-Date: Mon, 31 Jul 2017 10:08:46 -0400
-Subject: [PATCH] fix-getty-unit
-
-Prefer getty to agetty in console setup systemd units
+From 58dba37de7a2cd6e353f1ada97f1f3bc85ebf87b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@enst-bretagne.fr>
+Date: Fri, 22 Jun 2018 11:19:07 +0200
+Subject: [PATCH 1/3] Prefer getty to agetty in console setup systemd units
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 [aduskett at gmail.com: Update for systemd v237]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[jeremy.rosen at smile.fr: Update for systemd v238]
+Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
 ---
- units/getty at .service.m4        | 5 +----
- units/serial-getty at .service.m4 | 2 +-
- 2 files changed, 2 insertions(+), 5 deletions(-)
+ units/console-getty.service.m4    | 5 +----
+ units/container-getty at .service.m4 | 5 +----
+ units/getty at .service.m4           | 5 +----
+ units/serial-getty at .service.m4    | 2 +-
+ 4 files changed, 4 insertions(+), 13 deletions(-)
 
+diff --git a/units/console-getty.service.m4 b/units/console-getty.service.m4
+index 3c553240a..4f8fdf668 100644
+--- a/units/console-getty.service.m4
++++ b/units/console-getty.service.m4
+@@ -20,10 +20,7 @@ Before=getty.target
+ ConditionPathExists=/dev/console
+ 
+ [Service]
+-# The '-o' option value tells agetty to replace 'login' arguments with an
+-# option to preserve environment (-p), followed by '--' for safety, and then
+-# the entered username.
+-ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear --keep-baud console 115200,38400,9600 $TERM
++ExecStart=-/sbin/getty -L %I 115200 vt100
+ Type=idle
+ Restart=always
+ UtmpIdentifier=cons
+diff --git a/units/container-getty at .service.m4 b/units/container-getty at .service.m4
+index 087ab7f9b..9d1b78cef 100644
+--- a/units/container-getty at .service.m4
++++ b/units/container-getty at .service.m4
+@@ -25,10 +25,7 @@ Conflicts=rescue.service
+ Before=rescue.service
+ 
+ [Service]
+-# The '-o' option value tells agetty to replace 'login' arguments with an
+-# option to preserve environment (-p), followed by '--' for safety, and then
+-# the entered username.
+-ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear --keep-baud pts/%I 115200,38400,9600 $TERM
++ExecStart=-/sbin/getty -L %I 115200 vt100
+ Type=idle
+ Restart=always
+ RestartSec=0
 diff --git a/units/getty at .service.m4 b/units/getty at .service.m4
-index 2a84061..7ad588f 100644
+index 80e793bb7..385758c61 100644
 --- a/units/getty at .service.m4
 +++ b/units/getty at .service.m4
 @@ -35,10 +35,7 @@ ConditionPathExists=/dev/tty0
@@ -31,7 +68,7 @@ index 2a84061..7ad588f 100644
  Restart=always
  RestartSec=0
 diff --git a/units/serial-getty at .service.m4 b/units/serial-getty at .service.m4
-index b7caeaf..c663612 100644
+index 757b86ab2..3d60efdb6 100644
 --- a/units/serial-getty at .service.m4
 +++ b/units/serial-getty at .service.m4
 @@ -33,7 +33,7 @@ Before=rescue.service
@@ -44,5 +81,5 @@ index b7caeaf..c663612 100644
  Restart=always
  UtmpIdentifier=%I
 -- 
-2.13.3
+2.18.0
 
diff --git a/package/systemd/0002-install-don-t-use-ln-relative.patch b/package/systemd/0002-install-don-t-use-ln-relative.patch
index 61a139e2a2..ce3f183537 100644
--- a/package/systemd/0002-install-don-t-use-ln-relative.patch
+++ b/package/systemd/0002-install-don-t-use-ln-relative.patch
@@ -1,7 +1,10 @@
-From 17560d52e9ec0afebbfe31e694870c6433b36f60 Mon Sep 17 00:00:00 2001
+From f8757e2d9c7c76c5ec0eaeab4a90b8bd663d6956 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <Adamduskett@outlook.com>
 Date: Sun, 31 Dec 2017 12:46:04 -0500
-Subject: [PATCH] install: don't use ln --relative
+Subject: [PATCH 2/3] install: don't use ln --relative
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Oldish enterprise-class distributions have too old versions of
 coreutils, with ln not supporting --relative.
@@ -23,6 +26,8 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
 [tpiepho at impinj.com: Fix add-wants wrapper]
 Signed-off-by: Trent Piepho <tpiepho@impinj.com>
+[jeremy.rosen at smile.fr: Update for systemd v239]
+Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
 ---
  meson.build                 | 2 +-
  tools/meson-make-symlink.sh | 3 ++-
@@ -30,15 +35,15 @@ Signed-off-by: Trent Piepho <tpiepho@impinj.com>
  3 files changed, 7 insertions(+), 4 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index d4af95a44..d75f2b34c 100644
+index 04331dd41..359042c04 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -586,7 +586,7 @@ endforeach
+@@ -559,7 +559,7 @@ endforeach
  conf.set_quoted('TELINIT', get_option('telinit-path'))
  
  if run_command('ln', '--relative', '--help').returncode() != 0
--        error('ln does not support --relative')
-+        message('ln does not support --relative')
+-        error('ln does not support --relative (added in coreutils 8.16)')
++        message('ln does not support --relative (added in coreutils 8.16)')
  endif
  
  ############################################################
@@ -76,5 +81,5 @@ index 70f7172ae..bb8155075 100755
 +dds="$(printf "%s" "${linkdir#${DESTDIR:-}}" |sed -r -e 's:/+[^/]+:../:g; s:/$::')"
 +ln -vfs "$dds$unitpath" "$dir"
 -- 
-2.14.3
+2.18.0
 
diff --git a/package/systemd/0004-core-dont-include-libmount-h-in-a-header-file.patch b/package/systemd/0004-core-dont-include-libmount-h-in-a-header-file.patch
deleted file mode 100644
index b91d09722b..0000000000
--- a/package/systemd/0004-core-dont-include-libmount-h-in-a-header-file.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 227b8a762fea1458547be2cdf0e6e4aac0079730 Mon Sep 17 00:00:00 2001
-From: Michael Olbrich <m.olbrich@pengutronix.de>
-Date: Mon, 26 Mar 2018 17:34:53 +0200
-Subject: [PATCH] core: don't include libmount.h in a header file (#8580)
-
-linux/fs.h sys/mount.h, libmount.h and missing.h all include MS_*
-definitions.
-
-To avoid problems, only one of linux/fs.h, sys/mount.h and libmount.h
-should be included. And missing.h must be included last.
-
-Without this, building systemd may fail with:
-
-In file included from [...]/libmount/libmount.h:31:0,
-                 from ../systemd-238/src/core/manager.h:23,
-                 from ../systemd-238/src/core/emergency-action.h:37,
-                 from ../systemd-238/src/core/unit.h:34,
-                 from ../systemd-238/src/core/dbus-timer.h:25,
-                 from ../systemd-238/src/core/timer.c:26:
-[...]/sys/mount.h:57:2: error: expected identifier before numeric constant
-
-Upstream: https://github.com/systemd/systemd/pull/8580
-Signed-off-by: Stefan Becker <chemobejk@gmail.com>
----
- src/core/dbus-execute.c | 1 +
- src/core/manager.h      | 3 ++-
- src/core/mount.c        | 2 ++
- 3 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index 7344623ebf6..c342093bca4 100644
---- a/src/core/dbus-execute.c
-+++ b/src/core/dbus-execute.c
-@@ -18,6 +18,7 @@
-   along with systemd; If not, see <http://www.gnu.org/licenses/>.
- ***/
- 
-+#include <sys/mount.h>
- #include <sys/prctl.h>
- #include <stdio_ext.h>
- 
-diff --git a/src/core/manager.h b/src/core/manager.h
-index 28c5da225b1..e09e0cdf5e9 100644
---- a/src/core/manager.h
-+++ b/src/core/manager.h
-@@ -20,7 +20,6 @@
-   along with systemd; If not, see <http://www.gnu.org/licenses/>.
- ***/
- 
--#include <libmount.h>
- #include <stdbool.h>
- #include <stdio.h>
- 
-@@ -34,6 +33,8 @@
- #include "list.h"
- #include "ratelimit.h"
- 
-+struct libmnt_monitor;
-+
- /* Enforce upper limit how many names we allow */
- #define MANAGER_MAX_NAMES 131072 /* 128K */
- 
-diff --git a/src/core/mount.c b/src/core/mount.c
-index 0e755da5c02..0154ebda5d6 100644
---- a/src/core/mount.c
-+++ b/src/core/mount.c
-@@ -23,6 +23,8 @@
- #include <stdio.h>
- #include <sys/epoll.h>
- 
-+#include <libmount.h>
-+
- #include "sd-messages.h"
- 
- #include "alloc-util.h"
diff --git a/package/systemd/0005-basic-macros-rename-noreturn.patch b/package/systemd/0005-basic-macros-rename-noreturn.patch
deleted file mode 100644
index 6cd847098e..0000000000
--- a/package/systemd/0005-basic-macros-rename-noreturn.patch
+++ /dev/null
@@ -1,201 +0,0 @@
-From 848e863acc51ecfb0f3955c498874588201d9130 Mon Sep 17 00:00:00 2001
-From: Franck Bui <fbui@suse.com>
-Date: Thu, 15 Mar 2018 06:23:46 +0100
-Subject: [PATCH] basic/macros: rename noreturn into _noreturn_ (#8456)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-"noreturn" is reserved and can be used in other header files we include:
-
-  [   16s] In file included from /usr/include/gcrypt.h:30:0,
-  [   16s]                  from ../src/journal/journal-file.h:26,
-  [   16s]                  from ../src/journal/journal-vacuum.c:31:
-  [   16s] /usr/include/gpg-error.h:1544:46: error: expected ?,? or ?;? before ?)? token
-  [   16s]  void gpgrt_log_bug (const char *fmt, ...)    GPGRT_ATTR_NR_PRINTF(1,2);
-
-Here we include grcrypt.h (which in turns include gpg-error.h) *after* we
-"noreturn" was defined in macro.h.
-
-Upstream: https://github.com/systemd/systemd/pull/8456
-Signed-off-by: Stefan Becker <chemobejk@gmail.com>
----
- src/basic/log.c                         |  4 ++--
- src/basic/log.h                         |  4 ++--
- src/basic/macro.h                       | 19 +++++++++----------
- src/basic/process-util.c                |  2 +-
- src/basic/process-util.h                |  2 +-
- src/core/main.c                         |  4 ++--
- src/journal/test-journal-interleaving.c |  2 +-
- src/shared/pager.c                      |  2 +-
- src/udev/collect/collect.c              |  2 +-
- 9 files changed, 20 insertions(+), 21 deletions(-)
-
-diff --git a/src/basic/log.c b/src/basic/log.c
-index 7a7f2cbec13..16a2431c548 100644
---- a/src/basic/log.c
-+++ b/src/basic/log.c
-@@ -814,7 +814,7 @@ static void log_assert(
-         log_dispatch_internal(level, 0, file, line, func, NULL, NULL, NULL, NULL, buffer);
- }
- 
--noreturn void log_assert_failed_realm(
-+_noreturn_ void log_assert_failed_realm(
-                 LogRealm realm,
-                 const char *text,
-                 const char *file,
-@@ -826,7 +826,7 @@ noreturn void log_assert_failed_realm(
-         abort();
- }
- 
--noreturn void log_assert_failed_unreachable_realm(
-+_noreturn_ void log_assert_failed_unreachable_realm(
-                 LogRealm realm,
-                 const char *text,
-                 const char *file,
-diff --git a/src/basic/log.h b/src/basic/log.h
-index efcf0f1bfc1..314be128a23 100644
---- a/src/basic/log.h
-+++ b/src/basic/log.h
-@@ -186,7 +186,7 @@ int log_dump_internal(
-                 char *buffer);
- 
- /* Logging for various assertions */
--noreturn void log_assert_failed_realm(
-+_noreturn_ void log_assert_failed_realm(
-                 LogRealm realm,
-                 const char *text,
-                 const char *file,
-@@ -195,7 +195,7 @@ noreturn void log_assert_failed_realm(
- #define log_assert_failed(text, ...) \
-         log_assert_failed_realm(LOG_REALM, (text), __VA_ARGS__)
- 
--noreturn void log_assert_failed_unreachable_realm(
-+_noreturn_ void log_assert_failed_unreachable_realm(
-                 LogRealm realm,
-                 const char *text,
-                 const char *file,
-diff --git a/src/basic/macro.h b/src/basic/macro.h
-index 95be63a2040..8911edfc4be 100644
---- a/src/basic/macro.h
-+++ b/src/basic/macro.h
-@@ -53,6 +53,15 @@
- #else
- #define _fallthrough_
- #endif
-+/* Define C11 noreturn without <stdnoreturn.h> and even on older gcc
-+ * compiler versions */
-+#ifndef _noreturn_
-+#if __STDC_VERSION__ >= 201112L
-+#define _noreturn_ _Noreturn
-+#else
-+#define _noreturn_ __attribute__((noreturn))
-+#endif
-+#endif
- 
- /* Temporarily disable some warnings */
- #define DISABLE_WARNING_DECLARATION_AFTER_STATEMENT                     \
-@@ -414,16 +423,6 @@ static inline unsigned long ALIGN_POWER2(unsigned long u) {
- #endif
- #endif
- 
--/* Define C11 noreturn without <stdnoreturn.h> and even on older gcc
-- * compiler versions */
--#ifndef noreturn
--#if __STDC_VERSION__ >= 201112L
--#define noreturn _Noreturn
--#else
--#define noreturn __attribute__((noreturn))
--#endif
--#endif
--
- #define DEFINE_TRIVIAL_CLEANUP_FUNC(type, func)                 \
-         static inline void func##p(type *p) {                   \
-                 if (*p)                                         \
-diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index aa9846db5dc..e6120af5b68 100644
---- a/src/basic/process-util.c
-+++ b/src/basic/process-util.c
-@@ -987,7 +987,7 @@ bool is_main_thread(void) {
-         return cached > 0;
- }
- 
--noreturn void freeze(void) {
-+_noreturn_ void freeze(void) {
- 
-         log_close();
- 
-diff --git a/src/basic/process-util.h b/src/basic/process-util.h
-index 93029e36e5f..5170adec7bb 100644
---- a/src/basic/process-util.h
-+++ b/src/basic/process-util.h
-@@ -91,7 +91,7 @@ int pid_from_same_root_fs(pid_t pid);
- 
- bool is_main_thread(void);
- 
--noreturn void freeze(void);
-+_noreturn_ void freeze(void);
- 
- bool oom_score_adjust_is_valid(int oa);
- 
-diff --git a/src/core/main.c b/src/core/main.c
-index 076846a41c0..4b2d1492373 100644
---- a/src/core/main.c
-+++ b/src/core/main.c
-@@ -141,7 +141,7 @@ static uint64_t arg_default_tasks_max = UINT64_MAX;
- static sd_id128_t arg_machine_id = {};
- static EmergencyAction arg_cad_burst_action = EMERGENCY_ACTION_REBOOT_FORCE;
- 
--noreturn static void freeze_or_reboot(void) {
-+_noreturn_ static void freeze_or_reboot(void) {
- 
-         if (arg_crash_reboot) {
-                 log_notice("Rebooting in 10s...");
-@@ -156,7 +156,7 @@ noreturn static void freeze_or_reboot(void) {
-         freeze();
- }
- 
--noreturn static void crash(int sig) {
-+_noreturn_ static void crash(int sig) {
-         struct sigaction sa;
-         pid_t pid;
- 
-diff --git a/src/journal/test-journal-interleaving.c b/src/journal/test-journal-interleaving.c
-index 5a88b2774fa..d87bdbdd32a 100644
---- a/src/journal/test-journal-interleaving.c
-+++ b/src/journal/test-journal-interleaving.c
-@@ -37,7 +37,7 @@
- 
- static bool arg_keep = false;
- 
--noreturn static void log_assert_errno(const char *text, int error, const char *file, int line, const char *func) {
-+_noreturn_ static void log_assert_errno(const char *text, int error, const char *file, int line, const char *func) {
-         log_internal(LOG_CRIT, error, file, line, func,
-                      "'%s' failed at %s:%u (%s): %m", text, file, line, func);
-         abort();
-diff --git a/src/shared/pager.c b/src/shared/pager.c
-index 75db3c985bd..681af9c40e3 100644
---- a/src/shared/pager.c
-+++ b/src/shared/pager.c
-@@ -47,7 +47,7 @@ static int stored_stderr = -1;
- static bool stdout_redirected = false;
- static bool stderr_redirected = false;
- 
--noreturn static void pager_fallback(void) {
-+_noreturn_ static void pager_fallback(void) {
-         int r;
- 
-         r = copy_bytes(STDIN_FILENO, STDOUT_FILENO, (uint64_t) -1, 0);
-diff --git a/src/udev/collect/collect.c b/src/udev/collect/collect.c
-index 2821640e93b..c8fa47b3d7d 100644
---- a/src/udev/collect/collect.c
-+++ b/src/udev/collect/collect.c
-@@ -58,7 +58,7 @@ static inline struct _mate *node_to_mate(struct udev_list_node *node)
-         return container_of(node, struct _mate, node);
- }
- 
--noreturn static void sig_alrm(int signo)
-+_noreturn_ static void sig_alrm(int signo)
- {
-         exit(4);
- }
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index d580a29b83..c87ca0561c 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256	c83dabbe1c9de6b9db1dafdb7e04140c7d0535705c68842f6c0768653ba4913c	systemd-237.tar.gz
+sha256	8a11b1b07d620f4c06a16e95bba4dd2a97e90efdf2a5ba47ed0a935085787a14  	systemd-239.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
 sha256	9c7709aa401a41c4c3f33ea75c34ae5d5354d62c310c3391c2a5958952d8aadd	README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 82d0e1a027..16c9d9f290 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 237
+SYSTEMD_VERSION = 239
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
-- 
2.18.0
