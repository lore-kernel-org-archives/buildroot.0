From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 19:43:36 +0200
Subject: [Buildroot] [git commit] valgrind: add patch to fix build on
	PowerPC uClibc
Message-ID: <20141012174428.09468B2B33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1239610e223358d31bd9126f3bc5928deeba5d5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc on PowerPC forgot to define some PTRACE_* definitions. Even
though the Buildroot uClibc package has a fix for this, it doesn't fix
external uClibc toolchains that are not patched. Therefore this commit
adds a patch to Valgrind to workaround the problem by defining
PTRACE_GETSIGINFO to the appropriate value on PowerPC when it's not
defined by the C library.

Fixes:

  http://autobuild.buildroot.org/results/bc6/bc6be9aa1ad39201a1045a65c0c3eb1e968371f2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-add-missing-ptrace-getsiginfo-on-powerpc.patch |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/valgrind/valgrind-0003-add-missing-ptrace-getsiginfo-on-powerpc.patch b/package/valgrind/valgrind-0003-add-missing-ptrace-getsiginfo-on-powerpc.patch
new file mode 100644
index 0000000..f663825
--- /dev/null
+++ b/package/valgrind/valgrind-0003-add-missing-ptrace-getsiginfo-on-powerpc.patch
@@ -0,0 +1,28 @@
+Define PTRACE_GETSIGINFO on PowerPC when not available
+
+uClibc 0.9.33.2 does not define PTRACE_GETSIGINFO in PowerPC. Even
+though Buildroot has a uClibc patch doing that, it doesn't solve the
+case of external uClibc toolchain from other sources (such as
+Crosstool-NG). Therefore, this patch modifies Valgrind to define
+PTRACE_GETSIGINFO on PowerPC to the right value, when such definition
+is not available from the C library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/coregrind/vgdb-invoker-ptrace.c
+===================================================================
+--- a/coregrind/vgdb-invoker-ptrace.c
++++ b/coregrind/vgdb-invoker-ptrace.c
+@@ -71,6 +71,12 @@
+ #   endif
+ #endif
+ 
++#if defined(__powerpc__)
++# ifndef PTRACE_GETSIGINFO
++#  define PTRACE_GETSIGINFO 0x4202
++# endif
++#endif
++
+ #if VEX_HOST_WORDSIZE == 8
+ typedef Addr64 CORE_ADDR;
+ #elif VEX_HOST_WORDSIZE == 4
