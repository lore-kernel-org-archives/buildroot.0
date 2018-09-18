From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 18 Sep 2018 08:03:19 +0000
Subject: [Buildroot] [PATCH] libaio: Fix library creation for ARC with
 -Os
In-Reply-To: <20180918093604.0b421d5c@windsurf>
References: <20180917204329.15787-1-abrodkin@synopsys.com>
 <20180918093604.0b421d5c@windsurf>
Message-ID: <c9ec03f9f05e251fd8e7b99c0ffb06593db32b1c.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2018-09-18 at 09:36 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks Alexey for working on this. I have a few questions below, to
> better understand the problem and its solution.
> 
> On Mon, 17 Sep 2018 23:43:29 +0300, Alexey Brodkin wrote:
> > On ARC if "-Os" optimization is used compiler prefers to use so-called
> > millicode (basically function prologue & epilogue) implemented once and for
> > all in libgcc.a.
> 
> Until this point, I follow.
> 
> > And if we don't link with libgcc.a on DSO (read libaio.so)
> 
> I don't understand "link with libgcc.A on DSO" and therefore the rest
> of the explanation is a bit unclear to me.

This is how libaio.so is linked now (before my patch) with
omitted some non-important options:
----------------------->8-------------------
arc-buildroot-linux-uclibc-gcc -shared -matomic -Os -nostdlib -nostartfiles -fPIC \
  -o libaio.so io_queue_init.os io_queue_release.os io_queue_wait.os io_queue_run.os \
  io_getevents.os io_submit.os io_cancel.os io_setup.os io_destroy.os raw_syscall.os compat-0_1.os
----------------------->8-------------------

And that's what happens with my patch:
----------------------->8-------------------
arc-buildroot-linux-uclibc-gcc -shared -matomic -Os -nostdlib -nostartfiles -fPIC \
  -o libaio.so io_queue_init.os io_queue_release.os io_queue_wait.os io_queue_run.os \
  io_getevents.os io_submit.os io_cancel.os io_setup.os io_destroy.os raw_syscall.os compat-0_1.os -lgcc
----------------------->8-------------------

Note "-lgcc" in the latter case.

Now let's see what happens with millicode symbols in both cases.
Pre-patch case:
----------------------->8-------------------
# arc-linux-gnu-readelf -s libaio.so | grep __st_r13_to_r17
    3: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __st_r13_to_r17
   41: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __st_r13_to_r17
----------------------->8-------------------

Note millicode's "__st_r13_to_r17" is GLOBAL UNDEFINED symbol.
Thus during linkage of the final application that symbol will
need to be resolved and LD finds it in libgcc.a and essentially
refuses to proceed as there's no way for shared library to
use a function that is implemented in a different static library.

Post-patch case:
----------------------->8-------------------
# arc-linux-gnu-readelf -s libaio.so | grep __st_r13_to_r17
   38: 000006cc    18 FUNC    LOCAL  DEFAULT    9 __st_r13_to_r17
----------------------->8-------------------

Note "__st_r13_to_r17" is locally defined so shared library doesn't
need anything from libgcc.a.

> > creation those millicode functions won't be included, instead their
> > symbols will be referenced as they were in libgcc (HIDDEN).
> > 
> > And then when LD is about to link a final application it sees HIDDEN
> > symbol in libaio.so that is supposed to come from some static
> > libgcc.a... wait.. what? Shared library has unresolved symbol
> > implemented in static library? No, that's not right I guess :)
> > 
> > So to resolve that wrong sequence we just make sure libaio.so has
> > its own copy of used millicode functions implemented locally.
> 
> Why is this problem happening only with libaio, and not with other
> packages ?

That's a good question :)
I may assume other shared libs gets linked with libgcc.a, i.e. all
symbols from libgcc including millicode get built into libXXX.so.

> Is this the final fix, or is this a temporary workaround ?

This is the correct fix for that problem we were seeing
with those packages that depend on libaio.

> > BTW I guess something similar might happen for PowerPC,
> > see 
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__git.buildroot.org_buildroot_commit_-3Fid-3Dce6536ae500fc4ac0c201d5cb4edf39dd1b4d386&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=_sEB1SuyEghlCEki0fjXd9hCsCHOpiuQfkzhkrbxc5g&s=K49USLQoVu9LQm1rrUzqOt-E4XGsh4BcLKi0flkChnM&e=
> > --------------------------->8------------------------  
> > hidden symbol `_rest32gpr_30_x' in libgcc.a(e500crtresx32gpr.o) is referenced by DSO
> > --------------------------->8------------------------  
> 
> Ah, interesting. So there is really something special about libaio.so
> forgetting to link with libgcc?

Looks like that.

> Should this also be changed to cover PowerPC to remove the workaround ?

I think so.

Though essentially we'll need to:
 a) Reproduce PPC issue with
    commit ce6536ae500f "libaio: work-around for PowerPC issue"
    reverted.

 b) See if addition of "libgcc" fixes reproduced above problem.

I'll try to do that today.

-Alexey
