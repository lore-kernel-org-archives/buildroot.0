From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:07:41 +0100
Subject: [Buildroot] [git commit] package/gdb: fix build with glibc 2.20 (2)
Message-ID: <20150320132231.BB315818AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d2738289df16c487bf0352a0a69067c8f61bb10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a second patch from gdb 7.8 for aarch64.

Fixes:
http://autobuild.buildroot.net/results/2fc/2fcf1a40a08baf881fdbccd070b1a1a6c89127e1/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Steven Noonan <steven@uplinklabs.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...clude-asm-ptrace.h-in-aarch64-linux-nat.c.patch |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/gdb/7.7.1/0002-Include-asm-ptrace.h-in-aarch64-linux-nat.c.patch b/package/gdb/7.7.1/0002-Include-asm-ptrace.h-in-aarch64-linux-nat.c.patch
new file mode 100644
index 0000000..ccca8cb
--- /dev/null
+++ b/package/gdb/7.7.1/0002-Include-asm-ptrace.h-in-aarch64-linux-nat.c.patch
@@ -0,0 +1,37 @@
+From 9c45794265a9dc9aebfbdc520d378dfc8fb7b694 Mon Sep 17 00:00:00 2001
+From: Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>
+Date: Thu, 22 May 2014 16:07:20 +0100
+Subject: [PATCH] Include asm/ptrace.h in aarch64-linux-nat.c
+
+A recent change to glibc removed asm/ptrace.h from user.h for
+AArch64. This meant that cross-native builds of gdb using trunk
+glibc broke because aarch64-linux-nat.c because user_hwdebug_state
+couldn't be found.
+
+Fixed by including asm/ptrace.h like other ports.
+
+2014-05-22  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
+
+       * aarch64-linux-nat.c (asm/ptrace.h): Include.
+
+[Romain: rebase on top of 7.7.1]
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ gdb/aarch64-linux-nat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/aarch64-linux-nat.c b/gdb/aarch64-linux-nat.c
+index 31c26c6..710aa9b 100644
+--- a/gdb/aarch64-linux-nat.c
++++ b/gdb/aarch64-linux-nat.c
+@@ -33,6 +33,7 @@
+ 
+ #include <sys/ptrace.h>
+ #include <sys/utsname.h>
++#include <asm/ptrace.h>
+ 
+ #include "gregset.h"
+ 
+-- 
+1.9.3
+
