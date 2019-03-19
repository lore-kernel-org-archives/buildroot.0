From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 21:30:58 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/vsftpd: add patch
 to fix hang
Message-ID: <20190319202829.39E0381E4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e37abb31199c89649e09978262aac468a845f60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

This fixes a hang due to SIGCHLD not being handled correctly by
vsftpd. The patch comes from fedora and didn't make its way to
upstream yet.

More information about the bug can be found in:
 - https://bugzilla.redhat.com/show_bug.cgi?id=1198259

Signed-off-by: Abdelmalek Benelouezzane <abdelmalek.benelouezzane@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 498dff7ea1ef7d975f09fd3d7f1cce8d40b47a8b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-Prevent-hang-in-SIGCHLD-handler.patch     | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/package/vsftpd/0004-Prevent-hang-in-SIGCHLD-handler.patch b/package/vsftpd/0004-Prevent-hang-in-SIGCHLD-handler.patch
new file mode 100644
index 0000000000..0732c5f632
--- /dev/null
+++ b/package/vsftpd/0004-Prevent-hang-in-SIGCHLD-handler.patch
@@ -0,0 +1,87 @@
+From 1e65a0a15f819b8bf1b551bd84f71d0da1f5a00c Mon Sep 17 00:00:00 2001
+From: Martin Sehnoutka <msehnout@redhat.com>
+Date: Thu, 17 Nov 2016 13:02:27 +0100
+Subject: [PATCH] Prevent hanging in SIGCHLD handler.
+
+vsftpd can now handle pam_exec.so in pam.d config without hanging
+in SIGCHLD handler.
+
+[Abdelmalek:
+Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1198259
+Fetched from:
+https://src.fedoraproject.org/cgit/rpms/vsftpd.git/plain/0026-Prevent-hanging-in-SIGCHLD-handler.patch]
+Signed-off-by: Abdelmalek Benelouezzane <abdelmalek.benelouezzane@savoirfairelinux.com>
+---
+ sysutil.c    |  4 ++--
+ sysutil.h    |  2 +-
+ twoprocess.c | 13 +++++++++++--
+ 3 files changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/sysutil.c b/sysutil.c
+index 6d7cb3f..099748f 100644
+--- a/sysutil.c
++++ b/sysutil.c
+@@ -608,13 +608,13 @@ vsf_sysutil_exit(int exit_code)
+ }
+ 
+ struct vsf_sysutil_wait_retval
+-vsf_sysutil_wait(void)
++vsf_sysutil_wait(int hang)
+ {
+   struct vsf_sysutil_wait_retval retval;
+   vsf_sysutil_memclr(&retval, sizeof(retval));
+   while (1)
+   {
+-    int sys_ret = wait(&retval.exit_status);
++    int sys_ret = waitpid(-1, &retval.exit_status, hang ? 0 : WNOHANG);
+     if (sys_ret < 0 && errno == EINTR)
+     {
+       vsf_sysutil_check_pending_actions(kVSFSysUtilUnknown, 0, 0);
+diff --git a/sysutil.h b/sysutil.h
+index c145bdf..13153cd 100644
+--- a/sysutil.h
++++ b/sysutil.h
+@@ -177,7 +177,7 @@ struct vsf_sysutil_wait_retval
+   int PRIVATE_HANDS_OFF_syscall_retval;
+   int PRIVATE_HANDS_OFF_exit_status;
+ };
+-struct vsf_sysutil_wait_retval vsf_sysutil_wait(void);
++struct vsf_sysutil_wait_retval vsf_sysutil_wait(int hang);
+ int vsf_sysutil_wait_reap_one(void);
+ int vsf_sysutil_wait_get_retval(
+   const struct vsf_sysutil_wait_retval* p_waitret);
+diff --git a/twoprocess.c b/twoprocess.c
+index 33d84dc..b1891e7 100644
+--- a/twoprocess.c
++++ b/twoprocess.c
+@@ -47,8 +47,17 @@ static void
+ handle_sigchld(void* duff)
+ {
+ 
+-  struct vsf_sysutil_wait_retval wait_retval = vsf_sysutil_wait();
++  struct vsf_sysutil_wait_retval wait_retval = vsf_sysutil_wait(0);
+   (void) duff;
++  if (!vsf_sysutil_wait_get_exitcode(&wait_retval) &&
++      !vsf_sysutil_wait_get_retval(&wait_retval))
++    /* There was nobody to wait for, possibly caused by underlying library
++     * which created a new process through fork()/vfork() and already picked
++     * it up, e.g. by pam_exec.so or integrity check routines for libraries
++     * when FIPS mode is on (nss freebl), which can lead to calling prelink
++     * if the prelink package is installed.
++     */
++    return;
+   /* Child died, so we'll do the same! Report it as an error unless the child
+    * exited normally with zero exit code
+    */
+@@ -390,7 +399,7 @@ common_do_login(struct vsf_session* p_sess, const struct mystr* p_user_str,
+   priv_sock_send_result(p_sess->parent_fd, PRIV_SOCK_RESULT_OK);
+   if (!p_sess->control_use_ssl)
+   {
+-    (void) vsf_sysutil_wait();
++    (void) vsf_sysutil_wait(1);
+   }
+   else
+   {
+-- 
+2.14.4
+
