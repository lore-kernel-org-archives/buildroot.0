From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Jan 2019 22:18:26 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/glibc: fix include of
 syscalls.h for RISC-V architecture
In-Reply-To: <7d593615-b620-89af-4d58-3e4b496726d6@gmail.com>
References: <20190102151559.32221-1-mark.corbin@embecosm.com>
 <20190102151559.32221-2-mark.corbin@embecosm.com>
 <7d593615-b620-89af-4d58-3e4b496726d6@gmail.com>
Message-ID: <20190102211826.GN23435@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2019-01-02 20:51 +0100, Romain Naour spake thusly:
> Le 02/01/2019 ? 16:15, Mark Corbin a ?crit?:
> > UAPI header file asm/syscalls.h has been merged into the UAPI
> > asm/unistd.h header file for the RISC-V architecture in the
> > 4.20 kernel. This causes the glibc 2.28 build to break.
> > 
> > This commit applies the upstream glibc patch for this issue.
> 
> Can you ask upstream to backport this patch to the glibc 2.28 stable branch?
> When it's done you can just bump the glibc version up to the backported patch.

Well, we already have another patch that we backported from master, but
that upstream has not backported. Sigh...

So, even if updating would solve Mark's case, we'd still be missing a
fix we'd stil have to carry.

Regards,
Yann E. MORIN.

> Best regards,
> Romain
> 
> > 
> > Fixes:
> >   http://autobuild.buildroot.net/results/8190eb74b2b97911e03671138487d747fcb22cba/
> > Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> > ---
> >  .../0002-fix-syscalls-header-for-riscv.patch  | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0002-fix-syscalls-header-for-riscv.patch
> > 
> > diff --git a/package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0002-fix-syscalls-header-for-riscv.patch b/package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0002-fix-syscalls-header-for-riscv.patch
> > new file mode 100644
> > index 0000000000..2fc666dfdc
> > --- /dev/null
> > +++ b/package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0002-fix-syscalls-header-for-riscv.patch
> > @@ -0,0 +1,67 @@
> > +<asm/syscalls.h> has been removed by
> > +
> > +commit 27f8899d6002e11a6e2d995e29b8deab5aa9cc25
> > +Author: David Abdurachmanov <david.abdurachmanov@gmail.com>
> > +Date:   Thu Nov 8 20:02:39 2018 +0100
> > +
> > +    riscv: add asm/unistd.h UAPI header
> > +
> > +    Marcin Juszkiewicz reported issues while generating syscall table for riscv
> > +    using 4.20-rc1. The patch refactors our unistd.h files to match some other
> > +    architectures.
> > +
> > +    - Add asm/unistd.h UAPI header, which has __ARCH_WANT_NEW_STAT only for 64-bit
> > +    - Remove asm/syscalls.h UAPI header and merge to asm/unistd.h
> > +    - Adjust kernel asm/unistd.h
> > +
> > +    So now asm/unistd.h UAPI header should show all syscalls for riscv.
> > +
> > +<asm/syscalls.h> may be restored by
> > +
> > +Subject: [PATCH] riscv: restore asm/syscalls.h UAPI header
> > +Date: Tue, 11 Dec 2018 09:09:35 +0100
> > +
> > +UAPI header asm/syscalls.h was merged into UAPI asm/unistd.h header,
> > +which did resolve issue with missing syscalls macros resulting in
> > +glibc (2.28) build failure. It also broke glibc in a different way:
> > +asm/syscalls.h is being used by glibc. I noticed this while doing
> > +Fedora 30/Rawhide mass rebuild.
> > +
> > +The patch returns asm/syscalls.h header and incl. it into asm/unistd.h.
> > +I plan to send a patch to glibc to use asm/unistd.h instead of
> > +asm/syscalls.h
> > +
> > +In the meantime, we use __has_include__, which was added to GCC 5, to
> > +check if <asm/syscalls.h> exists before including it.  Tested with
> > +build-many-glibcs.py for riscv against kernel 4.19.12 and 4.20-rc7.
> > +
> > +	[BZ #24022]
> > +	* sysdeps/unix/sysv/linux/riscv/flush-icache.c: Check if
> > +	<asm/syscalls.h> exists with __has_include__ before including it.
> > +
> > +[Mark: patch retrieved from
> > +https://sourceware.org/git/?p=glibc.git;a=commit;h=0b9c84906f653978fb8768c7ebd0ee14a47e662e]
> > +
> > +Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> > +---
> > + sysdeps/unix/sysv/linux/riscv/flush-icache.c | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/sysdeps/unix/sysv/linux/riscv/flush-icache.c b/sysdeps/unix/sysv/linux/riscv/flush-icache.c
> > +index d612ef4c6c..d0ecec5107 100644
> > +--- a/sysdeps/unix/sysv/linux/riscv/flush-icache.c
> > ++++ b/sysdeps/unix/sysv/linux/riscv/flush-icache.c
> > +@@ -21,7 +21,11 @@
> > + #include <stdlib.h>
> > + #include <atomic.h>
> > + #include <sys/cachectl.h>
> > ++#if __has_include__ (<asm/syscalls.h>)
> > + #include <asm/syscalls.h>
> > ++#else
> > ++#include <asm/unistd.h>
> > ++#endif
> > + 
> > + typedef int (*func_type) (void *, void *, unsigned long int);
> > + 
> > +-- 
> > +2.19.2
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
