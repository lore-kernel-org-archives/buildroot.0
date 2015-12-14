From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 14 Dec 2015 15:00:35 +0000
Subject: [Buildroot] [PATCH 1/2] trinity: fix typo in MIPS' GET_FP_MODE and
	SET_FP_MODE macros
Message-ID: <1450105236-11224-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to fix a typo in the syscalls/prctl.c file. The
PR_GET_FP_MODE and PR_SET_FP_MODE macros are defined in
include/compat.h, but then syscalls/prctl.c tries to use GET_FP_MODE and
SET_FP_MODE. It's lacking the PR_ preffix, and this is causing build
failures like this one:

  CC	syscalls/prctl.o
syscalls/prctl.c:37:2: error: 'GET_FP_MODE' undeclared here (not in a
function)
  GET_FP_MODE, SET_FP_MODE,
  ^
syscalls/prctl.c:37:15: error: 'SET_FP_MODE' undeclared here (not
in a function)
  GET_FP_MODE, SET_FP_MODE,
               ^

This patch has been sent upstream.

Fixes:
  http://autobuild.buildroot.net/results/12f/12f3144b5d99aa1872f6073f3aaac7f8a9c5cfdc/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/trinity/0001-mips-fix-prctl-s.patch | 39 +++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/trinity/0001-mips-fix-prctl-s.patch

diff --git a/package/trinity/0001-mips-fix-prctl-s.patch b/package/trinity/0001-mips-fix-prctl-s.patch
new file mode 100644
index 0000000..aacd8d5
--- /dev/null
+++ b/package/trinity/0001-mips-fix-prctl-s.patch
@@ -0,0 +1,39 @@
+From d61dd102b95b9791e45d6bbf1e34814b8c6c1731 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Mon, 14 Dec 2015 14:46:37 +0000
+Subject: [PATCH] mips: fix prctl's
+
+It looks like a typo in the syscalls/prctl.c file. It's lacking the PR_
+preffix, and due to that is causing build failures like this one:
+
+  CC	syscalls/prctl.o
+syscalls/prctl.c:37:2: error: 'GET_FP_MODE' undeclared here (not in a
+function)
+  GET_FP_MODE, SET_FP_MODE,
+  ^
+syscalls/prctl.c:37:15: error: 'SET_FP_MODE' undeclared here (not
+in a function)
+  GET_FP_MODE, SET_FP_MODE,
+               ^
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ syscalls/prctl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/syscalls/prctl.c b/syscalls/prctl.c
+index 523f03e..5a64fb3 100644
+--- a/syscalls/prctl.c
++++ b/syscalls/prctl.c
+@@ -34,7 +34,7 @@ static int prctl_opts[] = {
+ 	PR_GET_NO_NEW_PRIVS, PR_GET_TID_ADDRESS, PR_SET_THP_DISABLE, PR_GET_THP_DISABLE,
+ 	PR_MPX_ENABLE_MANAGEMENT, PR_MPX_DISABLE_MANAGEMENT,
+ #ifdef __mips__
+-	GET_FP_MODE, SET_FP_MODE,
++	PR_GET_FP_MODE, PR_SET_FP_MODE,
+ #endif
+ 	PR_CAP_AMBIENT,
+ };
+-- 
+2.4.10
+
-- 
2.4.10
