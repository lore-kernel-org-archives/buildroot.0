From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 1 Jun 2016 11:40:21 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2016-05-31
In-Reply-To: <1464774805.3171.37.camel@synopsys.com>
References: <20160601063019.5D553101D2D@stock.ovh.net>
 <1464769003.3171.25.camel@synopsys.com>
 <20160601101953.54e9e80d@free-electrons.com>
 <1464774805.3171.37.camel@synopsys.com>
Message-ID: <1464781182.3171.49.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2016-06-01 at 12:53 +0300, Alexey Brodkin wrote:
> Hi Thomas,
> 
> On Wed, 2016-06-01 at 10:19 +0200, Thomas Petazzoni wrote:
> > 
> > Hello,
> > 
> > On Wed, 1 Jun 2016 08:17:21 +0000, Alexey Brodkin wrote:
> > 
> > > 
> > > 
> > > > 
> > > > 
> > > > ?????????arc |??????????????????jack2-v1.9.10 | NOK |
> > > > http://autobuild.buildroot.net/results/c05e4a5280f34b2a1dff8a10adfd46f53344e13a/??
> > > So this one is almost fixed by Bernd but given he has no time for the real fix
> > > we'll take a look at proposed solution and hopefully will cook up a patch ourselves.
> > Aah, good. I proposed a fix in a reply to Bernd, I believe it should
> > work, it just needs to be tested a little bit on platforms where NGREG
> > is really defined.
> Hm I see that NGREG is defined in Linux kernel in "include/uapi/linux/elfcore.h" as:
> ----------------->8----------------
> #ifndef __KERNEL__
> ...
> #define NGREG ELF_NGREG
> #endif
> ----------------->8----------------
> 
> Then in its turn ELF_NGREG is defined for ARC in "arch/arc/include/uapi/asm/elf.h" as:
> ----------------->8----------------
> #define ELF_NGREG	(sizeof(struct user_regs_struct) / sizeof(elf_greg_t))
> ----------------->8----------------
> 
> And since kernel's UAPI is meant to be exported to user-space I would expect NGREG to
> be available for ARC and all other users of UAPI.
> 
> So might be a better solution would be to just include "elfcore.h" in jack's "dbus/sigsegv.c"?
> I'll give it a try locally and if that works I'll send a patch upstream.

Ok apparently that didn't work.
Once I made:
----------------------->8------------------------
diff --git a/dbus/sigsegv.c b/dbus/sigsegv.c
index ee12f91..d7bbe7e 100644
--- a/dbus/sigsegv.c
+++ b/dbus/sigsegv.c
@@ -27,6 +27,7 @@
?#include <stdio.h>
?#include <signal.h>
?#include <dlfcn.h>
+#include <linux/elfcore.h>
?#include <execinfo.h>
?#include <errno.h>
?#ifndef NO_CPP_DEMANGLE
----------------------->8------------------------

I opened a can with worms:
----------------------->8------------------------
[255/259] c: dbus/sigsegv.c -> build/dbus/sigsegv.c.17.o
In file included from /home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/asm/signal.h:25:0,
?????????????????from /home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/linux/signal.h:4,
?????????????????from /home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/linux/elfcore.h:5,
?????????????????from ../dbus/sigsegv.c:30:
/home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/asm-
generic/signal.h:91:3: error: conflicting types for ?sigset_t?
?} sigset_t;
???^
In file included from /home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/sys/types.h:219:0,
?????????????????from /home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/stdlib.h:198,
?????????????????from ../dbus/sigsegv.c:26:
/home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/sys/select.h:37:20: note: previous declaration of ?sigset_t? was here
?typedef __sigset_t sigset_t;
????????????????????^
In file included from /home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/asm/signal.h:25:0,
?????????????????from /home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/linux/signal.h:4,
?????????????????from /home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/linux/elfcore.h:5,
?????????????????from ../dbus/sigsegv.c:30:
/home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/asm-
generic/signal.h:102:8: error: redefinition of ?struct sigaction?
?struct sigaction {
????????^
In file included from /home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/signal.h:251:0,
?????????????????from ../dbus/sigsegv.c:28:
/home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/bits/sigaction.h:28:8: note: originally defined here
?struct sigaction {
????????^
/home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/asm-
generic/signal.h:103:17: error: expected ?:?, ?,?, ?;?, ?}? or ?__attribute__? before ?.? token
? __sighandler_t sa_handler;
?????????????????^
In file included from /home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/asm/signal.h:25:0,
?????????????????from /home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/linux/signal.h:4,
?????????????????from /home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/linux/elfcore.h:5,
?????????????????from ../dbus/sigsegv.c:30:
/home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/asm-
generic/signal.h:111:16: error: redefinition of ?struct sigaltstack?
?typedef struct sigaltstack {
????????????????^
In file included from /home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/signal.h:354:0,
?????????????????from ../dbus/sigsegv.c:28:
/home/abrodkin/Outputs/buildroot/archs38-jack2/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/include/bits/sigstack.h:49:16: note: originally defined here
?typedef struct sigaltstack
????????????????^
----------------------->8------------------------

Then I googled that?http://article.gmane.org/gmane.linux.kernel.api/14978
So I'm not alone with my grief here.

Which means probably your proposal is the only feasible way to go.

-Alexey
