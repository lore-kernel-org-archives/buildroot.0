From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 17:26:01 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] openssh: bump to version
 7.9p1
Message-ID: <20190124162608.942788E1F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44b86a7e1a3e5b877016b23f0a37a5d4295de878
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Drop patch #1. uClibc no longer includes pthreads.h indirectly.

Drop patch #2. The sys/param.h header is included indirectly through the
local includes.h header since version 6.8p1.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 458ad4d7b6f542b3734088b5f5b0c96dce119851)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-pam-uclibc-pthreads-clash.patch       | 44 -------------------
 package/openssh/0002-fix-howmany-include.patch     | 49 ----------------------
 package/openssh/openssh.hash                       |  4 +-
 package/openssh/openssh.mk                         |  2 +-
 4 files changed, 3 insertions(+), 96 deletions(-)

diff --git a/package/openssh/0001-fix-pam-uclibc-pthreads-clash.patch b/package/openssh/0001-fix-pam-uclibc-pthreads-clash.patch
deleted file mode 100644
index d9bc6e5d0c..0000000000
--- a/package/openssh/0001-fix-pam-uclibc-pthreads-clash.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-When PAM is enabled, openssh makes its own static versions of pthreads
-functions.  But when built with a uclibc toolchain, pthreads.h gets
-indirectly included.  The clashing exported and static definitions of
-the pthreads functions then cause a compile error.  This patch fixes
-the problem by changing the static pthread function names with macros
-when the static functions are defined.
-
-Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
-
-diff -urN openssh-6.1p1.orig/auth-pam.c openssh-6.1p1/auth-pam.c
---- openssh-6.1p1.orig/auth-pam.c	2009-07-12 08:07:21.000000000 -0400
-+++ openssh-6.1p1/auth-pam.c	2012-09-15 19:49:47.677288199 -0400
-@@ -166,6 +166,7 @@
- 		sigdie("PAM: authentication thread exited uncleanly");
- }
- 
-+#define pthread_exit pthread_exit_AVOID_UCLIBC_PTHREAD_CLASH
- /* ARGSUSED */
- static void
- pthread_exit(void *value)
-@@ -173,6 +174,7 @@
- 	_exit(0);
- }
- 
-+#define pthread_create pthread_create_AVOID_UCLIBC_PTHREAD_CLASH
- /* ARGSUSED */
- static int
- pthread_create(sp_pthread_t *thread, const void *attr,
-@@ -200,6 +202,7 @@
- 	}
- }
- 
-+#define pthread_cancel pthread_cancel_AVOID_UCLIBC_PTHREAD_CLASH
- static int
- pthread_cancel(sp_pthread_t thread)
- {
-@@ -207,6 +210,7 @@
- 	return (kill(thread, SIGTERM));
- }
- 
-+#define pthread_join pthread_join_AVOID_UCLIBC_PTHREAD_CLASH
- /* ARGSUSED */
- static int
- pthread_join(sp_pthread_t thread, void **value)
diff --git a/package/openssh/0002-fix-howmany-include.patch b/package/openssh/0002-fix-howmany-include.patch
deleted file mode 100644
index 7a2a8e3202..0000000000
--- a/package/openssh/0002-fix-howmany-include.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Update patch from 2fea21799223d41605556858a95b55e69e9960ca to openssh
-version 6.8p1
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura openssh-6.8p1.orig/openbsd-compat/bsd-poll.c openssh-6.8p1/openbsd-compat/bsd-poll.c
---- openssh-6.8p1.orig/openbsd-compat/bsd-poll.c	2015-03-18 07:11:46.184620677 -0300
-+++ openssh-6.8p1/openbsd-compat/bsd-poll.c	2015-03-18 07:12:29.120094555 -0300
-@@ -19,6 +19,7 @@
- #include "includes.h"
- #if !defined(HAVE_POLL)
- 
-+#include <sys/param.h>
- #include <sys/types.h>
- #include <sys/time.h>
- #ifdef HAVE_SYS_SELECT_H
-diff -Nura openssh-6.8p1.orig/sshd.c openssh-6.8p1/sshd.c
---- openssh-6.8p1.orig/sshd.c	2015-03-18 07:11:46.187620780 -0300
-+++ openssh-6.8p1/sshd.c	2015-03-18 07:13:11.889562735 -0300
-@@ -44,6 +44,7 @@
- 
- #include "includes.h"
- 
-+#include <sys/param.h>
- #include <sys/types.h>
- #include <sys/ioctl.h>
- #include <sys/socket.h>
-diff -Nura openssh-6.8p1.orig/ssh-keyscan.c openssh-6.8p1/ssh-keyscan.c
---- openssh-6.8p1.orig/ssh-keyscan.c	2015-03-18 07:11:46.180620539 -0300
-+++ openssh-6.8p1/ssh-keyscan.c	2015-03-18 07:13:32.092256248 -0300
-@@ -9,6 +9,7 @@
- 
- #include "includes.h"
-  
-+#include <sys/param.h>
- #include <sys/types.h>
- #include "openbsd-compat/sys-queue.h"
- #include <sys/resource.h>
-diff -Nura openssh-6.8p1.orig/ssh-pkcs11-helper.c openssh-6.8p1/ssh-pkcs11-helper.c
---- openssh-6.8p1.orig/ssh-pkcs11-helper.c	2015-03-18 07:11:46.182620608 -0300
-+++ openssh-6.8p1/ssh-pkcs11-helper.c	2015-03-18 07:13:43.620651993 -0300
-@@ -17,6 +17,7 @@
- 
- #include "includes.h"
- 
-+#include <sys/param.h>
- #include <sys/types.h>
- #ifdef HAVE_SYS_TIME_H
- # include <sys/time.h>
diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 0b31f70ecc..26b143c059 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From http://www.openssh.com/txt/release-7.8 (base64 encoded)
-sha256 1a484bb15152c183bb2514e112aa30dd34138c3cfb032eee5490a66c507144ca  openssh-7.8p1.tar.gz
+# From http://www.openssh.com/txt/release-7.9 (base64 encoded)
+sha256 6b4b3ba2253d84ed3771c8050728d597c91cfce898713beb7b64a305b6f11aad  openssh-7.9p1.tar.gz
 # Locally calculated
 sha256 05a4c25ef464e19656c5259bd4f4da8428efab01044f3541b79fbb3ff209350f  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 45a11ee65e..07f3e0d663 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 7.8p1
+OPENSSH_VERSION = 7.9p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
