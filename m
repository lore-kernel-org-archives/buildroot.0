From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 27 Sep 2016 23:19:52 +0200
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.18
Message-ID: <20160927211952.GA11827@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to 1.0.18

This includes all patches, so remove them.

Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
---
 .../0001-arm-fix-compile-in-thumb-mode.patch       | 48 ---------------
 ...-sunrpc-Do-not-use-alloca-in-clntudp_call.patch | 59 ------------------
 .../uclibc/0003-ARC-Support-syscall-ABI-v4.patch   | 54 -----------------
 ...-dsbt-.h-avoid-void-pointer-s-subtraction.patch | 70 ----------------------
 package/uclibc/uclibc.hash                         |  2 +-
 package/uclibc/uclibc.mk                           |  2 +-
 6 files changed, 2 insertions(+), 233 deletions(-)
 delete mode 100644 package/uclibc/0001-arm-fix-compile-in-thumb-mode.patch
 delete mode 100644 package/uclibc/0002-sunrpc-Do-not-use-alloca-in-clntudp_call.patch
 delete mode 100644 package/uclibc/0003-ARC-Support-syscall-ABI-v4.patch
 delete mode 100644 package/uclibc/0004-elf-fdpic-dsbt-.h-avoid-void-pointer-s-subtraction.patch

diff --git a/package/uclibc/0001-arm-fix-compile-in-thumb-mode.patch b/package/uclibc/0001-arm-fix-compile-in-thumb-mode.patch
deleted file mode 100644
index 43fcb6f..0000000
--- a/package/uclibc/0001-arm-fix-compile-in-thumb-mode.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From bbd7151f7980c7d075fe652331f01d3aadc73e42 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Mon, 8 Aug 2016 06:41:03 +0200
-Subject: [PATCH] arm: fix compile in thumb mode
-
-Fix a regression introduced by commit
-0550ecce0e6580c5ad34e9a9a39ff18ccf8774f9
-
-Reported by Buildroot developers.
-
-Embedded test must be extented to ARMv7 thumb2 builds to
-find such regressions next time. It wasn't triggered by a
-cortex-m4 ARM noMMU build.
-
-[yann.morin.1998 at free.fr: backport from upstream]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- libc/sysdeps/linux/arm/bits/syscalls.h | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/libc/sysdeps/linux/arm/bits/syscalls.h b/libc/sysdeps/linux/arm/bits/syscalls.h
-index 5b30564..6c62a9e 100644
---- a/libc/sysdeps/linux/arm/bits/syscalls.h
-+++ b/libc/sysdeps/linux/arm/bits/syscalls.h
-@@ -43,6 +43,9 @@
-    })									\
- )
- 
-+#define INTERNAL_SYSCALL_ARM(name, err, nr, args...)           \
-+	INTERNAL_SYSCALL_NCS(__ARM_NR_##name, err, nr, args)
-+
- #if defined(__thumb__)
- /* We can't use push/pop inside the asm because that breaks
-    unwinding (ie. thread cancellation).
-@@ -83,10 +86,6 @@
-      }									\
-      (int) __internal_sys_result; }) \
- )
--
--#undef INTERNAL_SYSCALL_ARM
--#define INTERNAL_SYSCALL_ARM(name, err, nr, args...)           \
--	INTERNAL_SYSCALL_NCS(__ARM_NR_##name, err, nr, args)
- #endif
- 
- #define INTERNAL_SYSCALL_ERROR_P(val, err) \
--- 
-2.7.4
-
diff --git a/package/uclibc/0002-sunrpc-Do-not-use-alloca-in-clntudp_call.patch b/package/uclibc/0002-sunrpc-Do-not-use-alloca-in-clntudp_call.patch
deleted file mode 100644
index b0c523c..0000000
--- a/package/uclibc/0002-sunrpc-Do-not-use-alloca-in-clntudp_call.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 9213ad631513d0e67d9d31465c9cdb3f3dde0399 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Fri, 5 Aug 2016 21:33:44 +0200
-Subject: [PATCH 2/3] sunrpc: Do not use alloca in clntudp_call
-
-CVE-2016-4429:
-The call is technically in a loop, and under certain circumstances
-(which are quite difficult to reproduce in a test case), alloca
-can be invoked repeatedly during a single call to clntudp_call.
-As a result, the available stack space can be exhausted (even
-though individual alloca sizes are bounded implicitly by what
-can fit into a UDP packet, as a side effect of the earlier
-successful send operation).
-
-From GNU libc:
-https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commit;h=bc779a1a5b3035133024b21e2f339fe4219fb11c
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- libc/inet/rpc/clnt_udp.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/libc/inet/rpc/clnt_udp.c b/libc/inet/rpc/clnt_udp.c
-index 4fc55b7..ce7e9e6 100644
---- a/libc/inet/rpc/clnt_udp.c
-+++ b/libc/inet/rpc/clnt_udp.c
-@@ -368,9 +368,15 @@ send_again:
- 	  struct sock_extended_err *e;
- 	  struct sockaddr_in err_addr;
- 	  struct iovec iov;
--	  char *cbuf = (char *) alloca (outlen + 256);
-+	  char *cbuf = malloc (outlen + 256);
- 	  int ret;
- 
-+	  if (cbuf == NULL)
-+	    {
-+	      cu->cu_error.re_errno = errno;
-+	      return (cu->cu_error.re_status = RPC_CANTRECV);
-+	    }
-+
- 	  iov.iov_base = cbuf + 256;
- 	  iov.iov_len = outlen;
- 	  msg.msg_name = (void *) &err_addr;
-@@ -395,10 +401,12 @@ send_again:
- 		 cmsg = CMSG_NXTHDR (&msg, cmsg))
- 	      if (cmsg->cmsg_level == SOL_IP && cmsg->cmsg_type == IP_RECVERR)
- 		{
-+		  free (cbuf);
- 		  e = (struct sock_extended_err *) CMSG_DATA(cmsg);
- 		  cu->cu_error.re_errno = e->ee_errno;
- 		  return (cu->cu_error.re_status = RPC_CANTRECV);
- 		}
-+	  free (cbuf);
- 	}
- #endif
-       do
--- 
-2.7.4 (Apple Git-66)
-
diff --git a/package/uclibc/0003-ARC-Support-syscall-ABI-v4.patch b/package/uclibc/0003-ARC-Support-syscall-ABI-v4.patch
deleted file mode 100644
index 058adca..0000000
--- a/package/uclibc/0003-ARC-Support-syscall-ABI-v4.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 3e40f9669279f005f7154892539166f5081fbcb2 Mon Sep 17 00:00:00 2001
-From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
-Date: Tue, 16 Aug 2016 15:04:27 -0700
-Subject: [PATCH] ARC: Support syscall ABI v4
-
-The syscall ABI includes the gcc functional calling ABI since a syscall
-implies userland caller and kernel callee.
-
-The current gcc ABI (v3) for ARCv2 ISA required 64-bit data be passed in
-even-odd register pairs, (potentially punching reg holes when passing such
-values as args). This was partly driven by the fact that the double-word
-LDD/STD instructions in ARCv2 expect the register alignment and thus gcc
-forcing this avoids extra MOV at the cost of a few unused register (which we
-have plenty anyways).
-
-This however was rejected as part of upstreaming gcc port to HS. So the new
-ABI v4 doesn't enforce the even-odd reg restriction.
-
-Do note that for ARCompact ISA builds v3 and v4 are practically the same in
-terms of gcc code generation.
-
-This change is dormant for now (gcc 4.8.x based tools) and will only kick
-in with switch to gcc 6.x based tools.
-
-Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
-Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
----
- libc/sysdeps/linux/arc/bits/uClibc_arch_features.h | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/libc/sysdeps/linux/arc/bits/uClibc_arch_features.h b/libc/sysdeps/linux/arc/bits/uClibc_arch_features.h
-index 5160724..94e089d 100755
---- a/libc/sysdeps/linux/arc/bits/uClibc_arch_features.h
-+++ b/libc/sysdeps/linux/arc/bits/uClibc_arch_features.h
-@@ -41,8 +41,14 @@
- /* The default ';' is a comment on ARC. */
- #define __UCLIBC_ASM_LINE_SEP__ `
- 
--/* does your target align 64bit values in register pairs ? (32bit arches only) */
--#if defined(__A7__)
-+/* does your target align 64bit values in register pairs ? (32bit arches only)
-+ *  - ARC700 never had any constraint on reg pairs (even if ABI v3)
-+ *  - Inital HS ABI (v3: non upstream gcc) had 64-bit data aligned in even-odd
-+ *     reg pairs (thus allowed reg holes when passing such args to calls)
-+ *  - Upstream gcc (6.x) HS ABI doesn't have that restriction
-+ */
-+
-+#if defined(__A7__) || (__GNUC__ > 4)
- #undef __UCLIBC_SYSCALL_ALIGN_64BIT__
- #else
- #define __UCLIBC_SYSCALL_ALIGN_64BIT__
--- 
-2.7.4
-
diff --git a/package/uclibc/0004-elf-fdpic-dsbt-.h-avoid-void-pointer-s-subtraction.patch b/package/uclibc/0004-elf-fdpic-dsbt-.h-avoid-void-pointer-s-subtraction.patch
deleted file mode 100644
index 8c1c882..0000000
--- a/package/uclibc/0004-elf-fdpic-dsbt-.h-avoid-void-pointer-s-subtraction.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 2c242092372e9f7f62b881e81e8e798475e0cbb3 Mon Sep 17 00:00:00 2001
-From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
-Date: Sun, 18 Sep 2016 13:15:38 +0530
-Subject: [PATCH] elf-{fdpic, dsbt}.h: avoid void pointer's subtraction
-
-elf-fdpic.h or elf-dsbt.h is included by link.h. When C++ program
-includes <link.h>, we get following build failure.
-
-../usr/include/bits/elf-fdpic.h: In function 'void* __reloc_pointer(void*, const elf32_fdpic_loadmap*)':
-../usr/include/bits/elf-fdpic.h:95: error: invalid use of 'void'
-
-void pointer addition and subtraction is not allowed in C++ as it has
-undetermined size, however in C with language extension it is possible
-because sizeof void is treated as one byte.
-
-Instead of performing subtraction on void pointers, typecast it to char*
-first.
-
-This build failure is detected by Buildroot autobuilder.
-http://autobuild.buildroot.net/results/a10/a10ed48e6eb8411a3d8372f57c05fd11130da0e0/
-
-Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
----
- libc/sysdeps/linux/bfin/bits/elf-fdpic.h | 2 +-
- libc/sysdeps/linux/c6x/bits/elf-dsbt.h   | 2 +-
- libc/sysdeps/linux/frv/bits/elf-fdpic.h  | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/libc/sysdeps/linux/bfin/bits/elf-fdpic.h b/libc/sysdeps/linux/bfin/bits/elf-fdpic.h
-index dddf82c..9fcf93f 100644
---- a/libc/sysdeps/linux/bfin/bits/elf-fdpic.h
-+++ b/libc/sysdeps/linux/bfin/bits/elf-fdpic.h
-@@ -91,7 +91,7 @@ __reloc_pointer (void *p,
-       /* This should be computed as part of the pointer comparison
- 	 above, but we want to use the carry in the comparison, so we
- 	 can't convert it to an integer type beforehand.  */
--      unsigned long offset = p - (void*)map->segs[c].p_vaddr;
-+      unsigned long offset = (char*)p - (char*)map->segs[c].p_vaddr;
-       /* We only check for one-past-the-end for the last segment,
- 	 assumed to be the data segment, because other cases are
- 	 ambiguous in the absence of padding between segments, and
-diff --git a/libc/sysdeps/linux/c6x/bits/elf-dsbt.h b/libc/sysdeps/linux/c6x/bits/elf-dsbt.h
-index a4e3e7d..0e82ec7 100644
---- a/libc/sysdeps/linux/c6x/bits/elf-dsbt.h
-+++ b/libc/sysdeps/linux/c6x/bits/elf-dsbt.h
-@@ -94,7 +94,7 @@ __reloc_pointer (void *p,
- 
-   for (c = 0; c < map->nsegs; c++)
-     {
--      unsigned long offset = p - (void*)map->segs[c].p_vaddr;
-+      unsigned long offset = (char*)p - (char*)map->segs[c].p_vaddr;
-       /* We only check for one-past-the-end for the second segment,
- 	 assumed to be the data segment, because other cases are
- 	 ambiguous in the absence of padding between segments, and
-diff --git a/libc/sysdeps/linux/frv/bits/elf-fdpic.h b/libc/sysdeps/linux/frv/bits/elf-fdpic.h
-index dddf82c..9fcf93f 100644
---- a/libc/sysdeps/linux/frv/bits/elf-fdpic.h
-+++ b/libc/sysdeps/linux/frv/bits/elf-fdpic.h
-@@ -91,7 +91,7 @@ __reloc_pointer (void *p,
-       /* This should be computed as part of the pointer comparison
- 	 above, but we want to use the carry in the comparison, so we
- 	 can't convert it to an integer type beforehand.  */
--      unsigned long offset = p - (void*)map->segs[c].p_vaddr;
-+      unsigned long offset = (char*)p - (char*)map->segs[c].p_vaddr;
-       /* We only check for one-past-the-end for the last segment,
- 	 assumed to be the data segment, because other cases are
- 	 ambiguous in the absence of padding between segments, and
--- 
-2.6.2
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 637d93e..ebc2dc0 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From http://www.uclibc-ng.org/
-sha256  a2e7207634c19997e8b9f3e712182d80d42aaa85ce3462eff1a9bce812aaf354        uClibc-ng-1.0.17.tar.xz
+sha256  5430bb3acde31d70db906be33e3e2a022beba42b50f2c56695d37344560e253f        uClibc-ng-1.0.18.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 124bd59..16fc0dd 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.17
+UCLIBC_VERSION = 1.0.18
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPLv2.1+
-- 
2.1.4
