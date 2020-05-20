From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 21 May 2020 00:05:49 +0200
Subject: [Buildroot] [PATCH] package/gcc/9.3.0: fix host-gcc-final when
 ccache is used
Message-ID: <20200520220549.2343133-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As remported by several Buildroot users [1][2][3], the gcc build
fail while running selftests makefile target.

The problem only occurs when ccache is used with gcc 9 and 10,
probably due to a race condition.

While debuging with "make -p" we can notice that s-selftest-c target
contain only "cc1" as dependency instead of cc1 and SELFTEST_DEPS [4].

  s-selftest-c: cc1

While the build is failing, the s-selftest-c dependencies recipe is
still running and reported as a bug by make.

  "Dependencies recipe running (THIS IS A BUG)."

A change [5] in gcc 9 seems to introduce the problem since we can't
reproduce this problem with gcc 8.

For now add explicitely xgcc dependency to s-selftest-c and
s-selftest-c++. It not clear why SELFTEST_DEPS is lost.

[1] http://lists.busybox.net/pipermail/buildroot/2020-May/282171.html
[2] http://lists.busybox.net/pipermail/buildroot/2020-May/282766.html
[3] https://github.com/cirosantilli/linux-kernel-module-cheat/issues/108
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/c/Make-lang.in;h=bfae6fd2549c4f728816cd355fa9739dcc08fcde;hb=033eb5671769a4c681a44aad08a454e667e08502#l120
[5] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=033eb5671769a4c681a44aad08a454e667e08502

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Ben Dakin-Norris <ben.dakin-norris@navtechradar.com>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
This is probably not the definitive fix, but it's a step forward to
understand the issue.
---
 ...gcc-c-cp-add-missing-xgcc-dependency.patch | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 package/gcc/9.3.0/0004-gcc-c-cp-add-missing-xgcc-dependency.patch

diff --git a/package/gcc/9.3.0/0004-gcc-c-cp-add-missing-xgcc-dependency.patch b/package/gcc/9.3.0/0004-gcc-c-cp-add-missing-xgcc-dependency.patch
new file mode 100644
index 0000000000..1f8e3f3221
--- /dev/null
+++ b/package/gcc/9.3.0/0004-gcc-c-cp-add-missing-xgcc-dependency.patch
@@ -0,0 +1,72 @@
+From f6b8eb6604e73561ee116def993a3726cc1be201 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 20 May 2020 22:55:38 +0200
+Subject: [PATCH] gcc/{c,cp}: add missing xgcc dependency
+
+As remported by several Buildroot users [1][2][3], the gcc build
+fail while running selftests makefile target.
+
+The problem only occurs when ccache is used with gcc 9 and 10,
+probably due to a race condition.
+
+While debuging with "make -p" we can notice that s-selftest-c target
+contain only "cc1" as dependency instead of cc1 and SELFTEST_DEPS [4].
+
+  s-selftest-c: cc1
+
+While the build is failing, the s-selftest-c dependencies recipe is
+still running and reported as a bug by make.
+
+  "Dependencies recipe running (THIS IS A BUG)."
+
+A change [5] in gcc 9 seems to introduce the problem since we can't
+reproduce this problem with gcc 8.
+
+For now add explicitely xgcc dependency to s-selftest-c and
+s-selftest-c++. It not clear why SELFTEST_DEPS is lost.
+
+[1] http://lists.busybox.net/pipermail/buildroot/2020-May/282171.html
+[2] http://lists.busybox.net/pipermail/buildroot/2020-May/282766.html
+[3] https://github.com/cirosantilli/linux-kernel-module-cheat/issues/108
+[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/c/Make-lang.in;h=bfae6fd2549c4f728816cd355fa9739dcc08fcde;hb=033eb5671769a4c681a44aad08a454e667e08502#l120
+[5] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=033eb5671769a4c681a44aad08a454e667e08502
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Cc: Ben Dakin-Norris <ben.dakin-norris@navtechradar.com>
+Cc: Maxim Kochetkov <fido_max@inbox.ru>
+Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Cc: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ gcc/c/Make-lang.in  | 2 +-
+ gcc/cp/Make-lang.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/c/Make-lang.in b/gcc/c/Make-lang.in
+index 1422be6e013..9bb5794c9f3 100644
+--- a/gcc/c/Make-lang.in
++++ b/gcc/c/Make-lang.in
+@@ -116,7 +116,7 @@ c.srcman:
+ # at each stage of the build:
+ selftest-c: s-selftest-c
+ 
+-C_SELFTEST_FLAGS = -xc $(SELFTEST_FLAGS)
++C_SELFTEST_FLAGS = -xc xgcc$(exeext) $(SELFTEST_FLAGS)
+ C_SELFTEST_DEPS = cc1$(exeext) $(SELFTEST_DEPS)
+ 
+ # Run the C selftests:
+diff --git a/gcc/cp/Make-lang.in b/gcc/cp/Make-lang.in
+index 8fc1570659e..b2412544756 100644
+--- a/gcc/cp/Make-lang.in
++++ b/gcc/cp/Make-lang.in
+@@ -170,7 +170,7 @@ c++.srcman: doc/g++.1
+ # at each stage of the build:
+ selftest-c++: s-selftest-c++
+ 
+-CPP_SELFTEST_DEPS = cc1plus$(exeext) $(SELFTEST_DEPS)
++CPP_SELFTEST_DEPS = cc1plus$(exeext) xgcc$(exeext) $(SELFTEST_DEPS)
+ CPP_SELFTEST_FLAGS = -xc++ $(SELFTEST_FLAGS)
+ 
+ # Run the C++ selftests
+-- 
+2.25.4
+
-- 
2.25.4
