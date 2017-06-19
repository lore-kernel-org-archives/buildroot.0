From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 19 Jun 2017 15:18:07 +0100
Subject: [Buildroot] [PATCH] gdb: fix build for MIPS musl
Message-ID: <20170619141807.16084-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently building gdb for MIPS musl fails because it's trying to
include <sgidefs.h> which is provided by glibc and uClibc, but not by
musl.

However, the kernel headers provide <asm/sgidefs.h> which has the same
definitions, so we can use that one instead.

Backporting a patch that has been sent upstream. Taken from here:

https://sourceware.org/bugzilla/show_bug.cgi?id=21070

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gdb/7.10.1/0011-use-asm-sgidefs.h.patch | 44 +++++++++++++++++++++++++
 package/gdb/7.11.1/0006-use-asm-sgidefs.h.patch | 42 +++++++++++++++++++++++
 package/gdb/7.12.1/0005-use-asm-sgidefs.h.patch | 42 +++++++++++++++++++++++
 package/gdb/8.0/0003-use-asm-sgidefs.h.patch    | 42 +++++++++++++++++++++++
 4 files changed, 170 insertions(+)
 create mode 100644 package/gdb/7.10.1/0011-use-asm-sgidefs.h.patch
 create mode 100644 package/gdb/7.11.1/0006-use-asm-sgidefs.h.patch
 create mode 100644 package/gdb/7.12.1/0005-use-asm-sgidefs.h.patch
 create mode 100644 package/gdb/8.0/0003-use-asm-sgidefs.h.patch

diff --git a/package/gdb/7.10.1/0011-use-asm-sgidefs.h.patch b/package/gdb/7.10.1/0011-use-asm-sgidefs.h.patch
new file mode 100644
index 000000000..9513f2dd4
--- /dev/null
+++ b/package/gdb/7.10.1/0011-use-asm-sgidefs.h.patch
@@ -0,0 +1,44 @@
+Use <asm/sgidefs.h>
+
+Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=21070
+
+Patch has been adapted to apply on 7.10.1.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 12a0b8d81e1fda6ba98abdce8d6f09f9555ebcf5 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <amccurdy@gmail.com>
+Date: Sat, 30 Apr 2016 15:29:06 -0700
+Subject: [PATCH 07/10] use <asm/sgidefs.h>
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
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
index 000000000..de86154cc
--- /dev/null
+++ b/package/gdb/7.11.1/0006-use-asm-sgidefs.h.patch
@@ -0,0 +1,42 @@
+Use <asm/sgidefs.h>
+
+Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=21070
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 12a0b8d81e1fda6ba98abdce8d6f09f9555ebcf5 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <amccurdy@gmail.com>
+Date: Sat, 30 Apr 2016 15:29:06 -0700
+Subject: [PATCH 07/10] use <asm/sgidefs.h>
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
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
index 000000000..de86154cc
--- /dev/null
+++ b/package/gdb/7.12.1/0005-use-asm-sgidefs.h.patch
@@ -0,0 +1,42 @@
+Use <asm/sgidefs.h>
+
+Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=21070
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 12a0b8d81e1fda6ba98abdce8d6f09f9555ebcf5 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <amccurdy@gmail.com>
+Date: Sat, 30 Apr 2016 15:29:06 -0700
+Subject: [PATCH 07/10] use <asm/sgidefs.h>
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
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
diff --git a/package/gdb/8.0/0003-use-asm-sgidefs.h.patch b/package/gdb/8.0/0003-use-asm-sgidefs.h.patch
new file mode 100644
index 000000000..de86154cc
--- /dev/null
+++ b/package/gdb/8.0/0003-use-asm-sgidefs.h.patch
@@ -0,0 +1,42 @@
+Use <asm/sgidefs.h>
+
+Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=21070
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 12a0b8d81e1fda6ba98abdce8d6f09f9555ebcf5 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <amccurdy@gmail.com>
+Date: Sat, 30 Apr 2016 15:29:06 -0700
+Subject: [PATCH 07/10] use <asm/sgidefs.h>
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
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
-- 
2.13.0
