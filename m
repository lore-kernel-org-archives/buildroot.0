From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 15 Sep 2012 20:27:53 -0400
Subject: [Buildroot] [PATCH] openssh: add linux-pam support [v2]
Message-ID: <1347755273-32240-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 .../openssh-fix-pam-uclibc-pthreads-clash.patch    |   44 ++++++++++++++++++++
 package/openssh/openssh.mk                         |    5 +++
 2 files changed, 49 insertions(+)
 create mode 100644 package/openssh/openssh-fix-pam-uclibc-pthreads-clash.patch

diff --git a/package/openssh/openssh-fix-pam-uclibc-pthreads-clash.patch b/package/openssh/openssh-fix-pam-uclibc-pthreads-clash.patch
new file mode 100644
index 0000000..bfe99e7
--- /dev/null
+++ b/package/openssh/openssh-fix-pam-uclibc-pthreads-clash.patch
@@ -0,0 +1,44 @@
+When PAM is enabled, openssh makes its own static versions of pthreads
+functions.  But when built with a uclibc toolchain, pthreads.h gets
+indirectly included.  The clashing exported and static definitions of
+the pthreads functions then cause a compile error.  This patch fixes
+the problem by changing the static pthread function names with macros
+when the static functions are defined.
+
+Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com> 
+
+diff -urN openssh-6.1p1.orig/auth-pam.c openssh-6.1p1/auth-pam.c
+--- openssh-6.1p1.orig/auth-pam.c	2009-07-12 08:07:21.000000000 -0400
++++ openssh-6.1p1/auth-pam.c	2012-09-15 19:49:47.677288199 -0400
+@@ -166,6 +166,7 @@
+ 		sigdie("PAM: authentication thread exited uncleanly");
+ }
+ 
++#define pthread_exit pthread_exit_AVOID_UCLIBC_PTHREAD_CLASH
+ /* ARGSUSED */
+ static void
+ pthread_exit(void *value)
+@@ -173,6 +174,7 @@
+ 	_exit(0);
+ }
+ 
++#define pthread_create pthread_create_AVOID_UCLIBC_PTHREAD_CLASH
+ /* ARGSUSED */
+ static int
+ pthread_create(sp_pthread_t *thread, const void *attr,
+@@ -200,6 +202,7 @@
+ 	}
+ }
+ 
++#define pthread_cancel pthread_cancel_AVOID_UCLIBC_PTHREAD_CLASH
+ static int
+ pthread_cancel(sp_pthread_t thread)
+ {
+@@ -207,6 +210,7 @@
+ 	return (kill(thread, SIGTERM));
+ }
+ 
++#define pthread_join pthread_join_AVOID_UCLIBC_PTHREAD_CLASH
+ /* ARGSUSED */
+ static int
+ pthread_join(sp_pthread_t thread, void **value)
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 81a28a1..03ea73d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -12,6 +12,11 @@ OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
 
 OPENSSH_DEPENDENCIES = zlib openssl
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+OPENSSH_DEPENDENCIES += linux-pam
+OPENSSH_CONF_OPT += --with-pam
+endif
+
 define OPENSSH_INSTALL_INITSCRIPT
 	$(INSTALL) -D -m 755 package/openssh/S50sshd $(TARGET_DIR)/etc/init.d/S50sshd
 endef
-- 
1.7.9.5
