From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:09:01 +0200
Subject: [Buildroot] [git commit] package/fakeroot: test for SYSV IPC support
Message-ID: <20190921130620.5F5B48ED6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd1bcce9894773d7e1c1ca5be0f04b0b32128a1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fakeroot can be built to either use SYSV IPC or TCP for message passing.

A bug was discovered where Microsoft Windows 10 Services for Linux
doesn't include support for SYSV IPC MsgQ.  This patch adds support to
detect this case and automatically build fakeroot to use the TCP
transport instead (It is assumed a TCP transport would definitely have
more overhead then MsgQs so the default wasn't changed to TCP).

Fixes
https://bugs.busybox.net/show_bug.cgi?id=11366

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Jean-Francois Doyon <jfdoyon@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Arnout: use a post-patch hook and AUTORECONF=YES]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0003-Select-TCP-when-lack-of-SYSV-IPC.patch    | 77 ++++++++++++++++++++++
 package/fakeroot/fakeroot.mk                       |  8 ++-
 2 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/package/fakeroot/0003-Select-TCP-when-lack-of-SYSV-IPC.patch b/package/fakeroot/0003-Select-TCP-when-lack-of-SYSV-IPC.patch
new file mode 100644
index 0000000000..07b206b68e
--- /dev/null
+++ b/package/fakeroot/0003-Select-TCP-when-lack-of-SYSV-IPC.patch
@@ -0,0 +1,77 @@
+From 8e9a7a8c72a9fe407d296ec0ffeb56b2cd271959 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Mon, 16 Sep 2019 22:00:29 -0500
+Subject: [PATCH] Select TCP when lack of SYSV IPC
+
+Update to add a configure test to build and install the TCP IPC version
+when detecting SYSV IPC MsgQ support isn't available.
+
+The issue was initially discovered on Windows Services for Linux
+(WSL1.0). WSL does have some SysV IPC, but no message Q's, which is
+required by fakeroot/faked by default.
+
+Fixes:
+https://github.com/Microsoft/WSL/issues/2465
+
+Additional bug reports:
+https://bugs.busybox.net/show_bug.cgi?id=11366
+
+Upstream:
+https://salsa.debian.org/clint/fakeroot/merge_requests/2
+
+Signed-off-by: Jean-Francois Doyon <jfdoyon@gmail.com>
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ configure.ac | 36 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 36 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index a9189e6..1650f77 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -25,6 +25,42 @@ AC_CACHE_CHECK([which IPC method to use],
+ 	       [ac_cv_use_ipc],
+ 	       [ac_cv_use_ipc=sysv])
+ 
++if test $ac_cv_use_ipc = "sysv"; then
++  AC_MSG_CHECKING([whether SysV IPC message queues are actually working on the host])
++
++  AC_LANG_PUSH(C)
++  AC_TRY_RUN([
++#include <stdlib.h>
++#include <sys/types.h>
++#include <sys/ipc.h>
++#include <sys/msg.h>
++#include <time.h>
++#include <unistd.h>
++
++int main() {
++
++  srandom(time(NULL)+getpid()*33151);
++  key_t msg_key = random();
++  int msg_get = msgget(msg_key, IPC_CREAT|0600);
++
++  if (msg_get==-1) {
++    return 1;
++  } else {
++    msgctl(msg_get, IPC_RMID, NULL);
++    return 0;
++  }
++
++}], [ac_cv_use_ipc=sysv], [ac_cv_use_ipc=tcp])
++
++  if test $ac_cv_use_ipc = "tcp"; then
++    AC_MSG_RESULT([No, using TCP])
++  else
++    AC_MSG_RESULT([Yes])
++  fi
++
++  AC_LANG_POP(C)
++fi
++
+ AC_ARG_WITH([dbformat],
+ 	    AS_HELP_STRING([--with-dbformat@<:@=DBFORMAT@:>@],
+ 			   [database format to use: either inode (default) or path]),
+-- 
+2.17.1
+
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 4aa27a1b0c..1be99071bf 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -15,8 +15,14 @@ HOST_FAKEROOT_DEPENDENCIES = host-acl
 HOST_FAKEROOT_CONF_ENV = \
 	ac_cv_header_sys_capability_h=no \
 	ac_cv_func_capset=no
-
+# 0003-Select-TCP-when-lack-of-SYSV-IPC.patch touches configure.ac
+HOST_FAKEROOT_AUTORECONF = YES
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
 
+define HOST_FAKEROOT_BUILD_AUX
+	mkdir -p $(@D)/build-aux
+endef
+HOST_FAKEROOT_POST_PATCH_HOOKS += HOST_FAKEROOT_BUILD_AUX
+
 $(eval $(host-autotools-package))
