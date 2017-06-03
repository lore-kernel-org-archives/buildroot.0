From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Jun 2017 23:05:13 +0200
Subject: [Buildroot] [PATCH 3/3] gdb: add patches to fix musl build on
	ppc(64)(le) and sh
In-Reply-To: <1496523913-19323-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1496523913-19323-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1496523913-19323-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit small patches to gdb that fix redefined structures build
problems that occur when building on PowerPC, PowerPC64, PowerPC64le and
SuperH with the musl C library.

The PowerPC(64)(le) patch was taken from the Yocto Project, the SuperH
patch was inspired from the PowerPC patch. The issue has also been
reported upstream to the musl developers:

  http://www.openwall.com/lists/musl/2017/06/03/1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 53 ++++++++++++++++++++++
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 41 +++++++++++++++++
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 53 ++++++++++++++++++++++
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 41 +++++++++++++++++
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 53 ++++++++++++++++++++++
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 41 +++++++++++++++++
 6 files changed, 282 insertions(+)
 create mode 100644 package/gdb/7.10.1/0008-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
 create mode 100644 package/gdb/7.10.1/0009-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
 create mode 100644 package/gdb/7.11.1/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
 create mode 100644 package/gdb/7.11.1/0004-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
 create mode 100644 package/gdb/7.12.1/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
 create mode 100644 package/gdb/7.12.1/0003-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch

diff --git a/package/gdb/7.10.1/0008-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/7.10.1/0008-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
new file mode 100644
index 0000000..c280831
--- /dev/null
+++ b/package/gdb/7.10.1/0008-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -0,0 +1,53 @@
+From 3964e15443c5cdfca6723987c8ef1ef6cf984d41 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2016 17:32:50 -0700
+Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gdb/gdbserver/linux-ppc-low.c | 6 ++++++
+ gdb/nat/ppc-linux.h           | 6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
+index 188fac0..f71d5ab 100644
+--- a/gdb/gdbserver/linux-ppc-low.c
++++ b/gdb/gdbserver/linux-ppc-low.c
+@@ -21,7 +21,13 @@
+ #include "linux-low.h"
+ 
+ #include <elf.h>
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ 
+ #include "nat/ppc-linux.h"
+ 
+diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
+index 0ff2223..c978daa 100644
+--- a/gdb/nat/ppc-linux.h
++++ b/gdb/nat/ppc-linux.h
+@@ -18,7 +18,13 @@
+ #ifndef PPC_LINUX_H
+ #define PPC_LINUX_H 1
+ 
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ #include <asm/cputable.h>
+ 
+ /* This sometimes isn't defined.  */
+-- 
+2.7.4
+
diff --git a/package/gdb/7.10.1/0009-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/7.10.1/0009-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
new file mode 100644
index 0000000..50f9512
--- /dev/null
+++ b/package/gdb/7.10.1/0009-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
@@ -0,0 +1,41 @@
+From 1662a42e980c3f605000b23fda86ab24ceb69d32 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 3 Jun 2017 21:23:52 +0200
+Subject: [PATCH] sh/ptrace: Define pt_{dsp,}regs uapi_pt_{dsp,}regs on !GLIBC
+ systems
+
+Fixes a pt_{dsp,}regs redefinition when building with the musl C library
+on SuperH.
+
+Inspired by
+http://git.yoctoproject.org/clean/cgit.cgi/poky/plain/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch,
+adapted for SuperH.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gdb/gdbserver/linux-sh-low.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/gdb/gdbserver/linux-sh-low.c b/gdb/gdbserver/linux-sh-low.c
+index 218d4d3..c4ada84 100644
+--- a/gdb/gdbserver/linux-sh-low.c
++++ b/gdb/gdbserver/linux-sh-low.c
+@@ -27,7 +27,15 @@ extern const struct target_desc *tdesc_sh;
+ #include <sys/reg.h>
+ #endif
+ 
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++# define pt_dspregs uapi_pt_dspregs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++# undef pt_dspregs
++#endif
+ 
+ #define sh_num_regs 41
+ 
+-- 
+2.7.4
+
diff --git a/package/gdb/7.11.1/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/7.11.1/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
new file mode 100644
index 0000000..1e7f6b6
--- /dev/null
+++ b/package/gdb/7.11.1/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -0,0 +1,53 @@
+From 7438f3e5a41adf54cf82cd82d3d52244e77d7d05 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2016 17:32:50 -0700
+Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gdb/gdbserver/linux-ppc-low.c | 6 ++++++
+ gdb/nat/ppc-linux.h           | 6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
+index 2145c50..777905d 100644
+--- a/gdb/gdbserver/linux-ppc-low.c
++++ b/gdb/gdbserver/linux-ppc-low.c
+@@ -21,7 +21,13 @@
+ #include "linux-low.h"
+ 
+ #include <elf.h>
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ 
+ #include "nat/ppc-linux.h"
+ 
+diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
+index 85fbcd8..cbec9c5 100644
+--- a/gdb/nat/ppc-linux.h
++++ b/gdb/nat/ppc-linux.h
+@@ -18,7 +18,13 @@
+ #ifndef PPC_LINUX_H
+ #define PPC_LINUX_H 1
+ 
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ #include <asm/cputable.h>
+ 
+ /* This sometimes isn't defined.  */
+-- 
+2.7.4
+
diff --git a/package/gdb/7.11.1/0004-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/7.11.1/0004-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
new file mode 100644
index 0000000..f8c9e59
--- /dev/null
+++ b/package/gdb/7.11.1/0004-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
@@ -0,0 +1,41 @@
+From b7cbde12595599768bf2831e311a8ab265322313 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 3 Jun 2017 21:23:52 +0200
+Subject: [PATCH] sh/ptrace: Define pt_{dsp,}regs uapi_pt_{dsp,}regs on !GLIBC
+ systems
+
+Fixes a pt_{dsp,}regs redefinition when building with the musl C library
+on SuperH.
+
+Inspired by
+http://git.yoctoproject.org/clean/cgit.cgi/poky/plain/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch,
+adapted for SuperH.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gdb/gdbserver/linux-sh-low.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/gdb/gdbserver/linux-sh-low.c b/gdb/gdbserver/linux-sh-low.c
+index 38612e2..3195d0d 100644
+--- a/gdb/gdbserver/linux-sh-low.c
++++ b/gdb/gdbserver/linux-sh-low.c
+@@ -27,7 +27,15 @@ extern const struct target_desc *tdesc_sh;
+ #include <sys/reg.h>
+ #endif
+ 
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++# define pt_dspregs uapi_pt_dspregs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++# undef pt_dspregs
++#endif
+ 
+ #define sh_num_regs 41
+ 
+-- 
+2.7.4
+
diff --git a/package/gdb/7.12.1/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/7.12.1/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
new file mode 100644
index 0000000..f6ec1d7
--- /dev/null
+++ b/package/gdb/7.12.1/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -0,0 +1,53 @@
+From c45f07aec83ccb732ece970cb387f2db8b6896e4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2016 17:32:50 -0700
+Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gdb/gdbserver/linux-ppc-low.c | 6 ++++++
+ gdb/nat/ppc-linux.h           | 6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
+index 33a9feb..1a9141f 100644
+--- a/gdb/gdbserver/linux-ppc-low.c
++++ b/gdb/gdbserver/linux-ppc-low.c
+@@ -21,7 +21,13 @@
+ #include "linux-low.h"
+ 
+ #include <elf.h>
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ 
+ #include "nat/ppc-linux.h"
+ #include "linux-ppc-tdesc.h"
+diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
+index 5837ea1..7233929 100644
+--- a/gdb/nat/ppc-linux.h
++++ b/gdb/nat/ppc-linux.h
+@@ -18,7 +18,13 @@
+ #ifndef PPC_LINUX_H
+ #define PPC_LINUX_H 1
+ 
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ #include <asm/cputable.h>
+ 
+ /* This sometimes isn't defined.  */
+-- 
+2.7.4
+
diff --git a/package/gdb/7.12.1/0003-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/7.12.1/0003-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
new file mode 100644
index 0000000..4f142ec
--- /dev/null
+++ b/package/gdb/7.12.1/0003-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
@@ -0,0 +1,41 @@
+From 00a0ba059f01784e8da5cec3439ea2d6c4a2ef40 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 3 Jun 2017 21:23:52 +0200
+Subject: [PATCH] sh/ptrace: Define pt_{dsp,}regs uapi_pt_{dsp,}regs on !GLIBC
+ systems
+
+Fixes a pt_{dsp,}regs redefinition when building with the musl C library
+on SuperH.
+
+Inspired by
+http://git.yoctoproject.org/clean/cgit.cgi/poky/plain/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch,
+adapted for SuperH.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gdb/gdbserver/linux-sh-low.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/gdb/gdbserver/linux-sh-low.c b/gdb/gdbserver/linux-sh-low.c
+index ac084c9..08e104a 100644
+--- a/gdb/gdbserver/linux-sh-low.c
++++ b/gdb/gdbserver/linux-sh-low.c
+@@ -27,7 +27,15 @@ extern const struct target_desc *tdesc_sh;
+ #include <sys/reg.h>
+ #endif
+ 
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++# define pt_dspregs uapi_pt_dspregs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++# undef pt_dspregs
++#endif
+ 
+ #define sh_num_regs 41
+ 
+-- 
+2.7.4
+
-- 
2.7.4
