From: James Byrne <james.byrne@origamienergy.com>
Date: Wed, 20 Nov 2019 15:55:28 +0000
Subject: [Buildroot] [PATCH 1/1] package/ntp: remove host shell check
Message-ID: <0102016e898693a5-82db32f2-a59d-42c1-996b-97661b367c25-000000@eu-west-1.amazonses.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a patch which removes the autoconf check for which shell is
installed on the host and fixes the shell as '/bin/sh'. Since we are
cross-compiling, we cannot assume that the target uses the same shell.
Also, it can prevent builds being reproducible because a different host
environment will result in a different target binary.

Signed-off-by: James Byrne <james.byrne@origamienergy.com>
---
 package/ntp/0003-force-sh.patch | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/ntp/0003-force-sh.patch

diff --git a/package/ntp/0003-force-sh.patch b/package/ntp/0003-force-sh.patch
new file mode 100644
index 0000000000..4c2628e04a
--- /dev/null
+++ b/package/ntp/0003-force-sh.patch
@@ -0,0 +1,30 @@
+We're cross compiling, don't use the presence of shells on the host to decide
+anything about the target...
+
+diff --git a/sntp/libopts/m4/libopts.m4 b/sntp/libopts/m4/libopts.m4
+--- a/sntp/libopts/m4/libopts.m4
++++ b/sntp/libopts/m4/libopts.m4
+@@ -112,22 +112,7 @@
+   AC_CHECK_FUNCS([mmap canonicalize_file_name snprintf strdup strchr \
+                  strrchr strsignal fchmod fstat chmod])
+   AC_PROG_SED
+-  [while :
+-  do
+-      POSIX_SHELL=`which bash`
+-      test -x "$POSIX_SHELL" && break
+-      POSIX_SHELL=`which dash`
+-      test -x "$POSIX_SHELL" && break
+-      POSIX_SHELL=/usr/xpg4/bin/sh
+-      test -x "$POSIX_SHELL" && break
+-      POSIX_SHELL=`/bin/sh -c '
+-          exec 2>/dev/null
+-          if ! true ; then exit 1 ; fi
+-          echo /bin/sh'`
+-      test -x "$POSIX_SHELL" && break
+-      ]AC_MSG_ERROR([cannot locate a working POSIX shell])[
+-  done]
+-  AC_DEFINE_UNQUOTED([POSIX_SHELL], ["${POSIX_SHELL}"],
++  AC_DEFINE_UNQUOTED([POSIX_SHELL], ["/bin/sh"],
+            [define to a working POSIX compliant shell])
+   AC_SUBST([POSIX_SHELL])
+ ])
-- 
2.24.0
