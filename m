From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 10:09:05 +0100
Subject: [Buildroot] [git commit] package/systemd: fix update-done service
 for read-only filesystem
Message-ID: <20201111090020.A9C9B815F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d5076fdbab105c1efd41b8f88291a1215ebbe60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport an upstream patch to fix a regresion introduced in
246.5 by [1].

[1] https://github.com/systemd/systemd-stable/commit/8019995e9af9c6d7b5985198cedccd24eda3e26e

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981805

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...one-Do-not-fail-with-read-only-etc-or-var.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/systemd/0001-update-done-Do-not-fail-with-read-only-etc-or-var.patch b/package/systemd/0001-update-done-Do-not-fail-with-read-only-etc-or-var.patch
new file mode 100644
index 0000000000..01e7f1e906
--- /dev/null
+++ b/package/systemd/0001-update-done-Do-not-fail-with-read-only-etc-or-var.patch
@@ -0,0 +1,34 @@
+From e2a23672a1bbf4d3411dce0289051b5a72bd4a67 Mon Sep 17 00:00:00 2001
+From: Felix Riemann <felix.riemann@sma.de>
+Date: Mon, 19 Oct 2020 18:54:53 +0200
+Subject: [PATCH] update-done: Do not fail with read-only /etc or /var
+
+With the switch from log_debug() to log_debug_errno() in commit c413bb28df
+systemd-update-done would fail without any error message if /etc
+or /var were read-only. This restores the previous behaviour to
+silently ignore these directories again.
+
+[Romain: backport from 1eee15c3885fcc9f6a40df7e42347cb8fca71280]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/update-done/update-done.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/update-done/update-done.c b/src/update-done/update-done.c
+index e9d589e0e5..92c348d83b 100644
+--- a/src/update-done/update-done.c
++++ b/src/update-done/update-done.c
+@@ -31,8 +31,8 @@ static int apply_timestamp(const char *path, struct timespec *ts) {
+ 
+         r = write_string_file_atomic_label_ts(path, message, ts);
+         if (r == -EROFS)
+-                return log_debug_errno(r, "Cannot create \"%s\", file system is read-only.", path);
+-        if (r < 0)
++                log_debug_errno(r, "Cannot create \"%s\", file system is read-only.", path);
++        else if (r < 0)
+                 return log_error_errno(r, "Failed to write \"%s\": %m", path);
+         return 0;
+ }
+-- 
+2.25.4
+
