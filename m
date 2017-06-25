From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 00:33:41 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] gdb: fix full gdb build
	for MIPS musl
Message-ID: <20170625223515.E004A8188C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4230f5efefcc84a388d717bb4337da06c6b3e456
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Currently building full gdb for MIPS musl fails because it's trying to
include <sgidefs.h> which is provided by glibc and uClibc, but not by
musl.

However, the kernel headers provide <asm/sgidefs.h> which has the same
definitions, so we can use that one instead.

Backporting a patch that has been sent upstream. Taken from here:

https://sourceware.org/bugzilla/show_bug.cgi?id=21070

[Peter: drop gdb 8.0 patch]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 1874fe15224007308a7bf4e9765506a3b4bc1b27)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/7.10.1/0011-use-asm-sgidefs.h.patch | 41 +++++++++++++++++++++++++
 package/gdb/7.11.1/0006-use-asm-sgidefs.h.patch | 40 ++++++++++++++++++++++++
 package/gdb/7.12.1/0005-use-asm-sgidefs.h.patch | 40 ++++++++++++++++++++++++
 3 files changed, 121 insertions(+)

diff --git a/package/gdb/7.10.1/0011-use-asm-sgidefs.h.patch b/package/gdb/7.10.1/0011-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000..fdc5679
--- /dev/null
+++ b/package/gdb/7.10.1/0011-use-asm-sgidefs.h.patch
@@ -0,0 +1,41 @@
+From 12a0b8d81e1fda6ba98abdce8d6f09f9555ebcf5 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <amccurdy@gmail.com>
+Date: Sat, 30 Apr 2016 15:29:06 -0700
+Subject: [PATCH] use <asm/sgidefs.h>
+
+Build fix for MIPS with musl libc
+
+The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
+but not by musl. Regardless of the libc, the kernel headers provide
+<asm/sgidefs.h> which provides the same definitions, so use that
+instead.
+
+Upstream-Status: Pending
+
+[Vincent:
+Taken from https://sourceware.org/bugzilla/show_bug.cgi?id=21070
+Patch has been adapted to apply on 7.10.1.]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ gdb/mips-linux-nat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
+index 9f6d697..8f57bb2 100644
+--- a/gdb/mips-linux-nat.c
++++ b/gdb/mips-linux-nat.c
+@@ -31,7 +31,7 @@
+ #include "gdb_proc_service.h"
+ #include "gregset.h"
+ 
+-#include <sgidefs.h>
++#include <asm/sgidefs.h>
+ #include <sys/ptrace.h>
+ #include <asm/ptrace.h>
+
+-- 
+2.13.1
+ 
diff --git a/package/gdb/7.11.1/0006-use-asm-sgidefs.h.patch b/package/gdb/7.11.1/0006-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000..d303369
--- /dev/null
+++ b/package/gdb/7.11.1/0006-use-asm-sgidefs.h.patch
@@ -0,0 +1,40 @@
+From 12a0b8d81e1fda6ba98abdce8d6f09f9555ebcf5 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <amccurdy@gmail.com>
+Date: Sat, 30 Apr 2016 15:29:06 -0700
+Subject: [PATCH] use <asm/sgidefs.h>
+
+Build fix for MIPS with musl libc
+
+The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
+but not by musl. Regardless of the libc, the kernel headers provide
+<asm/sgidefs.h> which provides the same definitions, so use that
+instead.
+
+Upstream-Status: Pending
+
+[Vincent:
+Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=21070]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ gdb/mips-linux-nat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
+index f2df1b9907..d24664cb56 100644
+--- a/gdb/mips-linux-nat.c
++++ b/gdb/mips-linux-nat.c
+@@ -31,7 +31,7 @@
+ #include "gdb_proc_service.h"
+ #include "gregset.h"
+ 
+-#include <sgidefs.h>
++#include <asm/sgidefs.h>
+ #include "nat/gdb_ptrace.h"
+ #include <asm/ptrace.h>
+ #include "inf-ptrace.h"
+-- 
+2.13.1
+
diff --git a/package/gdb/7.12.1/0005-use-asm-sgidefs.h.patch b/package/gdb/7.12.1/0005-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000..d303369
--- /dev/null
+++ b/package/gdb/7.12.1/0005-use-asm-sgidefs.h.patch
@@ -0,0 +1,40 @@
+From 12a0b8d81e1fda6ba98abdce8d6f09f9555ebcf5 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <amccurdy@gmail.com>
+Date: Sat, 30 Apr 2016 15:29:06 -0700
+Subject: [PATCH] use <asm/sgidefs.h>
+
+Build fix for MIPS with musl libc
+
+The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
+but not by musl. Regardless of the libc, the kernel headers provide
+<asm/sgidefs.h> which provides the same definitions, so use that
+instead.
+
+Upstream-Status: Pending
+
+[Vincent:
+Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=21070]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ gdb/mips-linux-nat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
+index f2df1b9907..d24664cb56 100644
+--- a/gdb/mips-linux-nat.c
++++ b/gdb/mips-linux-nat.c
+@@ -31,7 +31,7 @@
+ #include "gdb_proc_service.h"
+ #include "gregset.h"
+ 
+-#include <sgidefs.h>
++#include <asm/sgidefs.h>
+ #include "nat/gdb_ptrace.h"
+ #include <asm/ptrace.h>
+ #include "inf-ptrace.h"
+-- 
+2.13.1
+
