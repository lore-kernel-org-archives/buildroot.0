From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 16 Sep 2019 22:58:14 -0500
Subject: [Buildroot] [PATCH v2 1/2] package/fakeroot: test for SYSV IPC
 support
Message-ID: <20190917035815.1750-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes
v1 -> v2
(Orig http://patchwork.ozlabs.org/patch/1130987/)
[Yann
 - Cleaned up commit log to be clear of the intent of this patch.  TCP
   IPC has other use cases but those don't apply to this fix and don't
   need to be included.
 - Verified concurrent use of TCP IPC are using ephemeral ports
 - Respining the orig patchset including runtime determination of
   enabling support instead of making it default.
---
 ...003-Select-TCP-when-lack-of-SYSV-IPC.patch | 77 +++++++++++++++++++
 package/fakeroot/fakeroot.mk                  | 18 ++++-
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 package/fakeroot/0003-Select-TCP-when-lack-of-SYSV-IPC.patch

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
index 4aa27a1b0c..2c1e4ea1c5 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -8,7 +8,7 @@ FAKEROOT_VERSION = 1.20.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
 FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/main/f/fakeroot
 
-HOST_FAKEROOT_DEPENDENCIES = host-acl
+HOST_FAKEROOT_DEPENDENCIES = host-acl host-automake host-autoconf host-libtool
 # Force capabilities detection off
 # For now these are process capabilities (faked) rather than file
 # so they're of no real use
@@ -16,6 +16,22 @@ HOST_FAKEROOT_CONF_ENV = \
 	ac_cv_header_sys_capability_h=no \
 	ac_cv_func_capset=no
 
+# We apply a patch to detect the availability of SysV IPC Message Q's via
+# autoconf since some hosts may not have that feature implemented, and
+# fakeroot defaults to that unless explicitely told otherwise.
+# This means we need to run autoreconf after patching.
+# The source tree seems to have a custom bootstrap script to do this however
+# and it does some non-standard things, so the built-in _AUTORECONF hook does
+# not work out of the box.
+# Instead, we replicate the useful bits here, and then run the autoreconf hook
+# explicitely.
+define HOST_FAKEROOT_BOOTSTRAP
+	test -d $(@D)/build-aux || mkdir $(@D)/build-aux
+	test -f $(@D)/ltmain.sh || (cd $(@D) && exec $(LIBTOOLIZE) --install --force)
+	$(AUTORECONF_HOOK)
+endef
+HOST_FAKEROOT_PRE_CONFIGURE_HOOKS += HOST_FAKEROOT_BOOTSTRAP
+
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
 
-- 
2.17.1
