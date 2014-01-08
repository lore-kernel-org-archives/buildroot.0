From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  8 Jan 2014 12:16:34 +0200
Subject: [Buildroot] [PATCH 3/4] uclibc: xtensa: update ptrace.h
In-Reply-To: <cover.1389168903.git.baruch@tkos.co.il>
References: <cover.1389168903.git.baruch@tkos.co.il>
Message-ID: <9a706d5ab9ea59687cf9c88c5684e0131e7e91eb.1389175037.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/84f/84fb918efbcbf1312a228a9c11608edf096b3c40/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0003-xtensa-use-common-ptrace.h.patch          | 184 +++++++++++++++++++++
 1 file changed, 184 insertions(+)
 create mode 100644 package/uclibc/3a3ad3dfc10876b3648369f22df8fc06661ddef0/0003-xtensa-use-common-ptrace.h.patch

diff --git a/package/uclibc/3a3ad3dfc10876b3648369f22df8fc06661ddef0/0003-xtensa-use-common-ptrace.h.patch b/package/uclibc/3a3ad3dfc10876b3648369f22df8fc06661ddef0/0003-xtensa-use-common-ptrace.h.patch
new file mode 100644
index 0000000..a0a4221
--- /dev/null
+++ b/package/uclibc/3a3ad3dfc10876b3648369f22df8fc06661ddef0/0003-xtensa-use-common-ptrace.h.patch
@@ -0,0 +1,184 @@
+From fbb30f0471176a18fb14ebf0ac4abc491f5bdf1a Mon Sep 17 00:00:00 2001
+Message-Id: <fbb30f0471176a18fb14ebf0ac4abc491f5bdf1a.1389164521.git.baruch@tkos.co.il>
+In-Reply-To: <7dbb2e43f34f53305d7807018865691c430efe5e.1389164521.git.baruch@tkos.co.il>
+References: <7dbb2e43f34f53305d7807018865691c430efe5e.1389164521.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 5 Jan 2014 14:39:03 +0200
+Subject: [PATCH 3/3] xtensa: use common ptrace.h
+
+Adds support for architecture independent actions.
+
+Patch status: posted upstream
+(http://lists.uclibc.org/pipermail/uclibc/2014-January/048149.html).
+
+Cc: Chris Zankel <chris@zankel.net>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ libc/sysdeps/linux/xtensa/sys/ptrace.h | 155 ---------------------------------
+ 1 file changed, 155 deletions(-)
+ delete mode 100644 libc/sysdeps/linux/xtensa/sys/ptrace.h
+
+diff --git a/libc/sysdeps/linux/xtensa/sys/ptrace.h b/libc/sysdeps/linux/xtensa/sys/ptrace.h
+deleted file mode 100644
+index 882b8c8..0000000
+--- a/libc/sysdeps/linux/xtensa/sys/ptrace.h
++++ /dev/null
+@@ -1,155 +0,0 @@
+-/* `ptrace' debugger support interface.  Linux version.
+-   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007
+-   Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-#ifndef _SYS_PTRACE_H
+-#define _SYS_PTRACE_H	1
+-
+-#include <features.h>
+-
+-/* Kludge away careless namespace pollution from the kernel. */
+-
+-#undef PTRACE_GETREGS
+-#undef PTRACE_SETREGS
+-#undef PTRACE_GETFPREGS
+-#undef PTRACE_SETFPREGS
+-#undef PTRACE_GETFPREGSIZE
+-
+-
+-__BEGIN_DECLS
+-
+-/* Type of the REQUEST argument to `ptrace.'  */
+-enum __ptrace_request
+-{
+-  /* Indicate that the process making this request should be traced.
+-     All signals received by this process can be intercepted by its
+-     parent, and its parent can use the other `ptrace' requests.  */
+-  PTRACE_TRACEME = 0,
+-#define PT_TRACE_ME PTRACE_TRACEME
+-
+-  /* Return the word in the process's text space at address ADDR.  */
+-  PTRACE_PEEKTEXT = 1,
+-#define PT_READ_I PTRACE_PEEKTEXT
+-
+-  /* Return the word in the process's data space at address ADDR.  */
+-  PTRACE_PEEKDATA = 2,
+-#define PT_READ_D PTRACE_PEEKDATA
+-
+-  /* Return the word in the process's user area at offset ADDR.  */
+-  PTRACE_PEEKUSER = 3,
+-#define PT_READ_U PTRACE_PEEKUSER
+-
+-  /* Write the word DATA into the process's text space at address ADDR.  */
+-  PTRACE_POKETEXT = 4,
+-#define PT_WRITE_I PTRACE_POKETEXT
+-
+-  /* Write the word DATA into the process's data space at address ADDR.  */
+-  PTRACE_POKEDATA = 5,
+-#define PT_WRITE_D PTRACE_POKEDATA
+-
+-  /* Write the word DATA into the process's user area at offset ADDR.  */
+-  PTRACE_POKEUSER = 6,
+-#define PT_WRITE_U PTRACE_POKEUSER
+-
+-  /* Continue the process.  */
+-  PTRACE_CONT = 7,
+-#define PT_CONTINUE PTRACE_CONT
+-
+-  /* Kill the process.  */
+-  PTRACE_KILL = 8,
+-#define PT_KILL PTRACE_KILL
+-
+-  /* Single step the process.
+-     This is not supported on all machines.  */
+-  PTRACE_SINGLESTEP = 9,
+-#define PT_STEP PTRACE_SINGLESTEP
+-
+-  /* Get all general purpose registers used by a processes.
+-     This is not supported on all machines.  */
+-   PTRACE_GETREGS = 12,
+-#define PT_GETREGS PTRACE_GETREGS
+-
+-  /* Set all general purpose registers used by a processes.
+-     This is not supported on all machines.  */
+-   PTRACE_SETREGS = 13,
+-#define PT_SETREGS PTRACE_SETREGS
+-
+-  /* Get all floating point registers used by a processes.
+-     This is not supported on all machines.  */
+-   PTRACE_GETFPREGS = 14,
+-#define PT_GETFPREGS PTRACE_GETFPREGS
+-
+-  /* Set all floating point registers used by a processes.
+-     This is not supported on all machines.  */
+-   PTRACE_SETFPREGS = 15,
+-#define PT_SETFPREGS PTRACE_SETFPREGS
+-
+-  /* Attach to a process that is already running. */
+-  PTRACE_ATTACH = 16,
+-#define PT_ATTACH PTRACE_ATTACH
+-
+-  /* Detach from a process attached to with PTRACE_ATTACH.  */
+-  PTRACE_DETACH = 17,
+-#define PT_DETACH PTRACE_DETACH
+-
+-  /* Get size required for the buffer holding the floating point registers.
+-     This is not supported on all machines.  */
+-   PTRACE_GETFPREGSIZE = 18,
+-#define PT_GETFPREGSIZE PTRACE_GETFPREGSIZE
+-
+-  /* Continue and stop at the next (return from) syscall.  */
+-  PTRACE_SYSCALL = 24
+-#define PT_SYSCALL PTRACE_SYSCALL
+-};
+-
+-/* Options set using PTRACE_SETOPTIONS.  */
+-enum __ptrace_setoptions {
+-  PTRACE_O_TRACESYSGOOD	= 0x00000001,
+-  PTRACE_O_TRACEFORK	= 0x00000002,
+-  PTRACE_O_TRACEVFORK   = 0x00000004,
+-  PTRACE_O_TRACECLONE	= 0x00000008,
+-  PTRACE_O_TRACEEXEC	= 0x00000010,
+-  PTRACE_O_TRACEVFORKDONE = 0x00000020,
+-  PTRACE_O_TRACEEXIT	= 0x00000040,
+-  PTRACE_O_MASK		= 0x0000007f
+-};
+-
+-/* Wait extended result codes for the above trace options.  */
+-enum __ptrace_eventcodes {
+-  PTRACE_EVENT_FORK	= 1,
+-  PTRACE_EVENT_VFORK	= 2,
+-  PTRACE_EVENT_CLONE	= 3,
+-  PTRACE_EVENT_EXEC	= 4,
+-  PTRACE_EVENT_VFORK_DONE = 5,
+-  PTRACE_EVENT_EXIT	= 6
+-};
+-
+-/* Perform process tracing functions.  REQUEST is one of the values
+-   above, and determines the action to be taken.
+-   For all requests except PTRACE_TRACEME, PID specifies the process to be
+-   traced.
+-
+-   PID and the other arguments described above for the various requests should
+-   appear (those that are used for the particular request) as:
+-     pid_t PID, void *ADDR, int DATA, void *ADDR2
+-   after REQUEST.  */
+-extern long int ptrace (enum __ptrace_request __request, ...) __THROW;
+-
+-__END_DECLS
+-
+-#endif /* _SYS_PTRACE_H */
+-- 
+1.8.5.2
+
-- 
1.8.5.2
