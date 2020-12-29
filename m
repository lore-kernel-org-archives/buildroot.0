From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 22:51:35 +0100
Subject: [Buildroot] [PATCH 1/3] package/gdb: add support for gdb 10.x
In-Reply-To: <20201228201025.1882536-1-thomas.petazzoni@bootlin.com>
References: <20201228201025.1882536-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201229215135.GA1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-12-28 21:10 +0100, Thomas Petazzoni spake thusly:
> All patches from gdb 9.2 are kept, except
> 0006-sim-ppc-Fix-linker-error-with-fno-common.patch which is
> upstream. The other patches are rebased to accommodate some code
> re-organization in gdb 10.x, especially the move of the gdbserver code
> from gdb/gdbserver/ to gdbserver/.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Full series applied to master, thanks.

I just added a blurb in the patch 2/3 commit log, about the previous
discrepancy about default version.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 ++++++++++++++++
>  ...-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 +++++++++++++
>  package/gdb/10.1/0003-use-asm-sgidefs.h.patch | 40 ++++++++++++
>  .../0004-gdbserver-fix-build-for-m68k.patch   | 63 +++++++++++++++++++
>  ...fork-inferior-include-linux-ptrace.h.patch | 53 ++++++++++++++++
>  package/gdb/Config.in.host                    |  4 ++
>  package/gdb/gdb.hash                          |  1 +
>  package/gdb/gdb.mk                            |  6 ++
>  8 files changed, 265 insertions(+)
>  create mode 100644 package/gdb/10.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
>  create mode 100644 package/gdb/10.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
>  create mode 100644 package/gdb/10.1/0003-use-asm-sgidefs.h.patch
>  create mode 100644 package/gdb/10.1/0004-gdbserver-fix-build-for-m68k.patch
>  create mode 100644 package/gdb/10.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
> 
> diff --git a/package/gdb/10.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/10.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> new file mode 100644
> index 0000000000..9369a14d2c
> --- /dev/null
> +++ b/package/gdb/10.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> @@ -0,0 +1,55 @@
> +From 64b8ab56118d2fea027adfb7ebbc01668b29528e Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 6 Aug 2016 17:32:50 -0700
> +Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +[Rebase on gdb 8.3]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + gdb/nat/ppc-linux.h        | 6 ++++++
> + gdbserver/linux-ppc-low.cc | 6 ++++++
> + 2 files changed, 12 insertions(+)
> +
> +diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
> +index d937a65b69c..1fd54b4a0e0 100644
> +--- a/gdb/nat/ppc-linux.h
> ++++ b/gdb/nat/ppc-linux.h
> +@@ -18,7 +18,13 @@
> + #ifndef NAT_PPC_LINUX_H
> + #define NAT_PPC_LINUX_H
> + 
> ++#if !defined(__GLIBC__)
> ++# define pt_regs uapi_pt_regs
> ++#endif
> + #include <asm/ptrace.h>
> ++#if !defined(__GLIBC__)
> ++# undef pt_regs
> ++#endif
> + #include <asm/cputable.h>
> + 
> + /* This sometimes isn't defined.  */
> +diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
> +index 337d555aee7..5d518f37268 100644
> +--- a/gdbserver/linux-ppc-low.cc
> ++++ b/gdbserver/linux-ppc-low.cc
> +@@ -23,7 +23,13 @@
> + #include "elf/common.h"
> + #include <sys/uio.h>
> + #include <elf.h>
> ++#if !defined(__GLIBC__)
> ++# define pt_regs uapi_pt_regs
> ++#endif
> + #include <asm/ptrace.h>
> ++#if !defined(__GLIBC__)
> ++# undef pt_regs
> ++#endif
> + 
> + #include "arch/ppc-linux-common.h"
> + #include "arch/ppc-linux-tdesc.h"
> +-- 
> +2.29.2
> +
> diff --git a/package/gdb/10.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/10.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
> new file mode 100644
> index 0000000000..2f96d29820
> --- /dev/null
> +++ b/package/gdb/10.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
> @@ -0,0 +1,43 @@
> +From d205f398e1e36f9673f50f368a3f29fd1dfaa794 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Sat, 3 Jun 2017 21:23:52 +0200
> +Subject: [PATCH] sh/ptrace: Define pt_{dsp,}regs uapi_pt_{dsp,}regs on !GLIBC
> + systems
> +
> +Fixes a pt_{dsp,}regs redefinition when building with the musl C library
> +on SuperH.
> +
> +Inspired by
> +http://git.yoctoproject.org/clean/cgit.cgi/poky/plain/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch,
> +adapted for SuperH.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +[Rebase	on gdb 8.0]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + gdbserver/linux-sh-low.cc | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/gdbserver/linux-sh-low.cc b/gdbserver/linux-sh-low.cc
> +index a6d3fc60047..b83cce6b9fe 100644
> +--- a/gdbserver/linux-sh-low.cc
> ++++ b/gdbserver/linux-sh-low.cc
> +@@ -76,7 +76,15 @@ extern const struct target_desc *tdesc_sh;
> + #include <sys/reg.h>
> + #endif
> + 
> ++#if !defined(__GLIBC__)
> ++# define pt_regs uapi_pt_regs
> ++# define pt_dspregs uapi_pt_dspregs
> ++#endif
> + #include <asm/ptrace.h>
> ++#if !defined(__GLIBC__)
> ++# undef pt_regs
> ++# undef pt_dspregs
> ++#endif
> + 
> + #define sh_num_regs 41
> + 
> +-- 
> +2.29.2
> +
> diff --git a/package/gdb/10.1/0003-use-asm-sgidefs.h.patch b/package/gdb/10.1/0003-use-asm-sgidefs.h.patch
> new file mode 100644
> index 0000000000..e04ebd1dd5
> --- /dev/null
> +++ b/package/gdb/10.1/0003-use-asm-sgidefs.h.patch
> @@ -0,0 +1,40 @@
> +From 65acc8800dba7e10da882871d4648241805c47ce Mon Sep 17 00:00:00 2001
> +From: Andre McCurdy <amccurdy@gmail.com>
> +Date: Sat, 30 Apr 2016 15:29:06 -0700
> +Subject: [PATCH] use <asm/sgidefs.h>
> +
> +Build fix for MIPS with musl libc
> +
> +The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
> +but not by musl. Regardless of the libc, the kernel headers provide
> +<asm/sgidefs.h> which provides the same definitions, so use that
> +instead.
> +
> +Upstream-Status: Pending
> +
> +[Vincent:
> +Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=21070]
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> +---
> + gdb/mips-linux-nat.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
> +index 38ff461a35b..b6cf194b2bf 100644
> +--- a/gdb/mips-linux-nat.c
> ++++ b/gdb/mips-linux-nat.c
> +@@ -31,7 +31,7 @@
> + #include "gdb_proc_service.h"
> + #include "gregset.h"
> + 
> +-#include <sgidefs.h>
> ++#include <asm/sgidefs.h>
> + #include "nat/gdb_ptrace.h"
> + #include <asm/ptrace.h>
> + #include "inf-ptrace.h"
> +-- 
> +2.29.2
> +
> diff --git a/package/gdb/10.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/10.1/0004-gdbserver-fix-build-for-m68k.patch
> new file mode 100644
> index 0000000000..846f7ed293
> --- /dev/null
> +++ b/package/gdb/10.1/0004-gdbserver-fix-build-for-m68k.patch
> @@ -0,0 +1,63 @@
> +From 90ebe548922538b854de52e8b687384f44360984 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Fri, 22 Jun 2018 22:40:26 +0200
> +Subject: [PATCH] gdbserver: fix build for m68k
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +As for strace [1], when <sys/reg.h> is included after <linux/ptrace.h>,
> +the build fails on m68k with the following diagnostics:
> +
> +In file included from ./../nat/linux-ptrace.h:28:0,
> +                 from linux-low.h:27,
> +                 from linux-m68k-low.c:20:
> +[...]/usr/include/sys/reg.h:26:3: error: expected identifier before numeric constant
> +   PT_D1 = 0,
> +   ^
> +[...]usr/include/sys/reg.h:26:3: error: expected ??}?? before numeric constant
> +[...]usr/include/sys/reg.h:26:3: error: expected unqualified-id before numeric constant
> +In file included from linux-m68k-low.c:27:0:
> +[...]usr/include/sys/reg.h:99:1: error: expected declaration before ??}?? token
> + };
> + ^
> +
> +Fix this by moving <sys/reg.h> on top of "linux-low.h".
> +
> +[1] https://github.com/strace/strace/commit/6ebf6c4f9e5ebca123a5b5f24afe67cf0473cf92
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + gdbserver/linux-m68k-low.cc | 9 +++++----
> + 1 file changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/gdbserver/linux-m68k-low.cc b/gdbserver/linux-m68k-low.cc
> +index 838ba353b0b..36679682b9a 100644
> +--- a/gdbserver/linux-m68k-low.cc
> ++++ b/gdbserver/linux-m68k-low.cc
> +@@ -17,6 +17,11 @@
> +    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
> + 
> + #include "server.h"
> ++
> ++#ifdef HAVE_SYS_REG_H
> ++#include <sys/reg.h>
> ++#endif
> ++
> + #include "linux-low.h"
> + 
> + /* Linux target op definitions for the m68k architecture.  */
> +@@ -80,10 +85,6 @@ m68k_target::low_decr_pc_after_break ()
> + void init_registers_m68k (void);
> + extern const struct target_desc *tdesc_m68k;
> + 
> +-#ifdef HAVE_SYS_REG_H
> +-#include <sys/reg.h>
> +-#endif
> +-
> + #define m68k_num_regs 29
> + #define m68k_num_gregs 18
> + 
> +-- 
> +2.29.2
> +
> diff --git a/package/gdb/10.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/10.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
> new file mode 100644
> index 0000000000..33dce4d940
> --- /dev/null
> +++ b/package/gdb/10.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
> @@ -0,0 +1,53 @@
> +From c8454711eca2e79437e17ed1e1e68b48b4c8d927 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Sun, 24 Jun 2018 23:33:55 +0200
> +Subject: [PATCH] nat/fork-inferior: include linux-ptrace.h
> +
> +To decide whether fork() or vfork() should be used, fork-inferior.c
> +uses the following test:
> +
> +  #if !(defined(__UCLIBC__) && defined(HAS_NOMMU))
> +
> +However, HAS_NOMMU is never defined, because it gets defined in
> +linux-ptrace.h, which is not included by fork-inferior.c. Due to this,
> +gdbserver fails to build on noMMU architectures. This commit fixes
> +that by simply including linux-ptrace.h.
> +
> +This bug was introduced by commit
> +2090129c36c7e582943b7d300968d19b46160d84 ("Share fork_inferior et al
> +with gdbserver"). Indeed, the same fork()/vfork() selection was done,
> +but in another file where linux-ptrace.h was included.
> +
> +Fixes the following build issue:
> +
> +../nat/fork-inferior.c: In function 'pid_t fork_inferior(const char*, const string&, char**, void (*)(), void (*)(int), void (*)(), const char*, void (*)(const char*, char* const*, char* const*))':
> +../nat/fork-inferior.c:376:11: error: 'fork' was not declared in this scope
> +     pid = fork ();
> +           ^~~~
> +../nat/fork-inferior.c:376:11: note: suggested alternative: 'vfork'
> +     pid = fork ();
> +           ^~~~
> +           vfork
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +[Romain: rebase on gdb 8.3]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + gdb/nat/fork-inferior.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/gdb/nat/fork-inferior.c b/gdb/nat/fork-inferior.c
> +index 7ba0126871d..53e1ec72f09 100644
> +--- a/gdb/nat/fork-inferior.c
> ++++ b/gdb/nat/fork-inferior.c
> +@@ -27,6 +27,7 @@
> + #include "gdbsupport/pathstuff.h"
> + #include "gdbsupport/signals-state-save-restore.h"
> + #include "gdbsupport/gdb_tilde_expand.h"
> ++#include "linux-ptrace.h"
> + #include <vector>
> + 
> + extern char **environ;
> +-- 
> +2.29.2
> +
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 4b868e2255..3abc4f7d23 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -78,6 +78,9 @@ config BR2_GDB_VERSION_8_3
>  config BR2_GDB_VERSION_9_2
>  	bool "gdb 9.2.x"
>  
> +config BR2_GDB_VERSION_10
> +	bool "gdb 10.x"
> +
>  endchoice
>  
>  endif
> @@ -90,4 +93,5 @@ config BR2_GDB_VERSION
>  	default "8.2.1"    if BR2_GDB_VERSION_8_2 || !BR2_PACKAGE_HOST_GDB
>  	default "8.3.1"    if BR2_GDB_VERSION_8_3
>  	default "9.2"      if BR2_GDB_VERSION_9_2
> +	default "10.1"	   if BR2_GDB_VERSION_10
>  	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
> diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
> index 1f14eeafaf..779ca141bc 100644
> --- a/package/gdb/gdb.hash
> +++ b/package/gdb/gdb.hash
> @@ -2,6 +2,7 @@
>  sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5a9355227d89ff328f7feb0fc411a69394560cafeb9fa75d35d896d11  gdb-8.2.1.tar.xz
>  sha512  9053a2dc6b9eb921907afbc4cecc75d635aa76df5e8c4f0e5824ccf57cb206b299c19b127fff000b65c334826ff8304a54ff6098428365a8e997cca886c39e9a  gdb-8.3.1.tar.xz
>  sha512  73635f00f343117aa5e2436f1e1597099e2bfb31ef7bb162b273fa1ea282c3fa9b0f52762e70bfc7ad0334addb8d159e9ac7cbe5998ca4f755ea8cf90714d274  gdb-9.2.tar.xz
> +sha512  0dc54380435c6853db60f1e388b94836d294dfa9ad7f518385a27db4edd03cb970f8717d5f1e9c9a0d4a33d7fcf91bc2e5d6c9cf9e4b561dcc74e65b806c1537  gdb-10.1.tar.xz
>  
>  # Locally calculated (fetched from Github)
>  sha512  5a2acf2fd33ab2ff589e1037ca40abda54328997dcff26b2b49b874bd3be980be5a63342962254f3c3bda98e32ce7a33af704d37353352833dee193135600458  gdb-arc-2020.09-release-gdb.tar.gz
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index f31b168bf1..c74279a43e 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -8,6 +8,12 @@ GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
>  GDB_SITE = $(BR2_GNU_MIRROR)/gdb
>  GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
>  
> +# recent gdb versions (>= 10) have gdbserver moved at the top-level,
> +# which requires a different build logic.
> +ifeq ($(BR2_GDB_VERSION_10),y)
> +GDB_GDBSERVER_TOPLEVEL = y
> +endif
> +
>  ifeq ($(BR2_arc),y)
>  GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
>  GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
