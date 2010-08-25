From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Aug 2010 17:30:38 +0200
Subject: [Buildroot] [git commit master 1/1] toolchain/gcc: fix 4.2.4 build
	after uClibc NTPL support got added
Message-ID: <20100825153147.1AF4789016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1ed2e4fffd0d852e62bc98e92045a132f24c37d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    3 +
 .../gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch    |   49 ++++++++++++++++++++
 2 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch

diff --git a/CHANGES b/CHANGES
index ccc6a52..49aae0e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,6 +8,9 @@
 	Mark CRIS architecture as deprecated, as it is discontinued
 	upstream.
 
+	Toolchain: fixed gcc 4.2.x build after uClibc NPTL support got
+	added.
+
 	Updated/fixed packages: busybox, imagemagick, libglib2, lua,
 	luafilesystem, lzo, netcat, php, sysvinit, util-linux
 
diff --git a/toolchain/gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch b/toolchain/gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch
new file mode 100644
index 0000000..9a7c909
--- /dev/null
+++ b/toolchain/gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch
@@ -0,0 +1,49 @@
+--- gcc-4.2.4/gcc/unwind-sjlj.c.khem	2010-08-11 12:45:28.000000000 -0700
++++ gcc-4.2.4/gcc/unwind-sjlj.c	2010-08-11 12:45:50.000000000 -0700
+@@ -28,6 +28,8 @@
+    Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
+    02110-1301, USA.  */
+ 
++#ifndef inhibit_libc
++
+ #include "tconfig.h"
+ #include "tsystem.h"
+ #include "coretypes.h"
+@@ -326,3 +328,4 @@ uw_identify_context (struct _Unwind_Cont
+ #include "unwind.inc"
+ 
+ #endif /* USING_SJLJ_EXCEPTIONS */
++#endif
+--- gcc-4.2.4/gcc/unwind-dw2.c.khem	2010-08-11 12:42:45.000000000 -0700
++++ gcc-4.2.4/gcc/unwind-dw2.c	2010-08-11 12:43:17.000000000 -0700
+@@ -28,6 +28,8 @@
+    Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
+    02110-1301, USA.  */
+ 
++#ifndef inhibit_libc
++
+ #include "tconfig.h"
+ #include "tsystem.h"
+ #include "coretypes.h"
+@@ -1537,3 +1539,5 @@ alias (_Unwind_SetIP);
+ #endif
+ 
+ #endif /* !USING_SJLJ_EXCEPTIONS */
++#endif
++
+--- gcc-4.2.4/gcc/unwind-dw2-fde-glibc.c.khem	2010-08-11 12:44:25.000000000 -0700
++++ gcc-4.2.4/gcc/unwind-dw2-fde-glibc.c	2010-08-11 12:44:48.000000000 -0700
+@@ -29,6 +29,8 @@
+    segment and dl_iterate_phdr to avoid register/deregister calls at
+    DSO load/unload.  */
+ 
++#ifndef inhibit_libc
++
+ #ifndef _GNU_SOURCE
+ #define _GNU_SOURCE 1
+ #endif
+@@ -438,3 +440,4 @@ _Unwind_Find_FDE (void *pc, struct dwarf
+ #if defined (USE_GAS_SYMVER) && defined (SHARED) && defined (USE_LIBUNWIND_EXCEPTIONS)
+ alias (_Unwind_Find_FDE);
+ #endif
++#endif
-- 
1.7.1
