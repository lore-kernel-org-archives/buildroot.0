From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 Mar 2013 15:02:58 +0100
Subject: [Buildroot] [PATCH 1/3] icu: workaround toolchain bugs
In-Reply-To: <1362837781-27071-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362837781-27071-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362837781-27071-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many of ARM Sourcery CodeBench toolchain have a bug when compiling
icu's translit.cpp source file. The bug is trigerred when there is a
combination of "-W -Wall" and "-Os", and causes an internal compiler
error. The bug has been reported to Mentor Graphics.

Even though it is clearly a toolchain bug, having a workaround for it
is trivial in this case. So it will avoid our users falling into this
internal compiler error, and allow our autobuilders to test more
packages using this Sourcery CodeBench toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/icu/icu-workaround-toolchain-bugs.patch |   36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/icu/icu-workaround-toolchain-bugs.patch

diff --git a/package/icu/icu-workaround-toolchain-bugs.patch b/package/icu/icu-workaround-toolchain-bugs.patch
new file mode 100644
index 0000000..df9d528
--- /dev/null
+++ b/package/icu/icu-workaround-toolchain-bugs.patch
@@ -0,0 +1,36 @@
+Workaround toolchain bugs
+
+Many of ARM Sourcery CodeBench toolchain have a bug when compiling
+icu's translit.cpp source file. The bug is trigerred when there is a
+combination of "-W -Wall" and "-Os", and causes an internal compiler
+error. The bug has been reported to Mentor Graphics.
+
+Even though it is clearly a toolchain bug, having a workaround for it
+is trivial in this case. So it will avoid our users falling into this
+internal compiler error, and allow our autobuilders to test more
+packages using this Sourcery CodeBench toolchain.qq
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/source/configure
+===================================================================
+--- a/source/configure
++++ b/source/configure
+@@ -4320,7 +4320,7 @@
+                 echo "# Note: We are not using '-ansi' with HP/UX GCC because int64_t broke, see <http://bugs.icu-project.org/trac/ticket/8493>"
+                 CFLAGS="$CFLAGS -Wall -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings -Wno-long-long";;
+             *)
+-                CFLAGS="$CFLAGS -Wall -ansi -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings -Wno-long-long";;
++                CFLAGS="$CFLAGS -ansi -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings -Wno-long-long";;
+             esac
+         else
+             case "${host}" in
+@@ -4333,7 +4333,7 @@
+         fi
+         if test "$GXX" = yes
+         then
+-            CXXFLAGS="$CXXFLAGS -W -Wall -ansi -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long"
++            CXXFLAGS="$CXXFLAGS -ansi -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long"
+             case "${host}" in
+             *-*-solaris*)
+                 CXXFLAGS="$CXXFLAGS -D__STDC__=0";;
-- 
1.7.9.5
