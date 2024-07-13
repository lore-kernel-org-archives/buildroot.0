Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90F1C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 15:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C85076076A;
	Sat, 13 Jul 2024 15:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-qFLlS-15od; Sat, 13 Jul 2024 15:50:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B386607A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B386607A6;
	Sat, 13 Jul 2024 15:50:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B954E1BF406
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5864410CA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aE9YNvWAULP2 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 15:50:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11F6140D77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11F6140D77
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 15:50:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F39788655A; Sat, 13 Jul 2024 15:50:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:56:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4454720908e79252ea98bcbe4de86e4bbd4de77
X-Git-Newrev: 1861c225eafc9c9679217abc43d54317e7a6d03f
X-Patchwork-Hint: ignore
Message-Id: <20240713155025.F39788655A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: add support for GDB 15.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2850703679619525708=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2850703679619525708==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1861c225eafc9c9679217abc43d54317e7a6d03f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As detailed in the release notes [1]:

  Building GDB and GDBserver now requires a C++17 compiler (for
  instance, GCC 9 or later).

Therefore, we make the option BR2_GDB_VERSION_15 depend on both
BR2_HOST_GCC_AT_LEAST_9 *and* BR2_TOOLCHAIN_GCC_AT_LEAST_9. One might
wonder why on both. It's because BR2_GDB_VERSION_15 defines both the
version of gdb used for the host *and* target, because we want them to
be in sync (to make sure our gdbserver is in sync with host-gdb).

The patches from gdb 14.1 are all ported to 15.1, with some minor
adaptation to 2 of them.

[1] https://lwn.net/Articles/981080/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                |  9 +++
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 +++++++++++++++++++
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 +++++++++++++++
 package/gdb/15.1/0003-use-asm-sgidefs.h.patch      | 40 ++++++++++++++
 .../15.1/0004-gdbserver-fix-build-for-m68k.patch   | 64 ++++++++++++++++++++++
 ...-nat-fork-inferior-include-linux-ptrace.h.patch | 53 ++++++++++++++++++
 ...-Fix-getrandom-compile-for-uclibc-v1.0.35.patch | 39 +++++++++++++
 .../gdb/15.1/0007-fix-musl-build-on-riscv.patch    | 60 ++++++++++++++++++++
 .../0008-gdbserver-Makefile.in-fix-NLS-build.patch | 38 +++++++++++++
 .../15.1/0009-gdb-Fix-native-build-on-xtensa.patch | 57 +++++++++++++++++++
 package/gdb/Config.in                              |  2 +-
 package/gdb/Config.in.host                         |  9 +++
 package/gdb/gdb.hash                               |  1 +
 package/gdb/gdb.mk                                 |  4 +-
 14 files changed, 471 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index eb2021fadb..2dd331451b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -613,6 +613,15 @@ package/gdb/14.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.U
 package/gdb/14.1/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
 package/gdb/14.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
 package/gdb/14.1/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
+package/gdb/15.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
+package/gdb/15.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
+package/gdb/15.1/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
+package/gdb/15.1/0004-gdbserver-fix-build-for-m68k.patch lib_patch.Upstream
+package/gdb/15.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch lib_patch.Upstream
+package/gdb/15.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.Upstream
+package/gdb/15.1/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
+package/gdb/15.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
+package/gdb/15.1/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
 package/gengetopt/0001-configure.ac-add-disable-doc-option.patch lib_patch.Upstream
 package/genpart/0001-fix-return-code.patch lib_patch.Upstream
 package/genromfs/0001-build-system.patch lib_patch.Sob lib_patch.Upstream
diff --git a/package/gdb/15.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/15.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
new file mode 100644
index 0000000000..d4147e3a47
--- /dev/null
+++ b/package/gdb/15.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -0,0 +1,55 @@
+From e815bac6c090d8c67a508d648685cbaf706ed052 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2016 17:32:50 -0700
+Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Rebase on gdb 8.3]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/nat/ppc-linux.h        | 6 ++++++
+ gdbserver/linux-ppc-low.cc | 6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
+index b51e2278f4b..f1bc07df0e9 100644
+--- a/gdb/nat/ppc-linux.h
++++ b/gdb/nat/ppc-linux.h
+@@ -18,7 +18,13 @@
+ #ifndef NAT_PPC_LINUX_H
+ #define NAT_PPC_LINUX_H
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
+diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
+index bd3ac143660..1c8c0b3a98e 100644
+--- a/gdbserver/linux-ppc-low.cc
++++ b/gdbserver/linux-ppc-low.cc
+@@ -22,7 +22,13 @@
+ #include "elf/common.h"
+ #include <sys/uio.h>
+ #include <elf.h>
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ 
+ #include "arch/ppc-linux-common.h"
+ #include "arch/ppc-linux-tdesc.h"
+-- 
+2.45.2
+
diff --git a/package/gdb/15.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/15.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
new file mode 100644
index 0000000000..0d4f918c8f
--- /dev/null
+++ b/package/gdb/15.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
@@ -0,0 +1,43 @@
+From da36d051935c737b09c080b5a4e27180f85d975f Mon Sep 17 00:00:00 2001
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
+[Rebase	on gdb 8.0]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdbserver/linux-sh-low.cc | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/gdbserver/linux-sh-low.cc b/gdbserver/linux-sh-low.cc
+index 64e6de3480b..4770e652614 100644
+--- a/gdbserver/linux-sh-low.cc
++++ b/gdbserver/linux-sh-low.cc
+@@ -75,7 +75,15 @@ extern const struct target_desc *tdesc_sh;
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
+2.45.2
+
diff --git a/package/gdb/15.1/0003-use-asm-sgidefs.h.patch b/package/gdb/15.1/0003-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000000..fbbeec0600
--- /dev/null
+++ b/package/gdb/15.1/0003-use-asm-sgidefs.h.patch
@@ -0,0 +1,40 @@
+From 73cfc1539610f4671e35591bfd1e6bf7edda8e71 Mon Sep 17 00:00:00 2001
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
+index 3d072ea935c..d763c9b8f7e 100644
+--- a/gdb/mips-linux-nat.c
++++ b/gdb/mips-linux-nat.c
+@@ -30,7 +30,7 @@
+ #include "gdb_proc_service.h"
+ #include "gregset.h"
+ 
+-#include <sgidefs.h>
++#include <asm/sgidefs.h>
+ #include "nat/gdb_ptrace.h"
+ #include <asm/ptrace.h>
+ #include "inf-ptrace.h"
+-- 
+2.45.2
+
diff --git a/package/gdb/15.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/15.1/0004-gdbserver-fix-build-for-m68k.patch
new file mode 100644
index 0000000000..f321a57af3
--- /dev/null
+++ b/package/gdb/15.1/0004-gdbserver-fix-build-for-m68k.patch
@@ -0,0 +1,64 @@
+From d7fac5f69c6426a9b74e6d98f926c8bf8d3207a0 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 22 Jun 2018 22:40:26 +0200
+Subject: [PATCH] gdbserver: fix build for m68k
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+As for strace [1], when <sys/reg.h> is included after <linux/ptrace.h>,
+the build fails on m68k with the following diagnostics:
+
+In file included from ./../nat/linux-ptrace.h:28:0,
+                 from linux-low.h:27,
+                 from linux-m68k-low.c:20:
+[...]/usr/include/sys/reg.h:26:3: error: expected identifier before numeric constant
+   PT_D1 = 0,
+   ^
+[...]usr/include/sys/reg.h:26:3: error: expected « } » before numeric constant
+[...]usr/include/sys/reg.h:26:3: error: expected unqualified-id before numeric constant
+In file included from linux-m68k-low.c:27:0:
+[...]usr/include/sys/reg.h:99:1: error: expected declaration before « } » token
+ };
+ ^
+
+Fix this by moving <sys/reg.h> on top of "linux-low.h".
+
+[1] https://github.com/strace/strace/commit/6ebf6c4f9e5ebca123a5b5f24afe67cf0473cf92
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdbserver/linux-m68k-low.cc | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/gdbserver/linux-m68k-low.cc b/gdbserver/linux-m68k-low.cc
+index 8020e49ac6e..d9ba6235288 100644
+--- a/gdbserver/linux-m68k-low.cc
++++ b/gdbserver/linux-m68k-low.cc
+@@ -16,6 +16,12 @@
+    You should have received a copy of the GNU General Public License
+    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ 
++#include "server.h"
++
++#ifdef HAVE_SYS_REG_H
++#include <sys/reg.h>
++#endif
++
+ #include "linux-low.h"
+ 
+ /* Linux target op definitions for the m68k architecture.  */
+@@ -79,10 +85,6 @@ m68k_target::low_decr_pc_after_break ()
+ void init_registers_m68k (void);
+ extern const struct target_desc *tdesc_m68k;
+ 
+-#ifdef HAVE_SYS_REG_H
+-#include <sys/reg.h>
+-#endif
+-
+ #define m68k_num_regs 29
+ #define m68k_num_gregs 18
+ 
+-- 
+2.45.2
+
diff --git a/package/gdb/15.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/15.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
new file mode 100644
index 0000000000..3b2bb3bfe7
--- /dev/null
+++ b/package/gdb/15.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
@@ -0,0 +1,53 @@
+From 1dbb7548d94ef83b76748c66bf5ade75a154b009 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 24 Jun 2018 23:33:55 +0200
+Subject: [PATCH] nat/fork-inferior: include linux-ptrace.h
+
+To decide whether fork() or vfork() should be used, fork-inferior.c
+uses the following test:
+
+  #if !(defined(__UCLIBC__) && defined(HAS_NOMMU))
+
+However, HAS_NOMMU is never defined, because it gets defined in
+linux-ptrace.h, which is not included by fork-inferior.c. Due to this,
+gdbserver fails to build on noMMU architectures. This commit fixes
+that by simply including linux-ptrace.h.
+
+This bug was introduced by commit
+2090129c36c7e582943b7d300968d19b46160d84 ("Share fork_inferior et al
+with gdbserver"). Indeed, the same fork()/vfork() selection was done,
+but in another file where linux-ptrace.h was included.
+
+Fixes the following build issue:
+
+../nat/fork-inferior.c: In function 'pid_t fork_inferior(const char*, const string&, char**, void (*)(), void (*)(int), void (*)(), const char*, void (*)(const char*, char* const*, char* const*))':
+../nat/fork-inferior.c:376:11: error: 'fork' was not declared in this scope
+     pid = fork ();
+           ^~~~
+../nat/fork-inferior.c:376:11: note: suggested alternative: 'vfork'
+     pid = fork ();
+           ^~~~
+           vfork
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Romain: rebase on gdb 8.3]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/nat/fork-inferior.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/nat/fork-inferior.c b/gdb/nat/fork-inferior.c
+index c1082eb0441..05e42dc580a 100644
+--- a/gdb/nat/fork-inferior.c
++++ b/gdb/nat/fork-inferior.c
+@@ -27,6 +27,7 @@
+ #include "gdbsupport/signals-state-save-restore.h"
+ #include "gdbsupport/gdb_tilde_expand.h"
+ #include "gdbsupport/gdb_signals.h"
++#include "linux-ptrace.h"
+ #include <vector>
+ 
+ extern char **environ;
+-- 
+2.45.2
+
diff --git a/package/gdb/15.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch b/package/gdb/15.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
new file mode 100644
index 0000000000..5fe5234acf
--- /dev/null
+++ b/package/gdb/15.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
@@ -0,0 +1,39 @@
+From 90d1e33247a4329235dbaa60521cf1ecb649d0f9 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 6 Nov 2021 10:06:25 +0100
+Subject: [PATCH] Fix getrandom compile for uclibc < v1.0.35
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+- fix getrandom compile for uclibc < v1.0.35, add missing stddef.h
+  include (fixed in uclibc since v1.0.35, see [1])
+
+Fixes:
+
+  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name ‘size_t’
+     27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
+        |                                   ^~~~~~
+
+[1] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=00972c02c2b6e0a95d5def4a71bdfb188e091782t
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ gnulib/import/getrandom.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gnulib/import/getrandom.c b/gnulib/import/getrandom.c
+index e1468730933..3948d8d552a 100644
+--- a/gnulib/import/getrandom.c
++++ b/gnulib/import/getrandom.c
+@@ -19,6 +19,7 @@
+ 
+ #include <config.h>
+ 
++#include <stddef.h>
+ #include <sys/random.h>
+ 
+ #include <errno.h>
+-- 
+2.45.2
+
diff --git a/package/gdb/15.1/0007-fix-musl-build-on-riscv.patch b/package/gdb/15.1/0007-fix-musl-build-on-riscv.patch
new file mode 100644
index 0000000000..08737d2152
--- /dev/null
+++ b/package/gdb/15.1/0007-fix-musl-build-on-riscv.patch
@@ -0,0 +1,60 @@
+From 7b93a4abcbaa0c273aabc40213b2cdc1d3570e25 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 10 Nov 2021 23:14:54 +0100
+Subject: [PATCH] fix musl build on riscv
+
+Fix the following build failure raised with musl:
+
+../../gdbserver/linux-riscv-low.cc: In function 'void riscv_fill_fpregset(regcache*, void*)':
+../../gdbserver/linux-riscv-low.cc:140:19: error: 'ELF_NFPREG' was not declared in this scope; did you mean 'ELF_NGREG'?
+  140 |   for (i = 0; i < ELF_NFPREG - 1; i++, regbuf += flen)
+      |                   ^~~~~~~~~~
+      |                   ELF_NGREG
+
+musl fixed the issue with
+https://git.musl-libc.org/cgit/musl/commit/?id=e5d2823631bbfebacf48e1a34ed28f28d7cb2570
+
+Fixes:
+ - http://autobuild.buildroot.org/results/16b19198980ce9c81a618b3f6e8dc9fe28247a28
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gdb/nat/riscv-linux-tdesc.c  | 5 +++++
+ gdbserver/linux-riscv-low.cc | 5 +++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/gdb/nat/riscv-linux-tdesc.c b/gdb/nat/riscv-linux-tdesc.c
+index 0cd38435b22..c1f39037ad7 100644
+--- a/gdb/nat/riscv-linux-tdesc.c
++++ b/gdb/nat/riscv-linux-tdesc.c
+@@ -30,6 +30,11 @@
+ # define NFPREG 33
+ #endif
+ 
++/* Work around musl breakage since version 1.1.24.  */
++#ifndef ELF_NFPREG
++# define ELF_NFPREG 33
++#endif
++
+ /* See nat/riscv-linux-tdesc.h.  */
+ 
+ struct riscv_gdbarch_features
+diff --git a/gdbserver/linux-riscv-low.cc b/gdbserver/linux-riscv-low.cc
+index c4554c507a8..aa9253ca769 100644
+--- a/gdbserver/linux-riscv-low.cc
++++ b/gdbserver/linux-riscv-low.cc
+@@ -29,6 +29,11 @@
+ # define NFPREG 33
+ #endif
+ 
++/* Work around musl breakage since version 1.1.24.  */
++#ifndef ELF_NFPREG
++# define ELF_NFPREG 33
++#endif
++
+ /* Linux target op definitions for the RISC-V architecture.  */
+ 
+ class riscv_target : public linux_process_target
+-- 
+2.45.2
+
diff --git a/package/gdb/15.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/15.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch
new file mode 100644
index 0000000000..8368c6bcae
--- /dev/null
+++ b/package/gdb/15.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch
@@ -0,0 +1,38 @@
+From 169d2240b045a77689d2f61af671557bc02271d4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 18 Nov 2021 22:52:08 +0100
+Subject: [PATCH] gdbserver/Makefile.in: fix NLS build
+
+Fix the following build failure raised since gdb version 10.1 and
+https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=9a665d62266e75f0519f3a663784c458885b5c63:
+
+  CXXLD  libinproctrace.so
+/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: gdbsupport/tdesc-ipa.o: in function `print_xml_feature::visit(tdesc_type_builtin const*)':
+/home/buildroot/autobuild/instance-2/output-1/build/gdb-10.2/build/gdbserver/../../gdbserver/../gdbsupport/tdesc.cc:310: undefined reference to `libintl_gettext'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/faacc874fe9d32b74cb3d3dea988ef661cb0e3d0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://sourceware.org/pipermail/gdb-patches/2021-November/183580.html]
+---
+ gdbserver/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
+index 6148ccf9121..7c054f4daf6 100644
+--- a/gdbserver/Makefile.in
++++ b/gdbserver/Makefile.in
+@@ -408,7 +408,7 @@ $(IPA_LIB): $(sort $(IPA_OBJS)) ${CDEPS}
+ 	$(ECHO_CXXLD) $(CC_LD) -shared -fPIC -Wl,--soname=$(IPA_LIB) \
+ 		-Wl,--no-undefined $(INTERNAL_CFLAGS) $(INTERNAL_LDFLAGS) \
+ 		 $(CXXFLAGS) \
+-		-o $(IPA_LIB) ${IPA_OBJS} $(LIBIBERTY_FOR_SHLIB) -ldl -pthread
++		-o $(IPA_LIB) ${IPA_OBJS} $(LIBIBERTY_FOR_SHLIB) -ldl -pthread $(INTL)
+ 
+ # Put the proper machine-specific files first, so M-. on a machine
+ # specific routine gets the one for the correct machine.
+-- 
+2.45.2
+
diff --git a/package/gdb/15.1/0009-gdb-Fix-native-build-on-xtensa.patch b/package/gdb/15.1/0009-gdb-Fix-native-build-on-xtensa.patch
new file mode 100644
index 0000000000..a6bdc92374
--- /dev/null
+++ b/package/gdb/15.1/0009-gdb-Fix-native-build-on-xtensa.patch
@@ -0,0 +1,57 @@
+From ab4b71c3f308af89fe2751344375b694e9d63a66 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 28 Aug 2022 23:21:37 +0200
+Subject: [PATCH] gdb: Fix native build on xtensa
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Apply a similar fix than for Alpha architecture on gdb 9:
+https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=7a27b85f6d9b5eea9bd1493f903158fbea4b2231
+
+Fixes:
+
+../../gdb/xtensa-linux-nat.c: In function ‘void fill_gregset(const regcache*, elf_greg_t (*)[128], int)’:
+../../gdb/xtensa-linux-nat.c:66:17: error: ‘gdbarch_pc_regnum’ was not declared in this scope
+   66 |   if (regnum == gdbarch_pc_regnum (gdbarch) || regnum == -1)
+      |                 ^~~~~~~~~~~~~~~~~
+  CXX    complaints.o
+../../gdb/xtensa-linux-nat.c:68:17: error: ‘gdbarch_ps_regnum’ was not declared in this scope
+   68 |   if (regnum == gdbarch_ps_regnum (gdbarch) || regnum == -1)
+      |                 ^~~~~~~~~~~~~~~~~
+../../gdb/xtensa-linux-nat.c:71:38: error: no matching function for call to ‘gdbarch_tdep::gdbarch_tdep(gdbarch*&)’
+   71 |   if (regnum == gdbarch_tdep (gdbarch)->wb_regnum || regnum == -1)
+      |                                      ^
+In file included from ../../gdb/xtensa-linux-nat.c:38:
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘gdbarch_tdep::gdbarch_tdep()’
+  160 | struct gdbarch_tdep
+      |        ^~~~~~~~~~~~
+../../gdb/xtensa-tdep.h:160:8: note:   candidate expects 0 arguments, 1 provided
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘constexpr gdbarch_tdep::gdbarch_tdep(const gdbarch_tdep&)’
+../../gdb/xtensa-tdep.h:160:8: note:   no known conversion for argument 1 from ‘gdbarch*’ to ‘const gdbarch_tdep&’
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘constexpr gdbarch_tdep::gdbarch_tdep(gdbarch_tdep&&)’
+../../gdb/xtensa-tdep.h:160:8: note:   no known conversion for argument 1 from ‘gdbarch*’ to ‘gdbarch_tdep&&’
+../../gdb/xtensa-linux-nat.c:72:49: error: no matching function for call to ‘gdbarch_tdep::gdbarch_tdep(gdbarch*&)’
+   72 |     regcache->raw_collect (gdbarch_tdep (gdbarch)->wb_regnum,
+      |                                                 ^
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/xtensa-linux-nat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/xtensa-linux-nat.c b/gdb/xtensa-linux-nat.c
+index f8509b02e07..794be827f9a 100644
+--- a/gdb/xtensa-linux-nat.c
++++ b/gdb/xtensa-linux-nat.c
+@@ -35,6 +35,7 @@
+ 
+ #include "gregset.h"
+ #include "xtensa-tdep.h"
++#include "gdbarch.h"
+ 
+ /* Defines ps_err_e, struct ps_prochandle.  */
+ #include "gdb_proc_service.h"
+-- 
+2.45.2
+
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 574ad5462f..88de76094e 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -59,7 +59,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh
 	select BR2_PACKAGE_GMP
-	select BR2_PACKAGE_MPFR if (BR2_GDB_VERSION_14 || BR2_arc)
+	select BR2_PACKAGE_MPFR if (BR2_GDB_VERSION_14 || BR2_GDB_VERSION_15 || BR2_arc)
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_ZLIB
 
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 53706cd3ee..cf2a1e4f1f 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -55,6 +55,14 @@ config BR2_GDB_VERSION_13
 config BR2_GDB_VERSION_14
 	bool "gdb 14.x"
 
+config BR2_GDB_VERSION_15
+	bool "gdb 15.x"
+	depends on BR2_HOST_GCC_AT_LEAST_9 && BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
+comment "gdb 15.x needs host and target gcc >= 9"
+	depends on !BR2_HOST_GCC_AT_LEAST_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
 endchoice
 
 endif
@@ -68,4 +76,5 @@ config BR2_GDB_VERSION
 	# When making 14.x the default, or 14.x becomes the oldest version,
 	# be sure to update the target variant to properly select mpfr.
 	default "14.2"     if BR2_GDB_VERSION_14
+	default "15.1"	   if BR2_GDB_VERSION_15
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 144f6da296..1b6b7b20bd 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -4,6 +4,7 @@ sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470b
 sha512  425568d2e84672177d0fb87b1ad7daafdde097648d605e30cf0656970f66adc6a82ca2d83375ea4be583e9683a340e5bfdf5819668ddf66728200141ae50ff2d  gdb-12.1.tar.xz
 sha512  8185d3e11ab60dafff5860a5016577bfe7dd7547ef01ebc867bc247603d82b74ff74c4f29492c7d2aee57076f52be33e289f4c6b414a4b870d4b3004909f4c34  gdb-13.2.tar.xz
 sha512  7e07941f1fe661288cc571b4964012ceabc1760624fce20320db2f470c01439b2386f859b5288da13204b758e2e3b22a74c68c012178db93b9529b06f1e22ede  gdb-14.2.tar.xz
+sha512  0217434073023a8b8316088bf3ee95d53a1b6a7897f6269095429016a8900f9a05e130c390d8d5d5550cc515c16519de1071d8eef96aa58e38056c7e37da1d8b  gdb-15.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  gdb-arc-2023.09-release.tar.gz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 141fcfc005..f2ef270e87 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -166,7 +166,7 @@ endif
 # gdb.
 # GDB fork from ARC GNU tools 2023.09 is based on GDB14 branch and so
 # requires MPFR as well.
-ifeq ($(BR2_GDB_VERSION_14)$(BR2_arc):$(BR2_PACKAGE_GDB_DEBUGGER),y:y)
+ifeq ($(BR2_GDB_VERSION_14)$(BR2_GDB_VERSION_15)$(BR2_arc):$(BR2_PACKAGE_GDB_DEBUGGER),y:y)
 GDB_DEPENDENCIES += mpfr
 GDB_CONF_OPTS += --with-mpfr=$(STAGING_DIR)
 else
@@ -272,7 +272,7 @@ HOST_GDB_CONF_OPTS = \
 # GDB newer than 14.x need host-mpfr
 # GDB fork from ARC GNU tools 2023.09 is based on GDB14 branch and so
 # requires MPFR as well.
-ifeq ($(BR2_GDB_VERSION_14)$(BR2_arc),y)
+ifeq ($(BR2_GDB_VERSION_14)$(BR2_GDB_VERSION_15)$(BR2_arc),y)
 HOST_GDB_DEPENDENCIES += host-mpfr
 HOST_GDB_CONF_OPTS += --with-mpfr=$(HOST_DIR)
 else

--===============2850703679619525708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2850703679619525708==--
