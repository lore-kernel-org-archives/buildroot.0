From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 07:03:34 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libssh: add patch
 to fix regression
Message-ID: <20200506051931.5845F825FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d177afefce7b655f7a240c7c85cbccddab6d0df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The libssh server is used by libnetconf2. With libssh version 0.9.4 a
regression was introduced that wrongly leads to session closed after the
poll timeout.

The patch comes from upstrem:
https://git.libssh.org/projects/libssh.git/commit/?id=6417f5a3cac8537ac6f6ff7fc1642dfaa0917fb4

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 39099153d9404cd6f107f0fd92ce8686bbd1beb2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...oid-returning-SSH_AGAIN-from-ssh_channel_.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/libssh/0002-channels-Avoid-returning-SSH_AGAIN-from-ssh_channel_.patch b/package/libssh/0002-channels-Avoid-returning-SSH_AGAIN-from-ssh_channel_.patch
new file mode 100644
index 0000000000..9cc9389479
--- /dev/null
+++ b/package/libssh/0002-channels-Avoid-returning-SSH_AGAIN-from-ssh_channel_.patch
@@ -0,0 +1,45 @@
+From 6417f5a3cac8537ac6f6ff7fc1642dfaa0917fb4 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 16 Apr 2020 11:13:34 +0200
+Subject: [PATCH] channels: Avoid returning SSH_AGAIN from
+ ssh_channel_poll_timeout()
+
+This addresses a regression introduced in 3bad0607, partially fixed in 022409e9,
+but the function was still able to return SSH_AGAIN, which was not expected by
+callers.
+
+Based on discussion in [1] and [2]
+
+[1] https://gitlab.com/libssh/libssh-mirror/-/merge_requests/101
+[2] https://www.libssh.org/archive/libssh/2020-03/0000029.html
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
+
+[Backport from upstream commit:
+6417f5a3cac8537ac6f6ff7fc1642dfaa0917fb4]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ src/channels.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/channels.c b/src/channels.c
+index bcc1c207..9fe309d0 100644
+--- a/src/channels.c
++++ b/src/channels.c
+@@ -3116,6 +3116,12 @@ int ssh_channel_poll_timeout(ssh_channel channel, int timeout, int is_stderr)
+         session->session_state == SSH_SESSION_STATE_ERROR) {
+         rc = SSH_ERROR;
+         goto out;
++    } else if (rc == SSH_AGAIN) {
++        /* If the above timeout expired, it is ok and we do not need to
++         * attempt to check the read buffer. The calling functions do not
++         * expect us to return SSH_AGAIN either here. */
++        rc = SSH_OK;
++        goto out;
+     }
+     len = ssh_buffer_get_len(stdbuf);
+     if (len > 0) {
+-- 
+2.20.1
+
