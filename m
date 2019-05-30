From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 May 2019 14:51:26 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/systemd: fix
 memory leak in systemd-journald
Message-ID: <20190530125117.759DB802FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae43e724e84dde358320775ba7423619b78d1839
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes #11911

Systemd-journald would leak memory when recording process info.  Add
patch files from upstream systemd.  Note that the patch from 2d5d2e0cc5
was taken as well in order to make the needed commit apply cleanly.

Bug report: https://github.com/systemd/systemd/issues/11502
Accepted patch: https://github.com/systemd/systemd/pull/11527

Signed-off-by: Jonah Petri <jonah@petri.us>
[Peter: add bz reference, add s-o-b to patches, drop numbering]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ss-util-limit-command-line-lengths-to-_SC.patch | 159 +++++++++++++++++++++
 ...l-don-t-use-overly-large-buffer-to-store-.patch |  70 +++++++++
 2 files changed, 229 insertions(+)

diff --git a/package/systemd/0020-basic-process-util-limit-command-line-lengths-to-_SC.patch b/package/systemd/0020-basic-process-util-limit-command-line-lengths-to-_SC.patch
new file mode 100644
index 0000000000..fd2fce7790
--- /dev/null
+++ b/package/systemd/0020-basic-process-util-limit-command-line-lengths-to-_SC.patch
@@ -0,0 +1,159 @@
+From 2d5d2e0cc5171c6795d2a485841474345d9e30ab Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Wed, 5 Dec 2018 18:48:23 +0100
+Subject: [PATCH 1/2] basic/process-util: limit command line lengths to
+ _SC_ARG_MAX
+
+This affects systemd-journald and systemd-coredump.
+
+Example entry:
+$ journalctl -o export -n1 'MESSAGE=Something logged'
+__CURSOR=s=976542d120c649f494471be317829ef9;i=34e;b=4871e4c474574ce4a462dfe3f1c37f06;m=c7d0c37dd2;t=57c4ac58f3b98;x=67598e942bd23dc0
+__REALTIME_TIMESTAMP=1544035467475864
+__MONOTONIC_TIMESTAMP=858200964562
+_BOOT_ID=4871e4c474574ce4a462dfe3f1c37f06
+PRIORITY=6
+_UID=1000
+_GID=1000
+_CAP_EFFECTIVE=0
+_SELINUX_CONTEXT=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
+_AUDIT_SESSION=1
+_AUDIT_LOGINUID=1000
+_SYSTEMD_OWNER_UID=1000
+_SYSTEMD_UNIT=user at 1000.service
+_SYSTEMD_SLICE=user-1000.slice
+_SYSTEMD_USER_SLICE=-.slice
+_SYSTEMD_INVOCATION_ID=1c4a469986d448719cb0f9141a10810e
+_MACHINE_ID=08a5690a2eed47cf92ac0a5d2e3cf6b0
+_HOSTNAME=krowka
+_TRANSPORT=syslog
+SYSLOG_FACILITY=17
+SYSLOG_IDENTIFIER=syslog-caller
+MESSAGE=Something logged
+_COMM=poc
+_EXE=/home/zbyszek/src/systemd-work3/poc
+_SYSTEMD_CGROUP=/user.slice/user-1000.slice/user at 1000.service/gnome-terminal-server.service
+_SYSTEMD_USER_UNIT=gnome-terminal-server.service
+SYSLOG_PID=4108
+SYSLOG_TIMESTAMP=Dec  5 19:44:27
+_PID=4108
+_CMDLINE=./poc AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA>
+_SOURCE_REALTIME_TIMESTAMP=1544035467475848
+
+$ journalctl -o export -n1 'MESSAGE=Something logged' --output-fields=_CMDLINE|wc
+      6    2053 2097410
+
+2MB might be hard for some clients to use meaningfully, but OTOH, it is
+important to log the full commandline sometimes. For example, when the program
+is crashing, the exact argument list is useful.
+---
+ src/basic/process-util.c | 73 +++++++++++++++++-------------------------------
+ 1 file changed, 25 insertions(+), 48 deletions(-)
+
+diff --git a/src/basic/process-util.c b/src/basic/process-util.c
+index 448503409b..31fdbd9346 100644
+--- a/src/basic/process-util.c
++++ b/src/basic/process-util.c
+@@ -129,6 +129,13 @@ int get_process_cmdline(pid_t pid, size_t max_length, bool comm_fallback, char *
+ 
+         (void) __fsetlocking(f, FSETLOCKING_BYCALLER);
+ 
++        if (max_length == 0) {
++                /* This is supposed to be a safety guard against runaway command lines. */
++                long l = sysconf(_SC_ARG_MAX);
++                assert(l > 0);
++                max_length = l;
++        }
++
+         if (max_length == 1) {
+ 
+                 /* If there's only room for one byte, return the empty string */
+@@ -139,32 +146,6 @@ int get_process_cmdline(pid_t pid, size_t max_length, bool comm_fallback, char *
+                 *line = ans;
+                 return 0;
+ 
+-        } else if (max_length == 0) {
+-                size_t len = 0, allocated = 0;
+-
+-                while ((c = getc(f)) != EOF) {
+-
+-                        if (!GREEDY_REALLOC(ans, allocated, len+3)) {
+-                                free(ans);
+-                                return -ENOMEM;
+-                        }
+-
+-                        if (isprint(c)) {
+-                                if (space) {
+-                                        ans[len++] = ' ';
+-                                        space = false;
+-                                }
+-
+-                                ans[len++] = c;
+-                        } else if (len > 0)
+-                                space = true;
+-               }
+-
+-                if (len > 0)
+-                        ans[len] = '\0';
+-                else
+-                        ans = mfree(ans);
+-
+         } else {
+                 bool dotdotdot = false;
+                 size_t left;
+@@ -236,34 +217,30 @@ int get_process_cmdline(pid_t pid, size_t max_length, bool comm_fallback, char *
+                 if (h < 0)
+                         return h;
+ 
+-                if (max_length == 0)
+-                        ans = strjoin("[", t, "]");
+-                else {
+-                        size_t l;
++                size_t l = strlen(t);
+ 
+-                        l = strlen(t);
+-
+-                        if (l + 3 <= max_length)
+-                                ans = strjoin("[", t, "]");
+-                        else if (max_length <= 6) {
++                if (l + 3 <= max_length) {
++                        ans = strjoin("[", t, "]");
++                        if (!ans)
++                                return -ENOMEM;
+ 
+-                                ans = new(char, max_length);
+-                                if (!ans)
+-                                        return -ENOMEM;
++                } else if (max_length <= 6) {
++                        ans = new(char, max_length);
++                        if (!ans)
++                                return -ENOMEM;
+ 
+-                                memcpy(ans, "[...]", max_length-1);
+-                                ans[max_length-1] = 0;
+-                        } else {
+-                                t[max_length - 6] = 0;
++                        memcpy(ans, "[...]", max_length-1);
++                        ans[max_length-1] = 0;
++                } else {
++                        t[max_length - 6] = 0;
+ 
+-                                /* Chop off final spaces */
+-                                delete_trailing_chars(t, WHITESPACE);
++                        /* Chop off final spaces */
++                        delete_trailing_chars(t, WHITESPACE);
+ 
+-                                ans = strjoin("[", t, "...]");
+-                        }
++                        ans = strjoin("[", t, "...]");
++                        if (!ans)
++                                return -ENOMEM;
+                 }
+-                if (!ans)
+-                        return -ENOMEM;
+         }
+ 
+         *line = ans;
+-- 
+2.14.3
+
diff --git a/package/systemd/0021-process-util-don-t-use-overly-large-buffer-to-store-.patch b/package/systemd/0021-process-util-don-t-use-overly-large-buffer-to-store-.patch
new file mode 100644
index 0000000000..7ac2482129
--- /dev/null
+++ b/package/systemd/0021-process-util-don-t-use-overly-large-buffer-to-store-.patch
@@ -0,0 +1,70 @@
+From eb1ec489eef8a32918bbfc56a268c9d10464584d Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Tue, 22 Jan 2019 14:29:50 +0100
+Subject: [PATCH 2/2] process-util: don't use overly large buffer to store
+ process command line
+
+Allocate new string as a return value and free our "scratch pad"
+buffer that is potentially much larger than needed (up to
+_SC_ARG_MAX).
+
+Fixes #11502
+---
+ src/basic/process-util.c | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/src/basic/process-util.c b/src/basic/process-util.c
+index 31fdbd9346..78ce43b944 100644
+--- a/src/basic/process-util.c
++++ b/src/basic/process-util.c
+@@ -102,7 +102,8 @@ int get_process_comm(pid_t pid, char **ret) {
+ int get_process_cmdline(pid_t pid, size_t max_length, bool comm_fallback, char **line) {
+         _cleanup_fclose_ FILE *f = NULL;
+         bool space = false;
+-        char *k, *ans = NULL;
++        char *k;
++        _cleanup_free_ char *ans = NULL;
+         const char *p;
+         int c;
+ 
+@@ -143,7 +144,7 @@ int get_process_cmdline(pid_t pid, size_t max_length, bool comm_fallback, char *
+                 if (!ans)
+                         return -ENOMEM;
+ 
+-                *line = ans;
++                *line = TAKE_PTR(ans);
+                 return 0;
+ 
+         } else {
+@@ -208,7 +209,7 @@ int get_process_cmdline(pid_t pid, size_t max_length, bool comm_fallback, char *
+                 _cleanup_free_ char *t = NULL;
+                 int h;
+ 
+-                free(ans);
++                ans = mfree(ans);
+ 
+                 if (!comm_fallback)
+                         return -ENOENT;
+@@ -241,9 +242,18 @@ int get_process_cmdline(pid_t pid, size_t max_length, bool comm_fallback, char *
+                         if (!ans)
+                                 return -ENOMEM;
+                 }
++
++                *line = TAKE_PTR(ans);
++                return 0;
+         }
+ 
+-        *line = ans;
++        k = realloc(ans, strlen(ans) + 1);
++        if (!k)
++                return -ENOMEM;
++
++        ans = NULL;
++        *line = k;
++
+         return 0;
+ }
+ 
+-- 
+2.14.3
+
