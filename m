From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:13:51 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libssh: security
 bump to version 0.9.5
Message-ID: <20200915185431.BDC5288D1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c547c18273ce7ca7a5e8d86f1d0478507ada396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- Drop patches (already in version)
- Fix CVE-2020-16135: libssh 0.9.4 has a NULL pointer dereference in
  tftpserver.c if ssh_buffer_new returns NULL.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit df2adb2a09989a6394cc390c23f6592aabae2ac1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-libssh.h-bump-to-version-0.9.4.patch      | 29 --------------
 ...oid-returning-SSH_AGAIN-from-ssh_channel_.patch | 45 ----------------------
 package/libssh/libssh.hash                         |  4 +-
 package/libssh/libssh.mk                           |  2 +-
 4 files changed, 3 insertions(+), 77 deletions(-)

diff --git a/package/libssh/0001-libssh.h-bump-to-version-0.9.4.patch b/package/libssh/0001-libssh.h-bump-to-version-0.9.4.patch
deleted file mode 100644
index d6ec50509e..0000000000
--- a/package/libssh/0001-libssh.h-bump-to-version-0.9.4.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8d8428cbbc2c00d078cfbc967e4e6fee7ff7bf0b Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Wed, 15 Apr 2020 11:57:29 +0200
-Subject: [PATCH] libssh.h: bump to version 0.9.4
-
-In the released version of libssh the version bump was not done
-properly. Therefore the current release 0.9.4 reports 0.9.3.
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- include/libssh/libssh.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/libssh/libssh.h b/include/libssh/libssh.h
-index 79030131..e2a8d991 100644
---- a/include/libssh/libssh.h
-+++ b/include/libssh/libssh.h
-@@ -79,7 +79,7 @@
- /* libssh version */
- #define LIBSSH_VERSION_MAJOR  0
- #define LIBSSH_VERSION_MINOR  9
--#define LIBSSH_VERSION_MICRO  3
-+#define LIBSSH_VERSION_MICRO  4
- 
- #define LIBSSH_VERSION_INT SSH_VERSION_INT(LIBSSH_VERSION_MAJOR, \
-                                            LIBSSH_VERSION_MINOR, \
--- 
-2.20.1
-
diff --git a/package/libssh/0002-channels-Avoid-returning-SSH_AGAIN-from-ssh_channel_.patch b/package/libssh/0002-channels-Avoid-returning-SSH_AGAIN-from-ssh_channel_.patch
deleted file mode 100644
index 9cc9389479..0000000000
--- a/package/libssh/0002-channels-Avoid-returning-SSH_AGAIN-from-ssh_channel_.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 6417f5a3cac8537ac6f6ff7fc1642dfaa0917fb4 Mon Sep 17 00:00:00 2001
-From: Jakub Jelen <jjelen@redhat.com>
-Date: Thu, 16 Apr 2020 11:13:34 +0200
-Subject: [PATCH] channels: Avoid returning SSH_AGAIN from
- ssh_channel_poll_timeout()
-
-This addresses a regression introduced in 3bad0607, partially fixed in 022409e9,
-but the function was still able to return SSH_AGAIN, which was not expected by
-callers.
-
-Based on discussion in [1] and [2]
-
-[1] https://gitlab.com/libssh/libssh-mirror/-/merge_requests/101
-[2] https://www.libssh.org/archive/libssh/2020-03/0000029.html
-
-Signed-off-by: Jakub Jelen <jjelen@redhat.com>
-Reviewed-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
-
-[Backport from upstream commit:
-6417f5a3cac8537ac6f6ff7fc1642dfaa0917fb4]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- src/channels.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/channels.c b/src/channels.c
-index bcc1c207..9fe309d0 100644
---- a/src/channels.c
-+++ b/src/channels.c
-@@ -3116,6 +3116,12 @@ int ssh_channel_poll_timeout(ssh_channel channel, int timeout, int is_stderr)
-         session->session_state == SSH_SESSION_STATE_ERROR) {
-         rc = SSH_ERROR;
-         goto out;
-+    } else if (rc == SSH_AGAIN) {
-+        /* If the above timeout expired, it is ok and we do not need to
-+         * attempt to check the read buffer. The calling functions do not
-+         * expect us to return SSH_AGAIN either here. */
-+        rc = SSH_OK;
-+        goto out;
-     }
-     len = ssh_buffer_get_len(stdbuf);
-     if (len > 0) {
--- 
-2.20.1
-
diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 62b860300a..bc6fa3f1f8 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.9/libssh-0.9.3.tar.xz.asc
+# https://www.libssh.org/files/0.9/libssh-0.9.5.tar.xz.asc
 # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
-sha256  150897a569852ac05aac831dc417a7ba8e610c86ca2e0154a99c6ade2486226b  libssh-0.9.4.tar.xz
+sha256  acffef2da98e761fc1fd9c4fddde0f3af60ab44c4f5af05cd1b2d60a3fa08718  libssh-0.9.5.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index abc9aec9a3..67e3ad9f91 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.9
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).4
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).5
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
