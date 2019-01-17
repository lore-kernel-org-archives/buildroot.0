From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 17 Jan 2019 20:36:30 +0100
Subject: [Buildroot] [PATCH v1] apr: fix runtime tests for cross compile
Message-ID: <20190117193630.18533-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - epoll supported since linux-2.5.44/glibc-2.3.2 (see [1])
 - dup3 supported since linux-2.6.27/glibc-2.9 (see [2])
 - SOCK_CLOEXEC supported on linux (see [3])
 - accept4 suppported since linux-2.6.28/glibc-2.10 (see [4])

Fixes [5] apache runtime failure:

  [mpm_event:crit] [pid 173:tid 1996214272] (70023)This function has not been
      implemented on this platform: AH00495: Couldn't create a Thread Safe Pollset.
      Is it supported on your platform?Also check system or user limits!
  [:emerg] [pid 173:tid 1996214272] AH00017: Pre-configuration failed, exiting

[1] http://man7.org/linux/man-pages/man7/epoll.7.html
[2] https://linux.die.net/man/2/dup3
[4] https://linux.die.net/man/2/accept4
[5] https://bugs.busybox.net/show_bug.cgi?id=11576

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Note:
  - one more option checked via AC_TRY_RUN
	ac_cv_func_sem_open
---
 package/apr/apr.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 58b1d86b28..8f29e57c59 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -26,7 +26,12 @@ APR_CONF_ENV = \
 	ac_cv_sizeof_pid_t=4 \
 	ac_cv_struct_rlimit=yes \
 	ac_cv_o_nonblock_inherited=no \
-	apr_cv_mutex_recursive=yes
+	apr_cv_mutex_recursive=yes \
+	apr_cv_epoll=yes \
+	apr_cv_epoll_create1=yes \
+	apr_cv_dup3=yes \
+	apr_cv_sock_cloexec=yes \
+	apr_cv_accept4=yes
 APR_CONFIG_SCRIPTS = apr-1-config
 
 # Doesn't even try to guess when cross compiling
-- 
2.20.1
